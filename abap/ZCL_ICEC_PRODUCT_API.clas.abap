class ZCL_ICEC_PRODUCT_API definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF ts_ae,
        partsbrandid               TYPE string,
        partsbrandname             TYPE string,
        partnumber                 TYPE string,
        category                   TYPE string,
        qualityid	                 TYPE string,
        qualityname	               TYPE string,
        originalpartnumber         TYPE string,
        carbrandcode               TYPE string,
        categorycode               TYPE string,
        salesamount	               TYPE string,
        dealamount                 TYPE string,
        totalquoteratio	           TYPE string,
        firstquoteratio	           TYPE string,
        secondquoteratio           TYPE string,
        totalquotequantity         TYPE string,
        firstquotequantity         TYPE string,
        secondquotequantity	       TYPE string,
        dealskuquantity	           TYPE string,
        totalquoteconversionratio	 TYPE string,
        firstquoteconversionratio	 TYPE string,
        secondquoteconversionratio TYPE string,
        unavailablequotequantity   TYPE string,
        returnrate                 TYPE string,
        returnquantity             TYPE string,
        returnamount               TYPE string,
      END OF ts_ae .
  types:
    BEGIN OF ts_oe,
        carbrand                   TYPE string,
        carbrandcode               TYPE string,
        originalpartnumber         TYPE string,
        category                   TYPE string,
        categorycode               TYPE string,
        oevirtualprimarykey	       TYPE string,
        salesamount	               TYPE string,
        dealamount                 TYPE string,
        totalquoteratio	           TYPE string,
        firstquoteratio	           TYPE string,
        secondquoteratio           TYPE string,
        totalquotequantity         TYPE string,
        firstquotequantity         TYPE string,
        secondquotequantity	       TYPE string,
        totalpushquantity	         TYPE string,
        firstpushquantity	         TYPE string,
        secondpushquantity         TYPE string,
        dealskuquantity	           TYPE string,
        totalquoteconversionratio	 TYPE string,
        firstquoteconversionratio	 TYPE string,
        secondquoteconversionratio TYPE string,
        unavailablequotequantity   TYPE string,
        returnrate                 TYPE string,
        returnquantity             TYPE string,
        returnamount               TYPE string,
        aeproductanalysispagedtos  TYPE STANDARD TABLE OF ts_ae WITH DEFAULT KEY,
      END OF ts_oe .
  types:
    BEGIN OF ts_productana_oe,
        content       TYPE STANDARD TABLE OF ts_oe WITH DEFAULT KEY,
        number        TYPE string,
        size          TYPE string,
        totalelements TYPE string,
        totalpages    TYPE string,
        sort          TYPE string,
      END OF ts_productana_oe .
  types:
    BEGIN OF ts_productana_ae,
        content       TYPE STANDARD TABLE OF ts_ae WITH DEFAULT KEY,
        number        TYPE string,
        size          TYPE string,
        totalelements TYPE string,
        totalpages    TYPE string,
        sort          TYPE string,
      END OF ts_productana_ae .
  types:
    BEGIN OF ts_uncheckednumber,
        inventory_check TYPE string,
        replace_check   TYPE string,
        brand_check     TYPE string,
        shelf_check     TYPE string,
        un_quote_check  TYPE string,
      END OF ts_uncheckednumber .
  types:
    BEGIN OF ts_productcheckitem,
        diagnosisitem   TYPE string,
        status          TYPE string,
        producttotal    TYPE string,
        uncheckednumber TYPE ts_uncheckednumber,
        processedrate   TYPE string,
      END OF ts_productcheckitem .
  types:
    BEGIN OF ts_productcheck,
        producttotal TYPE string,
        checkitems   TYPE STANDARD TABLE OF ts_productcheckitem WITH DEFAULT KEY,
      END OF ts_productcheck .
  types:
    BEGIN OF ts_productovew,
        totalelements TYPE string,
      END OF ts_productovew .
  types:
    BEGIN OF ts_productattribute,
        id               TYPE string, "66cb4836fb022f0001e60752",
        orderid          TYPE string, "S2408250007542",
        orderitemseqid   TYPE string, "00001",
        productid        TYPE string, "2"2040292103971471360",
        attrname         TYPE string, "尺寸",
        attrvalue        TYPE string, "16",
        createdstamp     TYPE string, "1724598327000,
        createdby        TYPE string, "619dd66bbd22310001f68862",
        lastupdatedstamp TYPE string, "1724598327000,
        lastupdatedby    TYPE string, "619dd66bbd22310001f68862"
      END OF ts_productattribute .
  types:
    tt_productattribute TYPE STANDARD TABLE OF ts_productattribute WITH DEFAULT KEY .
  types:
    BEGIN OF ts_inventories,
        facilitystoreid TYPE string,
        facilityid      TYPE string,
        facilityname    TYPE string,
        inventory       TYPE string,
        defaultfacility TYPE string,
        geoid           TYPE string,
        lot             TYPE string,
        lat             TYPE string,
        distance        TYPE string,
      END OF ts_inventories .
  types:
    BEGIN OF ts_cproduct_inv,
        productid      TYPE string,
        productstoreid TYPE string,
        total          TYPE string,
        inventories    TYPE STANDARD TABLE OF ts_inventories WITH DEFAULT KEY,
      END OF ts_cproduct_inv .
  types:
    tt_cproduct_inv TYPE STANDARD TABLE OF ts_cproduct_inv .
  types:
    BEGIN OF ty_partsbrand,
        brandcode TYPE string,
        brandname TYPE string,
        isoem     TYPE string,
        quality   TYPE string,
        brandlogo TYPE string,
      END OF ty_partsbrand .
  types:
    tt_partsbrand TYPE STANDARD TABLE OF ty_partsbrand WITH DEFAULT KEY .
  types:
    BEGIN OF ts_aeinfo,
        quotaskunum          TYPE string,
        quotaorderskunum     TYPE string, ": "0",
        quotaskuprice        TYPE string, ": "133.33",
        quotaordersellnum    TYPE string, ": "0.000",
        quotaordersellamount TYPE string, ": "0.00",
        date                 TYPE string,                   ": "0115"
      END OF ts_aeinfo .
  types:
    tt_aeinfo TYPE STANDARD TABLE OF ts_aeinfo .
  types:
    BEGIN OF ts_aekeyinfoprot,
        productpartnum   TYPE string,
        productbrandid   TYPE string,
        productbrandname TYPE string,
        brandquality     TYPE string,
        productname      TYPE string,
      END OF ts_aekeyinfoprot .
  types:
    BEGIN OF ts_aekeyinfodata,
        products TYPE STANDARD TABLE OF ts_aekeyinfoprot WITH DEFAULT KEY,
      END OF ts_aekeyinfodata .
  types:
    BEGIN OF ts_aekeyinfo,
        data TYPE ts_aekeyinfodata,
      END OF ts_aekeyinfo .

  methods GET_PRODUCT_INVENTORYS
    importing
      value(IV_DATA) type STRING
    exporting
      value(ET_INVENTORYS) type ZPROD_T_INVENTORYS
      value(EV_MSG) type BAPIRET2 .
  methods GET_PRODUCT_PRICE_BYIDS
    importing
      value(IV_DATA) type STRING
    exporting
      value(ET_PRODUCTPRICE) type ZPROD_T_F_PRODUCTPRICE
      value(EV_MSG) type BAPIRET2 .
  methods GET_CATAGORYS_FIRSTCATAGORY
    importing
      value(IV_CATAGORYID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_BUSINESSCATAGORYID) type ZPROD_T_BUSINESSCATAGORYS .
  methods GET_CATAG_FIRSTCATAGORY_NEW
    importing
      value(IV_CATEGORYID) type STRING
      value(IV_DEPTH) type STRING
      value(IV_NEEDBASE) type STRING
    exporting
      value(ET_OUTPUT) type ZPROD_T_BUSINESSCATAGORYS_NEW
      value(EV_MSG) type BAPIRET2 .
  methods GET_PARTS_BRAND
    importing
      value(IV_BODY) type STRING
      !IV_CREATE type CHAR01 optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_OUTPUT) type TT_PARTSBRAND .
  methods GET_CATAGORYS_BASE
    importing
      value(IV_KEY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_BASECATAGORYS) type ZPROD_T_BASECATAGORYS .
  methods GET_GROUPACT_PRODUCT_DETAIL
    importing
      value(IV_PRODUCTID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_OUTPUT) type ZPROD_S_ACTPRODUCT_DETAIL .
  methods GET_GROUPACT_PRODUCT_LIST
    importing
      value(IV_BODY) type STRING
    exporting
      value(ES_OUTPUT) type ZPROD_S_ACTPRODDUCT_HEAD
      value(EV_MSG) type BAPIRET2 .
  methods GET_PRODUCT_ATTR
    importing
      value(IV_ORDER) type STRING
    exporting
      value(ET_DATA) type TT_PRODUCTATTRIBUTE
      value(EV_MSG) type BAPIRET2 .
  methods GET_SALEACT_PRODUCT_LIST
    importing
      value(IV_BODY) type STRING
    exporting
      value(ES_OUTPUT) type ZPROD_S_SALEPRODUCT_HEAD
      value(EV_MSG) type BAPIRET2 .
  methods GET_PRODUCTDETAIL_BYIDS
    importing
      value(IV_BODY) type STRING
    exporting
      value(ET_OUTPUT) type ZPROD_T_PRODUCT_DETAIL
      value(EV_MSG) type BAPIRET2 .
  methods GET_VEN_INVOICECONFIG
    importing
      value(IV_BODY) type STRING optional
    exporting
      !EV_MSG type BAPIRET2
      !ET_INVOICECONFIG type ZPROD_T_VENINVOICE_INF .
  methods GET_CPRODUCT_INVENTORY
    importing
      value(IV_DATA) type STRING
    exporting
      value(ET_INVENTORYS) type TT_CPRODUCT_INV
      value(EV_MSG) type BAPIRET2 .
  methods GET_PRODUCT_CHECK
    importing
      value(IV_STOREID) type STRING
    exporting
      value(ES_DATA) type TS_PRODUCTCHECK
      value(EV_MSG) type BAPIRET2 .
  methods GET_PRODUCTANALYSIS_AE
    importing
      value(IV_BODY) type STRING
    exporting
      value(ES_DATA) type TS_PRODUCTANA_AE
      value(EV_MSG) type BAPIRET2 .
  methods GET_PRODUCTANALYSIS_AEINFO
    importing
      value(IV_BODY) type STRING
    exporting
      value(ET_DATA) type TT_AEINFO
      value(EV_MSG) type BAPIRET2 .
  methods GET_PRODUCTANALYSIS_OE
    importing
      value(IV_BODY) type STRING
    exporting
      value(ES_DATA) type TS_PRODUCTANA_OE
      value(EV_MSG) type BAPIRET2 .
  methods GET_PRODUCT_AEKEYINFO
    importing
      value(IV_BODY) type STRING
    exporting
      value(ES_DATA) type TS_AEKEYINFO
      value(EV_MSG) type BAPIRET2 .
  methods GET_PRODUCT_OVERVIEW
    importing
      value(IV_STOREID) type STRING
      value(IV_TYPE) type STRING optional
      value(IV_BASECATEGORY) type STRING optional
      value(IV_GENERALSTATUS) type STRING optional
    exporting
      value(ES_DATA) type TS_PRODUCTOVEW
      value(EV_MSG) type BAPIRET2 .
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



