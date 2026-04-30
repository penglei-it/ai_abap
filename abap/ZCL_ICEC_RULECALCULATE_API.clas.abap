CLASS zcl_icec_rulecalculate_api DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
      "优惠政策
      BEGIN OF ts_qualityfees,
        maxfee(10)               TYPE p DECIMALS 2,
        type                     TYPE string,
        qualityfeerate           TYPE string,
        vehiclegradename         TYPE string,
        tipdetail                TYPE string,
        qualityfeeratelowerlimit TYPE string,
        qualityfeerateupperlimit TYPE string,
        policydetail             TYPE string,
      END OF ts_qualityfees .
    TYPES:
      BEGIN OF ts_qualityfeecategorylist,
        priority             TYPE int4,
        qualityfees          TYPE STANDARD TABLE OF ts_qualityfees WITH DEFAULT KEY,
        qualityfeepolicylist TYPE STANDARD TABLE OF ts_qualityfees WITH DEFAULT KEY,
        tipdetail            TYPE string,
        tipshortdetail       TYPE string,
        policyshortdetail    TYPE string,
      END OF ts_qualityfeecategorylist .
    TYPES:
      BEGIN OF ts_data,
        categorytitle          TYPE string,
        qualityfeecategorylist TYPE STANDARD TABLE OF ts_qualityfeecategorylist WITH DEFAULT KEY,
      END OF ts_data .
    TYPES:
      BEGIN OF ts_policy,
        code         TYPE int4,
        data         TYPE ts_data,
        errormessage TYPE string,
      END OF ts_policy .
    TYPES:
      BEGIN OF ts_tempcredit,
        partyidfrom  TYPE string,                           ": "10424",
        partyidto    TYPE string, ": "l8k1ePc9TDDvCztMrgg",
        servicetype  TYPE string, ": "CASSLOAN",
        creditavai   TYPE string,                           ": 330000,
        creditlimit  TYPE string,                           ": 330000,
        startdate    TYPE string, ": 1583222389598,
        enddate      TYPE string, ": 1584547199000,
        status       TYPE string, ": 0,
        settlestatus TYPE string, ": 0
      END OF ts_tempcredit .
    TYPES:
      BEGIN OF ty_quality ,
        sequence TYPE string,
        code     TYPE string,
        name     TYPE string,
      END OF ty_quality .
    TYPES:
      tt_quality TYPE STANDARD TABLE OF ty_quality WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_technicalservice,
        ruletemplateid TYPE string,
        amount         TYPE string,
        chargeway      TYPE string,
      END OF ts_technicalservice .
    TYPES:
      tt_technicalservice TYPE STANDARD TABLE OF ts_technicalservice WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_margin,
        offerarea TYPE string,
        carlevel  TYPE string,
        amount    TYPE string,
      END OF ts_margin .
    TYPES:
      BEGIN OF ts_partsfeeconfig,
        quality                 TYPE string,
*        greaterthanskuprice     TYPE string,
        greaterthanskuprice     TYPE int4,
        lessthanorequalskuprice TYPE string,
        chargeratio(16)         TYPE p DECIMALS 2,
      END OF ts_partsfeeconfig .
    TYPES:
      tt_partsfeeconfig  TYPE STANDARD TABLE OF ts_partsfeeconfig .
    TYPES:
***废弃类型
      BEGIN OF ts_charge,
        companyid            TYPE string, "公司id
        createdtime          TYPE string, "创建时间
        endtime              TYPE string, "结束时间
        firstclasspartyrate  TYPE string, "一线品牌件费率
        id                   TYPE string, "自增主键
        lastupdatetime       TYPE string, "最后更新时间
        originalpartyrate    TYPE string, "原厂件费率
        otherclasspartyrate  TYPE string, "其他品牌件费率
        platformguaranteefee TYPE string, "保证金
        statusreason         TYPE string, "开始时间
        statusvalue          TYPE string, "状态变化原因
        technicalservicefee  TYPE string, "规则状态 状态  DRAFT：草稿   PRE_EFFECTIVE：预生效   EFFECTIVE：已生效  REFUSED：已拒绝  INVALID：已失效
        thirdclasspartyrate  TYPE string, "技术服务费
        use                  TYPE string, "第三类件费率
      END OF ts_charge .
    TYPES:
      tt_charge TYPE STANDARD TABLE OF ts_charge WITH DEFAULT KEY .
    TYPES:
