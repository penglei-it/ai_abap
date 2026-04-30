class ZCL_ICEC_GATEWAY definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF ts_accesstoken,
            agentid     TYPE string,
            corpid      TYPE string,
            accesstoken TYPE string,
            exptime     TYPE string,
          END OF ts_accesstoken .

  methods GET_QYWX_ACCESSTOKEN
    importing
      value(CORPID) type STRING
      value(AGENTID) type STRING
    exporting
      value(ES_TOKEN) type TS_ACCESSTOKEN
      value(ES_MSG) type BAPIRET2 .
protected section.
PRIVATE SECTION.
  METHODS save_api_log
    IMPORTING
      VALUE(ev_msg)          TYPE bapiret2 OPTIONAL
      VALUE(iv_commit)       TYPE char01 OPTIONAL
      VALUE(iv_keyvalue)     TYPE string OPTIONAL
      VALUE(iv_responsebody) TYPE string OPTIONAL
      VALUE(iv_requestbody)  TYPE string OPTIONAL .
ENDCLASS.



CLASS ZCL_ICEC_GATEWAY IMPLEMENTATION.


  METHOD get_qywx_accesstoken.
    DATA:lv_url          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.


    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_api)
      WHERE service = 'ICECGATEWAY' AND method = 'GET_QYWX_ACCESSTOKEN'.

    REPLACE '{corpId}' IN ls_api-url WITH corpid.
    REPLACE '{agentId}' IN ls_api-url WITH agentid.
    lv_rfcdest = COND #( WHEN ls_api-rfcdest IS INITIAL THEN 'NEWCASSINT' ELSE ls_api-rfcdest ).
    lv_url = ls_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest
        iv_uri          = lv_url
        is_content_type = ls_content_type
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = es_msg
                          ).
    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json = json_out
          CHANGING
            data = es_token ).
        es_msg-type = 'S'.
        es_msg-id = '200'.
        es_msg-message = 'JSON成功解析'.
      CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).
        es_msg-type = 'E'.
        es_msg-id = '404'.
        es_msg-message = 'JSON解析异常，请检查系统传入参数'.
      CATCH cx_root.
        es_msg-type = 'E'.
        es_msg-id = 404.
        es_msg-message = 'JSON解析异常，请检查系统传入参数'.
    ENDTRY.
   IF ls_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_url  iv_responsebody = json_out ev_msg = es_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD save_api_log.
    DATA:ls_apilog TYPE zticec_api_log.
    TRY .
        ls_apilog-apiguid =    cl_system_uuid=>if_system_uuid_static~create_uuid_c32( ).
      CATCH cx_uuid_error.
    ENDTRY.
    ls_apilog-keyvalue = iv_keyvalue.
    ls_apilog-msgtype = ev_msg-type.
    ls_apilog-msgid = ev_msg-id.
    ls_apilog-msg = ev_msg-message.
    ls_apilog-requestbody = iv_requestbody.
    ls_apilog-responsebody = iv_responsebody.
    ls_apilog-zcrt_bdate = sy-datum.
    ls_apilog-zcrt_btime = sy-uzeit.
    ls_apilog-zcrt_uname = sy-uname.

    MODIFY zticec_api_log FROM ls_apilog.
    IF iv_commit IS NOT INITIAL..
      COMMIT WORK AND WAIT .
    ENDIF.
  ENDMETHOD.
ENDCLASS.
