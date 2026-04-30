class ZCL_ICEC_AFTERSALE_API definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF ts_returnreason,
        sequenceid          TYPE int4, ": 3,
        returnreasonid      TYPE string, ": "RTN_NUM_NMATCH",
        returnreasondesc    TYPE string, ": "配件编码不符(货不对版)",
        returnreasoncomment TYPE string, ": ""
      END OF ts_returnreason .
  types:
    tt_returnreason TYPE STANDARD TABLE OF ts_returnreason .
  types:
    BEGIN OF ts_returnreport_header,
        returnreportid         TYPE string,
        returnid               TYPE string,
        returntime             TYPE string,
        paymentmethod          TYPE string,
        suppliername           TYPE string,
        supplierproductstoreid TYPE string,
        customerspartyid       TYPE string,
        customersname          TYPE string,
        companyid              TYPE string,
        companyname            TYPE string,
        fulfillvendorid        TYPE string,
        fulfillstoreid         TYPE string,
        storetype              TYPE string,
        fulfillstorename       TYPE string,
        storename              TYPE string,
        discount               TYPE string,
        returnamount           TYPE string,
        createdby              TYPE string,
        orderid                TYPE string,
        sellerreturnamount     TYPE string,
        cassdiscountamount     TYPE string,
        goldcointotal          TYPE string,
        goldcoinamount         TYPE string,
        paymonthly             TYPE string,
        returncostfee          TYPE string,
        orderstoretype         TYPE string,
        invoicetype            TYPE string,
        invoicediscount        TYPE string,
        lastupdatedstamp       TYPE string,
        lastupdatedtxstamp     TYPE string,
        createdstamp           TYPE string,
        createdtxstamp         TYPE string,
      END OF ts_returnreport_header .
  types:
    BEGIN OF ts_returnreport_item,
        returnreportid                 TYPE string,
        returnreportitemseqid          TYPE string,
        returnid                       TYPE string,
        returnitemseqid                TYPE string,
        returnheadertypeid             TYPE string,
        returnreasonid                 TYPE string,
        returntypeid                   TYPE string,
        returnitemtypeid               TYPE string,
        productid                      TYPE string,
        description                    TYPE string,
        orderid                        TYPE string,
        orderitemseqid                 TYPE string,
        statusid                       TYPE string,
        expecteditemstatus             TYPE string,
        returnquantity                 TYPE string,
        receivedquantity               TYPE string,
        returnprice                    TYPE string,
        amount                         TYPE string,
        returnitemresponseid           TYPE string,
        createdby                      TYPE string,
        frompartyid                    TYPE string,
        topartyid                      TYPE string,
        paymentmethodid                TYPE string,
        finaccountid                   TYPE string,
        billingaccountid               TYPE string,
        entrydate                      TYPE string,
        origincontactmechid            TYPE string,
        destinationcontactmechid       TYPE string,
        lastupdatedstamp               TYPE string,
        lastupdatedtxstamp             TYPE string,
        createdstamp                   TYPE string,
        createdtxstamp                 TYPE string,
        returnsellerprice              TYPE string,
        internalname                   TYPE string,
        partsno                        TYPE string,
        productname                    TYPE string,
        productbrandid                 TYPE string,
        productbrandname               TYPE string,
        quality                        TYPE string,
        qualityname                    TYPE string,
        originalsellerprice            TYPE string,
        buyerprice                     TYPE string,
        returnreasondescription        TYPE string,
        originalpartsnum               TYPE string,
        goldcoinprice                  TYPE string,
        goldcoincount                  TYPE string,
        couponamount                   TYPE string,
        cassdiscountsingle             TYPE string,
        returnreportdiscounts          TYPE string,
        casspayonlineamount            TYPE string,
        cassflowamount                 TYPE string,
        storefulloffamount             TYPE string,
        storecustomizeinqfulloffamount TYPE string,
        cassdiscountamount             TYPE string,
        goldcoinamount                 TYPE string,
        storecouponamount              TYPE string,
      END OF ts_returnreport_item .
  types:
    BEGIN OF ts_returnreport,
        returnreport               TYPE ts_returnreport_header,
        aftersalereturnreportitems TYPE STANDARD TABLE OF ts_returnreport_item WITH DEFAULT KEY,
        returnreportfees           TYPE string,
      END OF ts_returnreport .
  types:
    BEGIN OF ty_commonshanderresult,
        issuccess      TYPE string,
        failurereasons TYPE string,
        data           TYPE string,
      END OF ty_commonshanderresult .
  types:
    BEGIN OF ty_result,
        ok           TYPE string,
        error        TYPE string,
        code         TYPE  string,
        errormessage TYPE  string,
        data         TYPE string,
      END OF ty_result .
  types:
    "查询赔付单简要信息
    BEGIN OF ty_deductfees,
             aftersalerefundid TYPE string, ": "", // 账单ID
             asid              TYPE string, ": "", // 售后申请单
             deductfee         TYPE string, ": null, // 扣减金额
             feetype           TYPE string, ": "", // 费用明细类型：和退款单扣减类型相同
             feetypedesc       TYPE string, ": "" // 费用明细类型描述：和退款单扣减类型相同
           END OF ty_deductfees .
  types:
    BEGIN OF ty_data,"// 售后单关联帐单信息
             actualamount      TYPE string, ": null, // 实际金额
             aftersalerefundid TYPE string, ": "", // 账单ID
             asid              TYPE string, ": "", // 售后申请单
             billtype          TYPE string, ": "", // 退货单类型
             declaredamount    TYPE string, ": null, // 申请金额
             deductamount      TYPE string, ": null, // 扣减金额
             deductfees        TYPE STANDARD TABLE OF ty_deductfees WITH DEFAULT KEY, ":  // 退款单扣减明细
             deductremark      TYPE string, ": "", // 扣减备注
             identifyquality   TYPE string, ": "", // 退款时间
             ownershipgoods    TYPE string, ": "", // 配件初步鉴定结果
             refundtime        TYPE string, ": "" // 退款时间
           END OF ty_data .
  types:
    BEGIN OF ty_asinf,
             code         TYPE string, ": "", // null
             data         TYPE ty_data, ": "售后单关联帐单信息
             errormessage TYPE string, ": "" // null
           END OF ty_asinf .
  types TS_ASINF type TY_ASINF .
  types:
    tt_asinf TYPE STANDARD TABLE OF ty_asinf .
  types:
  "售后单物流信息
    BEGIN OF ty_logisticsstatustrackdtos,
    desc TYPE string,": "运单sf2501260003034，已签收",
    operator TYPE string,": "小榄一号",
    handletime TYPE string,": 1737855093000
  END OF ty_logisticsstatustrackdtos .
  types:
    BEGIN OF ty_logisticsdata,"// 售后单关联物流信息
    logisticsstatustrackdtos TYPE STANDARD TABLE OF ty_logisticsstatustrackdtos WITH DEFAULT KEY,
  END OF ty_logisticsdata .
  types:
    BEGIN OF ty_aslogistics,
    CODE         TYPE string, ": "", // null
    DATA         TYPE ty_logisticsdata, ": "售后单关联物流信息
          errormessage TYPE string, ": "" // null
  END OF ty_aslogistics .
  types TS_ASLOGISTICS type TY_ASLOGISTICS .
  types:
    tt_aslogistics TYPE STANDARD TABLE OF ty_aslogistics .

  methods GET_PROCESSBAR_DETAIL
    importing
      value(IV_ASID) type STRING
      value(IV_TYPE) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_BARINFO) type ZAS_PROCESSBARHEADER .
  methods GET_AFTERSALE_DETAIL
    importing
      value(IV_ASID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_ASINFO) type ZAS_S_ASINFO
      !EV_OUT type STRING .
  methods GET_AFTERSALE_STATUS
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_ASDETAIL) type ZAS_T_ASDETAIL
      !EV_OUT type STRING .
  methods GET_AS_RETURNAMOUNT
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_ASRETURNAMOUNT) type ZAS_T_RETURNAMOUNT
      !EV_OUT type STRING .
  methods GET_ASDETAIL
    importing
      value(IV_ASID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_ASINFO) type TS_ASINF
      !EV_OUT type STRING .
  methods GET_ASLOGISTICS
    importing
      value(IV_ASID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_ASLOGISTICS) type TS_ASLOGISTICS
      !EV_OUT type STRING .
  methods GET_RETURNREPORT_DETAIL
    importing
      value(IV_RETURNID) type STRING
      value(IV_LOGINID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_RETURNINFO) type TS_RETURNREPORT .
  methods CLOSE_AFTERSALE
    importing
      value(IV_BODY) type STRING optional
    exporting
      !ES_RESULT type TY_COMMONSHANDERRESULT
      !EV_MSG type BAPIRET2 .
  methods GET_AFTERSALE_RETURNREASON
    importing
      value(ORDERID) type STRING
      value(ISRECIVED) type STRING
      value(ORDERITEMSEQID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_REASON) type TT_RETURNREASON .
  methods UPDATE_AFTERSALE_STATUS
    importing
      value(ES_ASINF) type ZAS_AFTERSALEINF
    exporting
      !EV_MSG type BAPIRET2
    returning
      value(ES_RESULT) type TY_RESULT .
  methods REBATE_GOLD_COINS
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2 .
  methods ASAPPROVAL_CALLBACK
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(EV_RETURN) type TS_ASINF .
  methods REBATE_GOLD_COINS_NEW
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(EV_REBATE) type STRING .
  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS save_api_log
      IMPORTING
        VALUE(ev_msg)          TYPE bapiret2 OPTIONAL
        VALUE(iv_commit)       TYPE char01 OPTIONAL
        VALUE(iv_keyvalue)     TYPE string OPTIONAL
        VALUE(iv_requestbody)  TYPE string OPTIONAL
        VALUE(iv_responsebody) TYPE string OPTIONAL .
