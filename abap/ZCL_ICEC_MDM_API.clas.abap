class ZCL_ICEC_MDM_API definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF ts_partsinfo_stdnameobj,
        std_name      TYPE string, "前刹车碟",
        std_name_code TYPE string, "102290004",
        category_name TYPE string, "刹车碟",
        category_code TYPE string, "10229"
      END OF ts_partsinfo_stdnameobj .
  types:
    BEGIN OF ts_partsinfo_oe,
        status     TYPE string, "0,
        oe_code    TYPE string, "34 11 6 864 059",
        std_name   TYPE string, "前刹车碟",
        stdnameobj TYPE ts_partsinfo_stdnameobj,
        price_4s   TYPE string, "1890.0,
        price_date TYPE string,                             "20230701,
        oe_name    TYPE string, "制动盘 通风式"
      END OF ts_partsinfo_oe .
  types:
    BEGIN OF ts_partsinfo,
        status TYPE string,
        oes    TYPE STANDARD TABLE OF ts_partsinfo_oe WITH DEFAULT KEY,
      END OF ts_partsinfo .
  types:
    BEGIN OF ts_salesmodelresult,
        kssalesstyleid TYPE string,
        producedyear   TYPE string,
      END OF ts_salesmodelresult .
  types:
    BEGIN OF ts_dispmodelresult,
        brandcode   TYPE string,
        productyear TYPE string,
        energytype  TYPE string,
      END OF ts_dispmodelresult .
  types:
    BEGIN OF ts_carinfo,
        status          TYPE string,
        message         TYPE string,
        dispmodelresult TYPE ts_dispmodelresult,
