class ZCL_ICEC_COUPON_API definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF ty_return,
        code TYPE string,
        msg  TYPE string,
      END OF ty_return .
  types:
    BEGIN OF ty_template,
        id                     TYPE string, ": "1618649392668037120",
        templateid             TYPE string,
        name                   TYPE string, ": "wuzy测试优惠券模版",
        requirementamount      TYPE string, ": 200.00,
        couponamount           TYPE string, ": 10
        category               TYPE string, ": "PRODUCT",
        categorycondition      TYPE string, ": "15021812472642940000,15045147025797720000",
        payment                TYPE string, ": "LOAN",
        availablechannel       TYPE string, ": "PC",
        ordertype              TYPE string, ": "COMMON_INQUIRY,DISTRIBUTION_INQUIRY,CUSTOMIZE_INQUIRY",
        type                   TYPE string, ": "SINGLE",
        providednumber         TYPE string, ": 1,
        usednumber             TYPE string, ": 0,
        enabled                TYPE string, ": true,
        attachtype             TYPE string, ": "PLATFORM",
        coupontype             TYPE string, ": REACH_AMOUNT_REDUCE 满减券    DISCOUNT 折扣券
        createdstamp           TYPE string, ": 1585032888000,
        createdby              TYPE string, ": "kscc",
        storecodes             TYPE string, ": "CD000001,GZCDSX01",
        storenames             TYPE string, ": "广州存德汽配、广州存德速销",
        excludestorenames      TYPE string,
        excludeproduct         TYPE string,
        excludeproductids      TYPE string,
        isunderline            TYPE string, ": true,
        isappointcompany       TYPE string, ": true,
        discountceilingamount  TYPE string, ": 200.00,
        limitdays              TYPE string, ": 1,
        limitnumber            TYPE string, ": 1,
        costascriptiontype     TYPE string, ": "COMPANY",
        "availableChannels": ["PC"],
        availablechannelinfo   TYPE string, ": "PC",
        "categoryConditions": ["15021812472642940000","15045147025797720000"],
        discountinfo           TYPE string, ": "满200.00减10.00",
        categorydescription    TYPE string, ": "限定商品",
        carbrandconditionnames TYPE string,
        "orderTypes": ["CUSTOMIZE_INQUIRY","DISTRIBUTION_INQUIRY","COMMON_INQUIRY"],
        "payments": ["LOAN"],
        paymentinfo            TYPE string, ": "单结",
        ordertypeinfo          TYPE string, ": "事故单采购订单,备货询价订单,常规询价订单"
      END OF ty_template .
  types:
    BEGIN OF ty_templateitem,
        amountordiscount TYPE string, "优惠券金额/折扣
        name             TYPE string, "优惠券名称
        quantity         TYPE string, "优惠券数量
        requiredamount   TYPE string, "订单金额要求
        templateid       TYPE string, "优惠券模板ID(String)
        type             TYPE string, "优惠券类型：满减券(REACH_AMOUNT_REDUCE)、折扣券(DISCOUNT)
        value            TYPE string, "优惠券价值
      END OF ty_templateitem .
  types:
    BEGIN OF ty_actv_template,
        totalvalue TYPE string, "优惠券总价值
        coupons    TYPE STANDARD TABLE OF ty_templateitem WITH DEFAULT KEY, "优惠券明细
      END OF  ty_actv_template .
  types:
    BEGIN OF ts_coupons,
        id                         TYPE string, "优惠券ID
        companyid                  TYPE string,
        companycode                TYPE string,
        companyname                TYPE string,
        name                       TYPE string, "优惠券名称
        couponactivityid           TYPE string,
        couponactivityname         TYPE string, "
        requirementamount          TYPE string, "订单所需金额
        couponamount               TYPE string, "面值
        category                   TYPE string,
        excludeproductids          TYPE string,
        payment                    TYPE string,
        availablechannel           TYPE string,
        ordertype                  TYPE string,
        createdbyname              TYPE string, "
        createdstamp               TYPE string,
        validitybegindate          TYPE string, "有效期
        validityenddate            TYPE string,
        status                     TYPE string,
        userbyname                 TYPE string,
        usedstamp                  TYPE string,
        actualcouponamount         TYPE string, "优惠券实际优惠金额
        discountceilingamount      TYPE string, "折扣上限金额
        available                  TYPE string,
        coupontype                 TYPE string,
        attachtype                 TYPE string,
        storecodes                 TYPE string,
        excludestorecodes          TYPE string,
        isunderline                TYPE string,
        isacquired                 TYPE string, "是否已领取
        categoryinfo               TYPE string, "全品类（特例商品除外
        storeinfo                  TYPE string, "全店铺(除西安博丰汽配
        paymentinfo                TYPE string, " "挂账,现付,单结"
        ordertypeinfo              TYPE string, ""备货询价订单,常规询价订单,商城订单,事故单采购订单"
        suppliercompanydisplayname TYPE string, "供应商简称
        suppliercompanyname        TYPE string,
      END OF ts_coupons .
  types:
    tt_coupons TYPE STANDARD TABLE OF ts_coupons WITH DEFAULT KEY .
  types:
    BEGIN OF ty_content,
        content       TYPE STANDARD TABLE OF ts_coupons WITH DEFAULT KEY,
        totalelements TYPE int4,
      END OF ty_content .
  types:
    BEGIN OF ty_goldcoin,
        balance       TYPE string,
        deductedcount TYPE string,
        deductionrate TYPE string,
        id            TYPE string,
      END OF ty_goldcoin .
  types:
    BEGIN OF ty_send_goldcoin,
        approveflowid  TYPE string,
        businessareaid TYPE string,
        companycode    TYPE string,
        companyid      TYPE string,
        createdby      TYPE string,
        garageremark   TYPE string,
        number(8)      TYPE p DECIMALS 2, " int4,
        providereason  TYPE string,
        reasontype     TYPE string,
        remark         TYPE string,
        orderid        TYPE string,
      END OF ty_send_goldcoin .
  types:
    tt_send_goldcoin TYPE STANDARD TABLE OF ty_send_goldcoin WITH DEFAULT KEY .
  types:
    BEGIN OF ts_refund_goldcoin,
        companycode  TYPE string,
        companyid    TYPE string,
        refundnumber TYPE string,
        refundtype   TYPE string,
        remark       TYPE string,
        orderid      TYPE string,
        asid         TYPE string,
        sourceid     TYPE string,
        userloginid  TYPE string,
      END OF ts_refund_goldcoin .
  types:
    BEGIN OF ty_goldcoin_result,
        companycode TYPE string,
        remark      TYPE string,
        success     TYPE string,
      END OF ty_goldcoin_result .
  types:
    tt_result TYPE STANDARD TABLE OF ty_goldcoin_result WITH DEFAULT KEY .
  types:
      "查询所有持有免邮券列表
    BEGIN OF ty_glcouponinput,
        garagecompanyid TYPE string,
        page            TYPE string,
        size            TYPE string,
        statuses        TYPE STANDARD TABLE OF string WITH DEFAULT KEY,
      END OF ty_glcouponinput .
  types:
    BEGIN OF ty_garagelogisticscoupon,
        couponname         TYPE string, "免邮券名称
        coupontype         TYPE string, "免邮券类型 (BUS：班车送免邮券；DOWNWIND：拼车送免邮券；INSTANT: 专车送免邮券)
        effectivebegindate TYPE string, "开始有效期
        effectiveenddate   TYPE string, "结束有效期
        publishedstamp     TYPE string, "发放时间
        status             TYPE string, "使用状态 (UNUSED待使用，NOTSTARTED未开始，EXPIRED已过期，USED已使用，TOEXPIRE即将过期)
      END OF ty_garagelogisticscoupon .
  types:
    tt_garagelogisticscoupon TYPE STANDARD TABLE OF ty_garagelogisticscoupon WITH DEFAULT KEY .
  types:
      "维修厂的折扣卡列表
    BEGIN OF ty_carddata,
        acuqiredate         TYPE string, ": "", // 折扣卡获取时间
        canbuy              TYPE string, ": false, // 是否可购买标识，ture代表可购买
        cardid              TYPE string, ": "", // 卡项ID
        cardname            TYPE string, ": "", // 折扣卡名称
        cardpromotions      TYPE STANDARD TABLE OF string WITH DEFAULT KEY, ": [ // 折扣卡参与活动
        cardrealstatus      TYPE string, ": "", // 折扣卡实际状态; NOT_START(未开始),STARTING(进行中),EXPIRED(已失效),ABOUT_EXPIRE(即将过期)
        cardstatus          TYPE string, ": "", // 折扣卡状态
        cardtype            TYPE string, ": "", // 折扣卡类型
        companycardid       TYPE string, ": "", // 客户卡项ID
        companycode         TYPE string, ": "", // 维修厂公司编码
        companyid           TYPE string, ": "", // 维修厂公司id
        companyname         TYPE string, ": "", // 维修厂公司名称
        description         TYPE string, ": "", // 折扣卡描述
        id                  TYPE string, ": "", // 折扣卡id
        orderid             TYPE string, ": "", // 折扣卡购买订单编码
        price               TYPE string, ": null, // 折扣卡价格
        totaldiscountamount TYPE string, ": null, // 折扣卡累计抵扣金额
        usedtimes           TYPE string, ": "", // 折扣卡已使用次数
        usedtimeslimits     TYPE string, ": "", // 折扣卡使用次数
        validitybegin       TYPE string, ": "", // 有效期开始时间
        validityend         TYPE string, ": "" // 有效期结束时间
      END OF ty_carddata .
  types:
    BEGIN OF ty_cardlist,
        code         TYPE string, ": "", // null
        data         TYPE STANDARD TABLE OF ty_carddata WITH DEFAULT KEY , ": [ // null
        errormessage TYPE string, ": "" // null
      END OF ty_cardlist .
  types TS_CARDLIST type TY_CARDLIST .
  types:
      "维修厂的折扣卡使用记录
    BEGIN OF ty_promotiontemplates,
        discountamount          TYPE string, ": null, // 优惠金额
        discountcalculationtype TYPE string, ": "", // 折扣类型，DiscountCalculationTypeEnum
        displayname             TYPE string, ": "", // 展示名称
        orderamount             TYPE string, ": null, // 订单实付金额
        orderno                 TYPE string, ": "", // 订单号
        parvalue                TYPE string, ": "", // 折扣
        productnamejoin         TYPE string, ": "", // 配件名称、分隔
        quantity                TYPE string, ": "", // 配件数量
        templatename            TYPE string, ": "" // 活动模版名称
      END OF ty_promotiontemplates .
  types:
    BEGIN OF ty_usedcontent,
        cartname               TYPE string, ": "", // 折扣卡名称
        companycode            TYPE string, ": "", // 维修厂编码
        companyname            TYPE string, ": "", // 维修厂名称
        orderno                TYPE string, ": "", // 订单号
        ordertime              TYPE string, ": "", // 下单时间
        productnamejoin        TYPE string, ": "", // 配件名称、分隔
        promotiontemplatenames TYPE STANDARD TABLE OF string WITH DEFAULT KEY, ": [ // 折扣卡内容
        promotiontemplates     TYPE STANDARD TABLE OF ty_promotiontemplates WITH DEFAULT KEY, ": [ // 维修厂订单折扣使用明细
        totaldiscountamount    TYPE string, ": null, // 订单总优惠金额
        totalorderamount       TYPE string, ": null, // 订单总实付金额
        totalquantity          TYPE string, ": "", // 配件总数量
        validitybegin          TYPE string, ": "", // 有效期开始时间
        validityend            TYPE string, ": "" // 有效期结束时间
      END OF ty_usedcontent .
  types:
    BEGIN OF ty_usedmetadata,
        number        TYPE string, ": "", // null
        size          TYPE string, ": "", // null
        totalelements TYPE string, ": "", // null
        totalpages    TYPE string, ": "" // null
      END OF ty_usedmetadata .
  types:
    BEGIN OF ty_cardused,
        content          TYPE STANDARD TABLE OF ty_usedcontent WITH DEFAULT KEY, ": [ // null
        first            TYPE string, ": null, // null
        last             TYPE string, ": null, // null
        metadata         TYPE ty_usedmetadata, ": { // null
        number           TYPE string, ": "", // null
        numberofelements TYPE string, ": "", // null
        size             TYPE string, ": "", // null
        sort             TYPE string, ": {}, // null
        totalelements    TYPE string, ": "", // null
        totalpages       TYPE string, ": "" // null
      END OF ty_cardused .
  types TS_CARDUSED type TY_CARDUSED .

  methods GET_MARKET_COST_BY_USERID
    importing
      value(IV_USERID) type ZDE_USERID
    exporting
      !EV_COST type DMBTR .
  methods CHECK_APPLY_MARKET_FEE
    importing
      value(IV_TYPE) type CHAR1
      value(IV_USERID) type ZDE_USERID
    exporting
      !ES_RETURN type ZINTS_S_MARKET_CONTROL
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SEND_COUPONS_BY_TEMPLATE
    importing
      value(IS_SEND) type ZSINT_COUPON_SEND
    exporting
      value(EV_JSON) type STRING
      value(ET_COUPON) type ZSTINT_COUPON_TEMP
      value(ES_MSG) type BAPIRET2 .
  methods SEND_MARKET_POINTS
    importing
      value(IS_SEND) type ZSINT_ML_POINTS
    exporting
      value(ES_MSG) type BAPIRET2 .
  methods SEND_SPECIAL_COUPON
    importing
      value(IV_DATA) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(EV_ID) type STRING .
  methods SEND_SPECIAL_COUPON_V2
    importing
      value(IV_DATA) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(EV_ID) type STRING .
  methods SEND_REGISTER_COUPON
    importing
      value(IV_COMPANYID) type STRING
      value(IV_COUPONACTIVITYID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2 .
  methods GET_ACTCOUPON_TEMPLATE
    importing
      !IV_TEMPLATEID type STRING
    exporting
      !ES_MSG type BAPIRET2
      !ES_TEMPLATE type TY_ACTV_TEMPLATE .
  methods GET_COUPON_TEMPLATE_DETAIL
    importing
      !IV_TEMPLATEID type STRING
    exporting
      !ES_MSG type BAPIRET2
      !ES_TEMPLATE type TY_TEMPLATE .
  methods SEND_APPLID_COUPON_BATCH
    importing
      !IV_CPID type STRING
      !IV_COMPANYID type STRING
      !IV_NUM type STRING
    exporting
      !ES_RETURN type TY_RETURN
      !ES_MSG type BAPIRET2 .
  methods GET_CARDUSED_LIST
    importing
      value(IV_COMPANYID) type STRING
      value(IV_CARDID) type STRING
      value(IV_PAGE) type STRING optional
      value(IV_SIZE) type STRING optional
    exporting
      value(ET_OUTPUT) type TS_CARDUSED
      value(ES_MSG) type BAPIRET2 .
  methods GET_CARD_LIST
    importing
      value(IV_COMPANYID) type STRING
      value(IV_BODY) type STRING
    exporting
      value(ET_OUTPUT) type TS_CARDLIST
      value(ES_MSG) type BAPIRET2 .
  methods GET_CARD_LISTALL
    importing
      value(IV_COMPANYID) type STRING
    exporting
      value(ET_OUTPUT) type TS_CARDLIST
      value(ES_MSG) type BAPIRET2 .
  methods GET_COUPON_LIST
    importing
      value(IV_PARAM) type STRING
    exporting
      value(ET_OUTPUT) type TT_COUPONS
      value(ES_MSG) type BAPIRET2 .
  methods GET_COMPANY_GOLDCOIN
    importing
      value(IV_COMPANYID) type STRING
    exporting
      value(ES_OUTPUT) type TY_GOLDCOIN
      value(ES_MSG) type BAPIRET2 .
  methods GET_MARKET_MANAGEMENT
    importing
      value(IV_PARAM) type STRING
    exporting
      value(ES_OUTPUT) type ZINTS_S_MARKET_MANAGE
      value(ES_MSG) type BAPIRET2
    raising
      /IWBEP/CX_MGW_TECH_EXCEPTION
      /IWBEP/CX_MGW_BUSI_EXCEPTION .
  methods REFUND_CUSTOMER_GOLDCOIN
    importing
      value(IS_GOLDCOIN) type TS_REFUND_GOLDCOIN optional
    exporting
      !ES_MSG type BAPIRET2 .
  methods SEND_CUSTOMER_COIN
    importing
      value(IT_GOLDCOIN) type TT_SEND_GOLDCOIN optional
    exporting
      value(EV_JSON) type STRING
      !OT_RESULT type TT_RESULT
      !ES_MSG type BAPIRET2 .
  methods GET_GARAGE_LOGISTICS_COUPON
    importing
      value(IS_INPUT) type TY_GLCOUPONINPUT
    exporting
      value(EV_TOTAL) type STRING
      value(EV_PAGECOUNT) type STRING
      value(ES_MSG) type BAPIRET2
      value(ET_LIST) type TT_GARAGELOGISTICSCOUPON .
  methods GET_CONTROL_RULES
    exporting
      !ET_RULES type ZINTS_T_RULES
      !ES_MSG type BAPIRET2 .
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



CLASS ZCL_ICEC_COUPON_API IMPLEMENTATION.


  METHOD check_apply_market_fee.

*----检查营销费用申请是否受到管控 add by liy 20220322

    "说明：iv_type A申请优惠券列表 B 激活优惠券的列表 1申请优惠券 2 申请加额 3 激活优惠券 4 特殊优惠券
    TYPE-POOLS:zints.

    DATA(lo_coupon) = NEW zcl_icec_coupon_api( ).
    DATA:lv_param TYPE string.
    DATA:ls_marketmanage TYPE zints_s_market_manage.

    "获取当月连队信息
    SELECT SINGLE
      a~yearmonth,a~companyid,a~companyname,a~companyno,a~regionid
      INTO @DATA(ls_team)
      FROM ztint_team_targe AS a
      INNER JOIN ztint_user_group AS b
      ON a~teamid = b~teamid
      AND a~yearmonth = b~yearmonth
      INNER JOIN ztint_user_inf AS c
      ON b~userno = c~userno
      AND isstill = 'X'
      WHERE a~yearmonth = @sy-datum+0(6)
      AND c~userid = @iv_userid.

    IF sy-subrc <> 0.
      es_return-msg = '您的组织架构尚未划分市场连队，无法统计市场营销成本，暂不可申请'.

      es_return-applyaddamount = 'N'."  是否支持申请加额 Y表示可以申请
      es_return-applyyhq = 'N'."  是否支持申请优惠券 Y表示可以申请
      es_return-applyspecialyhq = 'N'."	是否支持申请特殊优惠券 Y表示可以申请
      es_return-applyregisteryhq = 'N'."  是否支持申请激活优惠券 Y表示可以申请

      RETURN.
    ENDIF.

    lv_param = '?areaCode=' && ls_team-regionid && '&month=' && sy-datum+0(4) && '-' && sy-datum+4(2).

    "请求营销管控接口
    lo_coupon->get_market_management(
      EXPORTING
      iv_param = lv_param
      IMPORTING
        es_output = ls_marketmanage
         ).

    " FEE_CONTROL_NOT_EFFECTIVE 管控未生效
    "FEE_CONTROL_ALREADY_EFFECTIVE 管控已生效
    "FEE_CONTROL_PAUSING 暂停管控
    "FEE_CONTROL_COMPULSORY 强制管控

    "默认都可以申请
    es_return-applyaddamount = 'Y'."  是否支持申请加额 Y表示可以申请
    es_return-applyyhq = 'Y'."  是否支持申请优惠券 Y表示可以申请
    es_return-applyspecialyhq = 'Y'."	是否支持申请特殊优惠券 Y表示可以申请
    es_return-applyregisteryhq = 'Y'."  是否支持申请激活优惠券 Y表示可以申请

    "根据管控状态控制申请
    CASE ls_marketmanage-controlstatusen.

        "管控未生效+暂停管控 支持申请各种优惠券
      WHEN 'FEE_CONTROL_NOT_EFFECTIVE' OR 'FEE_CONTROL_PAUSING'.

        "管控已生效
      WHEN 'FEE_CONTROL_ALREADY_EFFECTIVE'.

        "MARKETING_ALL_USED 市场营销费用已使用超过100%
        "MARKETING_EFFECTIVE_WARNING  市场营销费用有效占比超过预警值
        "COUPON_EFFECTIVE_WARNING 优惠券额度有效占比超过预警值

        "iv_type A申请优惠券列表 B 激活优惠券的列表 1申请优惠券 2 申请加额 3 激活优惠券 4 特殊优惠券
        LOOP AT ls_marketmanage-rules[] INTO DATA(ls_rule).

          CASE ls_rule-triggerconditioncode.

              "市场营销费用已使用超过100%
            WHEN 'MARKETING_ALL_USED'.
              IF ls_marketmanage-marketingquota-remainingquota <= 0.
                LOOP AT ls_rule-measures[] INTO DATA(ls_measure).
                  "禁止申请加额
                  IF ls_measure-code = 'QUOTA_APPLY_FORBIDDEN'.
                    es_return-applyaddamount = 'N'.

                    "禁止申请线下优惠券
                  ELSEIF ls_measure-code = 'OFFLINE_COUPON_APPLY_FORBIDDEN'.
                    es_return-applyyhq = 'N'.

                    "禁止申请特殊优惠券
                  ELSEIF ls_measure-code = 'SPECIAL_COUPON_APPLY_FORBIDDEN'.
                    es_return-applyspecialyhq = 'N'.

                    "禁止申请激活优惠券
                  ELSEIF ls_measure-code = 'ACTIVATE_COUPON_APPLY_FORBIDDEN'.
                    es_return-applyregisteryhq = 'N'.
                  ENDIF.

                ENDLOOP.
              ENDIF.

              "市场营销费用有效占比超过预警值
            WHEN 'MARKETING_EFFECTIVE_WARNING'.
              IF ls_marketmanage-marketingquota-effectivefeeproportion >= ls_marketmanage-marketingquota-earlywarningrate.
                LOOP AT ls_rule-measures[] INTO ls_measure.
                  "禁止申请加额
                  IF ls_measure-code = 'QUOTA_APPLY_FORBIDDEN'.
                    es_return-applyaddamount = 'N'.

                    "禁止申请线下优惠券
                  ELSEIF ls_measure-code = 'OFFLINE_COUPON_APPLY_FORBIDDEN'.
                    es_return-applyyhq = 'N'.

                    "禁止申请特殊优惠券
                  ELSEIF ls_measure-code = 'SPECIAL_COUPON_APPLY_FORBIDDEN'.
                    es_return-applyspecialyhq = 'N'.

                    "禁止申请激活优惠券
                  ELSEIF ls_measure-code = 'ACTIVATE_COUPON_APPLY_FORBIDDEN'.
                    es_return-applyregisteryhq = 'N'.
                  ENDIF.

                ENDLOOP.
              ENDIF.

              "优惠券额度有效占比超过预警值
            WHEN 'COUPON_EFFECTIVE_WARNING'.
              IF ls_marketmanage-couponquota-effectivefeeproportion >= ls_marketmanage-couponquota-earlywarningrate.
                LOOP AT ls_rule-measures[] INTO ls_measure.
                  "禁止申请加额
                  IF ls_measure-code = 'QUOTA_APPLY_FORBIDDEN'.
                    es_return-applyaddamount = 'N'.

                    "禁止申请线下优惠券
                  ELSEIF ls_measure-code = 'OFFLINE_COUPON_APPLY_FORBIDDEN'.
                    es_return-applyyhq = 'N'.

                    "禁止申请特殊优惠券
                  ELSEIF ls_measure-code = 'SPECIAL_COUPON_APPLY_FORBIDDEN'.
                    es_return-applyspecialyhq = 'N'.

                    "禁止申请激活优惠券
                  ELSEIF ls_measure-code = 'ACTIVATE_COUPON_APPLY_FORBIDDEN'.
                    es_return-applyregisteryhq = 'N'.
                  ENDIF.

                ENDLOOP.
              ENDIF.
            WHEN OTHERS.

          ENDCASE.

        ENDLOOP.

        "强制管控
      WHEN 'FEE_CONTROL_COMPULSORY'.

        LOOP AT ls_marketmanage-rules[] INTO ls_rule WHERE triggerconditioncode = 'FEE_CONTROL_COMPULSORY'.

          LOOP AT ls_rule-measures[] INTO ls_measure.
            "禁止申请加额
            IF ls_measure-code = 'QUOTA_APPLY_FORBIDDEN'.
              es_return-applyaddamount = 'N'.

              "禁止申请线下优惠券
            ELSEIF ls_measure-code = 'OFFLINE_COUPON_APPLY_FORBIDDEN'.
              es_return-applyyhq = 'N'.

              "禁止申请特殊优惠券
            ELSEIF ls_measure-code = 'SPECIAL_COUPON_APPLY_FORBIDDEN'.
              es_return-applyspecialyhq = 'N'.

              "禁止申请激活优惠券
            ELSEIF ls_measure-code = 'ACTIVATE_COUPON_APPLY_FORBIDDEN'.
              es_return-applyregisteryhq = 'N'.
            ENDIF.

          ENDLOOP.
        ENDLOOP.

      WHEN OTHERS.

    ENDCASE.

  ENDMETHOD.


  METHOD GET_ACTCOUPON_TEMPLATE.

    DATA: ls_content_type TYPE zapi_s_contenttype,
          lv_out          TYPE string,
          lv_title TYPE string,
          lv_uri type string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'COUPON' AND method = 'GET_ACTCOUPON_TEMPLATE'.
    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{?activityId}' IN lv_uri WITH iv_templateid.

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
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_template  ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out  ev_msg = es_msg ).
   ENDIF.


  ENDMETHOD.