***
      BEGIN OF ts_actiondtolist,
        actionid           TYPE string,
        ruleid             TYPE string,
        sequence           TYPE string,
        actiontype         TYPE string,
        actionoperatetype  TYPE string,
        actionoperatevalue TYPE string,
      END OF ts_actiondtolist .
    TYPES:
      tt_actiondtolist TYPE STANDARD TABLE OF ts_actiondtolist WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_ruledtolist,
        actiondtolist TYPE tt_actiondtolist,
      END OF ts_ruledtolist .
    TYPES:
      BEGIN OF ts_ruletemplatedto,
        templatename        TYPE string,
        templatedescription TYPE string,
        templatetype        TYPE string,
        ruledtolist         TYPE STANDARD TABLE OF ts_ruledtolist WITH DEFAULT KEY,
      END OF ts_ruletemplatedto .
    TYPES:
      BEGIN OF ts_signruleactiondtolist,
        actionid           TYPE string,
        ruleid             TYPE string,
        sequence           TYPE string,
        actiontype         TYPE string,
        actionoperatetype  TYPE string,
        actionoperatevalue TYPE string,
      END OF ts_signruleactiondtolist .
    TYPES:
      BEGIN OF ts_signruledtolist,
        signruleactiondtolist TYPE STANDARD TABLE OF ts_signruleactiondtolist WITH DEFAULT KEY,
      END OF ts_signruledtolist .
    TYPES:
      BEGIN OF ts_charge_new,
        financialcalculatetype TYPE string,
        ruletemplatedto        TYPE ts_ruletemplatedto,
        signruledtolist        TYPE STANDARD TABLE OF ts_signruledtolist WITH DEFAULT KEY,
      END OF ts_charge_new .
    TYPES:
      tt_charge_new TYPE STANDARD TABLE OF ts_charge_new WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_incentiveruleitems,
        sequence       TYPE string,
        origin         TYPE string,
        bound          TYPE string,
        incentiveratio TYPE string,
        operatevalue   TYPE string,
        firstcategory  TYPE string,
        secondcategory TYPE string,
      END OF ts_incentiveruleitems .
    TYPES:
      BEGIN OF ts_incentiverules,
        sequence           TYPE string,
        incentivetype      TYPE string,
        description        TYPE string,
        incentiveruleitems TYPE STANDARD TABLE OF ts_incentiveruleitems WITH DEFAULT KEY,
        enable             TYPE string,
        starttime          TYPE string,
        endtime            TYPE string,
      END OF ts_incentiverules .
    TYPES:
      BEGIN OF ts_incentive,
        companyid      TYPE string,
        status         TYPE string,
        incentiverules TYPE STANDARD TABLE OF ts_incentiverules WITH DEFAULT KEY,
      END OF ts_incentive .
    TYPES:
      tt_incentive TYPE STANDARD TABLE OF ts_incentive WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_conditiondto,
        conditionid           TYPE string,
        ruleid                TYPE string,
        sequence              TYPE string,
        conditiontype         TYPE string,
        conditionoperatetype  TYPE string,
        conditionoperatevalue TYPE string,
      END OF ts_conditiondto .
    TYPES:
      tt_conditiondto TYPE STANDARD TABLE OF ts_conditiondto WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_actiondto,
        actionid           TYPE string,
        ruleid             TYPE string,
        actionoperatetype  TYPE string,
        actionoperatevalue TYPE string,
      END OF ts_actiondto .
    TYPES:
      tt_actiondto TYPE STANDARD TABLE OF ts_actiondto WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_ruledto,
        ruleid           TYPE string,
        ruletemplateid   TYPE string,
        conditiondtolist TYPE STANDARD TABLE OF ts_conditiondto WITH DEFAULT KEY,
        actiondtolist    TYPE STANDARD TABLE OF ts_actiondto WITH DEFAULT KEY,
      END OF ts_ruledto .
    TYPES:
      tt_ruledto TYPE STANDARD TABLE OF ts_ruledto WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_ruletemplate,
        ruletemplateid      TYPE string,
        templatecode        TYPE string,
        templatedescription TYPE string,
        templatetype        TYPE string,
        ruledtolist         TYPE STANDARD TABLE OF ts_ruledto WITH DEFAULT KEY,
      END OF ts_ruletemplate .
    TYPES:
      tt_ruletemplate TYPE STANDARD TABLE OF ts_ruletemplate WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_partsfeeaction,
        actionid           TYPE string,                     ": 7770000,
        ruleid             TYPE string,                     ": "1100",
        sequence           TYPE string, ": 0,
        actiontype         TYPE string, ": "PLATFORM_FEE_NUM",
        actionoperatetype  TYPE string, ": "ADD",
        actionoperatevalue TYPE string, ": "8"
      END OF ts_partsfeeaction .
    TYPES:
      tt_partsfeeaction TYPE STANDARD TABLE OF ts_partsfeeaction WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_partsfeecondition,
        conditionid           TYPE string,                  ": 6660002,
        ruleid                TYPE string,                  ": "1100",
        sequence              TYPE string, ": 0,
        conditiontype         TYPE string, ": "STAND_NAME",
        conditionoperatetype  TYPE string, ": "EQUAL",
        conditionoperatevalue TYPE string, ": "启停电池
      END OF ts_partsfeecondition .
    TYPES:
      tt_partsfeecondition TYPE STANDARD TABLE OF ts_partsfeecondition WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ty_rule,
        actiondtolist    TYPE tt_partsfeeaction,
        conditiondtolist TYPE tt_partsfeecondition,
      END OF ty_rule .
    TYPES:
      BEGIN OF ts_partsfee,
        firstcategory         TYPE string, ": "电器系统",
        secondcategory        TYPE string, ": "蓄电池",
        thirdcategory         TYPE string, ": "蓄电池 ",
        forthcategory         TYPE string,
        id                    TYPE string, ": 3,
        ruleid                TYPE string,                  ": 1100,
        partstype             TYPE string, ": "OIL_WHEEL",
        standname             TYPE string, ": "蓄电池",
        quality               TYPE string, ": "原厂件",
        feeproportion         TYPE string, ": null,
        discountfeeproportion TYPE string, "优惠后
        rule                  TYPE ty_rule,
      END OF ts_partsfee .
    TYPES:
      tt_partsfee TYPE STANDARD TABLE OF ts_partsfee WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_flowdtoele,
        charge    TYPE string,  "等级对应的收费
        citygrade TYPE string,  "城市等级
        cityid    TYPE string,  "城市ID
        cityname  TYPE string,  "城市名称
        minflow   TYPE string, "保底流量
      END OF ts_flowdtoele .
    TYPES:
*  types:
*    BEGIN OF ts_flowdto,
*        cityandchargedtos TYPE ts_flowdtoele,
*      END OF ts_flowdto .
      BEGIN OF ts_flowfee,
        totalamount       TYPE string, "合计金额
        cityandchargedtos TYPE STANDARD TABLE OF ts_flowdtoele WITH DEFAULT KEY,
      END OF ts_flowfee .
    TYPES:
      BEGIN OF ts_brandgrade,
        brand_code        TYPE string,
        grade_flag        TYPE string,
        grade_code        TYPE string,
        grade_name        TYPE string,
        charge_grade_code TYPE string,
        charge_grade_name TYPE string,
      END OF ts_brandgrade .
    TYPES:
      BEGIN OF ts_gradebybrand,
        status TYPE string,
        msg    TYPE string,
        data   TYPE STANDARD TABLE OF ts_brandgrade WITH DEFAULT KEY,
      END OF ts_gradebybrand .

    METHODS get_chagre_bycompanyandstatus
      IMPORTING
        VALUE(iv_companyid) TYPE string
        !iv_status          TYPE string
      EXPORTING
        VALUE(ev_msg)       TYPE bapiret2
        VALUE(et_charge)    TYPE tt_charge .
    METHODS get_incentive_rule
      IMPORTING
        VALUE(iv_status)    TYPE string
        VALUE(iv_companyid) TYPE string
      EXPORTING
        VALUE(es_msg)       TYPE bapiret2
        VALUE(es_incentive) TYPE ts_incentive
        VALUE(ev_out)       TYPE string .
    METHODS get_incentive_templaterulelist
      IMPORTING
        VALUE(iv_tpnameorcode) TYPE string OPTIONAL
        VALUE(iv_templatetype) TYPE string
      EXPORTING
        VALUE(ev_msg)          TYPE bapiret2
        VALUE(et_template)     TYPE tt_ruletemplate .
    METHODS get_flowfee_config_post
      IMPORTING
        VALUE(iv_body)      TYPE string OPTIONAL
        VALUE(iv_localcity) TYPE string OPTIONAL
      EXPORTING
        VALUE(es_msg)       TYPE bapiret2
        VALUE(es_flowfee)   TYPE ts_flowfee .
    METHODS get_partsfee_configs
      IMPORTING
        VALUE(iv_body)     TYPE string OPTIONAL
      EXPORTING
        VALUE(es_msg)      TYPE bapiret2
        VALUE(et_partsfee) TYPE tt_partsfee .
    METHODS get_flowfee_config
      IMPORTING
        !iv_businessareacityids TYPE string
        !iv_localcityid         TYPE string
      EXPORTING
        !es_msg                 TYPE bapiret2
        !es_flowfee             TYPE ts_flowfee .
    METHODS get_technical_service
      EXPORTING
        !et_technicalservice TYPE tt_technicalservice
        !es_msg              TYPE bapiret2 .
    METHODS get_margin_amount
      IMPORTING
        VALUE(offerarea) TYPE string OPTIONAL
        VALUE(carlevel)  TYPE string OPTIONAL
      EXPORTING
        VALUE(es_margin) TYPE ts_margin
        VALUE(es_msg)    TYPE bapiret2 .
    METHODS get_cargradelist_bycarbrands
      IMPORTING
        VALUE(iv_carbrands) TYPE string OPTIONAL
      EXPORTING
        VALUE(es_msg)       TYPE bapiret2
        !es_cargrade        TYPE ts_gradebybrand .
    METHODS get_cargrade_bycarbrands
      IMPORTING
        VALUE(iv_carbrands) TYPE string OPTIONAL
      EXPORTING
        VALUE(es_msg)       TYPE bapiret2
        !ev_cargrade        TYPE string .
    METHODS get_partsfeeconfig
      IMPORTING
        VALUE(iv_body)           TYPE string OPTIONAL
        VALUE(iv_feequalitytype) TYPE string OPTIONAL
      EXPORTING
        !et_partsfeeconfig       TYPE tt_partsfeeconfig
        !es_msg                  TYPE bapiret2 .
    METHODS get_region_quotation
      IMPORTING
        VALUE(iv_body) TYPE string OPTIONAL
      EXPORTING
        VALUE(es_msg)  TYPE bapiret2
        !ev_region     TYPE string .
    METHODS get_parts_quality
      EXPORTING
        VALUE(es_msg) TYPE bapiret2
        !et_quality   TYPE tt_quality .
    METHODS get_chagre_bycompanyid
      IMPORTING
        VALUE(iv_companyid)        TYPE string
        !iv_financialcalculatetype TYPE string
      EXPORTING
        VALUE(ev_msg)              TYPE bapiret2
        VALUE(et_charge)           TYPE tt_charge_new .
    METHODS add_temp_credit
      IMPORTING
        VALUE(iv_body)       TYPE string OPTIONAL
      EXPORTING
        VALUE(es_msg)        TYPE bapiret2
        VALUE(es_tempcredit) TYPE ts_tempcredit .
    METHODS get_quality_policy
      IMPORTING
        VALUE(iv_body)   TYPE string
      EXPORTING
        VALUE(es_output) TYPE ts_data
        VALUE(es_msg)    TYPE bapiret2 .
    METHODS get_quality_policy_new
      EXPORTING
        VALUE(es_output) TYPE ts_data
        VALUE(es_msg)    TYPE bapiret2 .
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