*        salesmodelresults TYPE STANDARD TABLE OF ts_salesmodelresult WITH DEFAULT KEY,
      END OF ts_carinfo .
  types:
    BEGIN OF ts_category3,
        name TYPE string,
      END OF ts_category3 .
  types:
    BEGIN OF ts_category2,
        name      TYPE string,
        category3 TYPE STANDARD TABLE OF ts_category3 WITH DEFAULT KEY,
      END OF ts_category2 .
  types:
    BEGIN OF ts_category1,
        name      TYPE string,
        category2 TYPE STANDARD TABLE OF ts_category2 WITH DEFAULT KEY,
      END OF ts_category1 .
  types:
    BEGIN OF ts_category  ,
        category1 TYPE STANDARD TABLE OF ts_category1 WITH DEFAULT KEY,
      END OF ts_category .
  types:
    BEGIN OF ts_cate,
        category TYPE ts_category,
      END OF ts_cate .
  types:
    BEGIN OF ts_catalog4,
        catalog_name  TYPE string,
        catalog_code  TYPE string,
        category_name TYPE string,
        category_code TYPE string,
      END OF ts_catalog4 .
  types:
    BEGIN OF ts_catalog3,
        catalog_name TYPE string,
        catalog_code TYPE string,
        catalog4     TYPE STANDARD TABLE OF ts_catalog4 WITH DEFAULT KEY,
      END OF ts_catalog3 .
  types:
    BEGIN OF ts_catalog2,
        catalog_name TYPE string,
        catalog_code TYPE string,
        catalog3     TYPE STANDARD TABLE OF ts_catalog3 WITH DEFAULT KEY,
      END OF ts_catalog2 .
  types:
    BEGIN OF ts_catalog1,
        catalog_name TYPE string,
        catalog_code TYPE string,
        catalog2     TYPE STANDARD TABLE OF ts_catalog2 WITH DEFAULT KEY,
      END OF ts_catalog1 .
  types:
    BEGIN OF ts_result,
        catalog1 TYPE STANDARD TABLE OF ts_catalog1 WITH DEFAULT KEY,
      END OF ts_result .
  types TS_ALLCATALOG type TS_RESULT .
  types:
    tt_catalog1 TYPE STANDARD TABLE OF ts_catalog1 WITH DEFAULT KEY .
  types:
    BEGIN OF ty_carbrand,
        brand_code TYPE string,
        brand_name TYPE string,
      END OF ty_carbrand .
  types:
    tt_carbrand TYPE STANDARD TABLE OF ty_carbrand WITH DEFAULT KEY .
  types:
    "OE替换件查询出参结构
    BEGIN OF ty_replacement,
             from           TYPE STANDARD TABLE OF string WITH DEFAULT KEY, ": [ // 输入配件原始数据"000000999"],
             code_from      TYPE STANDARD TABLE OF string WITH DEFAULT KEY, ": [ // 输入配件格式化数据"000 000 999"],
             code_trim_from TYPE STANDARD TABLE OF string WITH DEFAULT KEY, ": [ // 输入配件去格式数据"000000999"],
             brand_code_to  TYPE string, ": "AUDI", // 替换号品牌
             code_to        TYPE STANDARD TABLE OF string WITH DEFAULT KEY, ": [ // 替换号格式化数据"000 000 666"],
             code_trim_to   TYPE STANDARD TABLE OF string WITH DEFAULT KEY, ": [ // 替换号去格式数据"000000666"],
             direction      TYPE string, ": 1 // 替换方向: 1单向, 2双向
           END OF ty_replacement .
  types:
    BEGIN OF ty_oedata,
            param       TYPE string, ": "000000999", // 配件零件号-调用参数
            brand_code  TYPE string, ": "audi", // 汽车品牌
            data_status TYPE string, ": 0, // 数据结果状态，0有替换数据,  1无替换数据
            replacement TYPE STANDARD TABLE OF ty_replacement WITH DEFAULT KEY, ": [ // 替换结果集
          END OF ty_oedata .
  types:
    BEGIN OF ty_oereplacement,
             status TYPE string, ": 0, // 状态码: 0成功, 其他非0均为失败（data没有该字段，有输入原始字段input）
             msg    TYPE string, ": "成功", // 详细错误信息,当接口调用失败时,返回具体的信息
             data   TYPE STANDARD TABLE OF ty_oedata WITH DEFAULT KEY, ": [ // 结果集
           END OF ty_oereplacement .
  types TS_OEREPLACEMENT type TY_OEREPLACEMENT .
  types:
    tt_oereplacement TYPE STANDARD TABLE OF ty_oereplacement WITH DEFAULT KEY .

  methods GET_ALL_CLASS
    exporting
      !ES_CLASS type TS_CATE
      !ES_MSG type BAPIRET2 .
  methods GET_CAR_BRAND
    exporting
      !ET_GRADE type TT_CARBRAND
      !ES_MSG type BAPIRET2 .
  methods GET_ALL_CLASS_NEW
    exporting
      value(ES_OUTPUT) type TS_ALLCATALOG
      value(ES_MSG) type BAPIRET2 .
  methods GET_CARINFO_BYVIN
    importing
      value(VIN) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type TS_CARINFO .
  methods GET_PARTINFO_BYOEBRAND
    importing
      !IV_BRAND type STRING
      !IV_OECODE type STRING
    exporting
      value(ES_MSG) type BAPIRET2
      value(ES_PARTSINFO) type TS_PARTSINFO .
  methods GET_OE_REPLACEMENT_TO
    importing
      value(IV_CALLER) type STRING optional
      value(BRAND_CODE) type STRING
      value(OE_CODES) type STRING
      value(VIN) type STRING optional
      value(QUOTE) type STRING optional
    exporting
      value(ES_MSG) type BAPIRET2
      value(ES_OEREPLACEMENT) type TS_OEREPLACEMENT .
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



