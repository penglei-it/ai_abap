class ZCL_ICEC_API definition
  public
  final
  create public .

public section.
  type-pools ZAPI .

  types:
    BEGIN OF ts_header,
            name  TYPE string,
            value TYPE string,
          END OF ts_header .
  types:
    tt_header TYPE STANDARD TABLE OF ts_header .

  methods GET_DATA
    importing
      value(IV_RFCDEST) type RFCDEST
      value(IV_URI) type STRING
      value(IS_CONTENT_TYPE) type ZAPI_S_CONTENTTYPE
    exporting
      value(JSON_OUT) type STRING
      value(EV_MSG) type BAPIRET2 .
  methods SAVE_API_LOG
    importing
      value(EV_MSG) type BAPIRET2 optional
      value(IV_COMMIT) type CHAR01 optional
      value(IV_KEYVALUE) type STRING optional
      value(IV_REQUESTBODY) type STRING optional
      value(IV_RESPONSEBODY) type STRING optional .
  methods POST_DATA
    importing
      value(IV_RFCDEST) type RFCDEST
      value(IV_URI) type STRING
      value(IS_CONTENT_TYPE) type ZAPI_S_CONTENTTYPE optional
      value(IV_BODY) type STRING
      value(IV_TITLE) type STRING optional
      value(IT_HEADER) type TT_HEADER optional
    exporting
      value(JSON_OUT) type STRING
      value(ERRO_OUT) type STRING
      value(EV_MSG) type BAPIRET2 .
  methods PUT_DATA
    importing
      value(IV_RFCDEST) type RFCDEST
      value(IV_URI) type STRING
      value(IS_CONTENT_TYPE) type ZAPI_S_CONTENTTYPE optional
      value(IV_BODY) type STRING
      value(IV_TITLE) type STRING optional
    exporting
      value(JSON_OUT) type STRING
      value(EV_MSG) type BAPIRET2 .
  methods DELETE_DATA
    importing
      value(IV_RFCDEST) type RFCDEST
      value(IV_URI) type STRING
      value(IS_CONTENT_TYPE) type ZAPI_S_CONTENTTYPE optional
      value(IV_BODY) type STRING
    exporting
      value(JSON_OUT) type STRING
      value(EV_MSG) type BAPIRET2 .
  methods SEND_FAIL_MSG
    importing
      value(IV_TITLE) type STRING optional
      value(IV_URI) type STRING optional .
protected section.
private section.
ENDCLASS.



CLASS ZCL_ICEC_API IMPLEMENTATION.


  METHOD DELETE_DATA.
    "get access tokey
    DATA: lv_token TYPE string,
          ls_log   TYPE zticcrm_log.

    CHECK iv_rfcdest IS NOT INITIAL.
    CHECK iv_uri IS NOT INITIAL.


    DATA: lo_http_client TYPE REF TO if_http_client,
          lo_rest_client TYPE REF TO cl_rest_http_client,
          lv_url         TYPE        string,
          lv_body        TYPE        string,
          token          TYPE        string,
          agreements     TYPE        string,
          lo_response    TYPE REF TO     if_rest_entity,
          lo_request     TYPE REF TO if_rest_entity.

    cl_http_client=>create_by_destination(
      EXPORTING
        destination              = iv_rfcdest   " Logical destination (specified in function call)
      IMPORTING
        client                   = lo_http_client    " HTTP Client Abstraction
      EXCEPTIONS
        argument_not_found       = 1
        destination_not_found    = 2
        destination_no_authority = 3
        plugin_not_active        = 4
        internal_error           = 5
        OTHERS                   = 6
        ).


* Create REST client instance
    CREATE OBJECT lo_rest_client
      EXPORTING
        io_http_client = lo_http_client.
* Set HTTP version
    lo_http_client->request->set_version( if_http_request=>co_protocol_version_1_0 ).
    IF lo_http_client IS BOUND AND lo_rest_client IS BOUND.

**    设置URI
***    lv_url = '/sns/userinfo?access_token=' && iv_asstoken &&
***            '&openid=' && iv_openid &&
***            '&lang=zh_CN'.
* Set the URI if any
      cl_http_utility=>set_request_uri(
        EXPORTING
          request = lo_http_client->request    " HTTP Framework (iHTTP) HTTP Request
          uri     = iv_uri
          ).



      lo_request = lo_rest_client->if_rest_client~create_request_entity( ).
      IF iv_body IS NOT INITIAL.
        lo_request->set_string_data( iv_body ).
      ENDIF.

      IF is_content_type IS NOT INITIAL.
        lo_request->set_content_type( EXPORTING iv_media_type = is_content_type-content_type it_parameter = is_content_type-content_para ).
      ENDIF.

      TRY .