CLASS ZCL_ICEC_RULECALCULATE_API IMPLEMENTATION.


  METHOD add_temp_credit.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RULECALCULATE'  AND method = 'ADD_TEMP_CREDIT'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title TYPE string.
    lv_title = '增加临时额度(ZCL_ICEC_RULECALCULATE_API->ADD_TEMP_CREDIT)'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        iv_body         = iv_body
        iv_title        = lv_title
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = es_msg ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_tempcredit  ).

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
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = es_msg iv_responsebody = lv_out iv_requestbody = lv_body ).
    ENDIF.

  ENDMETHOD.


  METHOD get_cargradelist_bycarbrands.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RULECALCULATE'  AND method = 'GET_CARGRADELIST_BYCARBRANDS'.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/x-www-form-urlencoded;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = iv_carbrands
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
                         data = es_cargrade ).

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


  METHOD get_cargrade_bycarbrands.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RULECALCULATE'  AND method = 'GET_CARGRADE_BYCARBRANDS'.

    lv_uri = ls_ztint_icec_api-url && '?' && iv_carbrands.


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
        ev_msg          = es_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = ev_cargrade ).

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


  METHOD get_chagre_bycompanyandstatus.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RULECALCULATE'  AND method = 'GET_CHAGRE_BYCOMPANYANDSTATUS'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.
    REPLACE '{valueStatus}' IN lv_uri WITH iv_status.

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
                         data = et_charge  ).

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


  METHOD GET_CHAGRE_BYCOMPANYID.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RULECALCULATE'  AND method = 'GET_CHAGRE_BYCOMPANYID'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.
    REPLACE '{financialCalculateType}' IN lv_uri WITH iv_financialCalculateType.

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
                         data = et_charge  ).

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


  METHOD get_flowfee_config.

    DATA:lv_uri          TYPE string,
         lv_out          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RULECALCULATE'  AND method = 'GET_FLOWFEE_CONFIG'.
    lv_uri = |{ ls_ztint_icec_api-url }?{ iv_businessareacityids }&{ iv_localcityid }|.
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
        ev_msg          = es_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_flowfee  ).

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = es_msg iv_responsebody = lv_out ).
   ENDIF.
  ENDMETHOD.


  METHOD get_flowfee_config_post.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RULECALCULATE'  AND method = 'GET_FLOWFEE_CONFIG_POST'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{localcity}' IN lv_uri  WITH iv_localcity.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA:lv_title TYPE string.
    lv_title = 'POST方法获取流量佣金(ZCL_ICEC_RULECALCULATE_API->GET_FLOWFEE_CONFIG_POST)'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        iv_body         = iv_body
        iv_title        = lv_title
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = es_msg ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_flowfee  ).

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = es_msg iv_responsebody = lv_out iv_requestbody = iv_body ).
   ENDIF.

  ENDMETHOD.


  METHOD get_incentive_rule.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RULECALCULATE'  AND method = 'GET_INCENTIVE_RULE'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.
    REPLACE '{status}' IN lv_uri WITH iv_status.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = ev_out
        ev_msg          = es_msg
                          ).
    IF ev_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = ev_out
                      CHANGING
                         data = es_incentive  ).

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = es_msg iv_responsebody = ev_out ).
   ENDIF.
  ENDMETHOD.


  METHOD get_incentive_templaterulelist.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RULECALCULATE'
      AND method = 'GET_INCENTIVE_TEMPLATERULELIST'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{TNcode}' IN lv_uri WITH iv_tpnameorcode.
    REPLACE '{templateType}' IN lv_uri WITH iv_templatetype.

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
                         data = eT_template ).


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


  METHOD get_margin_amount.
    DATA:lv_uri          TYPE string,
         lv_out          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RULECALCULATE'  AND method = 'GET_MARGIN_AMOUNT'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{offerArea}' IN lv_uri WITH offerarea.
    REPLACE '{carLevel}' IN lv_uri WITH carlevel.

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
        ev_msg          = es_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_margin ).

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = es_msg iv_responsebody = lv_out ).
   ENDIF.
  ENDMETHOD.


  METHOD get_partsfeeconfig.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RULECALCULATE'  AND method = 'GET_PARTSFEECONFIG'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{feeQualityType}' IN lv_uri WITH iv_feequalitytype.
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
        ev_msg          = es_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_partsfeeconfig ).
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


  METHOD get_partsfee_configs.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RULECALCULATE'  AND method = 'GET_PARTSFEE_CONFIGS'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title TYPE string.
    lv_title = '获取配件交易佣金(ZCL_ICEC_RULECALCULATE_API->GET_PARTSFEE_CONFIGS)'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        iv_body         = iv_body
        iv_title        = lv_title
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = es_msg ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_partsfee  ).

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = es_msg iv_responsebody = lv_out iv_requestbody = iv_body ).
   ENDIF.

  ENDMETHOD.


  METHOD get_parts_quality.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RULECALCULATE'  AND method = 'GET_PARTS_QUALITY'.

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
        ev_msg          = es_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_quality ).
          DATA:lt_quality TYPE STANDARD TABLE OF ztint_parts_qa.
          lt_quality = VALUE #( FOR wa IN et_quality ( quality = wa-code qualitydesc = wa-name ) ).
          DELETE FROM ztint_parts_qa.
          MODIFY ztint_parts_qa FROM TABLE lt_quality.
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = es_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_quality_policy.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.
    DATA:ls_data TYPE ts_policy.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RULECALCULATE'  AND method = 'GET_QUALITY_POLICY'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title TYPE string.
    lv_title = '获取交易佣金优惠政策(ZCL_ICEC_RULECALCULATE_API->GET_QUALITY_POLICY)'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        iv_body         = iv_body
        iv_title        = lv_title
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = es_msg ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = ls_data  ).
*          LOOP AT ls_data-data INTO DATA(ls_quality).
          es_output-categorytitle = ls_data-data-categorytitle.
          es_output-qualityfeecategorylist = CORRESPONDING #( ls_data-data-qualityfeecategorylist ).
