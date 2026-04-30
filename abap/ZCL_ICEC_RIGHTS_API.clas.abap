CLASS zcl_icec_rights_api DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
      BEGIN OF ts_garagelevel,
        garagecompanyid TYPE string, ": "Kyc4dpUPHTD5o4muRaD",
        levelid         TYPE string, ": "60b5cca4b905ae0001bc7065",
        levelname       TYPE string, ": "V4",
        gradeid         TYPE string, ": "3",
        gradename       TYPE string, ": "C类",
        citylevelid     TYPE string, ": "60b874fa763ba100019f6be0",
        citylevelname   TYPE string, ": "一级"
      END OF ts_garagelevel .
    TYPES:
      BEGIN OF ts_garagelory,
        gloryname             TYPE string, ": 荣誉名称
        sortno                TYPE string, "序号
        validiconurl          TYPE string, "生效图标地址
        invalidiconurl        TYPE string, "失效图标地址
        mintotalpurchaseamout TYPE string, "最低累计采购金额
        maxtotalpurchaseamout TYPE string, ": "最高累计采购金额
      END OF ts_garagelory .
    TYPES:
      BEGIN OF ts_fastdto,
        maxamount   TYPE string, "上限金额
        maxtimes    TYPE string, "最大次数
        remaintimes TYPE string, "剩余次数
      END OF ts_fastdto .
    TYPES:
      BEGIN OF ts_longdto,
        free           TYPE string, "是否免费
        price          TYPE string, "单价（付费权益）
        effectivedays  TYPE string, "付费权益购买后有效天数（天）
        warrantymonths TYPE string, "质保期（月）
        rightorderid   TYPE string, "付费购买订单号
      END OF ts_longdto .
    TYPES:
      BEGIN OF ts_easydto,
        cardinalamount   TYPE string, "免责基数
        lastmonthgtvrate TYPE string, "上月GTV比例
        amount           TYPE string, "总额度
        remainamount     TYPE string, "剩余额度
      END OF ts_easydto .
    TYPES:
      BEGIN OF ts_gargeright,
        rightid                        TYPE string, ": "60b0a76055264f0001dc0735",
        righttype                      TYPE string, ": "EASY_RETURN",
        garagecompanyid                TYPE string, ": "Kyc4dpUPHTD5o4muRaD",
        description                    TYPE string, "描述
        validiconurl                   TYPE string, ":
        invalidiconurl                 TYPE string, ":
        name                           TYPE string, ": "免责0.1%",
        displayname                    TYPE string, ": "无忧退货",
        applicationtype                TYPE string, ": "COMMON",
        effective                      TYPE string, ": true,
        effectivebegindate             TYPE string, ": 1619861326000,
        effectiveenddate               TYPE string, ": 1622453326000,
        commonfastcompensationrightdto TYPE ts_fastdto, ": null,
        commonlongwarrantyrightdto     TYPE ts_longdto, ": null,
        commoneasyreturnrightdto       TYPE ts_easydto, ": {
      END OF ts_gargeright .
    TYPES:
      tt_garageright TYPE STANDARD TABLE OF ts_gargeright WITH DEFAULT KEY .
    TYPES:
      "add at 2021.06.17--客户等级记录
      BEGIN OF ts_gargelevelrecord,
        companyid             TYPE string,                  ": "19337",
        gradeid               TYPE string, ": "3",
        gradename             TYPE string, ": "C类",   维修厂分类名称
        levelid               TYPE string, ": "60b5cca4b905ae0001bc7062",
        levelname             TYPE string, ": "V1",   维修厂等级名称
        citylevelid           TYPE string, ": "60b874fa763ba100019f6be0",
        citylevelname         TYPE string, ": "一级",    城市分类名称
        monthlypurchaseamount TYPE string, ": 265.00,     月有效采购金额
        monthlypurchasedays   TYPE string, ": 1,   月有效采购天数
        updatedstamp          TYPE string, ": 1623050839000   更新时间
      END OF ts_gargelevelrecord .
    TYPES:
      tt_gargelevelrecord TYPE STANDARD TABLE OF ts_gargelevelrecord WITH DEFAULT KEY .
    TYPES:
      "add at 2021.06.17--客户权益记录
      BEGIN OF ts_gargerightrecord,
        rightid            TYPE string, ": "60b0a76955264f0001dc0739",  权益id
        righttype          TYPE string, ": "FAST_COMPENSATION",   权益类型
        name               TYPE string, ": "单笔5000元，限6次",   权益名称描述
        displayname        TYPE string, ": "快处快赔",           权益展示名称
        levelid            TYPE string, ": "60b5cca4b905ae0001bc7066",   等级id
        levelname          TYPE string, ": "V5",       等级名称
        updatedate         TYPE string, ": 1623825059000,    更新时间
        description        TYPE string, ": "单笔退货单商品价值上限：5,000元；\n次数限制：6次",       权益备注
        effectivebegindate TYPE string, ": 1622476800000, 有效期开始
        effectiveenddate   TYPE string, ": 1625068799000   有效期结束
        remark             TYPE string, "权益备注
      END OF ts_gargerightrecord .
    TYPES:
      tt_gargerightrecord TYPE STANDARD TABLE OF ts_gargerightrecord WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_levconf,
        levelid   TYPE string,
        levelname TYPE string,
        sortno    TYPE string,
      END OF ts_levconf .
    TYPES:
      tt_levconf TYPE STANDARD TABLE OF ts_levconf WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_gloryconf,
        id                        TYPE string,
        gloryname                 TYPE string,
        sortno                    TYPE string,
        validiconurl              TYPE string,
        invalidiconurl            TYPE string,
        mintotalpurchaseamount(8) TYPE p DECIMALS 2,
        maxtotalpurchaseamount(8) TYPE p DECIMALS 2,
      END OF ts_gloryconf .
    TYPES:
      tt_gloryconf TYPE STANDARD TABLE OF ts_gloryconf WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_garagenextmonthlevel,
        garagecompanyid             TYPE string,
        levelid                     TYPE string,
        levelname                   TYPE string,
        reachlevelname              TYPE string,
        levelchange                 TYPE string,
        needpurchaseamount(8)       TYPE p DECIMALS 2,
        needpurchasedays            TYPE string,
        top                         TYPE string,
        content                     TYPE string,
        adminvalidamountrule        TYPE string,
        marketvalidamountrule       TYPE string,
        repurchaseamountrule        TYPE string,
        upgraderequiredamount       TYPE string,
        currentmonthreamountrule    TYPE string,
        last12monthsavgreamountrule TYPE string,
        paidamount(8)               TYPE p DECIMALS 2,
        unshippedamount(8)          TYPE p DECIMALS 2,
        sellerreturnamount(8)       TYPE p DECIMALS 2,
        easyreturnamount(8)         TYPE p DECIMALS 2,
        validpurchaseamount(8)      TYPE p DECIMALS 2,
      END OF ts_garagenextmonthlevel .
    TYPES:
      BEGIN OF ts_garagenextmonthlevel_list,
        garagecompanyid             TYPE string,
        levelid                     TYPE string,
        levelname                   TYPE string,
        levelchange                 TYPE string,
        needpurchaseamount          TYPE string,
        needpurchasedays            TYPE string,
        top                         TYPE string,
        content                     TYPE string,
        adminvalidamountrule        TYPE string, "本月等级有效金额计算规则-管理中心
        marketvalidamountrule       TYPE string, "本月等级有效金额计算规则-商城
        currentmonthreamountrule    TYPE string,
        last12monthsavgreamountrule TYPE string,
        repurchaseamountrule        TYPE string, "再采购金额计算规则
        upgraderequiredamount       TYPE string, "等级达标金额
        paidamount                  TYPE string, "已支付金额
        unshippedamount             TYPE string, "未发货金额
        sellerreturnamountt         TYPE string, "商家退货金额
        easyreturnamount            TYPE string, "无忧退货金额
        validpurchaseamount         TYPE string, "有效月采购额
      END OF ts_garagenextmonthlevel_list .
    TYPES:
      tt_garagenextmonthlevel_list TYPE STANDARD TABLE OF  ts_garagenextmonthlevel WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ty_cus,
        companyid TYPE ztint_cus_inf-companyid,
      END OF ty_cus .
    TYPES:
      tt_cus TYPE STANDARD TABLE OF ty_cus WITH DEFAULT KEY .
    TYPES:
      "判断是否被加入黑名单
      BEGIN OF ty_backlistexit,
        companyid       TYPE string, "公司ID
        customergroupid TYPE string, "客户分组ID-customerGroupId写死 GRBCG
        result          TYPE string, "返回的result为true代表在权益黑名单中
      END OF ty_backlistexit .
    TYPES:
      tt_backlistexit TYPE STANDARD TABLE OF ty_backlistexit WITH DEFAULT KEY .
    TYPES:
      "客户会员规则 add by zkj A61
      BEGIN OF ty_garagelevelrule,
        levelid                  TYPE string,   "客户等级id
        levelname                TYPE string,   "客户等级
        rightid                  TYPE string,   "权益Id
        righttype                TYPE string,   "权益类型
        validiconurl             TYPE string,   "生效图标地址
        invalidiconurl           TYPE string,   "失效图标地址
        appvalidiconurl          TYPE string,   "app端生效权益ICON
        appinvalidiconurl        TYPE string,   "app失效权益ICON
        gradeid                  TYPE string,   "客户分类等级
        citylevelid              TYPE string,   "城市等级ID
        name                     TYPE string,   "权益名称
        displayname              TYPE string,   "权益名称（描述）
        description              TYPE string,   "描述
        minmonthlypurchaseamount TYPE string,   "月采购额
        minmonthlypurchasedays   TYPE string,   "月采购天数
      END OF ty_garagelevelrule .
    TYPES:
      tt_garagelevelrule TYPE STANDARD TABLE OF ty_garagelevelrule WITH DEFAULT KEY .

    METHODS get_garage_levelchange_alert
      IMPORTING
        !iv_companyid TYPE string
      EXPORTING
        !ev_msg       TYPE bapiret2
        !ev_out       TYPE string .
    METHODS get_garage_level_rule
      IMPORTING
        VALUE(iv_companyid) TYPE string OPTIONAL
      EXPORTING
        !et_garagelevelrule TYPE tt_garagelevelrule
        !ev_msg             TYPE bapiret2 .
    METHODS get_rank_bycompanyid
      IMPORTING
        VALUE(iv_companyid) TYPE string
      EXPORTING
        VALUE(es_rank)      TYPE zrts_s_companyrank
        VALUE(ev_msg)       TYPE bapiret2 .
    METHODS get_levelinfo_bycompanyid
      IMPORTING
        VALUE(iv_companyid) TYPE string
      EXPORTING
        VALUE(es_levelinfo) TYPE zrts_s_levelinfo
        VALUE(ev_msg)       TYPE bapiret2 .
    METHODS get_rights_all
      EXPORTING
        VALUE(ev_msg)    TYPE bapiret2
        VALUE(et_rights) TYPE zrts_t_rights .
    METHODS get_rights_bycompanyid
      IMPORTING
        VALUE(iv_companyid) TYPE string
      EXPORTING
        VALUE(et_rights)    TYPE zrts_t_rights
        VALUE(ev_msg)       TYPE bapiret2 .
    METHODS get_rightsrecords_bycompanyid
      IMPORTING
        VALUE(iv_companyid) TYPE string
      EXPORTING
        VALUE(et_records)   TYPE zrts_t_records
        VALUE(ev_msg)       TYPE bapiret2 .
    METHODS get_nextlevel_bycompanyid
      IMPORTING
        VALUE(iv_companyid) TYPE string
      EXPORTING
        VALUE(es_next)      TYPE zrts_s_nextlevel
        VALUE(ev_msg)       TYPE bapiret2 .
    METHODS get_levelrecords_bycompanyid
      IMPORTING
        VALUE(iv_companyid) TYPE string
      EXPORTING
        VALUE(et_records)   TYPE zrts_t_records
        VALUE(ev_msg)       TYPE bapiret2 .
    METHODS get_levels_configs
      EXPORTING
        VALUE(ev_msg)         TYPE bapiret2
        VALUE(et_levelconfig) TYPE zrts_t_levelconfigs .
    METHODS get_rank_bycompanyidlist
      IMPORTING
        VALUE(iv_companylist) TYPE string
      EXPORTING
        VALUE(et_rank)        TYPE zrts_t_companyrank
        VALUE(ev_msg)         TYPE bapiret2 .
    METHODS get_levelinfo_bycompanylist
      IMPORTING
        VALUE(iv_companyidlist) TYPE string
      EXPORTING
        VALUE(et_levelinfo)     TYPE zrts_t_levelinfo
        VALUE(ev_msg)           TYPE bapiret2 .
    METHODS get_venrank_bycompanyid
      IMPORTING
        VALUE(iv_companyid) TYPE string
      EXPORTING
        VALUE(es_rank)      TYPE zrts_s_venrank
        VALUE(ev_msg)       TYPE bapiret2 .
    METHODS get_company_gloryrecord_count
      IMPORTING
        VALUE(iv_body)  TYPE string
      EXPORTING
        VALUE(ev_count) TYPE int4
        VALUE(ev_msg)   TYPE bapiret2 .
    METHODS get_company_gloryrecord
      IMPORTING
        VALUE(iv_body)        TYPE string
      EXPORTING
        VALUE(et_gloryrecord) TYPE zrts_t_garagegloryrecord
        VALUE(ev_msg)         TYPE bapiret2 .
    METHODS get_growthrecords_bycompanyid
      IMPORTING
        VALUE(iv_body)    TYPE string
      EXPORTING
        VALUE(es_records) TYPE zrts_s_venrecords
        VALUE(ev_msg)     TYPE bapiret2 .
    METHODS get_ven_level_bycompanyids
      IMPORTING
        VALUE(iv_body)      TYPE string OPTIONAL
      EXPORTING
        VALUE(et_ven_level) TYPE zrts_t_companyrank
        VALUE(ev_msg)       TYPE bapiret2 .
    METHODS get_company_garagelevel
      IMPORTING
        VALUE(iv_companyid) TYPE string
      EXPORTING
        VALUE(ev_msg)       TYPE bapiret2
        VALUE(es_level)     TYPE ts_garagelevel .
    METHODS get_company_garageglory
      IMPORTING
        VALUE(iv_companyid) TYPE string
      EXPORTING
        VALUE(ev_msg)       TYPE bapiret2
        VALUE(es_glory)     TYPE ts_garagelory .
    METHODS get_company_garagelevelrecord
      IMPORTING
        VALUE(iv_companyid) TYPE string
        !iv_pagenum         TYPE string OPTIONAL
        !iv_pagesize        TYPE string OPTIONAL
      EXPORTING
        VALUE(et_records)   TYPE tt_gargelevelrecord
        VALUE(es_msg)       TYPE bapiret2
        VALUE(ev_pagecount) TYPE string
        VALUE(ev_total)     TYPE string .
    METHODS get_company_garageright
      IMPORTING
        VALUE(iv_companyid) TYPE string
      EXPORTING
        VALUE(ev_msg)       TYPE bapiret2
        VALUE(et_right)     TYPE tt_garageright .
    METHODS get_company_garagerightrecord
      IMPORTING
        VALUE(iv_companyid) TYPE string
        !iv_pagenum         TYPE string OPTIONAL
        !iv_pagesize        TYPE string OPTIONAL
      EXPORTING
        VALUE(et_records)   TYPE tt_gargerightrecord
        VALUE(es_msg)       TYPE bapiret2
        VALUE(ev_pagecount) TYPE string
        VALUE(ev_total)     TYPE string .
    METHODS get_company_rightavailable
      IMPORTING
        !iv_body       TYPE string
      EXPORTING
        !et_companyids TYPE zrts_t_garagecompanyids
        !ev_msg        TYPE bapiret2 .
    METHODS get_customergroups_exist
      IMPORTING
        VALUE(ir_companyid) TYPE /iwbep/t_cod_select_options
      EXPORTING
        VALUE(et_list)      TYPE tt_backlistexit
        VALUE(es_msg)       TYPE bapiret2 .
    METHODS get_cuslevel_config
      EXPORTING
        !et_levlconf TYPE tt_levconf
        !ev_msg      TYPE bapiret2 .
    METHODS get_cusglory_config
      EXPORTING
        !et_gloryconf TYPE tt_gloryconf
        !ev_msg       TYPE bapiret2 .
    METHODS get_garage_level_nextmonth
      IMPORTING
        VALUE(iv_companyid)        TYPE string OPTIONAL
      EXPORTING
        !es_companynextmonth_level TYPE ts_garagenextmonthlevel
        !ev_msg                    TYPE bapiret2 .
    METHODS get_cuslevel_nextmonth_list
      IMPORTING
        VALUE(it_cus)             TYPE tt_cus OPTIONAL
      EXPORTING
        !et_companynextmonth_list TYPE tt_garagenextmonthlevel_list
        !ev_msg                   TYPE bapiret2 .
  PROTECTED SECTION.