CLASS ZCL_ICEC_PRODUCT_API IMPLEMENTATION.


  METHOD get_catagorys_base.


    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA: lv_key TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT'
      AND method = 'GET_CATAGORYS_BASE'.

    lv_uri = ls_ztint_icec_api-url.
    lv_key = iv_key.
    CALL METHOD cl_http_utility=>escape_url
      EXPORTING
        unescaped = lv_key
      RECEIVING
        escaped   = lv_key.

    REPLACE '{keywords}' IN lv_uri WITH lv_key.



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
                         data = et_basecatagorys ) .


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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_responsebody = lv_out ).
   ENDIF.




  ENDMETHOD.


  METHOD get_catagorys_firstcatagory.


    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT'
      AND method = 'GET_CATAGORYS_FIRSTCATAGORY'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{catagoryId}' IN lv_uri WITH iv_catagoryid.

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
                         data = et_businesscatagoryid ) .


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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_responsebody = lv_out ).
   ENDIF.




  ENDMETHOD.


  METHOD get_catag_firstcatagory_new.
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT'
      AND method = 'GET_CATAG_FIRSTCATAGORY_NEW'.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title  TYPE string.
    lv_title = '根据业务分类ID查询一级分类-新(ZCL_ICEC_PRODUCT_API->GET_CATAG_FIRSTCATAGORY_NEW)'.

    REPLACE '{categoryId}' IN lv_uri WITH iv_categoryid.
    REPLACE '{depth}' IN lv_uri WITH iv_depth.
    REPLACE '{needBase}' IN lv_uri WITH iv_needbase.

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
                         data = et_output ) .
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_responsebody = lv_out ).
   ENDIF.
  ENDMETHOD.


  METHOD get_cproduct_inventory.

    DATA: lv_str TYPE  zcl_json=>json.
    TYPES:      BEGIN OF ty_product,
                  id        TYPE string,
                  inventory TYPE  zcl_json=>json,
                END OF ty_product.
    DATA:lt_product TYPE SORTED TABLE OF ty_product WITH UNIQUE KEY id.
    DATA: lt_inventorys TYPE zprod_t_inventorys.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT'
      AND method = 'GET_CPRODUCT_INVENTORY'.

    lv_uri = ls_ztint_icec_api-url.


    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    "lv_body = '{"userloginId":"ddxyq","productIds": ["Init31114005","15604834551287100000","Init31114006"]}'.
    lv_body = iv_data.
    DATA:lv_title TYPE string.
    lv_title = '获取商品ID仓库库存(ZCL_ICEC_PRODUCT_API->GET_CPRODUCT_INVENTORYS)'.
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
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_inventorys ) .


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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_requestbody = iv_data iv_responsebody = lv_out ).
   ENDIF.
  ENDMETHOD.


  METHOD get_groupact_product_detail.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'ACTIVITY'
      AND method = 'GET_GROUPACTIVITY_PRODUCT_DETAIL'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{productId}' IN lv_uri WITH iv_productid.

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

    "解析
    IF lv_out IS NOT INITIAL.
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_output  ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_responsebody = lv_out ).
   ENDIF.


  ENDMETHOD.


  METHOD get_groupact_product_list.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'ACTIVITY'
      AND method = 'GET_GROUPACTIVITY_PRODUCT_LIST'.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA:lv_title TYPE string.
    lv_title = '获取拼团活动商品列表(ZCL_ICEC_PRODUCT_API->GET_GROUPACT_PRODUCT_LIST)'.
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
                         data = es_output  ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_responsebody = lv_out ).
   ENDIF.

  ENDMETHOD.


  METHOD get_parts_brand.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT' AND method = 'GET_PRODUCT_BRAND'.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title  TYPE string.
    lv_title = '获取商品品牌清单(ZCL_ICEC_PRODUCT_API->GET_PARTS_BRAND)'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

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
                         data = et_output  ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_responsebody = lv_out ).
   ENDIF.
    IF iv_create EQ 'X' AND et_output IS NOT INITIAL.
      DATA lt_partsbrand TYPE STANDARD TABLE OF ztint_partsbrand.
      lt_partsbrand = CORRESPONDING #( et_output ).
      IF lt_partsbrand IS NOT INITIAL.
        DELETE FROM ztint_partsbrand.
        MODIFY ztint_partsbrand FROM TABLE lt_partsbrand.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD GET_PRODUCTANALYSIS_AE.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT' AND method = 'GET_PRODUCTANALYSIS_AE'.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         lv_body         TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                          ELSE ls_ztint_icec_api-rfcdest ).

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title  TYPE string.


    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

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
                         data = es_data  ).
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

  ENDMETHOD.


  METHOD GET_PRODUCTANALYSIS_AEINFO.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT' AND method = 'GET_PRODUCTANALYSIS_AEINFO'.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         lv_body         TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                          ELSE ls_ztint_icec_api-rfcdest ).

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title  TYPE string.


    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

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
                         data = et_data  ).
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

  ENDMETHOD.


  METHOD get_productanalysis_oe.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT' AND method = 'GET_PRODUCTANALYSIS_OE'.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         lv_body         TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                          ELSE ls_ztint_icec_api-rfcdest ).

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title  TYPE string.


    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

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
                         data = es_data  ).
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

  ENDMETHOD.


  METHOD get_productdetail_byids.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT'
      AND method = 'GET_PRODUCTDETAIL_BYIDS'.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA:lv_title TYPE string.
    lv_title = '获取商品详情(ZCL_ICEC_PRODUCT_API->GET_PRODUCTDETAIL_BYIDS)'.
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
                         data = et_output  ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_responsebody = lv_out ).
   ENDIF.

  ENDMETHOD.


  METHOD get_product_aekeyinfo.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT' AND method = 'GET_PRODUCT_AEKEYINFO'.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         lv_body         TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                          ELSE ls_ztint_icec_api-rfcdest ).

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title  TYPE string.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

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
                         data = es_data  ).
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

  ENDMETHOD.


  METHOD get_product_attr.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out     TYPE string,
          lv_rfcdesc TYPE rfcdest.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT'
      AND method = 'GET_PRODUCT_ATTR'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdesc = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                        ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{orderId}' IN lv_uri WITH iv_order.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA:lv_title TYPE string.
    lv_title = ''.
    CALL METHOD lo_api->get_data
      EXPORTING
        iv_rfcdest      = lv_rfcdesc
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.

    IF lv_out IS NOT INITIAL.
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_data  ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_responsebody = lv_out ).
   ENDIF.

  ENDMETHOD.


  METHOD get_product_check.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT' AND method = 'GET_PRODUCT_CHECK'.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         lv_body         TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                          ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    CALL METHOD lo_api->get_data
      EXPORTING
        iv_rfcdest      = lv_rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.

    IF lv_out IS NOT INITIAL.
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_data  ).
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

  ENDMETHOD.


  METHOD get_product_inventorys.


    DATA: lv_str TYPE  zcl_json=>json.
    TYPES:      BEGIN OF ty_product,
                  id        TYPE string,
                  inventory TYPE  zcl_json=>json,
                END OF ty_product.
    DATA:lt_product TYPE SORTED TABLE OF ty_product WITH UNIQUE KEY id.
    DATA: lt_inventorys TYPE zprod_t_inventorys.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT'
      AND method = 'GET_PRODUCT_INVENTORYS'.

    lv_uri = ls_ztint_icec_api-url.


    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    "lv_body = '{"userloginId":"ddxyq","productIds": ["Init31114005","15604834551287100000","Init31114006"]}'.
    lv_body = iv_data.
    DATA:lv_title TYPE string.
    lv_title = '获取商品ID仓库库存(ZCL_ICEC_PRODUCT_API->GET_PRODUCT_INVENTORYS)'.
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
      lv_str = lv_out.
      zcl_json=>deserialize( EXPORTING json = lv_str assoc_arrays = abap_true CHANGING data = lt_product ).

      IF lt_product IS NOT INITIAL .

        LOOP AT  lt_product INTO DATA(ls_product).
          CLEAR lv_out.
          REFRESH lt_inventorys.
          lv_out = ls_product-inventory.
          /ui2/cl_json=>deserialize(
                     EXPORTING
                        json = lv_out
                     CHANGING
                        data = lt_inventorys  ).
          IF lt_inventorys IS NOT INITIAL.
            APPEND LINES OF lt_inventorys TO et_inventorys.
          ENDIF.
          CLEAR ls_product.
        ENDLOOP.
        DELETE et_inventorys WHERE availabletopromisetotal = 0.
      ENDIF.


    ENDIF.

   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg  iv_responsebody = lv_out ).
   ENDIF.



  ENDMETHOD.


  METHOD get_product_overview.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PRODUCT' AND method = 'GET_PRODUCT_OVERVIEW'.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         lv_body         TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                          ELSE ls_ztint_icec_api-rfcdest ).

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title  TYPE string.
    lv_body = |\{"storeIn":["{ iv_storeid }"]| &&
              COND string( WHEN iv_basecategory IS INITIAL THEN |,"createSource":"N"| ) &&
              COND string( WHEN iv_type = 'INQUIRY' THEN |,"inquiryAvailable":true| ) &&
              COND string( WHEN iv_type = 'MALL' THEN |,"mallAvailableSale":true| ) &&
              COND string( WHEN iv_basecategory IS NOT INITIAL THEN |,"baseCategory":"{ iv_basecategory }"| ) &&
              COND string( WHEN iv_generalstatus IS NOT INITIAL THEN |,"generalStatus":"{ iv_generalstatus }"| ) &&
              |\}|.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = lv_rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
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
                         data = es_data  ).
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

  ENDMETHOD.