ENDCLASS.



CLASS ZCL_ICEC_AFTERSALE_API IMPLEMENTATION.


  METHOD ASAPPROVAL_CALLBACK.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AFTERSALE'
          AND method = 'ASAPPROVAL_CALLBACK'.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = ls_ztint_icec_api-rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = iv_body
*        iv_title        = lv_title
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          /ui2/cl_json=>deserialize(
          EXPORTING
            json = lv_out
          CHANGING
          data = ev_return  ).
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
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
    ENDIF.
  ENDMETHOD.


  METHOD close_aftersale.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AFTERSALE'
          AND method = 'CLOSE_AFTERSALE'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.


    DATA:lv_title TYPE string.
    lv_title = '同步工单关闭状态至平台更新售后申请单状态(ZCL_ICEC_AFTERSALE_API->CLOSE_AFTERSALE)'.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = iv_body
        iv_title        = lv_title
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
          data = es_result ) .

          ev_msg-type = 'S'.
          ev_msg-id = '200'.
          ev_msg-message = 'JSON成功解析'.
        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).
          ev_msg-type = 'E'.
          ev_msg-id = '404'.
          ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
        CATCH cx_root.
          ev_msg-type = 'E'.
          ev_msg-id = '404'.
          ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
      ENDTRY.
    ENDIF.
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_requestbody = iv_body iv_responsebody = lv_out ).
    ENDIF.

  ENDMETHOD.


  METHOD get_aftersale_detail.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AFTERSALE'
          AND method = 'GET_AFTERSALE_DETAIL'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{asId}' IN lv_uri WITH iv_asid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = ls_ztint_icec_api-rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg
                          ).
    IF lv_out IS NOT INITIAL .

      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
          EXPORTING
            json = lv_out
          CHANGING
          data = es_asinfo  ).


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

      ev_out = lv_out .
    ENDIF.
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg   iv_responsebody = lv_out ).
    ENDIF.



  ENDMETHOD.


  METHOD get_aftersale_returnreason.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AFTERSALE'
          AND method = 'GET_AFTERSALE_RETURNREASON'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{orderId}' IN lv_uri WITH orderid.
    REPLACE '{orderItemSeqId}' IN lv_uri WITH orderitemseqid.
    REPLACE '{isRecived}' IN lv_uri WITH isrecived.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          /ui2/cl_json=>deserialize(
          EXPORTING
            json = lv_out
          CHANGING
          data = et_reason  ).
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
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg   iv_responsebody = lv_out ).
    ENDIF.
  ENDMETHOD.


  METHOD GET_AFTERSALE_STATUS.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AFTERSALE'
          AND method = 'GET_AFTERSALE_STATUS'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = ls_ztint_icec_api-rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = iv_body
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg
                          ).
    IF lv_out IS NOT INITIAL .

      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
          EXPORTING
            json = lv_out
          CHANGING
          data = es_asdetail  ).


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

      ev_out = lv_out .
    ENDIF.
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg   iv_responsebody = lv_out ).
    ENDIF.


  ENDMETHOD.


  METHOD get_asdetail.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AFTERSALE'
          AND method = 'GET_ASDETAIL'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{asId}' IN lv_uri WITH iv_asid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = ls_ztint_icec_api-rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
          EXPORTING
            json = lv_out
          CHANGING
          data = es_asinfo  ).


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

      ev_out = lv_out .
    ENDIF.
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg   iv_responsebody = lv_out ).
    ENDIF.



  ENDMETHOD.