*          ENDLOOP.

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = es_msg iv_responsebody = lv_out iv_requestbody = iv_body ).
   ENDIF.

  ENDMETHOD.


  METHOD get_quality_policy_new.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.
    DATA:ls_data TYPE ts_policy.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RULECALCULATE'  AND method = 'GET_QUALITY_POLICY_NEW'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title TYPE string.
    lv_title = '商务政策获取交易佣金优惠政策(ZCL_ICEC_RULECALCULATE_API->GET_QUALITY_POLICY)'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    ""调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = es_msg ).

    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = ls_data  ).
*          LOOP AT ls_data-data INTO DATA(ls_quality).
          es_output-categorytitle = ls_data-data-categorytitle.
          es_output-qualityfeecategorylist = CORRESPONDING #( ls_data-data-qualityfeecategorylist ).
*          ENDLOOP.

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = es_msg iv_responsebody = lv_out iv_requestbody = lv_body ).
   ENDIF.

  ENDMETHOD.


  METHOD get_region_quotation.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RULECALCULATE'  AND method = 'GET_REGION_QUOTATION'.

    lv_uri = ls_ztint_icec_api-url.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title TYPE string.
    lv_title = '获取报价范围(ZCL_ICEC_RULECALCULATE_API->GET_REGION_QUOTATION)'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        iv_body         = iv_body
        iv_title        = lv_title
        is_content_type = ls_content_type
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
                         data = ev_region ).

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = es_msg iv_requestbody = iv_body ).
   ENDIF.
  ENDMETHOD.


  METHOD get_technical_service.
    DATA:lv_uri          TYPE string,
         lv_out          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'RULECALCULATE'  AND method = 'GET_TECHNICAL_SERVICE'.

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
        ev_msg          = es_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_technicalservice  ).

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = es_msg iv_responsebody = lv_out ).
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