METHOD get_cardused_list.
  DATA: ls_content_type TYPE zapi_s_contenttype,
        lv_out          TYPE string,
        lv_title        TYPE string,
        lv_uri          TYPE string.
  DATA ls_content TYPE ty_content.
  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'CARD' AND method = 'GET_CARDUSED_LIST'.

  IF iv_page IS INITIAL.
    iv_page = 0.
  ENDIF.
  IF iv_size IS INITIAL.
    iv_size = 20.
  ENDIF.
  lv_uri = ls_ztint_icec_api-url.

  ls_content_type-content_type = 'application/json;charset=UTF-8'.
  ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
  DATA: lv_body TYPE string.
  lv_body = '{' &&
  |"page": "{ iv_page }",| &&
  |"size": "{ iv_size }",| &&
  |"condition": | &&
  '{' &&
  |  "companyId": "{ iv_companyid }",| &&
  |  "companyCardId": "{ iv_cardid }"| &&
  '}' &&
  '}'.
  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  CALL METHOD lo_api->post_data
    EXPORTING
      iv_rfcdest      = ls_ztint_icec_api-rfcdest
      iv_uri          = lv_uri
      is_content_type = ls_content_type
      iv_body         = lv_body
    IMPORTING
      json_out        = lv_out
      ev_msg          = es_msg.

  IF lv_out IS NOT INITIAL .
    TRY.
        /ui2/cl_json=>deserialize(
        EXPORTING
          json = lv_out
        CHANGING
        data = et_output  ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out  ev_msg = es_msg ).
   ENDIF.