METHOD get_aslogistics.
  DATA:lv_uri          TYPE string,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'AFTERSALE'
        AND method = 'GET_ASLOGISTICS'.

  lv_uri = ls_ztint_icec_api-url.

  REPLACE '{asId}' IN lv_uri WITH iv_asid.

  ls_content_type-content_type = 'application/json;charset=UTF-8'.
  ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  CALL METHOD lo_api->get_data(
    EXPORTING
      iv_rfcdest      = ls_ztint_icec_api-rfcdest
      iv_uri          = lv_uri
      is_content_type = ls_content_type
    IMPORTING
      json_out        = lv_out
      ev_msg          = ev_msg
                        ).
  IF lv_out IS NOT INITIAL .
    "解析json
    TRY.

        /ui2/cl_json=>deserialize(
        EXPORTING
          json = lv_out
        CHANGING
        data = es_aslogistics  ).


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

    ev_out = lv_out .
  ENDIF.
  IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg   iv_responsebody = lv_out ).
  ENDIF.


ENDMETHOD.


METHOD get_as_returnamount.
  DATA:lv_uri          TYPE string,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'AFTERSALE'
        AND method = 'GET_AS_RETURNAMOUNT'.

  lv_uri = ls_ztint_icec_api-url.

  ls_content_type-content_type = 'application/json;charset=UTF-8'.
  ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  CALL METHOD lo_api->post_data(
    EXPORTING
      iv_rfcdest      = ls_ztint_icec_api-rfcdest
      iv_uri          = lv_uri
      is_content_type = ls_content_type
      iv_body         = iv_body
    IMPORTING
      json_out        = lv_out
      ev_msg          = ev_msg
                        ).
  IF lv_out IS NOT INITIAL .

    "解析json
    TRY.

        /ui2/cl_json=>deserialize(
        EXPORTING
          json = lv_out
        CHANGING
        data = es_asreturnamount  ).


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

    ev_out = lv_out .
  ENDIF.
  IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg   iv_responsebody = lv_out ).
  ENDIF.



