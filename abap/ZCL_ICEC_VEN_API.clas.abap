class ZCL_ICEC_VEN_API definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF ts_level_inf ,
        isstorelevel    TYPE string, "是否是店铺等级-查询最新配置时该字段无用
        levelcode       TYPE string, "等级编码-前端可用来排序
        levelid         TYPE string, "等级ID
        levelname       TYPE string, "等级名称-前端展示
        levelurl        TYPE string, "等级图标
        levelexpiredate TYPE string, "等级有效期
      END OF ts_level_inf .
  types:
    tt_levelinf TYPE STANDARD TABLE OF ts_level_inf WITH DEFAULT KEY .
  types:
    BEGIN OF ts_levelinf,
        data         TYPE STANDARD TABLE OF ts_level_inf WITH DEFAULT KEY,
        errormessage TYPE string,
        code         TYPE string,
      END OF ts_levelinf .
  types:
    BEGIN OF ts_level_trends ,
        isefficient      TYPE string, "
        timename         TYPE string, "
        levelvalue       TYPE string, "等级ID
        levelvaluenumber TYPE string, "等级名称-前端展示
        datalist         TYPE string,
      END OF ts_level_trends .
  types:
    tt_leveltrends TYPE STANDARD TABLE OF ts_level_trends WITH DEFAULT KEY .
  types:
    BEGIN OF ts_leveltrends,
        data         TYPE STANDARD TABLE OF ts_level_trends WITH DEFAULT KEY,
        errormessage TYPE string,
        code         TYPE string,
      END OF ts_leveltrends .
  types:
    BEGIN OF ty_rightinfo,"权益标量信息
        rightactive TYPE string, "权益类型是否标量：true-标亮；false-置灰
        rightcode   TYPE string, "权益类型名称
        rightname   TYPE string, "权益类型名称
        righturl    TYPE string, "权益类型图标
      END OF ty_rightinfo .
  types:
    BEGIN OF ty_rank,"排名信息
        comparedscore TYPE string, "店铺排名信息变化数值（保留两位小数）
        comparedtype  TYPE string, "店铺排名信息变化类型：UP-上升；DOWN-下降；SAME-相同无变化
        storeranking  TYPE string, "店铺排名信息（没有小数位）
        beyondranking TYPE string, "店铺排名超越信息（保留两位小数）
      END OF ty_rank .
  types:
    BEGIN OF ty_rankdata,
        comprehensive         TYPE ty_rank,
        service_capability    TYPE ty_rank,
        effective_performance TYPE ty_rank,
        customers_service     TYPE ty_rank,
      END OF ty_rankdata .
  types:
    BEGIN OF ts_storelevelinf,
        isnewstore       TYPE string, "店铺等级的图标
        periodinfo       TYPE string, "计算周期/更新时间：2020.5.1-2020.5.31
        storechannelcode TYPE string, "店铺赛道的编码
        storechannelname TYPE string, "店铺赛道的名称
        storelevelcode   TYPE string, "店铺等级的编码
        storelevelname   TYPE string, "店铺等级的名称
        storelevelurl    TYPE string, " 店铺等级的图标
        rightinfo        TYPE STANDARD TABLE OF ty_rightinfo WITH DEFAULT KEY,
        rankdata         TYPE ty_rankdata,
        storeid          TYPE string,
        isartificial     TYPE string, "	是否是定制等级
      END OF ts_storelevelinf .
  types:
    BEGIN OF ty_tipcontent,
        text     TYPE string,
        imageurl TYPE string,
      END OF ty_tipcontent .
  types:
    BEGIN OF ty_tips,
        contenttype     TYPE string, "常见问题类型
        contenttypedesc TYPE string, "常见问题类型中文
        tipid           TYPE string, "这条数据的ID
        title           TYPE string, " 标题或问题
        titletype       TYPE string, "是规则说明还是常见问题
        content         TYPE STANDARD TABLE OF ty_tipcontent WITH DEFAULT KEY,
      END OF ty_tips .
  types:
    tt_leveltips TYPE STANDARD TABLE OF ty_tips WITH DEFAULT KEY .
  types:
    BEGIN OF ty_instruction,
        description TYPE string, "信息描述
        id          TYPE string, "店铺权益附加属性ID
        sequence    TYPE string, "序号
        type        TYPE string, "类型（权益介绍：RIGHT_INTRODUCTION；附加说明：ADDITIONAL_INSTRUCTION；使用说明：USE_INSTRUCTION）
        typedesc    TYPE string, "类型描述
      END OF ty_instruction .
  types:
    BEGIN OF ty_storeright,
        applyflag             TYPE string, "是否需要申请
        cashingmethod         TYPE string, "兑现方式
        cashingmethoddesc     TYPE string, "兑现方式描述
        description           TYPE string, "店铺权益概要
        firstpublish          TYPE string, " null
        id                    TYPE string, "店铺权益ID
        name                  TYPE string, "店铺权益名称
        publishstatus         TYPE string, "发布状态
        publishstatusdesc     TYPE string, "发布状态描述
        rightcategorycode     TYPE string, "店铺权益类型CODE
        rightcategoryicon     TYPE string, "店铺权益类型图片
        rightcategoryname     TYPE string, " 店铺权益类型名称
        useinstruction        TYPE STANDARD TABLE OF ty_instruction WITH DEFAULT KEY, "使用说明
        storerightextends     TYPE STANDARD TABLE OF ty_instruction WITH DEFAULT KEY, " 店铺权益附加信息列表
        rightintroduction     TYPE STANDARD TABLE OF ty_instruction WITH DEFAULT KEY, " 权益介绍
        additionalinstruction TYPE STANDARD TABLE OF ty_instruction WITH DEFAULT KEY, " 附加说明
      END OF ty_storeright .
  types:
    tt_storeright TYPE STANDARD TABLE OF ty_storeright WITH DEFAULT KEY .
  types:
    BEGIN OF ty_storeright1,
        applicant            TYPE string, "使用人
        applicantuserloginid TYPE string, "使用人id
        applydate            TYPE string, "申请时间
        effectivebegindate   TYPE string, "有效期开始时间
        effectiveenddate     TYPE string, "有效期结束时间
        id                   TYPE string, "店铺权益记录id
        remark               TYPE string, " 备注信息
        status               TYPE string, "店铺权益状态。待申请:TO_APPLY;已申请:APPLIED;已使用:USED;已终止:TERMINATED;已过期:EXPIRED
        statusupdateddate    TYPE string, "状态维护时间。对应权益使用时间或者终止时间
        applyflag            TYPE string, "是否需要申请
        cashingmethod        TYPE string, "兑现方式
        cashingmethoddesc    TYPE string, "兑现方式描述
        description          TYPE string, "店铺权益概要
        firstpublish         TYPE string, " null
        name                 TYPE string, "店铺权益名称
        publishstatus        TYPE string, "发布状态
        publishstatusdesc    TYPE string, "发布状态描述
        rightcategorycode    TYPE string, "店铺权益类型CODE
        rightcategoryicon    TYPE string, "店铺权益类型图片
        rightcategoryname    TYPE string, " 店铺权益类型名称
        terminatedreason     TYPE string, " 终止原因
        storeright           TYPE ty_storeright, "店铺权益内容信息
      END OF ty_storeright1 .
  types:
    tt_storeright1  TYPE STANDARD TABLE OF ty_storeright1  WITH DEFAULT KEY .
  types:
    BEGIN OF ts_storelevel,
        belongmonth TYPE  string,
        channel     TYPE  string,
        datasource  TYPE  string,
        enddate     TYPE  string,
        startdate   TYPE  string,
        levelcode   TYPE  string,
        levelname   TYPE  string,
        storeid     TYPE zde_productstoreid,
      END OF ts_storelevel .
  types:
    tt_storelevel TYPE STANDARD TABLE OF ts_storelevel WITH DEFAULT KEY .
  types:
    BEGIN OF ty_storeid,
        storeid TYPE string,
      END OF ty_storeid .
  types:
    tt_storeid TYPE STANDARD TABLE OF ty_storeid WITH DEFAULT KEY .
  types:
    tt_storeids TYPE STANDARD TABLE OF string WITH DEFAULT KEY .

  methods GET_VENLEVEL_INFO
    importing
      value(SEARCHTYPE) type STRING optional
      value(STOREID) type STRING optional
      value(UPDATE) type CHAR1 optional
    exporting
      !EV_MSG type BAPIRET2
    returning
      value(ET_LEVELINF) type TT_LEVELINF .
  methods GET_STORELEVEL_INF
    importing
      !STOREID type STRING
    exporting
      !ES_DATA type TS_STORELEVELINF
      !EV_MSG type BAPIRET2 .
  methods GET_STORELEVEL_INF_BATCH
    importing
      value(BATCHSIZE) type INT4 optional
      value(STOREID) type STRING optional
      value(BATCHTYPE) type STRING optional
      value(STOREIDS) type TT_STOREID optional
    exporting
      !ET_DATA type TT_STORELEVEL
      !EV_MSG type BAPIRET2 .
  methods GET_COMPANYCODES_BYGROUPID
    importing
      !IV_CUSTOMERGROUPID type STRING
    exporting
      !EV_MSG type BAPIRET2
    returning
      value(ET_STOREIDS) type TT_STOREIDS .
  methods GET_LEVELTIPS
    importing
      !SEARCHTYPE type STRING
    exporting
      !EV_MSG type BAPIRET2
    returning
      value(ET_LEVELTIPS) type TT_LEVELTIPS .
  methods GET_STORE_RIGHT
    importing
      !CHANNEL type STRING
      !LEVELCODE type STRING
      !CATEGORYCODE type STRING
    exporting
      !EV_MSG type BAPIRET2
    returning
      value(ET_STORERIGHT) type TT_STORERIGHT .
  methods GET_STORE_OWN_RIGHT
    importing
      !STOREID type STRING
    exporting
      !EV_MSG type BAPIRET2
    returning
      value(ET_STORERIGHT) type TT_STORERIGHT1 .
  methods GET_STORELEVEL_TRENDS
    importing
      value(STOREID) type STRING optional
    exporting
      !EV_MSG type BAPIRET2
    returning
      value(ET_LEVELTRENDS) type TT_LEVELTRENDS .
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



