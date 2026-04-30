class ZCL_ICEC_PARTYCREDIT_API definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF ts_tempcredit,
        partyidfrom         TYPE string,                    ": "10424",
        partyidto           TYPE string, ": "eue9pmAKiToXwDeC2Ko",
        servicetype         TYPE string, ": "COMPANY_ACCOUNT",
        creditavai          TYPE string,                    ": 5000000,
        creditlimit         TYPE string,                    ": 5000000,
        startdate           TYPE string, ": 1721206117000,
        enddate             TYPE string, ": 1722934117000,
        status              TYPE string, ": 0,
        settlestatus        TYPE string, ": 0,
        partytempcredittype TYPE string, ": "NORMAL"
      END OF ts_tempcredit .
  types:
    tt_tempcredit TYPE STANDARD TABLE OF ts_tempcredit WITH DEFAULT KEY .
  types:
    BEGIN OF ts_info,
        issecuritysigned TYPE string, "担保函是否签署,1：已签署;0：未签署
      END OF ts_info .
  types:
    BEGIN OF ts_contractinfo,
        contractinfo TYPE ts_info,
      END OF ts_contractinfo .
  types:
    BEGIN OF ts_userinfo,
        code TYPE string, "200",
        msg  TYPE string, "
        obj  TYPE ts_contractinfo,
      END OF ts_userinfo .
  types:
    BEGIN OF ts_specialinfodetail,
        listcode TYPE string,
        listname TYPE string,
      END OF ts_specialinfodetail .
  types:
    BEGIN OF ts_temporary_d,
        speciallistflag   TYPE string,
        specialinfodetail TYPE STANDARD TABLE OF ts_specialinfodetail WITH DEFAULT KEY,
      END OF ts_temporary_d .
  types:
    BEGIN OF ts_temporary,
        code TYPE string,
        msg  TYPE string,
        obj  TYPE ts_temporary_d,
      END OF ts_temporary .
  types:
    BEGIN OF ty_creditdetail,
        companyid                TYPE string,
        creditlimit              TYPE string,
        maxdeadline              TYPE string,
        closereason              TYPE string,
        servicetype              TYPE string,
        companycode              TYPE string,
        creditst                 TYPE string,
        creditavai               TYPE string,
        punishaccountrate        TYPE string,
        firstactiveflag          TYPE string,
        protocolamount           TYPE string,
        predictamount            TYPE string,
        applicationamount        TYPE string,
        predictmaxdeadline       TYPE string,
        predictpunishaccountrate TYPE string,
        remark                   TYPE string,
        maxcreditlimit           TYPE string,
        predictmaxcreditlimit    TYPE string,
      END OF ty_creditdetail .
  types:
    BEGIN OF ty_partycredit,
        applying              TYPE string,
        availablecredit       TYPE string,
        availablesumcredit    TYPE string,
        availabletempcredit   TYPE string,
        companyid             TYPE string,
        creditlimit           TYPE string,
        maxcreditlimit        TYPE string,
        servicetype           TYPE string,
        tmpcreditapplycount   TYPE string,
        waitreceivetempamount TYPE string,
      END OF ty_partycredit .
  types:
    BEGIN OF ty_addcreadit,
        status TYPE string,
        msg    TYPE string,
      END OF  ty_addcreadit .
  types:
    BEGIN OF ty_servicetype,
             companyid             TYPE string, ": "swEsyp7zUmdiXoitaPq",
             creditlimit           TYPE string, ": null,
             availablecredit       TYPE string, ": null,
             availabletempcredit   TYPE string, ": null,
             availablesumcredit    TYPE string, ": null,
             maxcreditlimit        TYPE string, ": null,
             tmpcreditapplycount   TYPE string, ": null,
             applying              TYPE string, ": false,
             servicetype           TYPE string, ": "CASSLOAN",
             waitreceivetempamount TYPE string, ": null
           END OF ty_servicetype .

  methods CLOSE_PARTYCREDIT
    importing
      value(IV_DATA) type STRING
    exporting
      value(ES_RETURN) type ZPC_S_PRODUCTTRANSFERRETURN
      value(EV_MSG) type BAPIRET2 .
  methods PARTYCREDIT_PRODUCT_TRANSFER
    importing
      value(IV_DATA) type STRING
    exporting
      value(ES_RETURN) type ZPC_S_PRODUCTTRANSFERRETURN
      value(EV_MSG) type BAPIRET2 .
  methods UPDATE_PARTYCREDIT
    importing
      value(IV_DATA) type STRING
    exporting
      value(ES_RETURN) type ZPC_S_PRODUCTTRANSFERRETURN
      value(EV_MSG) type BAPIRET2 .
  methods GET_COMPNAY_PARTYCREDIT
    importing
      value(IV_COMPANYID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_PARTYCREDIT) type TY_PARTYCREDIT .
  methods GET_COMPNAY_SERVICETYPE
    importing
      value(IV_COMPANYID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_SERVICETYPE) type TY_SERVICETYPE .
  methods GET_TEMPROARY_SPECIALLIST
    importing
      value(IV_COMPANYID) type STRING
      value(IV_SERVICETYPE) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_TEMPORARY) type TS_TEMPORARY .
  methods ADD_CREDIT_INFO
    importing
      !IV_BODY type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ES_ADDCREDIT type TY_ADDCREADIT .
  methods DELAY_CREDIT_INFO
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DELAYCREDIT) type TY_ADDCREADIT .
  methods GET_PARTYCREDIT_DETAIL
    importing
      !IV_COMPANYID type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ES_CREDITDETAIL type TY_CREDITDETAIL .
  methods GET_APPLYUSERINFO
    importing
      value(IV_COMPANYCODE) type STRING optional
    exporting
      !EV_MSG type BAPIRET2
      !ES_DATA type TS_USERINFO .
  methods GET_COMPANY_TEMPCREDIT
    importing
      value(IV_COMPANYID) type STRING
      value(IV_SERVICETYPE) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_TEMPCREDIT) type TT_TEMPCREDIT .