* HTTP delete
          lo_rest_client->if_rest_client~delete( ).
        CATCH cx_rest_client_exception.
          RETURN.
        CATCH cx_root.
          RETURN.
      ENDTRY.

* HTTP response
      lo_response = lo_rest_client->if_rest_client~get_response_entity( ).

* HTTP return status
      DATA(http_status)   = lo_response->get_header_field( '~status_code' ).

      IF http_status = '200'. "return ok
* HTTP JSON return string
        json_out = lo_response->get_string_data( ).

      ELSE.



        DATA(lt_field) = lo_response->get_header_fields( ).

        DATA(lv_data) = lo_response->get_string_data( ).

        ev_msg-type = 'E'.
        ev_msg-message = lo_response->get_header_field( '~status_reason' ).

      ENDIF.
    ELSE.
    ENDIF.


    CALL METHOD lo_http_client->close.




  ENDMETHOD.


  METHOD get_data.
    "get access tokey
    DATA: lv_token TYPE string,
          ls_log   TYPE zticcrm_log.

    CHECK iv_rfcdest IS NOT INITIAL.
    CHECK iv_uri IS NOT INITIAL.


    DATA: lo_http_client TYPE REF TO if_http_client,
          lo_rest_client TYPE REF TO cl_rest_http_client,
          lv_url         TYPE        string,
          lv_body        TYPE        string,
          token          TYPE        string,
          agreements     TYPE        string,
          lo_response    TYPE REF TO     if_rest_entity,
          lo_request     TYPE REF TO if_rest_entity.

    cl_http_client=>create_by_destination(
      EXPORTING
        destination              = iv_rfcdest   " Logical destination (specified in function call)
      IMPORTING
        client                   = lo_http_client    " HTTP Client Abstraction
      EXCEPTIONS
        argument_not_found       = 1
        destination_not_found    = 2
        destination_no_authority = 3
        plugin_not_active        = 4
        internal_error           = 5
        OTHERS                   = 6
        ).


* Create REST client instance
    CREATE OBJECT lo_rest_client
      EXPORTING
        io_http_client = lo_http_client.
* Set HTTP version
    lo_http_client->request->set_version( if_http_request=>co_protocol_version_1_0 ).
    IF lo_http_client IS BOUND AND lo_rest_client IS BOUND.

* Set the URI if any
      cl_http_utility=>set_request_uri(
        EXPORTING
          request = lo_http_client->request    " HTTP Framework (iHTTP) HTTP Request
          uri     = iv_uri
          ).
      lo_request = lo_rest_client->if_rest_client~create_request_entity( ).
      IF is_content_type IS NOT INITIAL.
        lo_request->set_content_type( EXPORTING iv_media_type = is_content_type-content_type it_parameter = is_content_type-content_para ).
      ENDIF.

      TRY .
* HTTP GET
          lo_rest_client->if_rest_client~get( ).
        CATCH cx_rest_client_exception INTO DATA(lo_exc).
          data(Lo_text) = lo_exc->get_text( ).
          ev_msg-type = 'get_token'.
          ev_msg-id = '000'.
          ev_msg-type = 'E'.
          ev_msg-message = 'get失败，检查证书'.
          RETURN.
        CATCH cx_root.
          ev_msg-type = 'get_token'.
          ev_msg-id = '000'.
          ev_msg-type = 'E'.
          ev_msg-message = 'get失败，检查证书'.
          RETURN.
      ENDTRY.

* HTTP response
      lo_response = lo_rest_client->if_rest_client~get_response_entity( ).

* HTTP return status
      DATA(http_status)   = lo_response->get_header_field( '~status_code' ).

      IF http_status = '200'. "return ok