CLASS ZCL_ICEC_VEN_API IMPLEMENTATION.


  METHOD GET_COMPANYCODES_BYGROUPID.
    DATA:lv_url          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'USER'
      AND method = 'GET_COMPANYCODES_BYGROUPID'.

    lv_url = ls_ztint_icec_api-url.
    REPLACE '{customerGroupId}' WITH iv_customerGroupId INTO lv_url.
    CONDENSE lv_url NO-GAPS.
    ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = ls_ztint_icec_api-rfcdest
        iv_uri          = lv_url
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
                         data = et_storeids  ).

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
   save_api_log( EXPORTING iv_keyvalue = lv_url ev_msg = ev_msg  iv_responsebody = lv_out ).
   ENDIF.
  ENDMETHOD.


  METHOD get_leveltips.
    DATA:lv_url          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'STORE_LEVEL'
      AND method = 'GET_LEVELTIPS'.

    lv_url = ls_ztint_icec_api-url.
    REPLACE '{searchType}' WITH searchtype INTO lv_url.
    CONDENSE lv_url NO-GAPS.
    ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = ls_ztint_icec_api-rfcdest
        iv_uri          = lv_url
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
                         data = et_leveltips  ).

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
   save_api_log( EXPORTING iv_keyvalue = lv_url ev_msg = ev_msg  iv_responsebody = lv_out ).
   ENDIF.
  ENDMETHOD.


  METHOD get_storelevel_inf.
    DATA:lv_url          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'STORE_LEVEL'
      AND method = 'GET_STORELEVEL_INF'.

    lv_url = ls_ztint_icec_api-url.
    REPLACE '{StoreId}' WITH storeid INTO lv_url.
    CONDENSE lv_url NO-GAPS.
    ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = ls_ztint_icec_api-rfcdest
        iv_uri          = lv_url
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
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_url ev_msg = ev_msg  iv_responsebody = lv_out ).
   ENDIF.
  ENDMETHOD.


  METHOD get_storelevel_inf_batch.
    DATA:lv_url          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_title TYPE string.
    DATA lv_body TYPE string.
    DATA lv_storeid TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'STORE_LEVEL'
      AND method = 'GET_STORELEVEL_INF_BATCH'.

    lv_url = ls_ztint_icec_api-url.
    LOOP AT storeids INTO DATA(ls_store).
      lv_storeid = COND #( WHEN lv_storeid IS  INITIAL THEN |"{ ls_store-storeid }"|
                           ELSE |{ lv_storeid },"{ ls_store-storeid }"| ).
    ENDLOOP.
      lv_storeid = |[{ lv_storeid }]|.

    lv_body = '{' && |"batchSize": "{ batchsize }","batchType": "{ batchtype }","storeId": "{ storeid }","storeIds": { lv_storeid } | && '}'.

    ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_title = '批量获取店铺等级信息（ZCL_ICEC_VEN_API=》GET_STORELEVEL_INF_BATCH）'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = ls_ztint_icec_api-rfcdest
        iv_uri          = lv_url
        is_content_type = ls_content_type
        iv_body         = lv_body
        iv_title        = lv_title
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
   save_api_log( EXPORTING iv_keyvalue = lv_url ev_msg = ev_msg iv_requestbody = lv_body  iv_responsebody = lv_out ).
   ENDIF.
  ENDMETHOD.


  METHOD get_storelevel_trends.
    DATA:lv_url          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_out TYPE string.
    DATA lt_level TYPE STANDARD TABLE OF ztint_venlevel_c WITH DEFAULT KEY.
    DATA ls_level LIKE LINE OF lt_level.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'STORE_LEVEL'
      AND method = 'GET_STORELEVEL_TRENDS'.

    lv_url = ls_ztint_icec_api-url.

    REPLACE '{storeId}' WITH storeid INTO lv_url.

    ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = ls_ztint_icec_api-rfcdest
        iv_uri          = lv_url
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg
                          ).

    IF lv_out IS NOT INITIAL .
      REPLACE ALL OCCURRENCES OF `"dataList":{"店铺绩效排名：` IN lv_out WITH '"dataList":"店铺绩效排名 '.
      REPLACE ALL OCCURRENCES OF `%"` IN lv_out WITH '%'.
      REPLACE ALL OCCURRENCES OF `"有效业绩排名：` IN lv_out WITH '有效业绩排名 '.
      REPLACE ALL OCCURRENCES OF `"服务客户数排名：` IN lv_out WITH '服务客户数排名 '.
      REPLACE ALL OCCURRENCES OF `-"` IN lv_out WITH '0%'.
      REPLACE ALL OCCURRENCES OF `:null` IN lv_out WITH space.
      REPLACE ALL OCCURRENCES OF `}}` IN lv_out WITH '"}'.
      DATA: lv_str1 TYPE string,
            lv_str2 TYPE string,
            lv_str3 TYPE string.
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_leveltrends   ).
          ev_msg-type = 'S'.
          ev_msg-id = '200'.
          ev_msg-message = 'JSON成功解析'.
          LOOP AT et_leveltrends ASSIGNING FIELD-SYMBOL(<ls_trends>).
            SPLIT <ls_trends>-datalist AT ',' INTO TABLE DATA(lt_trend).
            CLEAR: lv_str1,lv_str2,lv_str3.
            LOOP AT lt_trend INTO DATA(ls_trend).
              CASE sy-tabix.
                WHEN 1.
                  lv_str1 = ls_trend.
                WHEN 2.
                  lv_str2 = ls_trend.
                WHEN 3.
                  lv_str3 = ls_trend.
              ENDCASE.
            ENDLOOP.
            CONCATENATE lv_str1 ' ' lv_str2 ' ' lv_str3 INTO <ls_trends>-datalist RESPECTING BLANKS.
          ENDLOOP.

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
   save_api_log( EXPORTING iv_keyvalue = lv_url ev_msg = ev_msg  iv_responsebody = lv_out ).
   ENDIF.

  ENDMETHOD.


  METHOD get_store_own_right.
    DATA:lv_url          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'GARAGERIGHT'
      AND method = 'GET_STORE_OWN_RIGHT'.

    lv_url = ls_ztint_icec_api-url.
    REPLACE '{storeId}' WITH storeid INTO lv_url.
    CONDENSE lv_url NO-GAPS.
    ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = ls_ztint_icec_api-rfcdest
        iv_uri          = lv_url
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
                         data = et_storeright  ).

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
   save_api_log( EXPORTING iv_keyvalue = lv_url ev_msg = ev_msg  iv_responsebody = lv_out ).
   ENDIF.
  ENDMETHOD.


  METHOD get_store_right.
    DATA:lv_url          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'GARAGERIGHT'
      AND method = 'GET_STORE_RIGHT'.

    lv_url = ls_ztint_icec_api-url.
    REPLACE '{channel}' WITH channel INTO lv_url.
    REPLACE '{levelCode}' WITH levelcode INTO lv_url.
    REPLACE '{categoryCode}' WITH categorycode INTO lv_url.
    CONDENSE lv_url NO-GAPS.
    ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = ls_ztint_icec_api-rfcdest
        iv_uri          = lv_url
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
                         data = et_storeright  ).

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
   save_api_log( EXPORTING iv_keyvalue = lv_url ev_msg = ev_msg  iv_responsebody = lv_out ).
   ENDIF.
  ENDMETHOD.


  METHOD get_venlevel_info.
    DATA:lv_url          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_out TYPE string.
    DATA lt_level TYPE STANDARD TABLE OF ztint_venlevel_c WITH DEFAULT KEY.
    DATA ls_level LIKE LINE OF lt_level.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'STORE_LEVEL'
      AND method = 'GET_VENLEVEL_INFO'.

    lv_url = ls_ztint_icec_api-url.
    REPLACE '{searchType}' WITH searchtype INTO lv_url.
    REPLACE '{storeId}' WITH storeid INTO lv_url.

    ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = ls_ztint_icec_api-rfcdest
        iv_uri          = lv_url
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
                         data = et_levelinf  ).
          ev_msg-type = 'S'.
          ev_msg-id = '200'.
          ev_msg-message = 'JSON成功解析'.
          IF update EQ 'X'.
            SORT et_levelinf BY levelid.
            SELECT * FROM ztint_venlevel_c INTO TABLE @DATA(lt_old).
            DELETE ztint_venlevel_c from TABLE lt_old.
            LOOP  AT et_levelinf INTO DATA(ls_temp).
              lt_level = VALUE #( BASE lt_level ( levelid = ls_temp-levelid levelcode = ls_temp-levelcode
                                  levelname = ls_temp-levelname  rightname = |{ ls_temp-levelname }权益|
                                  sortno = sy-tabix levelurl = ls_temp-levelurl ) ).
              CLEAR:ls_temp.
            ENDLOOP.
            IF lt_level IS NOT INITIAL.
              MODIFY ztint_venlevel_c FROM TABLE lt_level.
            ENDIF.
          ENDIF.
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
   save_api_log( EXPORTING iv_keyvalue = lv_url ev_msg = ev_msg  iv_responsebody = lv_out ).
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
