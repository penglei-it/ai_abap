CLASS zcl_icec_label_api DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      BEGIN OF ts_labelsection,
        startcode TYPE string,
        endcode   TYPE string,
        quantity  TYPE int4,
      END OF ts_labelsection,
      tt_labelsection TYPE STANDARD TABLE OF ts_labelsection WITH DEFAULT KEY.

    TYPES:
      BEGIN OF ts_purchaseorder,
        orderid             TYPE string,
        id                  TYPE string,
        storeid             TYPE string,
        storename           TYPE string,
        purchaseorderstatus TYPE string,
        quantity            TYPE string,
        price               TYPE string,
        ordertime           TYPE string,
        buyer               TYPE string,
        buyeraddress        TYPE string,
        logisticscompany    TYPE string,
        logisticsorderid    TYPE string,
        carriageprice       TYPE string,
        labelsectionlist    TYPE STANDARD TABLE OF ts_labelsection WITH DEFAULT KEY,
      END OF ts_purchaseorder .
    TYPES:
      BEGIN OF ts_po_record,
        createdby           TYPE string,
        createdtime         TYPE string,
        creatorname         TYPE string,
        id                  TYPE string,
        purchaseorderid     TYPE string,
        purchaseorderstatus TYPE string,
        remark              TYPE string,
      END OF ts_po_record .
    TYPES:
      tt_po_record TYPE STANDARD TABLE OF ts_po_record WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_address,
        orderid       TYPE string,
        contactnumber TYPE string,
        contacttel    TYPE string,
      END OF ts_address .

    METHODS get_purchaseorder
      IMPORTING
        VALUE(iv_torderid)      TYPE string
      EXPORTING
        VALUE(es_purchaseorder) TYPE ts_purchaseorder
        VALUE(es_msg)           TYPE bapiret2 .
    METHODS get_purchaseorder_record
      IMPORTING
        VALUE(iv_purchaseorderid) TYPE string OPTIONAL
      EXPORTING
        !es_msg                   TYPE bapiret2
        !et_record                TYPE tt_po_record .
    METHODS get_torder_postaladdress
      IMPORTING
        VALUE(iv_torderid) TYPE string
      EXPORTING
        !es_msg            TYPE bapiret2
        !es_address        TYPE ts_address .
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



CLASS ZCL_ICEC_LABEL_API IMPLEMENTATION.


  METHOD get_purchaseorder.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA:lv_body TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'LABEL' AND method = 'GET_PURCHASEORDER'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{id}' IN lv_uri WITH iv_torderid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = es_msg.
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_purchaseorder ).
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
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = es_msg  iv_responsebody = lv_out ).
   ENDIF.

  ENDMETHOD.


  METHOD get_purchaseorder_record.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA:lv_body TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'LABEL' AND method = 'GET_PURCHASEORDER_RECORD'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{purchaseOrderId}' IN lv_uri WITH iv_purchaseorderid .

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = es_msg.
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_record ).
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
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = es_msg  iv_responsebody = lv_out ).
   ENDIF.

  ENDMETHOD.


  METHOD get_torder_postaladdress.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA:lv_body TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'LABEL' AND method = 'GET_TORDER_POSTALADDRESS'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{orderId}' IN lv_uri WITH iv_torderid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = es_msg.
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_address ).
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
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = es_msg  iv_responsebody = lv_out ).
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