private section.

*  types: BEGIN OF TS_VENRECORDS ,
*        vcontent       TYPE  STANDARD TABLE OF zrts_s_venrecordlist,
*        totalpages    TYPE string,
*        totalelements TYPE string,
*      END OF ts_venrecords.
  methods SAVE_API_LOG
    importing
      value(EV_MSG) type BAPIRET2 optional
      value(IV_COMMIT) type CHAR01 optional
      value(IV_KEYVALUE) type STRING optional
      value(IV_RESPONSEBODY) type STRING optional
      value(IV_REQUESTBODY) type STRING optional .
ENDCLASS.



CLASS ZCL_ICEC_RIGHTS_API IMPLEMENTATION.


  METHOD get_company_garageglory.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_COMPANY_GARAGEGLORY'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).

    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
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
                         data = es_glory  ).

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


  METHOD get_company_garagelevel.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_COMPANY_GARAGELEVEL'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).

    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
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
                         data = es_level  ).

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


  METHOD get_company_garagelevelrecord.

    DATA:lv_uri           TYPE string,
         ls_content_type  TYPE zapi_s_contenttype,
         lv_out           TYPE string,
         lv_body          TYPE string,
         lv_title         TYPE string,
         lv_uri2          TYPE string,
         ls_content_type2 TYPE zapi_s_contenttype,
         lv_out2          TYPE string,
         lv_body2         TYPE string,
         lv_title2        TYPE string,
         lv_pagenum       TYPE string,
         lv_pagesize      TYPE string,
         lv_total         TYPE string.

    IF iv_companyid IS INITIAL.
      es_msg-type = 'E'.
      es_msg-message = '维修厂客户代码id必填'.
      RETURN.
    ELSE.
      SELECT COUNT(*) UP TO 1 ROWS
        FROM ztint_cus_inf WHERE companyid = iv_companyid.
      IF sy-subrc NE 0.
        es_msg-type = 'E'.
        es_msg-message = '维修厂客户代码id不存在'.
        RETURN.
      ENDIF.
    ENDIF.

    CLEAR:lv_uri,ls_content_type,lv_out,lv_body,lv_title,lv_pagenum,lv_pagesize,
          lv_uri2,ls_content_type2,lv_out2,lv_body2,lv_title2,lv_total.
    IF iv_pagenum IS INITIAL OR iv_pagenum = 0.
      lv_pagenum = 1.
    ELSE.
      lv_pagenum = iv_pagenum.
    ENDIF.
    CONDENSE lv_pagenum NO-GAPS.
    IF iv_pagesize IS INITIAL OR iv_pagesize = 0.
      lv_pagesize = 20.
    ELSE.
      lv_pagesize = iv_pagesize.
    ENDIF.
    CONDENSE lv_pagesize NO-GAPS.

    "转换Json
    lv_body = '{"garageCompanyId":"' && iv_companyid && '","pageNum":"' && lv_pagenum && '","pageSize":"' && lv_pagesize && '"}'.