* HTTP JSON return string
        json_out = lo_response->get_string_data( ).
        ev_msg-type = 'S'.
        ev_msg-id = http_status.
        ev_msg-message = '成功获取系统返回值'.
      ELSE.
        ev_msg-type = 'E'.
        ev_msg-id = http_status.
        ev_msg-message = '未能获取系统返回值，请检查系统传入参数'.
      ENDIF.
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-message = 'Rest服务未能正常构建，请检查系统配置'.
    ENDIF.


    CALL METHOD lo_http_client->close.

   SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE url = @lv_uri.
   IF lv_nolog_1 IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = iv_uri ev_msg = ev_msg ).
   ENDIF.



  ENDMETHOD.


  METHOD post_data.
    "get access tokey
    DATA: lv_token TYPE string,
          ls_log   TYPE zticcrm_log.

    CHECK iv_rfcdest IS NOT INITIAL.
    CHECK iv_uri IS NOT INITIAL.


    DATA: lo_http_client TYPE REF TO if_http_client,
          lo_rest_client TYPE REF TO cl_rest_http_client,
          lv_url         TYPE        string,
          lv_body        TYPE        string,
          token          TYPE        string,
          agreements     TYPE        string,
          lo_response    TYPE REF TO     if_rest_entity,
          lo_request     TYPE REF TO if_rest_entity.

    cl_http_client=>create_by_destination(
      EXPORTING
        destination              = iv_rfcdest   " Logical destination (specified in function call)
      IMPORTING
        client                   = lo_http_client    " HTTP Client Abstraction
      EXCEPTIONS
        argument_not_found       = 1
        destination_not_found    = 2
        destination_no_authority = 3
        plugin_not_active        = 4
        internal_error           = 5
        OTHERS                   = 6
        ).


* Create REST client instance
    CREATE OBJECT lo_rest_client
      EXPORTING
        io_http_client = lo_http_client.
* Set HTTP version
    lo_http_client->request->set_version( if_http_request=>co_protocol_version_1_0 ).
    IF lo_http_client IS BOUND AND lo_rest_client IS BOUND.

**    设置URI
***    lv_url = '/sns/userinfo?access_token=' && iv_asstoken &&
***            '&openid=' && iv_openid &&
***            '&lang=zh_CN'.
* Set the URI if any
      cl_http_utility=>set_request_uri(
        EXPORTING
          request = lo_http_client->request    " HTTP Framework (iHTTP) HTTP Request
          uri     = iv_uri
          ).



      lo_request = lo_rest_client->if_rest_client~create_request_entity( ).
      IF iv_body IS NOT INITIAL.
        lo_request->set_string_data( zcl_cassint_formatter=>escape_for_json_body( iv_body ) ).
      ENDIF.

      LOOP AT it_header INTO DATA(ls_header).
        CALL METHOD lo_http_client->request->set_header_field(
          EXPORTING
            name  = ls_header-name
            value = ls_header-value ).
      ENDLOOP.

      IF is_content_type IS NOT INITIAL.
        lo_request->set_content_type( EXPORTING iv_media_type = is_content_type-content_type it_parameter = is_content_type-content_para ).
      ENDIF.

      TRY .
* HTTP POST
          lo_rest_client->if_rest_client~post( lo_request ).
        CATCH cx_rest_client_exception INTO DATA(ls_cliexp).
          DATA(lv_text) = ls_cliexp->get_text( ).
          RETURN.
        CATCH cx_root.
          RETURN.
      ENDTRY.

* HTTP response
      lo_response = lo_rest_client->if_rest_client~get_response_entity( ).

* HTTP return status
      DATA(http_status)   = lo_response->get_header_field( '~status_code' ).

      IF http_status = '200' OR http_status = '201'. "return ok
* HTTP JSON return string
        json_out = lo_response->get_string_data( ).

      ELSE.

**        send_fail_msg( EXPORTING iv_title = iv_title iv_uri = iv_uri ).

        DATA(lt_field) = lo_response->get_header_fields( ).

        DATA(lv_data) = lo_response->get_string_data( ).

        erro_out = lv_data.

        ev_msg-type = 'E'.
        ev_msg-message = lo_response->get_header_field( '~status_reason' ).
        ev_msg-message_v4 = http_status.
      ENDIF.
    ELSE.
    ENDIF.


    CALL METHOD lo_http_client->close.




  ENDMETHOD.


  METHOD put_data.
    "get access tokey
    DATA: lv_token TYPE string,
          ls_log   TYPE zticcrm_log.

    CHECK iv_rfcdest IS NOT INITIAL.
    CHECK iv_uri IS NOT INITIAL.


    DATA: lo_http_client TYPE REF TO if_http_client,
          lo_rest_client TYPE REF TO cl_rest_http_client,
          lv_url         TYPE        string,
          lv_body        TYPE        string,
          token          TYPE        string,
          agreements     TYPE        string,
          lo_response    TYPE REF TO     if_rest_entity,
          lo_request     TYPE REF TO if_rest_entity.

    cl_http_client=>create_by_destination(
      EXPORTING
        destination              = iv_rfcdest   " Logical destination (specified in function call)
      IMPORTING
        client                   = lo_http_client    " HTTP Client Abstraction
      EXCEPTIONS
        argument_not_found       = 1
        destination_not_found    = 2
        destination_no_authority = 3
        plugin_not_active        = 4
        internal_error           = 5
        OTHERS                   = 6
        ).