ENDMETHOD.


  METHOD get_processbar_detail.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AFTERSALE'
          AND method = 'GET_PROCESSBAR_DETAIL'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{asId}' IN lv_uri WITH iv_asid.

    REPLACE '{type}' IN lv_uri WITH iv_type.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM' "'PLATFORM-DEV'"
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
          EXPORTING
            json = lv_out
          CHANGING
          data = es_barinfo  ).


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
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg   iv_responsebody = lv_out ).
    ENDIF.

  ENDMETHOD.


  METHOD get_returnreport_detail.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AFTERSALE' AND method = 'GET_RETURNREPORT_DETAIL'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{returnReportId}' IN lv_uri WITH iv_returnid .
    REPLACE '{userLoginId}' IN lv_uri WITH iv_loginid .

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
          EXPORTING
            json = lv_out
          CHANGING
          data = es_returninfo  ).


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
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg   iv_responsebody = lv_out ).
    ENDIF.



  ENDMETHOD.


  METHOD rebate_gold_coins.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AFTERSALE'
          AND method = 'REBATE_GOLD_COINS'.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA:lv_title TYPE string.
    lv_title = '质保工单回扣金币(ZCL_ICEC_AFTERSALE_API->REBATE_GOLD_COINS)'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = iv_body
        iv_title        = lv_title
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg ).
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
    ENDIF.
  ENDMETHOD.


  METHOD rebate_gold_coins_new.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AFTERSALE'
          AND method = 'REBATE_GOLD_COINS_NEW'.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA:lv_title TYPE string.
    lv_title = '质保工单回扣金币(ZCL_ICEC_AFTERSALE_API->REBATE_GOLD_COINS_NEW)'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = iv_body
        iv_title        = lv_title
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          /ui2/cl_json=>deserialize(
          EXPORTING
            json = lv_out
          CHANGING
          data = ev_rebate  ).
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
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
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
    ls_apilog-zcrt_bdate = sy-datum.
    ls_apilog-zcrt_btime = sy-uzeit.
    ls_apilog-zcrt_uname = sy-uname.
    ls_apilog-requestbody = iv_requestbody.
    ls_apilog-responsebody = iv_responsebody.
    MODIFY zticec_api_log FROM ls_apilog.
    IF iv_commit IS NOT INITIAL..
      COMMIT WORK AND WAIT .
    ENDIF.
  ENDMETHOD.


  METHOD update_aftersale_status.
    DATA lv_uri TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_body TYPE string.
    DATA lv_aftersaleform TYPE string.
    DATA lv_postaddress TYPE string.
    DATA(lo_api) = NEW zcl_icec_api( ).
    DATA lv_title TYPE string.

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AFTERSALE'
          AND method = 'UPDATE_AFTERSALE_STATUS'.
    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(ls_aftersale) = es_asinf-aftersaleform.