ENDMETHOD.


METHOD get_card_list.
  DATA: ls_content_type TYPE zapi_s_contenttype,
        lv_out          TYPE string,
        lv_title        TYPE string,
        lv_uri          TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'CARD' AND method = 'GET_CARD_LIST'.

  lv_uri = ls_ztint_icec_api-url.
  CHECK iv_companyid IS NOT INITIAL.
  REPLACE '{repairCompanyId}' IN lv_uri WITH iv_companyid.

  ls_content_type-content_type = 'application/json;charset=UTF-8'.
  ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
  DATA(lo_api) = NEW zcl_icec_api( ).

  "调用接口
  CALL METHOD lo_api->post_data
    EXPORTING
      iv_rfcdest      = ls_ztint_icec_api-rfcdest
      iv_uri          = lv_uri
      is_content_type = ls_content_type
      iv_body         = iv_body
    IMPORTING
      json_out        = lv_out
      ev_msg          = es_msg.

  IF lv_out IS NOT INITIAL .
    TRY.
        /ui2/cl_json=>deserialize(
        EXPORTING
          json = lv_out
        CHANGING
        data = et_output  ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out  ev_msg = es_msg ).
   ENDIF.

ENDMETHOD.


METHOD GET_CARD_LISTALL.
  DATA: ls_content_type TYPE zapi_s_contenttype,
        lv_out          TYPE string,
        lv_title        TYPE string,
        lv_uri          TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'CARD' AND method = 'GET_CARD_LISTALL'.

  lv_uri = ls_ztint_icec_api-url.
  CHECK iv_companyid IS NOT INITIAL.
  REPLACE '{repairCompanyId}' IN lv_uri WITH iv_companyid.

  ls_content_type-content_type = 'application/json;charset=UTF-8'.
  ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
  DATA(lo_api) = NEW zcl_icec_api( ).

  "调用接口
  CALL METHOD lo_api->get_data
    EXPORTING
      iv_rfcdest      = ls_ztint_icec_api-rfcdest
      iv_uri          = lv_uri
      is_content_type = ls_content_type
    IMPORTING
      json_out        = lv_out
      ev_msg          = es_msg.

  IF lv_out IS NOT INITIAL .
    TRY.
        /ui2/cl_json=>deserialize(
        EXPORTING
          json = lv_out
        CHANGING
        data = et_output  ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out  ev_msg = es_msg ).
   ENDIF.