* Create REST client instance
    CREATE OBJECT lo_rest_client
      EXPORTING
        io_http_client = lo_http_client.
* Set HTTP version
    lo_http_client->request->set_version( if_http_request=>co_protocol_version_1_0 ).
    IF lo_http_client IS BOUND AND lo_rest_client IS BOUND.

**    设置URI
***    lv_url = '/sns/userinfo?access_token=' && iv_asstoken &&
***            '&openid=' && iv_openid &&
***            '&lang=zh_CN'.
* Set the URI if any
      cl_http_utility=>set_request_uri(
        EXPORTING
          request = lo_http_client->request    " HTTP Framework (iHTTP) HTTP Request
          uri     = iv_uri
          ).



      lo_request = lo_rest_client->if_rest_client~create_request_entity( ).
      IF iv_body IS NOT INITIAL.
        lo_request->set_string_data( zcl_cassint_formatter=>escape_for_json_body( iv_body ) ).
      ENDIF.

      IF is_content_type IS NOT INITIAL.
        lo_request->set_content_type( EXPORTING iv_media_type = is_content_type-content_type it_parameter = is_content_type-content_para ).
      ENDIF.

      TRY .
* HTTP POST
          lo_rest_client->if_rest_client~put( lo_request ).
        CATCH cx_rest_client_exception.
          RETURN.
        CATCH cx_root.
          RETURN.
      ENDTRY.

* HTTP response
      lo_response = lo_rest_client->if_rest_client~get_response_entity( ).

* HTTP return status
      DATA(http_status)   = lo_response->get_header_field( '~status_code' ).

      IF http_status = '200'. "return ok
* HTTP JSON return string
        json_out = lo_response->get_string_data( ).

      ELSE.


        send_fail_msg( EXPORTING iv_title = iv_title iv_uri = iv_uri ).

        DATA(lt_field) = lo_response->get_header_fields( ).

        DATA(lv_data) = lo_response->get_string_data( ).

        ev_msg-type = 'E'.
        ev_msg-message = lo_response->get_header_field( '~status_reason' ).

      ENDIF.
    ELSE.
    ENDIF.


    CALL METHOD lo_http_client->close.




  ENDMETHOD.


  METHOD save_api_log.
    DATA:ls_apilog TYPE zticec_api_log.
    EXIT.
    TRY .
        ls_apilog-apiguid =   cl_system_uuid=>if_system_uuid_static~create_uuid_c32( ).
      CATCH cx_uuid_error.
    ENDTRY.
    ls_apilog-keyvalue     =  iv_keyvalue.
    ls_apilog-requestbody  =  iv_requestbody.
    ls_apilog-responsebody =  iv_responsebody. "add by wuzy 20210922
    ls_apilog-msgtype      =  ev_msg-type.
    ls_apilog-msgid        =  ev_msg-id.   "modify  wuzy 20210922
    ls_apilog-msg          =  ev_msg-message.

    ls_apilog-zcrt_bdate = sy-datum.
    ls_apilog-zcrt_btime = sy-uzeit.
    ls_apilog-zcrt_uname = sy-uname.

    MODIFY zticec_api_log FROM ls_apilog.
*    IF iv_commit IS NOT INITIAL..
    COMMIT WORK AND WAIT .
*    ENDIF.
  ENDMETHOD.


  METHOD send_fail_msg.
    DATA:lv_alert_content TYPE string.
    DATA:lv_title TYPE string.
    DATA:lv_log_msg TYPE string.
    DATA lv_fname TYPE string.
    DATA:lv_url TYPE string.
    DATA:lv_msg_type TYPE string.

    lv_alert_content = '开思助手 \n '  && iv_title  && '调用电商接口失败,请关注! \n '
        && 'URI' && lv_url && ' \n '
        && |{ sy-datum DATE = ISO } { sy-uzeit TIME = ISO }|.

    lv_fname = 'APILOG'.
    lv_title =  '开思助手'.
    lv_msg_type = 'text'.

    CALL FUNCTION 'Z_FMQYWX_ALERT_ERROR_REPORT'
      EXPORTING
        iv_content = lv_alert_content
        iv_fname   = lv_fname.
***    CALL FUNCTION 'Z_FMINT_ERRORALERT'
***      IN UPDATE TASK
***      EXPORTING
***        iv_title    = lv_title
***        iv_msg_type = lv_msg_type
****       IV_URL      =
***        iv_content  = lv_alert_content
***        iv_fname    = lv_fname.
  ENDMETHOD.
ENDCLASS.
