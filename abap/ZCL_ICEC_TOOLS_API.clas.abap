class ZCL_ICEC_TOOLS_API definition
  public
  final
  create public .

public section.

  methods GET_OSS_POLICY
    importing
      value(IV_BUCKET) type STRING
      value(IV_ENDPOINT) type STRING
      value(IV_ACCESSKEYSECRET) type STRING
      value(IV_ACCESSKEYID) type STRING
      value(IV_DIR) type STRING
    exporting
      !ES_POLICY type ZTOOL_S_POLICY .
  methods GET_OBS_POLICY
    importing
      !IV_FILETYPE type STRING
    exporting
      !ES_OBSPOLICY type ZTOOL_S_OBSPOLICY .
protected section.
private section.

  methods SAVE_API_LOG
    importing
      value(EV_MSG) type BAPIRET2 optional
      value(IV_COMMIT) type CHAR01 optional
      value(IV_KEYVALUE) type STRING optional
      value(IV_REQUESTBODY) type STRING optional
      value(IV_RESPONSEBODY) type STRING optional .
ENDCLASS.



CLASS ZCL_ICEC_TOOLS_API IMPLEMENTATION.


  METHOD get_obs_policy.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA: lv_msg TYPE bapiret2.
    DATA:lv_title TYPE string.
    DATA: lv_body    TYPE string,
          lv_rfcdest TYPE rfcdest.




    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'TOOLS'
        AND method = 'GET_OBS_POLICY'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{group}' IN lv_uri WITH 'cassint'.
    "REPLACE '{contentType}' IN lv_uri WITH 'application/json;charset=UTF-8'.
    REPLACE '{contentType}' IN lv_uri WITH iv_filetype.

    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                              ELSE ls_ztint_icec_api-rfcdest ).
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    lv_title = '调用平台OBS签名信息(ZCL_ICEC_TOOLS_API->GET_OBS_POLICY)'.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = lv_msg ).


    IF lv_out IS NOT INITIAL.
      REPLACE ALL OCCURRENCES OF '"x-obs-acl"' IN lv_out WITH '"xobsacl"' .
      DATA: BEGIN OF ls_data ,
              errorcode TYPE string,
              data      TYPE ztool_s_obspolicy,
              message   TYPE string,
            END OF ls_data.

      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = ls_data ) .

          MOVE-CORRESPONDING ls_data-data TO es_obspolicy.

        CATCH cx_root.

      ENDTRY.

    ENDIF.

   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = lv_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD get_oss_policy.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA: lv_msg TYPE bapiret2.
    DATA:lv_title TYPE string.
    DATA: lv_body TYPE string.

    CHECK iv_bucket IS NOT INITIAL.
    CHECK iv_endpoint IS NOT INITIAL.
    CHECK iv_accesskeysecret IS NOT INITIAL.
    CHECK iv_accesskeyid IS NOT INITIAL.
    CHECK iv_dir IS NOT INITIAL.

    "整理消息体


    lv_body = '{' && '"bucket":"' && iv_bucket && '","endpoint":"' && iv_endpoint && '","accessKeyId":"' && iv_accesskeyid && '","accessKeySecret":"' && iv_accesskeysecret && '","dir":"' && iv_dir  && '"}'.


    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'TOOLS'
        AND method = 'GET_OSS_POLICY'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    lv_title = '调用平台OSS签名信息(ZCL_ICEC_TOOLS_API->GET_OSS_POLICY)'.


    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
        iv_title        = lv_title
      IMPORTING
        json_out        = lv_out
        ev_msg          = lv_msg.


    IF lv_out IS NOT INITIAL.

      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_policy ) .




        CATCH cx_root.

      ENDTRY.

    ENDIF.


   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = lv_msg iv_requestbody = lv_body iv_responsebody = lv_out ).
   ENDIF.



  ENDMETHOD.


  METHOD save_api_log.

    DATA:ls_apilog TYPE zticec_api_log.
    TRY .
        ls_apilog-apiguid =    cl_system_uuid=>if_system_uuid_static~create_uuid_c32( ).
      CATCH cx_uuid_error.
    ENDTRY.
    ls_apilog-keyvalue = iv_keyvalue.
    ls_apilog-msgtype = ls_apilog-msgtype.
    ls_apilog-msgid = ls_apilog-msgid.
    ls_apilog-msg = ls_apilog-msg.
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