CLASS ZCL_ICEC_MDM_API IMPLEMENTATION.


  METHOD get_all_class.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MDM' AND method = 'GET_ALL_CLASS'.

    lv_uri = ls_ztint_icec_api-url.

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
                         data = es_class ).
          DATA:lt_class  TYPE STANDARD TABLE OF ztint_partsclass,
               ls_class1 LIKE LINE OF lt_class,
               ls_class2 LIKE LINE OF lt_class,
               ls_class3 LIKE LINE OF lt_class.
          DATA:lv_id TYPE int4.
          LOOP AT es_class-category-category1 INTO DATA(ls_category1).
            lv_id = lv_id + 1.
            ls_class1-categoryid = lv_id.
            ls_class1-categoryname = ls_category1-name.
            ls_class1-parentcategory = 0.
            APPEND ls_class1 TO lt_class.
            ls_class2-parentcategory = ls_class1-categoryid.

            LOOP AT ls_category1-category2 INTO DATA(ls_category2).
              lv_id = lv_id + 1.
              ls_class2-categoryid = lv_id.
              ls_class2-categoryname = ls_category2-name.
              APPEND ls_class2 TO lt_class.
              ls_class3-parentcategory = ls_class2-categoryid.

              LOOP AT ls_category2-category3 INTO DATA(ls_category3).
                lv_id = lv_id + 1.
                ls_class3-categoryid = lv_id.
                ls_class3-categoryname = ls_category3-name.
                APPEND ls_class3 TO lt_class.
              ENDLOOP.
            ENDLOOP.
          ENDLOOP.

          DELETE FROM ztint_partsclass.
          MODIFY ztint_partsclass FROM TABLE lt_class.
          COMMIT WORK AND WAIT.
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


  METHOD get_all_class_new.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MDM' AND method = 'GET_ALL_CLASS_NEW'.

    lv_uri = ls_ztint_icec_api-url.

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
                         data = es_output ).
          DATA:ls_class1 TYPE ztint_partscatal,
               ls_class2 LIKE ls_class1,
               ls_class3 LIKE ls_class1,
               ls_class4 LIKE ls_class1,
               lt_class  TYPE STANDARD TABLE OF ztint_partscatal.

          LOOP AT es_output-catalog1 INTO DATA(ls_catalog1).
            ls_class1-cataloglevel = 1.
            ls_class1-catalogcode = ls_catalog1-catalog_code.
            ls_class1-catalogname = ls_catalog1-catalog_name.
            APPEND ls_class1 TO lt_class.
            LOOP AT ls_catalog1-catalog2 INTO DATA(ls_catalog2).
              ls_class2-cataloglevel = 2.
              ls_class2-catalogcode = ls_catalog2-catalog_code.
              ls_class2-catalogname = ls_catalog2-catalog_name.
              ls_class2-parentcatalogcode = ls_catalog1-catalog_code.
              APPEND ls_class2 TO lt_class.
              LOOP AT ls_catalog2-catalog3 INTO DATA(ls_catalog3).
                ls_class3-cataloglevel = 3.
                ls_class3-catalogcode = ls_catalog3-catalog_code.
                ls_class3-catalogname = ls_catalog3-catalog_name.
                ls_class3-parentcatalogcode = ls_catalog2-catalog_code.
                APPEND ls_class3 TO lt_class.
                LOOP AT ls_catalog3-catalog4 INTO DATA(ls_catalog4).
                  ls_class4-cataloglevel = 4.
                  ls_class4-catalogcode = ls_catalog4-catalog_code.
                  ls_class4-catalogname = ls_catalog4-catalog_name.
                  ls_class4-categorycode = ls_catalog4-category_code.
                  ls_class4-categoryname = ls_catalog4-category_name.
                  ls_class4-parentcatalogcode = ls_catalog3-catalog_code.
                  APPEND ls_class4 TO lt_class.
                ENDLOOP.
              ENDLOOP.
            ENDLOOP.
          ENDLOOP.
          DELETE FROM ztint_partscatal.
          COMMIT WORK AND WAIT .
          MODIFY ztint_partscatal FROM TABLE lt_class.
          COMMIT WORK AND WAIT.
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


  METHOD get_carinfo_byvin.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA:lv_body TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MDM' AND method = 'GET_CARINFO_BYVIN'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{vin}' IN lv_uri WITH vin.

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg  iv_responsebody = lv_out ).
   ENDIF.
  ENDMETHOD.


  METHOD get_car_brand.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA:lv_body TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MDM' AND method = 'GET_CAR_BRAND'.

    lv_uri = ls_ztint_icec_api-url.
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
                         data = et_grade ).
          DATA:lv_carbrand TYPE string.
          DATA:lt_carbrand TYPE STANDARD TABLE OF ztint_carbrand.

          LOOP AT et_grade INTO DATA(ls_carbrand).
            DATA(lv_mod) = sy-tabix MOD 100.

            IF lv_carbrand IS INITIAL.
              lv_carbrand = |caller=mdm&brand_codes={ ls_carbrand-brand_code }|.
            ELSE.
              lv_carbrand = |{ lv_carbrand },{ ls_carbrand-brand_code }|.
            ENDIF.
            lt_carbrand = VALUE #( BASE lt_carbrand ( carbrandid = ls_carbrand-brand_code carbrandname = ls_carbrand-brand_name ) ).

            IF lv_mod EQ 0.
              NEW zcl_icec_rulecalculate_api( )->get_cargradelist_bycarbrands(
                  EXPORTING iv_carbrands = lv_carbrand
                  IMPORTING es_msg = DATA(ls_msg) es_cargrade = DATA(ls_cargrade) ).
              LOOP AT ls_cargrade-data INTO DATA(ls_grade).
                READ TABLE lt_carbrand ASSIGNING FIELD-SYMBOL(<lfs_carbrand>) WITH KEY carbrandid = ls_grade-brand_code.
                IF sy-subrc EQ 0.
                  <lfs_carbrand>-vehicle_grade_code = ls_grade-grade_code.
                  <lfs_carbrand>-vehicle_grade_name = ls_grade-grade_name.
                  <lfs_carbrand>-charge_grade_code = ls_grade-charge_grade_code.
                  <lfs_carbrand>-charge_grade_name = ls_grade-charge_grade_name.
                ENDIF.
                CLEAR ls_grade.
              ENDLOOP.
              CLEAR:lv_carbrand,ls_cargrade,ls_grade.
            ENDIF.
          ENDLOOP.

          IF lv_mod NE 0.
            NEW zcl_icec_rulecalculate_api( )->get_cargradelist_bycarbrands(
                EXPORTING iv_carbrands = lv_carbrand
                IMPORTING es_msg = ls_msg es_cargrade = ls_cargrade ).
            LOOP AT ls_cargrade-data INTO ls_grade.
              READ TABLE lt_carbrand ASSIGNING <lfs_carbrand> WITH KEY carbrandid = ls_grade-brand_code.
              IF sy-subrc EQ 0.
                <lfs_carbrand>-vehicle_grade_code = ls_grade-grade_code.
                <lfs_carbrand>-vehicle_grade_name = ls_grade-grade_name.
                <lfs_carbrand>-charge_grade_code = ls_grade-charge_grade_code.
                <lfs_carbrand>-charge_grade_name = ls_grade-charge_grade_name.
              ENDIF.
              CLEAR:ls_grade.
            ENDLOOP.
          ENDIF.

          DELETE FROM ztint_carbrand.
          MODIFY ztint_carbrand FROM TABLE lt_carbrand.
          COMMIT WORK AND WAIT.
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