METHOD get_product_price_byids.

  DATA:lv_uri          TYPE string,
       lv_rfcdest      TYPE rfcdest,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'PRODUCT'
        AND method = 'GET_PRODUCT_PRICE_BYIDS'.

  lv_uri = ls_ztint_icec_api-url.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS NOT INITIAL THEN ls_ztint_icec_api-rfcdest ELSE 'PLATFORM' ).
  ls_content_type-content_type = 'application/json;charset=UTF-8'.

  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  DATA: lv_body TYPE string.

  lv_body = iv_data.

  CALL METHOD lo_api->post_data
    EXPORTING
      iv_rfcdest      = lv_rfcdest
      iv_uri          = lv_uri
      is_content_type = ls_content_type
      iv_body         = lv_body
*     iv_title        = lv_title
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
        data = et_productprice ) .
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


  METHOD get_saleact_product_list.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'ACTIVITY'
      AND method = 'GET_SALEACT_PRODUCT_LIST'.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA:lv_title TYPE string.
    lv_title = '获取特价活动商品列表(ZCL_ICEC_PRODUCT_API->GET_SALEACT_PRODUCT_LIST)'.
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
                         data = es_output  ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_responsebody = lv_out ).
   ENDIF.

  ENDMETHOD.


  METHOD get_ven_invoiceconfig.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'ACTIVITY'
      AND method = 'GET_VEN_INVOICECONFIG'.
    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA:lv_title TYPE string.
    lv_title = '获取商品开票信息(ZCL_ICEC_PRODUCT_API->GET_VEN_INVOICECONFIG)'.
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
                         data = et_invoiceconfig  ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_responsebody = lv_out ).
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
ENDCLASS.
