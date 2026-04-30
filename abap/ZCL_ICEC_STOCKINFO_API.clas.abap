class ZCL_ICEC_STOCKINFO_API definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF ts_purchase_status,
            companyid TYPE string,
            status    TYPE string,
          END OF ts_purchase_status .
  types:
    tt_purchase_status TYPE STANDARD TABLE OF ts_purchase_status WITH DEFAULT KEY .
  types:
    BEGIN OF ts_purchasebagpromiserewards,
        id                   TYPE string, "1702354872114851866",
        purchasebagpromiseid TYPE string, "1640377195251453952",
        rewardtype           TYPE string, "POINT",
        rewardcalculate      TYPE  string, "RATIO
        rewardcalculatevalue TYPE string, "12.66",
        imgurl               TYPE string, "1",
        rewardcondition      TYPE string, "实际采购量*2.66%"
      END OF ts_purchasebagpromiserewards .
  types:
    BEGIN OF ts_stockpurchasebags,
        promiseid                 TYPE string, "
        purchasequantity          TYPE string, "2000,
        purchasequantityunit      TYPE string, "元",
        purchasebagpromiserewards TYPE STANDARD TABLE OF ts_purchasebagpromiserewards WITH DEFAULT KEY,
        purchaseagreementrewards  TYPE string, "
      END OF ts_stockpurchasebags .
  types:
    BEGIN OF ts_stockpurchase_cont,
        id               TYPE string, "1643695088575483904",
        code             TYPE string, "D202005008",
        name             TYPE string, "yhl_内部演示_商品包_积分奖品",
        agreementenddate TYPE string, "2020-06-30",
        purchasedatetype TYPE string, "DEADLINE",
        periodnum        TYPE string,
        assigndate       TYPE string, "2020-06-01",
        agreementstatus  TYPE string, "INVALID",
        rewardstatus     TYPE string, "EXPIRED",
        depositstatus    TYPE string, "NO_PAY",
        deposittype      TYPE string, "AMOUNT",
        companyid        TYPE string, "bjkJpEn9Lh4bzziUPwI",
        companyname      TYPE string, "苏州市维奕汽车销售有限公司",
        companycode      TYPE string,                       "C0190856",
        purchasebags     TYPE STANDARD TABLE OF ts_stockpurchasebags WITH DEFAULT KEY,
        contractid       TYPE string, "5ed4cc579366cb0001b2d8e9",
        depositvalue     TYPE string, "88",
        purchasedpercent TYPE string, "
        purchaseamount   TYPE string, "
      END OF ts_stockpurchase_cont .
  types:
    BEGIN OF ts_stockpurchase,
        content       TYPE STANDARD TABLE OF ts_stockpurchase_cont WITH DEFAULT KEY,
        number        TYPE string,
        size          TYPE string,
        totalelements TYPE string,
        totalpages    TYPE string,
        first         TYPE string,
        last          TYPE string,
      END OF ts_stockpurchase .
  types:
    BEGIN OF ts_stocklist,
        id                 TYPE string, "ID
        companyid          TYPE string, "公司ID
        companyname        TYPE string, "公司名称
        brandcode          TYPE string, "品牌编码
        brandname          TYPE string, "品牌名称
        categorycode       TYPE string, "品类编码
        categoryname       TYPE string, "品类名称
        imageurl           TYPE string, "
        partnumber         TYPE string, "零件号
        standardpartnumber TYPE string, "标准零件号
        parttype           TYPE string, "配件类型
        clarifystatus      TYPE string, "澄清状态
        partname           TYPE string, "配件名称
        stocknum           TYPE string, "常备数量
        vehiclebrandcode   TYPE string, "汽车品牌编码
        vehiclebrandname   TYPE string, "汽车品牌名称
        createddate        TYPE string, "创建时间
        lastupdatedby      TYPE string, "创建人
        lastupdateddate    TYPE string, "最后更新时间
      END OF ts_stocklist .
  types:
    tt_stocklist TYPE STANDARD TABLE OF ts_stocklist WITH DEFAULT KEY .
  types:
    BEGIN OF ts_stockinfo_list,
        number           TYPE string,
        size             TYPE string,
        totalelements    TYPE string,
        totalpages       TYPE string,
        first            TYPE string,
        last             TYPE string,
        sort             TYPE string,
        numberofelements TYPE string,
        content          TYPE STANDARD TABLE OF ts_stocklist WITH DEFAULT KEY,
      END OF ts_stockinfo_list .
  types:
    BEGIN OF ts_stockbasicinf,
        id TYPE string,
      END OF ts_stockbasicinf .
  types:
    BEGIN OF ts_stockcategories,
        categorycode TYPE string,
        categoryname TYPE string,
      END OF ts_stockcategories .
  types:
    tt_stockcategories TYPE STANDARD TABLE OF ts_stockcategories WITH DEFAULT KEY .
  types:
    BEGIN OF ts_vehicle_series,
        seriesname TYPE string,
      END OF ts_vehicle_series .
  types:
    tt_seriesname TYPE STANDARD TABLE OF ts_vehicle_series WITH DEFAULT KEY .
  types:
    BEGIN OF ts_vehicle_manufacturers,
        manufacturer TYPE string,
      END OF ts_vehicle_manufacturers .
  types:
    tt_vehicle_manufacturers TYPE STANDARD TABLE OF ts_vehicle_manufacturers WITH DEFAULT KEY .
  types:
      "添加配件
    BEGIN OF ts_addstock_list,
        sequence           TYPE string, "序号
        companyid          TYPE string, "公司ID
        brandcode          TYPE string, "品牌编码
        quality            TYPE string, "常备数量
        parttype           TYPE string, "配件类型
        categorycode       TYPE string, "品类编码
        partnumber         TYPE string, "零件号
        standardpartnumber TYPE string, "标准零件号
        partname           TYPE string, "配件名称
        imageurl           TYPE string, "
        stocknum           TYPE string, "常备数量
        createdby          TYPE string, "创建人id
        createdbyname      TYPE string, "创建人
        sourcetype         TYPE string, "
        valid              TYPE string,
      END OF ts_addstock_list .
  types:
    BEGIN OF ts_quantity,
        all     TYPE string,
        success TYPE string,
        failure TYPE string,
      END OF ts_quantity .
  types:
    BEGIN OF ts_errormsg,
        number    TYPE string,
        errortype TYPE string,
        message   TYPE string,
      END OF ts_errormsg .
  types:
    BEGIN OF ts_addstock_header,
        failures     TYPE STANDARD TABLE OF ts_addstock_list WITH EMPTY KEY,
        quantity     TYPE ts_quantity,
        errormessage TYPE STANDARD TABLE OF ts_errormsg WITH EMPTY KEY,
      END OF ts_addstock_header .
  types:
    BEGIN OF ts_brandinfo,
        brandcode TYPE string,
        brandname TYPE string,
        isoem     TYPE string,
      END OF ts_brandinfo .
  types:
    tt_brandinfo TYPE STANDARD TABLE OF ts_brandinfo WITH EMPTY KEY .
  types:
    BEGIN OF ty_picture,
        id       TYPE string,
        seqnum   TYPE int4,
        name     TYPE string,
        type     TYPE string,
        typecode TYPE string,
        url      TYPE string,
      END OF ty_picture .
  types:
    BEGIN OF ts_standardinf,
        std_name      TYPE string,
        std_name_code TYPE string,
        category_name TYPE string,
        category_code TYPE string,
      END OF ts_standardinf .
  types:
    BEGIN OF ts_vehiclebrandpart,"品牌配件匹配信息
        brand              TYPE string,
        aecode             TYPE string,
        aename             TYPE string,
        categoryname       TYPE string,
        pictures           TYPE  STANDARD TABLE OF ty_picture WITH EMPTY KEY,
        standardnameobject TYPE  ts_standardinf,
      END OF ts_vehiclebrandpart .
  types:
    tt_vehiclebrandpart TYPE STANDARD TABLE OF ts_vehiclebrandpart WITH EMPTY KEY .
  types:
    BEGIN OF ts_oelist,
        status      TYPE string,
        isfastflow  TYPE string,
        brandcode   TYPE string,
        brandcodecn TYPE string,
        paramcode   TYPE string,
        oe_code     TYPE string,
        oe_name     TYPE string,
        std_name    TYPE string,
        price_4s    TYPE string,
        stdnameobj  TYPE ts_standardinf,
      END OF ts_oelist .
  types:
    BEGIN OF ts_partsitem,
        ignorevinoeslist TYPE STANDARD TABLE OF ts_oelist WITH EMPTY KEY,
        brandcode        TYPE string,
        oecodelist       TYPE string,
      END OF ts_partsitem .
  types:
    tt_partsitem TYPE STANDARD TABLE OF ts_partsitem WITH EMPTY KEY .
  types:
    BEGIN OF ts_originalparts,
        message    TYPE string,
        statuscode TYPE string,
        success    TYPE string,
        data       TYPE STANDARD TABLE OF ts_partsitem WITH EMPTY KEY,
      END OF ts_originalparts .
  types:
      "***推荐清单****
    BEGIN OF ts_stockrecommend_l,
        id               TYPE string, "序号
        brandcode        TYPE string, "品牌编码
        brandname        TYPE string, "品牌名称
        parttype         TYPE string, "配件类型
        categorycode     TYPE string, "配件品类编码
        categoryname     TYPE string, "配件品类名称
        partnumber       TYPE string, "零件号
        partname         TYPE string, "配件名称
        imageurl         TYPE string, "图片地址
        vehiclebrandcode TYPE string, "车辆品牌code
        vehiclebrand     TYPE string, "车辆品牌
        vehicleseries    TYPE string, "车系
      END OF ts_stockrecommend_l .
  types:
    BEGIN OF ts_stockrecommend_h,
        number           TYPE string,
        size             TYPE string,
        totalelements    TYPE string,
        totalpages       TYPE string,
        numberofelements TYPE string,
        content          TYPE STANDARD TABLE OF ts_stockrecommend_l WITH DEFAULT KEY,
      END OF ts_stockrecommend_h .
  types:
      "油品备货F4--查询标名属性（属性值带单位），包含品牌
    BEGIN OF ts_brandlist,
        brandcode    TYPE string,
        brandname    TYPE string,
        selectstatus TYPE string,
      END OF ts_brandlist .
  types:
    BEGIN OF ts_cattrlist,
        id             TYPE string,
        categoryid     TYPE string,
        categoryname   TYPE string,
        attrname       TYPE string,
        isrequired     TYPE string,
        attrtype       TYPE string,
        attrunit       TYPE string,
        attrvalue      TYPE string,
        iscategoryshow TYPE string,
        createdby      TYPE string,
        createddate    TYPE string,
        updatedby      TYPE string,
        updateddate    TYPE string,
        selectstatus   TYPE string,
      END OF ts_cattrlist .
  types:
    BEGIN OF ts_listattrs_brands,
        brandlist        TYPE STANDARD TABLE OF ts_brandlist WITH DEFAULT  KEY,
        categoryattrlist TYPE STANDARD TABLE OF ts_cattrlist WITH DEFAULT  KEY,
      END OF ts_listattrs_brands .
  types:
    tt_listattrs_brands TYPE STANDARD TABLE OF ts_listattrs_brands WITH EMPTY KEY .

    "***推荐清单****
  methods GET_STOCKINFO_LIST
    importing
      value(IV_BODY) type STRING
    exporting
      !ES_STOCK_INF type TS_STOCKINFO_LIST
      !EV_MSG type BAPIRET2 .
  methods GET_BRAND_INFO
    importing
      value(IV_BODY) type STRING
    exporting
      !ET_DATA type TT_BRANDINFO
      !EV_MSG type BAPIRET2 .
  methods GET_ORIGINALPART_INFO
    importing
      value(IV_BODY) type STRING
    exporting
      !ES_DATA type TS_ORIGINALPARTS
      !EV_MSG type BAPIRET2 .
  methods GET_VEHICLEBRANDPART_INFO
    importing
      value(IV_BODY) type STRING
    exporting
      !ET_DATA type TT_VEHICLEBRANDPART
      !EV_MSG type BAPIRET2 .
  methods STOCKINFOS_BATCH_ADD
    importing
      value(IV_BODY) type STRING
    exporting
      !ES_DATA type TS_ADDSTOCK_HEADER
      !EV_MSG type BAPIRET2 .
  methods GET_ALLSTOCKCATEGORIES
    exporting
      value(ET_OUTPUT) type TT_STOCKCATEGORIES
      value(ES_MSG) type BAPIRET2 .
  methods GET_VEHICLE_SERIES
    importing
      value(IV_BODY) type STRING
    exporting
      value(ET_OUTPUT) type TT_SERIESNAME
      value(ES_MSG) type BAPIRET2 .
  methods DELETE_STOCKINF_BYID
    importing
      value(IV_ID) type STRING
    exporting
      value(ES_MSG) type BAPIRET2 .
  methods GET_VEHICLE_MANUFACTURERS
    importing
      value(IV_BRAND) type STRING
    exporting
      value(ET_OUTPUT) type TT_VEHICLE_MANUFACTURERS
      value(ES_MSG) type BAPIRET2 .
  methods GET_STOCKRECOMMEND_INF
    importing
      value(IV_BODY) type STRING
    exporting
      !ES_STOCKRECOMMAND type TS_STOCKRECOMMEND_H
      !EV_MSG type BAPIRET2 .
  methods UPDATE_STOCKBASICINF_TOEC
    importing
      value(IV_BODY) type STRING
    exporting
      value(ES_OUTPUT) type TS_STOCKBASICINF
      value(ES_MSG) type BAPIRET2 .
  methods GET_LISTATTRS_BRANDS
    importing
      value(IV_CATEGORYNAME) type STRING
    exporting
      value(ES_OUTPUT) type TS_LISTATTRS_BRANDS
      value(ES_MSG) type BAPIRET2 .
  methods GET_STOCK_PURCHASE_AGGRELIST
    importing
      !IV_BODY type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ES_LIST type TS_STOCKPURCHASE .
  methods GET_STOCK_PURCHASE_STATUS
    importing
      !IV_COMPANYID type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ET_DATA type TT_PURCHASE_STATUS .
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