ENDMETHOD.


  method GET_COMPANY_GOLDCOIN.
        DATA: ls_content_type TYPE zapi_s_contenttype,
          lv_out          TYPE string,
          lv_title        TYPE string,
          lv_uri          TYPE string.
    DATA ls_content TYPE ty_content.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'GOLDCOIN' AND method = 'GET_COMPANY_GOLDCOIN'.
    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{garageCompanyId}' IN lv_uri WITH IV_COMPANYID.

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out  ev_msg = es_msg ).
   ENDIF.


  endmethod.


  METHOD get_control_rules.
    DATA: ls_content_type TYPE zapi_s_contenttype,
          lv_out          TYPE string,
          lv_title        TYPE string,
          lv_uri          TYPE string.
    DATA ls_content TYPE ty_content.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MARKET' AND method = 'GET_CONTROL_RULES'.
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
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_rules  ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out  ev_msg = es_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD get_coupon_list.
    DATA: ls_content_type TYPE zapi_s_contenttype,
          lv_out          TYPE string,
          lv_title        TYPE string,
          lv_uri          TYPE string.
    DATA ls_content TYPE ty_content.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'COUPON' AND method = 'GET_COUPON_LIST'.
    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{param}' IN lv_uri WITH iv_param.

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
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = ls_content  ).
          et_output = CORRESPONDING #( ls_content-content ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out  ev_msg = es_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_coupon_template_detail.

