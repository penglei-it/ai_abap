class ZCL_ICEC_TERMINAL_API definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF ty_evaluation,
            recordid   TYPE string, "拜访记录id
            touserid   TYPE string, "客户经理Id/工号
            tousername TYPE string, "客户经理姓名
            companyid  TYPE string, " 维修厂Id
          END OF ty_evaluation .

  methods CREATE_EVALUATION
    importing
      value(ES_EVALUATION) type TY_EVALUATION
    exporting
      value(EV_MSG) type BAPIRET2
    returning
      value(MSG) type STRING .
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



CLASS ZCL_ICEC_TERMINAL_API IMPLEMENTATION.


  METHOD create_evaluation.
    DATA(lo_api) = NEW zcl_icec_api( ).
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'TERMINAL' AND method = 'CREATE_EVALUATION'.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    "调用接口
    lv_body = '{' &&
               |"recordId":"{ es_evaluation-recordid }","toUserId":"{ es_evaluation-touserid }",| &&
               |"toUserName":"{ es_evaluation-tousername }","companyId":"{ es_evaluation-companyid }"| &&
               '}'.
    lv_title = '创建评价任务(ZCL_ICEC_TERMINAL_API->CREATE_EVALUATIONS)'.

    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_title        = lv_title
        iv_body         = lv_body
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.
    msg = lv_out.
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = lv_out  ).

          ev_msg-type = 'S'.
          ev_msg-id = '200'.
          ev_msg-message = 'JSON成功解析'.
        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).
          ev_msg-type = 'E'.
          ev_msg-id = '404'.
          ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
        CATCH cx_root.
          ev_msg-type = 'E'.
          ev_msg-id = 404.
          ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
      ENDTRY.
    ENDIF.
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_requestbody = lv_body iv_responsebody = lv_out ).
    ENDIF.


  ENDMETHOD.


  METHOD SAVE_API_LOG.
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