protected section.
private section.

  methods SAVE_API_LOG
    importing
      value(EV_MSG) type BAPIRET2 optional
      value(IV_COMMIT) type CHAR01 optional
      value(IV_KEYVALUE) type STRING optional
      value(IV_RESPONSEBODY) type STRING optional
      value(IV_REQUESTBODY) type STRING optional .
ENDCLASS.



CLASS ZCL_ICEC_PARTYCREDIT_API IMPLEMENTATION.


  METHOD add_credit_info.

    DATA: lv_id TYPE string.
    DATA: ls_coupon TYPE zcoup_s_coupon.
    TYPES:      BEGIN OF ty_product,
                  id        TYPE string,
                  inventory TYPE  zcl_json=>json,
                END OF ty_product.
    DATA:lt_product TYPE SORTED TABLE OF ty_product WITH UNIQUE KEY id.
    DATA: lt_inventorys TYPE zprod_t_inventorys.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_code TYPE string.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PARTYCREDIT'
      AND method = 'ADD_CREDIT_INFO'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    lv_body = iv_body.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.

    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          IF lv_out EQ 'true'.
            es_addcredit-status = lv_out.
          ELSE.

            /ui2/cl_json=>deserialize(
                        EXPORTING
                           json = lv_out
                        CHANGING
                           data = es_addcredit ).
          ENDIF.
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
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
    ENDIF.

  ENDMETHOD.


  METHOD close_partycredit.

    DATA: lv_id TYPE string.
    DATA: ls_coupon TYPE zcoup_s_coupon.
    TYPES:      BEGIN OF ty_product,
                  id        TYPE string,
                  inventory TYPE  zcl_json=>json,
                END OF ty_product.
    DATA:lt_product TYPE SORTED TABLE OF ty_product WITH UNIQUE KEY id.
    DATA: lt_inventorys TYPE zprod_t_inventorys.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_code TYPE string.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PARTYCREDIT'
      AND method = 'CLOSE_PARTYCREDIT'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    lv_body = iv_data.
    CALL METHOD lo_api->put_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.

    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_return  ).

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
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
    ENDIF.



  ENDMETHOD.


  METHOD delay_credit_info.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PARTYCREDIT' AND method = 'DELAY_CREDIT_INFO'.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    lv_body = iv_body.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.

    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          IF lv_out EQ 'true'.
            es_delaycredit-status = 'true'.
          ELSE.
            /ui2/cl_json=>deserialize(
                        EXPORTING
                           json = lv_out
                        CHANGING
                           data = es_delaycredit ).
          ENDIF.
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
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
    ENDIF.

  ENDMETHOD.


  METHOD get_applyuserinfo.
    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA: lv_body TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PARTYCREDIT' AND method = 'GET_APPLYUSERINFO'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                ELSE ls_ztint_icec_api-rfcdest ).
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    lv_body = |\{"companyCode":"{ iv_companycode }"\}|.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.

    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_data ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_company_tempcredit.
    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PARTYCREDIT' AND method = 'GET_COMPANY_TEMPCREDIT'.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    lv_body = |\{"partyIdTo":"{ iv_companyid }","serviceType":"{ iv_servicetype }"\}|.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = lv_rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.

    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_tempcredit ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_compnay_partycredit.

    DATA: lv_id TYPE string.
    DATA: ls_coupon TYPE zcoup_s_coupon.
    TYPES:      BEGIN OF ty_product,
                  id        TYPE string,
                  inventory TYPE  zcl_json=>json,
                END OF ty_product.
    DATA:lt_product TYPE SORTED TABLE OF ty_product WITH UNIQUE KEY id.
    DATA: lt_inventorys TYPE zprod_t_inventorys.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_code TYPE string.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PARTYCREDIT'
      AND method = 'GET_COMPNAY_PARTYCREDIT'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    ls_ztint_icec_api-rfcdest = COND #( WHEN  ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    "lv_body = '{"userloginId":"ddxyq","productIds": ["Init31114005","15604834551287100000","Init31114006"]}'.

    CALL METHOD lo_api->get_data
      EXPORTING
        iv_rfcdest      = ls_ztint_icec_api-rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.

    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_partycredit  ).

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD GET_COMPNAY_SERVICETYPE.

    DATA: lv_id TYPE string.
    DATA: ls_coupon TYPE zcoup_s_coupon.
    TYPES:      BEGIN OF ty_product,
                  id        TYPE string,
                  inventory TYPE  zcl_json=>json,
                END OF ty_product.
    DATA:lt_product TYPE SORTED TABLE OF ty_product WITH UNIQUE KEY id.
    DATA: lt_inventorys TYPE zprod_t_inventorys.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_code TYPE string.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PARTYCREDIT'
      AND method = 'GET_COMPNAY_SERVICETYPE'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    ls_ztint_icec_api-rfcdest = COND #( WHEN  ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口


    CALL METHOD lo_api->get_data
      EXPORTING
        iv_rfcdest      = ls_ztint_icec_api-rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.

    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_servicetype  ).

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD get_partycredit_detail.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PARTYCREDIT' AND method = 'GET_PARTYCREDIT_DETAIL'.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    lv_body = |\{"companyId":"{ iv_companyid }"\}|.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.

    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_creditdetail ).

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_temproary_speciallist.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_code TYPE string.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PARTYCREDIT'
      AND method = 'GET_TEMPROARY_SPECIALLIST'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.
    REPLACE '{serviceType}' IN lv_uri WITH iv_servicetype.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    ls_ztint_icec_api-rfcdest = COND #( WHEN  ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.

    CALL METHOD lo_api->get_data
      EXPORTING
        iv_rfcdest      = ls_ztint_icec_api-rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.

    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_temporary ).

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD partycredit_product_transfer.

    DATA: lv_id TYPE string.
    DATA: ls_coupon TYPE zcoup_s_coupon.
    TYPES:      BEGIN OF ty_product,
                  id        TYPE string,
                  inventory TYPE  zcl_json=>json,
                END OF ty_product.
    DATA:lt_product TYPE SORTED TABLE OF ty_product WITH UNIQUE KEY id.
    DATA: lt_inventorys TYPE zprod_t_inventorys.

    DATA:lv_uri          TYPE string,
         lv_rfcdesc      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_code TYPE string.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PARTYCREDIT'
      AND method = 'PARTYCREDIT_PRODUCT_TRANSFER'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdesc = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    "lv_body = '{"userloginId":"ddxyq","productIds": ["Init31114005","15604834551287100000","Init31114006"]}'.
    lv_body = iv_data.
    CALL METHOD lo_api->put_data
      EXPORTING
        iv_rfcdest      = lv_rfcdesc "'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.

    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_return  ).

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
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
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


  METHOD UPDATE_PARTYCREDIT.

    DATA: lv_id TYPE string.
    DATA: ls_coupon TYPE zcoup_s_coupon.
    TYPES:      BEGIN OF ty_product,
                  id        TYPE string,
                  inventory TYPE  zcl_json=>json,
                END OF ty_product.
    DATA:lt_product TYPE SORTED TABLE OF ty_product WITH UNIQUE KEY id.
    DATA: lt_inventorys TYPE zprod_t_inventorys.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_code TYPE string.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PARTYCREDIT'
      AND method = 'UPDATE_PARTYCREDIT'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    lv_body = iv_data.
    CALL METHOD lo_api->put_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.

    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_return  ).

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
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
    ENDIF.



  ENDMETHOD.
ENDCLASS.