*接口地址http://ctsp.casstime.com/interface/manage/detail?id=16009&model_id=26258&classify=2714&method=GET&product_id=1

*请求接口：http://hwbeta-api.intra.casstime.com/coupon-service/coupon_templates/2306869162636341248
    DATA: ls_content_type TYPE zapi_s_contenttype,
          lv_out          TYPE string,
          lv_title        TYPE string,
          lv_uri          TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'COUPON'
      AND method = 'GET_COUPON_TEMPLATE_DETAIL'.
    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{id}' IN lv_uri WITH iv_templateid.

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
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_template  ).

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
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out  ev_msg = es_msg ).
    ENDIF.

  ENDMETHOD.


  METHOD get_garage_logistics_coupon.

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
         lv_total         TYPE string,
         lv_statuses      TYPE string.

    IF is_input-garagecompanyid IS INITIAL.
      es_msg-type = 'E'.
      es_msg-message = '维修厂客户代码id必填'.
      RETURN.
    ELSE.
      SELECT COUNT(*) UP TO 1 ROWS
        FROM ztint_cus_inf WHERE companyid = is_input-garagecompanyid.
      IF sy-subrc NE 0.
        es_msg-type = 'E'.
        es_msg-message = '维修厂客户代码id不存在'.
        RETURN.
      ENDIF.
    ENDIF.

    CLEAR:lv_uri,ls_content_type,lv_out,lv_body,lv_title,lv_pagenum,lv_pagesize,
          lv_uri2,ls_content_type2,lv_out2,lv_body2,lv_title2,lv_total,lv_statuses.
    IF is_input-page IS INITIAL OR is_input-page = 0.
      lv_pagenum = 1.
    ELSE.
      lv_pagenum = is_input-page.
    ENDIF.
    CONDENSE lv_pagenum NO-GAPS.
    IF is_input-size IS INITIAL OR is_input-size = 0.
      lv_pagesize = 20.
    ELSE.
      lv_pagesize = is_input-size.
    ENDIF.
    CONDENSE lv_pagesize NO-GAPS.

    LOOP AT is_input-statuses INTO DATA(ls_status).
      IF lv_statuses IS INITIAL.
        lv_statuses = '"' && ls_status && '"'.
      ELSE.
        lv_statuses = lv_statuses && ',"' && ls_status && '"'.
      ENDIF.
    ENDLOOP.

    "转换Json
    lv_body = '{"garageCompanyId":"' && is_input-garagecompanyid && '","page":"' && is_input-page && '","size":"' && is_input-size
                && '","statuses":[' && lv_statuses && ']}'.