METHOD get_oe_replacement_to.

  DATA:lv_uri          TYPE string,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.
  DATA iv_body TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'MDM' AND method = 'GET_OE_REPLACEMENT_TO'.

  lv_uri = ls_ztint_icec_api-url.
  ls_content_type-content_type = 'application/x-www-form-urlencoded;charset=UTF-8'.

  "入参拼接

  IF iv_caller IS INITIAL.
    iv_caller = 'mdm'.
  ENDIF.
  "奔驰vin必填
  IF brand_code = 'BENZ' AND vin IS INITIAL.
    vin = 'WDDFH3DB9BJ682069'.
  ENDIF.
  IF quote IS INITIAL.
    quote = '1'.
  ENDIF.

  "	汽车品牌（必传）
  iv_body = |brand_code={ brand_code }|.

  "	配件零件号，分号进行分隔，最多100个（必传）
  iv_body = |{ iv_body }&oe_codes={ oe_codes }|.

  "	vin码，车架号可以为空或无该字段--奔驰时vin(WDDFH3DB9BJ682069)必填
  IF vin IS NOT INITIAL.
    iv_body = |{ iv_body }&vin={ vin }|.
  ENDIF.
  "是否正式报价，可以为空或无该字段--；默认为1，非正式报价填写0（字段类型字符串）
  IF quote IS NOT INITIAL.
    iv_body = |{ iv_body }&quote={ quote }|.
  ENDIF.
  "	调用者(必传）
  iv_body = |{ iv_body }&caller={ iv_caller }|.


  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  CALL METHOD lo_api->post_data(
    EXPORTING
      iv_rfcdest      = 'PLATFORM'
      iv_uri          = lv_uri
      is_content_type = ls_content_type
      iv_body         = iv_body
    IMPORTING
      json_out        = lv_out
      ev_msg          = es_msg
                        ).
  IF lv_out IS NOT INITIAL .
    "解析json
    TRY.

        /ui2/cl_json=>deserialize(
        EXPORTING
          json = lv_out
        CHANGING
        data = es_oereplacement ).

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
 save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = es_msg ).
 ENDIF.

ENDMETHOD.


METHOD get_partinfo_byoebrand.

  DATA:lv_uri          TYPE string,
       lv_rfcdest      TYPE rfcdest,
       ls_content_type TYPE zapi_s_contenttype.

  DATA: lv_out TYPE string.
  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'MDM' AND method = 'GET_PARTINFO_BYOEBRAND'.

  lv_uri = ls_ztint_icec_api-url.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

  REPLACE '{BRAND}' IN lv_uri WITH iv_brand.
  REPLACE '{OECODE}' IN lv_uri WITH iv_oecode.

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
      ev_msg          = es_msg.
  IF lv_out IS NOT INITIAL .
    "解析json
    TRY.

        /ui2/cl_json=>deserialize(
        EXPORTING
          json = lv_out
        CHANGING
        data = es_partsinfo ).
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