*&---取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS' AND method = 'GET_COMPANY_GARAGELEVELRECORD'.
    lv_uri = ls_ztint_icec_api-url.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    lv_title = '获取公司会员等级记录(ZCL_ICEC_RIGHTS_API->GET_COMPANY_GARAGELEVELRECORD)'.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
        iv_title        = lv_title
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
                         data = et_records ) .

          es_msg-type = 'S'.
          es_msg-id = '200'.
          es_msg-message = 'JSON成功解析'.

          "再调用另一个API去获取总条目数
          lv_title2 = '获取公司会员等级记录总条目数(ZCL_ICEC_RIGHTS_API->GET_COMPANY_GARAGELEVELRECORD)'.
          ls_content_type2-content_type = 'application/json;charset=UTF-8'.
          lv_uri2 = '/garage-right-service/garage-level/count'.
          lv_body2 = '{"garageCompanyId":"' && iv_companyid && '","pageNum":"' && '' && '","pageSize":"' && '' && '"}'.
          CALL METHOD lo_api->post_data
            EXPORTING
              iv_rfcdest      = 'PLATFORM'
              iv_uri          = lv_uri2
              is_content_type = ls_content_type2
              iv_body         = lv_body2
              iv_title        = lv_title2
            IMPORTING
              json_out        = lv_out2.
          IF lv_out2 IS NOT INITIAL.
            TRY .
                /ui2/cl_json=>deserialize( EXPORTING json = lv_out2
                            CHANGING data = lv_total ) .
                CONDENSE lv_total NO-GAPS.
                ev_total = lv_total.
                IF iv_pagesize NE 0.
                  ev_pagecount = ceil( lv_total / iv_pagesize ).
                  CONDENSE ev_pagecount NO-GAPS.
                ENDIF.
              CATCH cx_json_illegal_syntax INTO DATA(lo_syntax2).
              CATCH cx_root.
            ENDTRY.
          ENDIF.

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


  METHOD get_company_garageright.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_COMPANY_GARAGERIGHT'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).

    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
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
                         data = et_right  ).

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


  METHOD get_company_garagerightrecord.

    DATA:lv_uri           TYPE string,
         ls_content_type  TYPE zapi_s_contenttype,
         lv_out           TYPE string,
         lv_body          TYPE string,
         lv_title         TYPE string,
         lv_uri2          TYPE string,
         ls_content_type2 TYPE zapi_s_contenttype,
         lv_out2          TYPE string,
         lv_body2         TYPE string,
         lv_title2        TYPE string,
         lv_pagenum       TYPE string,
         lv_pagesize      TYPE string,
         lv_total         TYPE string.

    IF iv_companyid IS INITIAL.
      es_msg-type = 'E'.
      es_msg-message = '维修厂客户代码id必填'.
      RETURN.
    ELSE.
      SELECT COUNT(*) UP TO 1 ROWS
        FROM ztint_cus_inf WHERE companyid = iv_companyid.
      IF sy-subrc NE 0.
        es_msg-type = 'E'.
        es_msg-message = '维修厂客户代码id不存在'.
        RETURN.
      ENDIF.
    ENDIF.

    CLEAR:lv_uri,ls_content_type,lv_out,lv_body,lv_title,lv_pagenum,lv_pagesize,
          lv_uri2,ls_content_type2,lv_out2,lv_body2,lv_title2,lv_total.
    IF iv_pagenum IS INITIAL OR iv_pagenum = 0.
      lv_pagenum = 1.
    ELSE.
      lv_pagenum = iv_pagenum.
    ENDIF.
    CONDENSE lv_pagenum NO-GAPS.
    IF iv_pagesize IS INITIAL OR iv_pagesize = 0.
      lv_pagesize = 20.
    ELSE.
      lv_pagesize = iv_pagesize.
    ENDIF.
    CONDENSE lv_pagesize NO-GAPS.

    "转换Json
    lv_body = '{"garageCompanyId":"' && iv_companyid && '","pageNum":"' && lv_pagenum && '","pageSize":"' && lv_pagesize && '"}'.