*    REPLACE ALL OCCURRENCES OF  '\'  IN ls_aftersale-appealresponse WITH ''.
    ls_aftersale-appealresponse = zcl_cassint_formatter=>filter_emoji_string( EXACT string( ls_aftersale-appealresponse ) ) .
    CONDENSE ls_aftersale-appealresponse NO-GAPS.
    CONDENSE ls_aftersale-returncostfee NO-GAPS.
    "入参
    lv_postaddress = '{' &&
    |\\"asId\\":\\"{ ls_aftersale-id }\\",\\"receiverName\\":\\"{ ls_aftersale-postaddress-receivername }\\",| &&
    |\\"address\\":\\"{ ls_aftersale-postaddress-address }\\",\\"contactTel\\":\\"{ ls_aftersale-postaddress-contacttel }\\",| &&
    |\\"contactNumber\\":\\"{ ls_aftersale-postaddress-contactnumber }\\"| &&  '}'.

    lv_aftersaleform = '{'  && |\\"ID\\":\\"\\",\\"asStatusId\\":\\"{ ls_aftersale-asstatusid }\\",| &&
    |\\"handleReason\\":\\"{ ls_aftersale-handlereason }\\",\\"handleMessage\\":\\"{ ls_aftersale-handlemessage }\\",| &&
    |\\"handleUserId\\":\\"{ ls_aftersale-handleuserid }\\",\\"repairDesc\\":\\"{ ls_aftersale-repairdesc }\\",| &&
    |\\"supplierDesc\\":\\"{ ls_aftersale-supplierdesc }\\",\\"platformDesc\\":\\"{ ls_aftersale-platformdesc }\\",| &&
    |\\"dealMessage\\":\\"{ ls_aftersale-dealmessage }\\",\\"lastUpdatedStamp\\":null,\\"lastUpdatedTxStamp\\":null,| &&
    |\\"createdStamp\\":null,\\"createdTxStamp\\":null,| &&
    |\\"returnGoldCoin\\":\\"{ ls_aftersale-returngoldcoin }\\",\\"toCreateReturnReport\\":\\"{ ls_aftersale-tocreatereturnreport }\\",| &&
    |\\"returnCostFee\\":\\"{ ls_aftersale-returncostfee }\\",\\"isPaidCoin\\":\\"{ ls_aftersale-ispaidcoin }\\",| &&
    |\\"isRebate\\":\\"{ ls_aftersale-isrebate }\\",\\"compensationMessage\\":\\"{ ls_aftersale-compensationmessage }\\",| &&
    |\\"rebateCoin\\":\\"{ ls_aftersale-rebatecoin }\\",| &&
    |\\"appealResponse\\":\\"{ ls_aftersale-appealresponse }\\",\\"postAddress\\":{ lv_postaddress }|  && '}'.
    lv_body = '{' && | "asId": "{ es_asinf-asid }","handleUserName":"{  es_asinf-handleusername }","handleBehavior": "",| &&
    |"handleTime":"{ es_asinf-handletime } ","afterSaleForm":"{  lv_aftersaleform }"| && '}'.

*    REPLACE ALL OCCURRENCES OF '\\' IN lv_body  WITH '\'.

    "调用接口
    lv_title = '同步节点信息至平台更新售后申请单状态(ZCL_ICEC_AFTERSALE_API->UPDATE_AFTERSALE_STATUS)'.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
        iv_title        = lv_title
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
          data = es_result ) .
          ev_msg-type = 'S'.
          ev_msg-id = '200'.
          ev_msg-message = 'JSON成功解析'.
        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).
          ev_msg-type = 'E'.
          ev_msg-id = '404'.
          ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
        CATCH cx_root.
          ev_msg-type = 'E'.
          ev_msg-id = '404'.
          ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
      ENDTRY.
    ENDIF.
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_requestbody = lv_body iv_responsebody = lv_out ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