*&---取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'COUPON' AND method = 'GET_GARAGE_LOGISTICS_COUPON'.
    lv_uri = ls_ztint_icec_api-url.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    lv_title = '获取维修厂所持有免邮券列表(ZCL_ICEC_COUPON_API->GET_GARAGE_LOGISTICS_COUPON)'.
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
                         data = et_list ) .

          es_msg-type = 'S'.
          es_msg-id = '200'.
          es_msg-message = 'JSON成功解析'.

          "再调用另一个API去获取总条目数
          lv_title2 = '获取维修厂所持有免邮券总条目数(ZCL_ICEC_COUPON_API->GET_GARAGE_LOGISTICS_COUPON)'.
          ls_content_type2-content_type = 'application/json;charset=UTF-8'.
          SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api2)
            WHERE service = 'COUPON' AND method = 'GET_GARAGE_LOGISTICS_COUPON2'.
          lv_uri2 = ls_ztint_icec_api2-url.
          lv_body2 = '{"garageCompanyId":"' && is_input-garagecompanyid && '","statuses":[' && lv_statuses && ']}'.
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
                ev_pagecount = ceil( lv_total / lv_pagesize ).
                CONDENSE ev_pagecount NO-GAPS.
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


  METHOD get_market_cost_by_userid.

    "根据userid获取本月用户名下客户已使用营销费
    DATA:ls_option TYPE /iwbep/s_cod_select_option,
         so_date   TYPE /iwbep/t_cod_select_options. "日期

    ls_option-sign = 'I'.
    ls_option-option = 'BT'.
    ls_option-low = sy-datum+0(6) && '01'.
    ls_option-high = sy-datum.
    APPEND ls_option TO so_date.

    SELECT a~*
      INTO TABLE @DATA(lt_cost)
      FROM ztint_marketcost AS a
      INNER JOIN ztint_cus_inf AS b
      ON a~companyid = b~companyid
      INNER JOIN ztint_cus_user AS c
      ON b~cusid = c~cusid
      WHERE a~daily IN @so_date
      AND c~userid = @iv_userid
      AND c~usertype = '1'
      AND c~ispre = ''
      AND c~isdelete = ''.
    IF sy-subrc = 0.

      "汇总本月已使用营销费用
      LOOP AT lt_cost INTO DATA(ls_cost).
        ev_cost = ev_cost + ls_cost-marketingcost.
      ENDLOOP.

    ENDIF.

  ENDMETHOD.


  METHOD get_market_management.
    DATA: ls_content_type TYPE zapi_s_contenttype,
          lv_out          TYPE string,
          lv_title        TYPE string,
          lv_uri          TYPE string.
    DATA ls_content TYPE ty_content.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MARKET' AND method = 'GET_MARKET_MANAGEMENT'.
    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{?areaCode,month}' IN lv_uri WITH iv_param.

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out  ev_msg = es_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD refund_customer_goldcoin.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA: lv_data TYPE string.
    DATA lv_body TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'GOLDCOIN'  AND method = 'REFUND_CUSTOMER_GOLDCOIN'.
    lv_uri = ls_ztint_icec_api-url.

    IF is_goldcoin IS NOT INITIAL.
      lv_body = '{' &&
                  |"companyId":"{ is_goldcoin-companyid }","orderId":"{ is_goldcoin-orderid }",| &&
                  |"refundNumber":{ is_goldcoin-refundnumber },"refundType":"{ is_goldcoin-refundtype }",| &&
                  |"remark":"{ is_goldcoin-remark }","sourceId":"{ is_goldcoin-asid }",| &&
                  |"userLoginId":"{ is_goldcoin-userloginid }"| && '}'.

    ENDIF.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA:lv_title TYPE string.
    lv_title = '发放金币带小数(ZCL_ICEC_COUPON_API->REFUND_CUSTOMER_GOLDCOIN)'.
    CALL METHOD lo_api->put_data
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
                         data =  lv_data ).

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
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = es_msg ).
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


  METHOD send_applid_coupon_batch.

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
      WHERE service = 'COUPON'  AND method = 'SEND_APPLID_COUPON_BATCH'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{id}' IN lv_uri WITH iv_cpid.
    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.
    REPLACE '{number}' IN lv_uri WITH iv_num.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    lv_title = '发放优惠券(ZCL_ICEC_COUPON_API->SEND_APPLID_COUPON_BATCH)'.
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
                         data = es_return  ).

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
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = es_msg ).
    ENDIF.

  ENDMETHOD.


  METHOD send_coupons_by_template.