*&---取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS' AND method = 'GET_COMPANY_GARAGERIGHTRECORD'.
    lv_uri = ls_ztint_icec_api-url.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    lv_title = '获取公司会员权益记录(ZCL_ICEC_RIGHTS_API->GET_COMPANY_GARAGERIGHTRECORD)'.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
        iv_title        = lv_title
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
                         data = et_records ) .

          es_msg-type = 'S'.
          es_msg-id = '200'.
          es_msg-message = 'JSON成功解析'.

          "再调用另一个API去获取总条目数
          lv_title2 = '获取公司会员权益记录总条目数(ZCL_ICEC_RIGHTS_API->GET_COMPANY_GARAGERIGHTRECORD)'.
          ls_content_type2-content_type = 'application/json;charset=UTF-8'.
          lv_uri2 = '/garage-right-service/garage-right/count'.
          lv_body2 = '{"garageCompanyId":"' && iv_companyid && '","pageNum":"' && '' && '","pageSize":"' && '' && '"}'.
          CALL METHOD lo_api->post_data
            EXPORTING
              iv_rfcdest      = 'PLATFORM'
              iv_uri          = lv_uri2
              is_content_type = ls_content_type2
              iv_body         = lv_body2
              iv_title        = lv_title2
            IMPORTING
              json_out        = lv_out2.
          IF lv_out2 IS NOT INITIAL.
            TRY .
                /ui2/cl_json=>deserialize( EXPORTING json = lv_out2
                            CHANGING data = lv_total ) .
                CONDENSE lv_total NO-GAPS.
                ev_total = lv_total.
                IF iv_pagesize NE 0.
                  ev_pagecount = ceil( lv_total / iv_pagesize ).
                  CONDENSE ev_pagecount NO-GAPS.
                ENDIF.
              CATCH cx_json_illegal_syntax INTO DATA(lo_syntax2).
              CATCH cx_root.
            ENDTRY.
          ENDIF.

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


  METHOD get_company_gloryrecord.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_COMPANY_GLORYRECORD'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).

    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    lv_title = '获取维修厂荣誉等级记录ZCL_ICEC_RIGHTS_API->GET_COMPANY_GLORYRECORD)'.
    lv_body = iv_body.
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
                         data = et_gloryrecord  ).
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


  METHOD get_company_gloryrecord_count.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_COMPANY_GLORYRECORD_COUNT'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).

    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    lv_title = '获取维修厂荣誉等级记录总条数ZCL_ICEC_RIGHTS_API->GET_COMPANY_GLORYRECORD_COUNT)'.
    lv_body = iv_body.
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
    ev_count = lv_out.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_company_rightavailable.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS' AND method = 'GET_COMPANY_RIGHTAVAILABLE'.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
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
        ev_msg          = ev_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_companyids  ).


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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = lv_out  ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD get_cusglory_config.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS' AND method = 'GET_CUSGLORY_CONFIG'.

    lv_uri = ls_ztint_icec_api-url.
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
                         data = et_gloryconf  ).

          DATA:lt_gloryconf TYPE STANDARD TABLE OF ztint_cusglory_c.
          lt_gloryconf = CORRESPONDING #( et_gloryconf ).
          MODIFY ztint_cusglory_c FROM TABLE lt_gloryconf.
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out  ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_cuslevel_config.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS' AND method = 'GET_CUSLEVEL_CONFIG'.

    lv_uri = ls_ztint_icec_api-url.
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
                         data = et_levlconf  ).
          DATA:LT_LEVLCONF TYPE STANDARD TABLE OF ZTINT_CUSLEVEL_C.
               LT_LEVLCONF = CORRESPONDING #( ET_LEVLCONF ).
               MODIFY ZTINT_CUSLEVEL_C FROM TABLE LT_LEVLCONF.
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out  ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD get_cuslevel_nextmonth_list.
    DATA lv_uri          TYPE string.
    DATA(lo_api) = NEW zcl_icec_api( ).
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_body TYPE string.
    DATA lv_title TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_CUSLEVEL_NEXTMONTH_LIST'.
    lv_uri = ls_ztint_icec_api-url.
    CHECK it_cus IS NOT INITIAL.

    LOOP AT it_cus INTO DATA(ls_cus).
      lv_body = COND #( WHEN lv_body IS INITIAL THEN |"{ ls_cus-companyid }"|
                        ELSE |{ lv_body },"{ ls_cus-companyid }"| ).
    ENDLOOP.
    lv_body = |[{ lv_body }]|.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
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
                         data = et_companynextmonth_list  ).

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


  METHOD get_customergroups_exist.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_out          TYPE string,
         lv_body         TYPE string,
         lv_title        TYPE string.

    CHECK ir_companyid[] IS NOT INITIAL.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS' AND method = 'GET_CUSTOMERGROUPS_EXIST'.

    CLEAR:lv_uri,ls_content_type,lv_out,lv_body,lv_title,es_msg,et_list[].
    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_title = '判断客户是否被加入黑名单(ZCL_ICEC_RIGHTS_API->GET_CUSTOMERGROUPS_EXIST)'.
    LOOP AT ir_companyid INTO DATA(ls_companyid).
      IF lv_body IS INITIAL.
        lv_body = '[{"companyId":"' && ls_companyid-low && '","customerGroupId":"GRBCG"}'.
      ELSE.
        lv_body = lv_body && ',{"companyId":"' && ls_companyid-low && '","customerGroupId":"GRBCG"}'.
      ENDIF.

      AT LAST.
        lv_body = lv_body && ']'.
      ENDAT.
    ENDLOOP.

    "customerGroupId写死GRBCG，返回的result为true代表在权益黑名单中
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
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
                         data = et_list  ).


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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out  ev_msg = es_msg ).
   ENDIF.

  ENDMETHOD.


  method GET_GARAGE_LEVELCHANGE_ALERT.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_GARAGE_LEVELCHANGE_ALERT'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{garageCompanyId}' IN lv_uri WITH iv_companyid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).

    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    CALL METHOD lo_api->get_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.

    IF lv_out IS NOT INITIAL .
      ev_out = lv_out.
      ev_msg-type = 'S'.
      ev_msg-id = '200'.
      ev_msg-message = '接口调用成功'.
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '404'.
      ev_msg-message = '接口调用失败'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  endmethod.


  METHOD get_garage_level_nextmonth.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA: lv_rfcdest TYPE rfcdest.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_GARAGE_LEVEL_NEXTMONTH'.

    lv_uri = ls_ztint_icec_api-url.
    IF ls_ztint_icec_api-rfcdest IS INITIAL.
      lv_rfcdest = 'PLATFORM'.
    ELSE.
      lv_rfcdest = ls_ztint_icec_api-rfcdest.
    ENDIF.
    REPLACE '{garageCompanyId}' IN lv_uri WITH iv_companyid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).

    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    CALL METHOD lo_api->get_data
      EXPORTING
        iv_rfcdest      = lv_rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.

    IF lv_out IS NOT INITIAL .
      "解析json
      REPLACE 'currentMonthRepurchaseAmountRule' IN lv_out WITH 'currentmonthreamountrule'.
      REPLACE 'last12MonthsAvgRepurchaseAmountRule' IN lv_out WITH 'last12MonthsAvgReAmountRule'.
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_companynextmonth_level  ).

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


  METHOD get_garage_level_rule.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_GARAGE_LEVEL_RULE'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{garageCompanyId}' IN lv_uri WITH iv_companyid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).

    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
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
                         data = et_garagelevelrule  ).

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


  METHOD get_growthrecords_bycompanyid.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_GROWTHSRECORDS_BYCOMPANYID'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).

    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    lv_title = '获取供应商成长值记录(ZCL_ICEC_RIGHTS_API->GET_GROWTHRECORDS_BYCOMPANYID)'.
    lv_body = iv_body.
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
                         data = es_records  ).

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


  METHOD get_levelinfo_bycompanyid.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_LEVELINFO_BYCOMPANYID'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.

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
                         data = es_levelinfo  ).


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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_levelinfo_bycompanylist.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_LEVELINFO_BYCOMPANYIDLIST'.

    lv_uri = ls_ztint_icec_api-url.


    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    lv_title = '批量获取当前公司权益等级信息(ZCL_ICEC_RIGHTS_API->GET_LEVELINFO_BYCOMPANYLIST)'.
    lv_body = iv_companyidlist.
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
                         data = et_levelinfo  ).


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


  METHOD get_levelrecords_bycompanyid.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_LEVELRECORDS_BYCOMPANYID'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.

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
                         data = et_records  ).


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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_levels_configs.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_LEVELS_CONFIGS'.

    lv_uri = ls_ztint_icec_api-url.

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
                         data = et_levelconfig ).


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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_nextlevel_bycompanyid.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_NEXTLEVEL_BYCOMPANYID'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.

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
                         data = es_next  ).


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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_rank_bycompanyid.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_RANK_BYCOMPANYID'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.

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
                         data = es_rank  ).


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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_rank_bycompanyidlist.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_RANK_BYCOMPANYIDLIST'.

    lv_uri = ls_ztint_icec_api-url.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).

    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    lv_title = '批量获取公司等级(ZCL_ICEC_RIGHTS_API->GET_RANK_BYCOMPANYIDLIST)'.
    lv_body = iv_companylist.
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
                         data = et_rank  ).


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


  METHOD get_rightsrecords_bycompanyid.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_RIGHTSRECORDS_BYCOMPANYID'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.

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
                         data = et_records  ).


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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_rights_all.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_RIGHTS_ALL'.

    lv_uri = ls_ztint_icec_api-url.


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
                         data = et_rights  ).


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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_rights_bycompanyid.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_RIGHTS_BYCOMPANYID'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.

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
                         data = et_rights  ).


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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out  ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_venrank_bycompanyid.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS'
      AND method = 'GET_VENRANK_BYCOMPANYID'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.

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
                         data = es_rank  ).


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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_ven_level_bycompanyids.

    DATA lv_uri TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_body TYPE string.
    DATA lv_title TYPE string.

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RIGHTS' AND method = 'GET_VEN_LEVEL_BYCOMPANYIDS'.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).

    lv_title = '批量获取商家等级(ZCL_ICEC_RIGHTS_API->GET_VEN_LEVEL_BYCOMPANYIDS)'.
    lv_body = iv_body.
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
                         data = et_ven_level  ).

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