CLASS ZCL_ICEC_STOCKINFO_API IMPLEMENTATION.


  METHOD delete_stockinf_byid.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_body TYPE string.
    DATA lv_data TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'STOCK' AND method = 'DELETE_STOCKINF_BYID'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{Id}' IN  lv_uri WITH iv_id.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->delete_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
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
                         data = lv_data ).
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


  METHOD get_allstockcategories.
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'STOCK' AND method = 'GET_ALLSTOCKCATEGORIES'.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.


    DATA(lo_api) = NEW zcl_icec_api( ).
    DATA:lv_title TYPE string.
    lv_title = '获取全部维修厂备货品类(ZCL_ICEC_STOCKINFO_API->GET_ALLSTOCKCATEGORIES)'.

    CALL METHOD lo_api->get_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = es_msg.

    IF lv_out IS NOT INITIAL.
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_output ).
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


  METHOD GET_BRAND_INFO.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT' AND method = 'GET_BRAND_INFO'.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    DATA:lv_title TYPE string.
    lv_title = '根据品牌ID获取配件类型信息(ZCL_ICEC_STOCKINFO_API->GET_BRAND_INFO)'.
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
    IF lv_out IS NOT INITIAL.
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data =   et_data ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_listattrs_brands.
    DATA:lv_uri          TYPE string,
         lv_categoryname TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_out          TYPE string.