*接口文档地址
*http://ctsp.casstime.com/interface/manage/detail?id=16019&model_id=26268&classify=2716&method=POST&product_id=1

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_json         TYPE string,
         lv_out          TYPE string,
         lv_title        TYPE string.

    "转换Json
    CALL FUNCTION 'Z_FMBC_GET_JSON'
      EXPORTING
        iv_data = is_send
      IMPORTING
        ev_json = lv_json.

    "取url
    SELECT SINGLE *
      FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'COUPON'
      AND method = 'SEND_COUPON_BY_TEMP'.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    lv_title = '新版营销管理-根据模版发放优惠券(ZCL_ICEC_COUPON_API->SEND_MARKET_POINTS)'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_json
        iv_title        = lv_title
      IMPORTING
        json_out        = lv_out  "是个list
        ev_msg          = es_msg.

    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_coupon  ).
          ev_json = lv_out.
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
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_json iv_responsebody = lv_out ev_msg = es_msg ).
    ENDIF.

  ENDMETHOD.


  METHOD send_customer_coin.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lt_paycoin TYPE STANDARD TABLE OF ztint_pay_coin.
    DATA: lv_out TYPE string.
    DATA lv_body1 TYPE string.
    DATA lv_body TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'GOLDCOIN'  AND method = 'SEND_CUSTOMER_COIN'.
    lv_uri = ls_ztint_icec_api-url.

    LOOP AT it_goldcoin INTO DATA(ls_goldcoin).
      lv_body1 = '{' &&
                  |"companyCode":"{ ls_goldcoin-companycode }","companyId":"{ ls_goldcoin-companyid }",| &&
                  |"createdBy":"{ ls_goldcoin-createdby }","number":{ ls_goldcoin-number },"quantity":{ ls_goldcoin-number },| &&
                  |"orderId":"{ ls_goldcoin-orderid }","remark":"{ ls_goldcoin-remark }","approveFlowId":"{ ls_goldcoin-approveflowid }",| &&
                  |"provideReason":"{ ls_goldcoin-providereason }"| && '}'.
      lv_body = COND #( WHEN lv_body IS INITIAL THEN lv_body1
                        ELSE |{ lv_body },{ lv_body1 }| ).
      TRY.
          lt_paycoin = VALUE #( BASE lt_paycoin ( guid = cl_system_uuid=>if_system_uuid_static~create_uuid_c32( )
                                companycode = ls_goldcoin-companycode companyid = ls_goldcoin-companyid orderid = ls_goldcoin-orderid
                                coinnumber = ls_goldcoin-number createby = ls_goldcoin-createdby remark = ls_goldcoin-remark
                                approveflowid = ls_goldcoin-approveflowid providereason = ls_goldcoin-providereason
                                zcrt_uname = sy-uname zcrt_bdate = sy-datum zcrt_btime = sy-uzeit
                                zupd_uname = sy-uname zupd_bdate = sy-datum zupd_btime = sy-uzeit
                                ) ).
      ENDTRY.
    ENDLOOP.
    lv_body = |[{ lv_body }]|.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA:lv_title TYPE string.
    lv_title = '发放金币(ZCL_ICEC_COUPON_API->SEND_CUSTOMER_COIN)'.
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
      ev_json = lv_out .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = ot_result  ).
          LOOP AT ot_result INTO DATA(ls_result).
            READ TABLE lt_paycoin ASSIGNING FIELD-SYMBOL(<lfs_paycoin>) WITH KEY companycode = ls_result-companycode.
            IF sy-subrc EQ 0.
              <lfs_paycoin>-status = COND #( WHEN ls_result-success EQ 'true' OR ls_result-success EQ 'X' THEN 'S'
                                             ELSE 'E').
              <lfs_paycoin>-resultremark = ls_result-remark.
            ENDIF.
          ENDLOOP.

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
    IF lt_paycoin IS NOT INITIAL.
      MODIFY ztint_pay_coin FROM TABLE lt_paycoin.
    ENDIF.
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = es_msg ).
    ENDIF.

  ENDMETHOD.


  METHOD send_market_points.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_json         TYPE string,
         lv_out          TYPE string,
         lv_title        TYPE string.

    "转换Json
    CALL FUNCTION 'Z_FMBC_GET_JSON'
      EXPORTING
        iv_data = is_send
      IMPORTING
        ev_json = lv_json.

    "取url
    SELECT SINGLE *
      FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'POINT'
      AND method = 'SEND_MARKET_POINTS'.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    lv_title = '新版营销管理-发放积分(ZCL_ICEC_COUPON_API->SEND_MARKET_POINTS)'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_json
        iv_title        = lv_title
      IMPORTING
        json_out        = lv_out  "积分的接口发放成功没有返回值
        ev_msg          = es_msg.

    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_json iv_responsebody = lv_out ev_msg = es_msg ).
    ENDIF.

  ENDMETHOD.


  METHOD send_register_coupon.


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
      WHERE service = 'COUPON'
      AND method = 'SEND_REGISTER_COUPON'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.
    REPLACE '{couponActivityId}' IN lv_uri WITH iv_couponactivityid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    lv_title = '发放注册优惠券(ZCL_ICEC_COUPON_API->SEND_REGISTER_COUPON)'.
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

    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out  ev_msg = ev_msg ).
   ENDIF.



  ENDMETHOD.


  METHOD send_special_coupon.

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
      WHERE service = 'COUPON'
      AND method = 'SEND_SPECIAL_COUPON'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    "lv_body = '{"userloginId":"ddxyq","productIds": ["Init31114005","15604834551287100000","Init31114006"]}'.
    lv_body = iv_data.
    DATA:lv_title TYPE string.
    lv_title = '发放特殊优惠券(ZCL_ICEC_COUPON_API->SEND_SPECIAL_COUPON)'.
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
                         data = ls_coupon  ).

          ev_id = ls_coupon-id.
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


  METHOD send_special_coupon_v2.

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
      WHERE service = 'COUPON'
      AND method = 'SEND_SPECIAL_COUPON_V2'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    "lv_body = '{"userloginId":"ddxyq","productIds": ["Init31114005","15604834551287100000","Init31114006"]}'.
    lv_body = iv_data.
    DATA:lv_title TYPE string.
    lv_title = '发放特殊优惠券(ZCL_ICEC_COUPON_API->SEND_SPECIAL_COUPON)'.
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
                         data = ls_coupon  ).

          ev_id = ls_coupon-id.
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