*&---取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT' AND method = 'GET_LISTATTRS_BRANDS'.
    lv_uri = ls_ztint_icec_api-url.
    CALL METHOD cl_http_utility=>escape_url
      EXPORTING
        unescaped = iv_categoryname
      RECEIVING
        escaped   = lv_categoryname.
    REPLACE '{categoryName}' IN  lv_uri WITH lv_categoryname.

*&---获取API数据
    CLEAR:ls_content_type,lv_out,es_msg.
    ls_content_type-content_type = 'text/plain; charset=utf-8'.

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
                         data = es_output  ).
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


  METHOD get_originalpart_info.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MAINDATA' AND method = 'GET_ORIGINALPART_INFO'.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    DATA:lv_title TYPE string.
    lv_title = '批量获取原厂件标准零件号(ZCL_ICEC_STOCKINFO_API->GET_ORIGINALPART_INFO)'.
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
    IF lv_out IS NOT INITIAL.
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data =   es_data ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_stockinfo_list.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'STOCK' AND method = 'GET_STOCKINFO_LIST'.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    DATA:lv_title TYPE string.
    lv_title = '获取公司备货清单(ZCL_ICEC_STOCKINFO_API->GET_STOCKINFO_LIST)'.
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
    IF lv_out IS NOT INITIAL.
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data =  es_stock_inf ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_stockrecommend_inf.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'STOCK' AND method = 'GET_STOCKRECOMMEND_INF'.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    DATA:lv_title TYPE string.
    lv_title = '查询推荐备货清单(ZCL_ICEC_STOCKINFO_API->GET_STOCKRECOMMEND_INF)'.
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
    IF lv_out IS NOT INITIAL.
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data =   es_stockrecommand ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_stock_purchase_aggrelist.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'STOCK' AND method = 'GET_STOCK_PURCHASE_AGGRELIST'.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                        ELSE ls_ztint_icec_api-rfcdest ).
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    DATA:lv_title TYPE string.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = lv_rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = iv_body
        iv_title        = lv_title
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.
    IF lv_out IS NOT INITIAL.
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data =   es_list ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_stock_purchase_status.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA:lv_body TYPE string.
    DATA:lt_data TYPE STANDARD TABLE OF string .
    DATA ls_data TYPE ts_vehicle_manufacturers.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'STOCK' AND method = 'GET_STOCK_PURCHASE_STATUS'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    REPLACE '{companyId}' IN  lv_uri WITH iv_companyid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
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
                         data = et_data ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg  iv_responsebody = lv_out ).
   ENDIF.
  ENDMETHOD.


  METHOD get_vehiclebrandpart_info.
    DATA:lv_url          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT' AND method = 'GET_VEHICLEBRANDPART_INFO'.


    lv_url = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    REPLACE '{lv_body}' IN lv_url WITH iv_body.
    DATA:lv_title TYPE string.
    lv_title = '获取品牌件配件信息 (ZCL_ICEC_STOCKINFO_API->GET_VEHICLEBRANDPART_INFO)'.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_url
        is_content_type = ls_content_type
        iv_body         = iv_body
        iv_title        = lv_title
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.
    IF lv_out IS NOT INITIAL.
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data =   et_data ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_url  iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_vehicle_manufacturers.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA:lv_body TYPE string.
    DATA:lt_data TYPE STANDARD TABLE OF string .
    DATA ls_data TYPE ts_vehicle_manufacturers.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT' AND method = 'GET_VEHICLE_MANUFACTURERS'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{brand}' IN  lv_uri WITH iv_brand.

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
                         data = lt_data ).
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
    IF lt_data IS NOT INITIAL.
      LOOP AT lt_data INTO DATA(lv_string).
        ls_data-manufacturer = lv_string.
        APPEND ls_data TO et_output.
        CLEAR lv_string.
      ENDLOOP.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = es_msg  iv_responsebody = lv_out ).
   ENDIF.
  ENDMETHOD.


  METHOD get_vehicle_series.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_body TYPE string.
    DATA: lv_title TYPE string.
    DATA: lv_out TYPE string.
    DATA lt_data TYPE STANDARD TABLE OF string.
    DATA ls_output TYPE ts_vehicle_series.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT' AND method = 'GET_VEHICLE_SERIES'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_title = '根据汽车品牌和制造商获取车系(ZCL_ICEC_STOCKINFO_API->GET_VEHICLE_SERIES)'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    lv_body = iv_body.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        iv_title        = lv_title
        is_content_type = ls_content_type
        iv_body         = iv_body
      IMPORTING
        json_out        = lv_out
        ev_msg          = es_msg.

    IF lv_out IS NOT INITIAL .  "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = lt_data ) .
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

    IF lt_data IS NOT INITIAL.
      LOOP AT  lt_data INTO DATA(lv_string).
        ls_output-seriesname = lv_string.
        APPEND ls_output TO et_output.
        CLEAR:lv_string,ls_output.
      ENDLOOP.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = es_msg iv_requestbody = lv_body iv_responsebody = lv_out ).
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


  METHOD stockinfos_batch_add.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'STOCK' AND method = 'STOCKINFOS_BATCH_ADD'.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    DATA:lv_title TYPE string.
    lv_title = '批量添加备货清单(ZCL_ICEC_STOCKINFO_API->STOCKINFOS_BATCH_ADD)'.
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
    IF lv_out IS NOT INITIAL.
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data =   es_data ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD update_stockbasicinf_toec.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_body TYPE string.
    DATA: lv_title TYPE string.
    DATA: lv_out TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'STOCK' AND method = 'UPDATE_STOCKBASICINF_TOEC'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_title = '同步维修厂基础信息到平台(ZCL_ICEC_STOCKINFO_API->UPDATE_STOCKBASICINF_TOEC)'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    lv_body = iv_body.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        iv_title        = lv_title
        is_content_type = ls_content_type
        iv_body         = iv_body
      IMPORTING
        json_out        = lv_out
        ev_msg          = es_msg.

    IF lv_out IS NOT INITIAL .  "解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_output ) .
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
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = es_msg iv_requestbody = lv_body iv_responsebody = lv_out ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
