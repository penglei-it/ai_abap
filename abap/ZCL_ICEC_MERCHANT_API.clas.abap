class ZCL_ICEC_MERCHANT_API definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF ts_promoteproposal,
        proposalexplainjumptext TYPE string, "提升建议跳转文案
        proposalexplainjumpurl  TYPE string, "提升建议跳转文案链接
        proposalexplainlist     TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "提升建议说明
      END OF ts_promoteproposal .
  types:
    BEGIN OF ts_bsrtag_initial,
*    childScoreRankList TYPE STANDARD TABLE OF TS_childScoreRankList WITH DEFAULT KEY,"二级指标得分排名信息
        code              TYPE string, "指标Code
        codename          TYPE string, "指标名称
        rankrating        TYPE string, "得分排名
        score             TYPE string, "得分
        weight            TYPE string, "权重:也是得分总分
        promoteproposal   TYPE ts_promoteproposal, "bsr-指标提升建议
        ratingexplainlist TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "提升建议说明
      END OF ts_bsrtag_initial .
  types:
    tt_bsrtag_initial TYPE STANDARD TABLE OF ts_bsrtag_initial WITH DEFAULT KEY .
  types:
    BEGIN OF ts_bartag_v2,
        childscoreranklist TYPE STANDARD TABLE OF ts_bsrtag_initial WITH DEFAULT KEY,
        code               TYPE string, "指标Code
        codename           TYPE string, "指标名称
        rankrating         TYPE string, "得分排名
        score              TYPE string, "得分
        weight             TYPE string, "权重:也是得分总分
        promoteproposal    TYPE ts_promoteproposal, "bsr-指标提升建议
        ratingexplainlist  TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "提升建议说明
      END OF ts_bartag_v2 .
  types:
*---add by penglei 2023.10.13
    BEGIN OF ts_backlogs_return_data,
        eventkey         TYPE string,
        eventname        TYPE string,
        eventdesc        TYPE string,
        operationtext    TYPE string,
        operationtexturl TYPE string,
        happenedtime     TYPE string,
      END OF ts_backlogs_return_data .
  types:
    ts_backlogs_return TYPE STANDARD TABLE OF ts_backlogs_return_data WITH DEFAULT KEY .
  types:
    BEGIN OF ts_quoteexceptiondtolist,
        id             TYPE string,
        storeid        TYPE string,
        eventkey       TYPE string,
        eventdate      TYPE string,
        partsnum       TYPE string,
        standardname   TYPE string,
        inquiryid      TYPE string,
        carbrand       TYPE string,
        partsbrand     TYPE string,
        partsquality   TYPE string,
        quoteprice     TYPE string,
        quoteby        TYPE string,
        quotedate      TYPE string,
        feedbackstatus TYPE string,
      END OF ts_quoteexceptiondtolist .
  types:
    BEGIN OF ts_content,
        oecode                TYPE string,
        count                 TYPE string,
        unit                  TYPE string,
        quoteexceptiondtolist TYPE STANDARD TABLE OF ts_quoteexceptiondtolist WITH DEFAULT KEY,
      END OF ts_content .
  types:
    BEGIN OF ts_quoteprice_return,
*    class TYPE string,
        content          TYPE STANDARD TABLE OF ts_content WITH DEFAULT KEY,
        number           TYPE string,
        size             TYPE string,
        totalelements    TYPE string,
        totalpages       TYPE string,
        sort             TYPE string,
        first            TYPE string,
        numberofelements TYPE string,
        last             TYPE string,
      END OF ts_quoteprice_return .
  types:
    BEGIN OF ts_statisticsperioddtolist,
        startday TYPE string,
        endday   TYPE string,
      END OF ts_statisticsperioddtolist .
  types:
    BEGIN OF ts_indicatorstatisticsdtolist,
        indicatorkey        TYPE string,
        indicatorname       TYPE string,
        statisticsunit      TYPE string,
        statisticsvaluelist TYPE STANDARD TABLE OF string WITH DEFAULT KEY,
      END OF ts_indicatorstatisticsdtolist .
  types:
    BEGIN OF ts_hisstatistics_return,
        periodtype                 TYPE string,
        statisticsperioddtolist    TYPE STANDARD TABLE OF ts_statisticsperioddtolist WITH DEFAULT KEY,
        indicatorstatisticsdtolist TYPE STANDARD TABLE OF ts_indicatorstatisticsdtolist WITH DEFAULT KEY,
      END OF ts_hisstatistics_return .
  types:
    BEGIN OF ts_event,
        eventtypekey   TYPE string,
        eventtypename  TYPE string,
        eventcount     TYPE string,
        statisticsunit TYPE string,
        eventdate      TYPE string,
        eventinfluence TYPE string,
        eventsuggest   TYPE string,
      END OF ts_event .
  types:
    ts_statisticsevent_return TYPE STANDARD TABLE OF ts_event WITH DEFAULT KEY .
  types:
    BEGIN OF ts_all,
        eventcount TYPE string,
        eventdate  TYPE string,
      END OF ts_all .
  types:
    ts_allstatistics_return TYPE STANDARD TABLE OF ts_all WITH DEFAULT KEY .
  types:
    BEGIN OF ts_averagetip,
        averagevalue TYPE string,
        averagetext  TYPE string,
      END OF ts_averagetip .
  types:
    BEGIN OF ts_attentiontip,
        attentiontips    TYPE string,
        attentiontipicon TYPE string,
      END OF ts_attentiontip .
  types:
    BEGIN OF ts_indicatorvaluelist,
        indicatordate  TYPE string,
        indicatorvalue TYPE string,
        exceptional    TYPE string,
      END OF ts_indicatorvaluelist .
  types:
    BEGIN OF ts_improvetipvolist,
        improvetips TYPE string,
        linktext    TYPE string,
        linkurl     TYPE string,
      END OF ts_improvetipvolist .
  types:
    BEGIN OF ts_lineindicatoreventvo,
        indicatorkey       TYPE string,
        indicatorname      TYPE string,
        indicatorreasonkey TYPE string,
        averagetip         TYPE ts_averagetip,
        attentiontip       TYPE ts_attentiontip,
        indicatorvaluelist TYPE STANDARD TABLE OF ts_indicatorvaluelist WITH DEFAULT KEY,
        improvetipvolist   TYPE STANDARD TABLE OF ts_improvetipvolist WITH DEFAULT KEY,
      END OF ts_lineindicatoreventvo .
  types:
    BEGIN OF ts_indicators,
        indicatoreventtype   TYPE string,
        lineindicatoreventvo TYPE ts_lineindicatoreventvo,
      END OF ts_indicators .
  types:
    ts_indicators_return TYPE STANDARD TABLE OF ts_indicators WITH DEFAULT KEY .
  types:
    BEGIN OF ts_feature ,
        companyid   TYPE string, "10424",
        featureid   TYPE string, "OPR_ANALYSIS_CAT4",
        featurename TYPE string, "经营分析支持到4级品类开关",
        enabled     TYPE string, "false,
      END OF ts_feature .
  types:
    BEGIN OF ts_online_info,
        businesstype        TYPE string, "开通业务
        cityname            TYPE string, "城市名称
        customermanagername TYPE string, "拓展经理名称
        merchanttype        TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "供应商类型
        merchanttypestr     TYPE string, "供应商类型拼接
        onlinemonth         TYPE string, "上线时长(月)
        onlinestatus        TYPE string, "在线状态
        onlinetime          TYPE string, "上线时间
        pieceid             TYPE string, "片联ID
        piecename           TYPE string, "片联名称
        provincename        TYPE string, "省份名称
        rectificationflag   TYPE string, "整改中标志
        salebrandstr        TYPE string, "品牌拼接
        salebrands          TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "经营品牌
        signingnumber       TYPE string, "签约次数
        storeid             TYPE string, "店铺id
        storename           TYPE string, "店铺名称
      END OF ts_online_info .
  types:
    tt_online_info TYPE STANDARD TABLE OF ts_online_info WITH DEFAULT KEY .
  types:
    BEGIN OF ts_asalysis_brand,
        brandid   TYPE string,
        brandname TYPE string,
      END OF ts_asalysis_brand .
  types:
    tt_asalysis_brand TYPE STANDARD TABLE OF ts_asalysis_brand WITH DEFAULT KEY .
  types:
    BEGIN OF ts_analysis_head,
        displaystoreinfo    TYPE string, "展示店铺信息
        displayupdateinfo   TYPE string, "展示更新信息
        levelurl            TYPE string, "等级图标url
        salesamount         TYPE string, "本月销售额
        targetachievingrate TYPE string, "目标达成率
        targetsalesamount   TYPE string, "目标销售额
      END OF ts_analysis_head .
  types:
    BEGIN OF ts_analysis_col,
        key   TYPE string,
        names TYPE STANDARD TABLE OF string WITH DEFAULT KEY,
        type  TYPE string,
      END OF ts_analysis_col .
  types:
    BEGIN OF ts_analysis_viewhead.
            INCLUDE TYPE ts_analysis_col.
    TYPES:children TYPE STANDARD TABLE OF ts_analysis_col WITH DEFAULT KEY,
          END OF ts_analysis_viewhead .
  types:
    BEGIN OF ts_analysis_viewdata,
        af TYPE string,
      END OF ts_analysis_viewdata .
  types:
    BEGIN OF ts_analysis_viewrow,
        content TYPE STANDARD TABLE OF ts_analysis_viewdata WITH DEFAULT KEY,
      END OF ts_analysis_viewrow .
  types:
    BEGIN OF ts_analysis_view,
        heads                TYPE STANDARD TABLE OF ts_analysis_viewhead WITH DEFAULT KEY,
        rows                 TYPE string,
*            pagedrows            TYPE ts_analysis_viewrow,
        statisticsperiodinfo TYPE string,
        totalelements        TYPE string,
        totalpages           TYPE string,
        number               TYPE string,
        size                 TYPE string,
      END OF ts_analysis_view .
  types:
    BEGIN OF ts_prodcheck_uncheck,
        inventory_check TYPE string,
        shelf_check     TYPE string,
        un_quote_check  TYPE string,
        replace_check   TYPE string,
        brand_check     TYPE string,
      END OF ts_prodcheck_uncheck .
  types:
    BEGIN OF ts_checkitem,
        diagnosisitem   TYPE string, "检测项
        processedratio  TYPE string, "进度
        producttotal    TYPE string, "商品总数
        status          TYPE string, "状态
        uncheckednumber TYPE ts_prodcheck_uncheck, "
      END OF ts_checkitem .
  types:
    BEGIN OF ts_prodcheck_confitem,
        exclude_category TYPE string,
        check_item_name  TYPE string,
      END OF ts_prodcheck_confitem .
  types:
    BEGIN OF ts_productcheck,
        operatingtime   TYPE string, "操作时间
        operator        TYPE string, "操作人
        processedperiod TYPE string, "预计进度
        producttotal    TYPE string, "商品总数
        status          TYPE string, "全量诊断状态:CHECKING(诊断中);CHECKED(诊断完成);FAIL(失败);UNCHECK(首检);OVER_CHECK(过期)
        uncheckednumber TYPE string, "可优化商品数
        configitems     TYPE ts_prodcheck_confitem,
        checkitems      TYPE STANDARD TABLE OF ts_checkitem WITH DEFAULT KEY,
      END OF ts_productcheck .
  types:
    BEGIN OF ts_feeinfo,
        storeid         TYPE string,                        "JNDA0001",
        contractid      TYPE string, "634cedbd74af350001010a7d",
        guaranteefee    TYPE string, "2500.00,
        techmaintainfee TYPE string, "60000.00,
        incentiveratio  TYPE string,
        feeunit         TYPE string, "Y"
      END OF ts_feeinfo .
  types:
    BEGIN OF ts_fee_incentive,
        actualfee  TYPE string, "默认比例
        currentfee TYPE string, "当前比例
        fixedfee   TYPE string, "固定比例
        type       TYPE string, "类型：实时费用/固定费用
      END OF ts_fee_incentive .
  types:
    BEGIN OF ts_fee_platformfee,
        actualfee  TYPE string, "实时费用
        currentfee TYPE string, "当前金额
        fixedfee   TYPE string, "固定费用
        type       TYPE string, "类型：实时费用/固定费用
      END OF ts_fee_platformfee .
  types:
    BEGIN OF ts_fee_techserv,
        actualfeeformonth TYPE string, "实时费用/月
        actualfeeforyear  TYPE string, "实时费用/年
        currentfee        TYPE string, "当前金额
        currentfeeunit    TYPE string, "当前金额的单位：月-MONTH/年-YEAR
        feeunit           TYPE string, "按月支付-MONTH/按年支付-YEAR
        fixedfee          TYPE string, "固定费用
        type              TYPE string, "类型：实时费用/固定费用
      END OF ts_fee_techserv .
  types:
    BEGIN OF ts_contract_feeinfo,
        companyid           TYPE string, "店铺内部ID
        incentiverules      TYPE ts_fee_incentive, "激励规则对象
        platformfee         TYPE ts_fee_platformfee, "平台费用对象
        technicalservicefee TYPE ts_fee_techserv, "技术服务缴费方式对象
      END OF  ts_contract_feeinfo .
  types:
    BEGIN OF ts_contract_detail,
        id                 TYPE string, "合同id
        templateid         TYPE string, "协议模板id
        companyagreementid TYPE string, "公司id
        contractnumber     TYPE string, "合同编号
        agreementtype      TYPE string, "协议类型SUPPLIER_FEE",
        type               TYPE string, "协议类型SUPPLIER_FEE",
        signdate           TYPE string, "合同签署日期，1665735933000,
        validitybegindate  TYPE string, "有效期开始1665676800000,
        validityenddate    TYPE string, "有效期截止1672502399000,
        status             TYPE string, "合同状态SIGNED",
        createdstamp       TYPE string, "创建日期1665730524000,
        lastupdatedstamp   TYPE string, "1665735936000,
      END OF ts_contract_detail .
  types:
    BEGIN OF ts_store_contract,
        id                  TYPE string, "958557861847433216",
        storeid             TYPE string, "4400017310",
        agreementid         TYPE string, "634e4328d6449300016c8c42",
        agreementnumber     TYPE string, "1958557861251842048",
        agreementtype       TYPE string, "ENTERING",
        agreementtypename   TYPE string, "入驻协议",
        agreementstatus     TYPE string, "IGNED",
        agreementstatusname TYPE string, "已签约",
        signingdate         TYPE string, "022-10-18 14:10:24",
        signtype            TYPE string, "FIRST_SIGN",
        signtypename        TYPE string, "首签",
        templatename        TYPE string, "供应商入驻协议",
        templateid          TYPE string, "5e6ed85804729100017b9f09",
        effectivestarttime  TYPE string, "2021.10.18",
        effectiveendtime    TYPE string, "2021.12.31",
        createdby           TYPE string, "mandy",
        lastupdatedby       TYPE string, "mandy",
        createdtime         TYPE string, "2022-10-18 14:09:42",
        lastupdatedtime     TYPE string, "2022-10-18 15:41:44"
      END OF ts_store_contract .
  types:
    tt_sotre_contract TYPE STANDARD TABLE OF ts_store_contract .
  types:
    BEGIN OF ts_storeinf,
        id                TYPE ztint_ven_inf-productstoreid,
        name              TYPE string,
        storeinternalid	  TYPE string,
        storetype	        TYPE string,
        fulfillparty      TYPE string,
        grouponly	        TYPE string,
        enabled	          TYPE string,
        customermanager	  TYPE string,
        customermanagerid	TYPE string,
        contactperson	    TYPE string,
        contactnumber	    TYPE string,
        storeflag	        TYPE string,
        email	            TYPE string,
        remark            TYPE string,
        createdby	        TYPE string,
        createdstamp      TYPE string,
        lastupdatedby	    TYPE string,
        lastupdatedstamp  TYPE string,
      END OF ts_storeinf .
  types:
    tt_storeinf TYPE STANDARD TABLE OF ts_storeinf .
  types:
*  types TY_DEADLINE .
    BEGIN OF ty_deadline,
        id             TYPE string,
        storeid        TYPE string,
        storename      TYPE string,
        storetype      TYPE string,
        storestatus    TYPE string,
        configinfolist TYPE STANDARD TABLE OF zmer_s_configinfolist WITH DEFAULT KEY,
      END OF ty_deadline .
  types:
    BEGIN OF ty_forecequit,
        code TYPE string,
      END OF ty_forecequit .
  types:
    BEGIN OF ty_offlineaudit,
        applyreason   TYPE  string, "退店理由
        auditreason   TYPE  string, "审核不通过原因
        auditstatus   TYPE  string, "审核状态
        audittime     TYPE  string, "审核时间
        companyid     TYPE  string, "公司id
        companyname   TYPE  string, "店铺全称
        displayname   TYPE  string, "店铺简称
        promoterid    TYPE  string, "发起人id
        promotername  TYPE  string, "发起人name
        promoterphone TYPE  string, "发起人联系电话
        storeid       TYPE  string, "店铺id
      END OF ty_offlineaudit .
  types:
    BEGIN OF ts_approvecon,
        id               TYPE string,
        storeid          TYPE string,
        signingstatus    TYPE string,
        agreementtype    TYPE string,
        agreementname    TYPE string,
        templateversion  TYPE string,
        templatetype     TYPE string,
        reviewdate       TYPE string,
        approveddate     TYPE string,
        signingnumber    TYPE string,
        signingusername  TYPE string,
        signinguserphone TYPE string,
        signinguserid    TYPE string,
        companyid        TYPE string,
        createdby        TYPE string,
        createdtime      TYPE string,
        lastupdateby     TYPE string,
        lastupdatetime   TYPE string,
      END OF ts_approvecon .
  types:
    BEGIN OF ts_confstatus,
        storeid      TYPE string,
        storename    TYPE string,
        configtype   TYPE string,
        configname   TYPE string,
        configstatus TYPE string,
      END OF ts_confstatus .
  types:
    tt_confstatus TYPE STANDARD TABLE OF ts_confstatus .
  types:
    BEGIN OF ts_veninfo,
        address         TYPE string, "add
        citygeoid       TYPE string, "add
        citygeoname     TYPE string,  "add
        companyid       TYPE string,
        companyname     TYPE string, "add
        companytype     TYPE string, "add
        contactnumber   TYPE string,
        countygeoid     TYPE string, "add
        countygeoname   TYPE string, "add
        displayname     TYPE string,
        venid           TYPE string,
        email           TYPE string,
        provincegeoid   TYPE string, "add
        provincegeoname TYPE string, "add
        villagegeoid    TYPE string, "add
        villagegeoname  TYPE string, "add
      END OF ts_veninfo .
  types:
    BEGIN OF ts_stock,
        endrow          TYPE string, ": "", // null
        firstpage       TYPE string, ": "", // null
        hasnextpage     TYPE string, ": null, // null
        haspreviouspage TYPE string, ": null, // null
        isfirstpage     TYPE string, ": null, // null
        islastpage      TYPE string, ": null, // null
        lastpage        TYPE string, ": "", // null
        nextpage        TYPE string, ": "", // null
        orderby         TYPE string, ": "", // null
        pagenum         TYPE string, ": "", // null
        pagesize        TYPE string, ": "", // null
        pages           TYPE string, ": "", // null
        prepage         TYPE string, ": "", // null
        size            TYPE string, ": "", // null
        startrow        TYPE string, ": "", // null
        total           TYPE string, ": "" // null
      END OF ts_stock .
  types:
    BEGIN OF ts_stocklist,
        erpname     TYPE string,
        dockingtime TYPE string, ": "", // 对接时间
        failnumber  TYPE string, ": "", // 对接失败的数据量
        subjectid   TYPE string, ": "", // 店铺ID
        totalnumber TYPE string, ": "" // 对接的总数据量
      END OF ts_stocklist .
  types:
    tt_stocklist TYPE STANDARD TABLE OF ts_stocklist WITH DEFAULT KEY .
  types:
    BEGIN OF ts_stockovelist.
            INCLUDE TYPE ts_stock.
    TYPES: list TYPE tt_stocklist,
           END OF ts_stockovelist .
  types:
    tt_stockovelist TYPE STANDARD TABLE OF ts_stockovelist .
  types:
    BEGIN OF ts_stockresult,
        code       TYPE string, ": "", // 不符合自动报价原因code
        message    TYPE string, ": "", // 不符合自动报价原因
        quantity   TYPE string, ": "", // 数量
        suggestion TYPE string, ": "" // 处理建议
      END OF ts_stockresult .
  types:
    tt_stockresult TYPE STANDARD TABLE OF ts_stockresult .
  types:
    BEGIN OF ts_stockbrandlist,
        brandname          TYPE string, ": "", // 品牌名称
        brandqualityname   TYPE string, ": "", // 品质名称
        dockingtime        TYPE string, ": "", // 对接时间
        quotabledatanumber TYPE string, ": "", // 可自动报价数量
        remark             TYPE string, ": "" // 备注
      END OF ts_stockbrandlist .
  types:
    tt_stockbrandlist TYPE STANDARD TABLE OF ts_stockbrandlist WITH DEFAULT KEY .
  types:
    BEGIN OF ts_stockbrand.
            INCLUDE TYPE ts_stock.
    TYPES:list TYPE tt_stockbrandlist,
          END OF ts_stockbrand .
  types:
    tt_stockbrand TYPE STANDARD TABLE OF ts_stockbrand WITH DEFAULT KEY .
  types:
    BEGIN OF ty_cost_data,
        id                 TYPE string,
        agreetime          TYPE string,
        approvaltype       TYPE string,
        orderid            TYPE string,
        amount(8)          TYPE p DECIMALS 2, "             TYPE int4,
        partsname          TYPE string,
        partsprice         TYPE string,
        compensationreason TYPE string,
      END OF ty_cost_data .
  types:
    BEGIN OF ty_return,
        code         TYPE string,
        data         TYPE string,
        errormessage TYPE string,
      END OF ty_return .
  types TS_RETURN type TY_RETURN .
  types:
    BEGIN OF ts_chartitem,
        name  TYPE string, "指标名称
        total TYPE string, "指标满分值
        value TYPE string, "指标值
      END OF ts_chartitem .
  types:
    BEGIN OF ts_risingchartitem,
        name     TYPE string, "指标名称
        total    TYPE string, "指标满分值
        value    TYPE string, "指标值
        children TYPE STANDARD TABLE OF ts_chartitem WITH DEFAULT KEY,
      END OF ts_risingchartitem .
  types:
    BEGIN OF ts_childtag,
        code            TYPE string, "指标编码
        codename        TYPE string, "指标名称
        rankrating      TYPE string, "当前排名
        score           TYPE string, "得分
        unit            TYPE string, "
        indicatorstatus TYPE string, "指标状态，0-正常，1-异常
        exceptiondesc   TYPE string, "指标展示描述
      END OF ts_childtag .
  types:
    BEGIN OF ts_subratinginfo,
        rankrating         TYPE string, ": 100,
        comparedrankrating TYPE string, ": null,
        score              TYPE string, ": 0,
        comparedscore      TYPE string, ": null,
        indicatorstatus    TYPE string, ": 1,
        exceptiondesc      TYPE string, ": "店铺无订单",
        code               TYPE string,                     ": "S2201",
        codename           TYPE string, ": "服务异常率",
        fullscore          TYPE string, ": 15,
      END OF ts_subratinginfo .
  types:
    BEGIN OF ts_exception,
        code            TYPE string, "指标编码
        codename        TYPE string, "指标名称
        indicatorstatus TYPE string, "指标状态，0-正常，1-异常
        rankrating      TYPE string, "当前排名
        score           TYPE string, "得分
        unit            TYPE string, "
        subratinginfos  TYPE STANDARD TABLE OF ts_subratinginfo WITH DEFAULT KEY,
        childtags       TYPE STANDARD TABLE OF ts_childtag WITH DEFAULT KEY,
      END OF ts_exception .
  types:
    BEGIN OF ts_sunburst,
        risingchartitems TYPE STANDARD TABLE OF ts_risingchartitem WITH DEFAULT KEY,
        exceptions       TYPE STANDARD TABLE OF ts_exception WITH DEFAULT KEY,
      END OF ts_sunburst .
  types:
    BEGIN OF ts_excep_content,
        scorecode        TYPE string, "S2201",
        exceptiontype    TYPE string, "开思质保",
        orderid          TYPE string, "S2210270015311",
        partsname        TYPE string, "减震气泵",
        price            TYPE string, "2182.5,
        customername     TYPE string, "深圳市德诚名车快修服务有限公司",
        handlefinishtime TYPE string, "2023-06-29"
      END OF ts_excep_content .
  types:
    BEGIN OF ts_exception_info,
        number           TYPE string,
        size             TYPE string,
        totalelements    TYPE string,
        totalpages       TYPE string,
        sort             TYPE string,
        first            TYPE string,
        last             TYPE string,
        numberofelements TYPE string,
        content          TYPE STANDARD TABLE OF ts_excep_content WITH DEFAULT KEY,
      END OF ts_exception_info .
  types:
    BEGIN OF ts_facilityaddresscontactdto,
        address       TYPE string, ": "", // 详细地址
        cityid        TYPE string, ": "", // 城市id
        cityname      TYPE string, ": "", // 城市name
        contactnumber TYPE string, ": "", // 联系电话
        countyid      TYPE string, ": "", // 区域id
        countyname    TYPE string, ": "", // 区域name
        housenumber   TYPE string, ": "", // 门牌号
        latitude      TYPE string, ": null, // 纬度
        longitude     TYPE string, ": null, // 经度
        provinceid    TYPE string, ": "", // 省份ID
        provincename  TYPE string, ": "", // 省份name
        receivername  TYPE string, ": "", // 联系人
        roadinfo      TYPE string, ": "", // 马路信息
        streetid      TYPE string, ": "", // 街道id
        streetname    TYPE string, ": "" // 街道name
      END OF ts_facilityaddresscontactdto .
  types:
*TYPES:
*BEGIN OF ts_facilityContactInfo,
*  address TYPE string,": "", // 地址
*  contactPerson TYPE string,": "", // 联系人
*  contactPhone TYPE string,": "" // 联系电话
*END OF ts_facilityContactInfo.
    BEGIN OF ts_facilitie_cont,
        facilityid                TYPE string, ": "123123",
        facilityname              TYPE string, ": "123123ddd",
        warehousetype             TYPE string, ": "YUN",
        description               TYPE string, ": "dddd",
        createdate                TYPE string, ": 1595841712000,087000,
*  facilitySalesAreaList TYPE STANDARD TABLE OF string WITH DEFAULT KEY,
        facilityaddresscontactdto TYPE  ts_facilityaddresscontactdto,
*  facilityContactInfo  TYPE STANDARD TABLE OF TS_facilityContactInfo WITH DEFAULT KEY,
      END OF ts_facilitie_cont .
  types:
    BEGIN OF ts_facilities,
        content          TYPE STANDARD TABLE OF ts_facilitie_cont WITH DEFAULT KEY,
        number           TYPE string, ": 0,
        size             TYPE string, ": 20,
        totalelements    TYPE string, ": 20,
        totalpages       TYPE string, ": 1,
        first            TYPE string, ": true,
        numberofelements TYPE string, ": 20,
        last             TYPE string, ": true
      END OF ts_facilities .
  types:
    BEGIN OF ts_cellphone_user,"平台手机号对应用户信息
        appuser                  TYPE string, ": false, // 已废弃--（是否是app用户，为之前的app临时用户）
        applicationstamp         TYPE string, ": "", // 申请、离职时间
        authenticated            TYPE string, ": "", // 认证 Y/N
        bindphone                TYPE string, ": false, // 是否绑定 cellphone
        cellphone                TYPE string, ": "", // 电话号码
        contactnumber            TYPE string, ": "", // 联系电话
        createdstamp             TYPE string, ": "", // 创建时间
        currentpassword          TYPE string, ": "", // 当前密码, 此接口不再返回密码
        customerhotline          TYPE string, ": "", // 客服热线
        customermanager          TYPE string, ": "", // 客户经理
        customermanagervalidated TYPE string, ": false, // 客户经理已验证
        defaultcompanyid         TYPE string, ": "", // 集团用户默认登录公司ID
        email                    TYPE string, ": "", // email
        enabled                  TYPE string, ": false, // 是否可用
        entryapplied             TYPE string, ": false, // 是否处于待入职申请中
        entrycompanyid           TYPE string, ": "", // 待入职的公司ID
        fullname                 TYPE string, ": "", // 全名
        functiontype             TYPE string, ": "", // 类型      COMMON(普通用户)/TEST(测试用户)
        garagebranchcompanyid    TYPE string, ": "", // 此分公司维修厂公司DI废弃
        garagecompanyid          TYPE string, ": "", // 此维修厂公司ID废弃, 获取公司信息请调用另外的接口Companyv2Service.listGaragesByUserLoginId
        gender                   TYPE string, ": "", // 性别, 0:男,1:女
        haspassword              TYPE string, ": false, // 用户是否含有密码
        id                       TYPE string, ": "", // id
        inviteuserloginid        TYPE string, ": "", // 使用邀请码注册   所来自的用户  的UserLoginId
        inviteusername           TYPE string, ": "", // 使用邀请码注册   所来自的用户  的UserName
        joinparty                TYPE string, ": false, // 是否加入公司
        joinstamp                TYPE string, ": "", // 入司时间
        loginfailedtimes         TYPE string, ": "", // 登录失败次数
        needchangepassword       TYPE string, ": false, // 是否需要修改密码
        nickname                 TYPE string, ": "", // 昵称
        orgtype                  TYPE string, ": "", // 用户组织类型--请注意，因现在的集团用户和之前的集团用户定义发生变化,返回用户集合的接口都不返回此字段值,特标注。获取集团，可以用CompanyGroupService.getByUserLoginId
        portraiturl              TYPE string, ": "", // 用户图像Url
        position                 TYPE string, ": "", // 岗位
        productstoreid           TYPE string, ": "", // 此供应商店铺废弃, 获取公司信息请调用另外的接口Companyv2Service.listSuppliersByUserLoginId
        qq                       TYPE string, ": "", // qq
        registercompleted        TYPE string, ": false, // 注册流程是否完整    移动端需补全信息后转为true
        registersource           TYPE string, ": "", // 注册来源
        remark                   TYPE string, ": "", // 备注
        status                   TYPE string, ": "", // 员工状态
        supplierbranchcompanyid  TYPE string, ": "", // 此供应商公司ID废弃
        suppliercompanyid        TYPE string, ": "", // 此供应商公司ID废弃, 获取公司信息请调用另外的接口Companyv2Service.listSuppliersByUserLoginId
        updatetimes              TYPE string, ": "", // userLoginName修改次数
        userloginid              TYPE string, ": "", // userLoginId,只做关联
        userloginname            TYPE string, ": "", // 用户登录账号名
        username                 TYPE string, ": "", // 用户名/userName
        userparentid             TYPE string, ": "", // 主账号ID
        userparentname           TYPE string, ": "", // 主账号name
        usertypeid               TYPE string, ": "", // 用户类型: PERSON/PARTY_GROUP,兼容之前的主账号查询逻辑
        virtual                  TYPE string, ": false // 是否 虚拟
      END OF ts_cellphone_user .
  types:
    BEGIN OF ts_userloginid_vendorcode,"平台用户账号对应的供应商代码
        authenticated           TYPE string, ": false, // 是否认证
        code                    TYPE string, ": "", // 供应商code
        contactnumber           TYPE string, ": "", // 联系电话
        contactperson           TYPE string, ": "", // 联系人
        createdby               TYPE string, ": "", // null
        createdstamp            TYPE string, ": "", // null
        customermanager         TYPE string, ": "", // 供应商拓展（客户经理）
        customermanagerid       TYPE string, ": "", // 客户经理id
        email                   TYPE string, ": "", // 邮箱
        enabled                 TYPE string, ": false, // 是否有效
        enterprisecode          TYPE string, ": "", // 企业代码
        id                      TYPE string, ": "", // 供应商id
        integration             TYPE string, ": false, // 是否三证合一
        lastupdatedby           TYPE string, ": "", // null
        lastupdatedstamp        TYPE string, ": "", // null
        name                    TYPE string, ": "", // 供应商名称
        orgcode                 TYPE string, ": "", // 组织机构代码
        regcode                 TYPE string, ": "", // 营业执照号
        registerchannel         TYPE string, ": "", // 注册渠道：OFFICIAL_WEBSITE：官网，OFFICIAL_WECHAT_ACCOUNT：公众号，BACKGROUND：后台入驻
        remark                  TYPE string, ": "", // 备注
        source                  TYPE string, ": "", // 注册来源：CASS_DEVELOPMENT:开思拓展，COUNTERPARTS_INTRODUCE：同行介绍，NATURAL_FLOW：自然流量
        taxcode                 TYPE string, ": "", // 税务登记证号
        unifiedsocialcreditcode TYPE string, ": "" // 统一社会信用代码
      END OF ts_userloginid_vendorcode .
  types:
    BEGIN OF ts_vendor_user,
        cellphone       TYPE string, ": "", // 电话号码
        contactnumber   TYPE string, ": "", // 联系电话
        createdstamp    TYPE string, ": "", // 创建时间
        customermanager TYPE string, ": "", // 客户经理
        enabled         TYPE string, ": false, // 是否可用
        gender          TYPE string, ": "", // 性别, 0:男,1:女
        id              TYPE string, ": "", // id
        joinparty       TYPE string, ": false, // 是否加入公司
        joinstamp       TYPE string, ": "", // 入司时间
        position        TYPE string, ": "", // 岗位
        registersource  TYPE string, ": "", // 注册来源
        status          TYPE string, ": "", // 员工状态
        userloginid     TYPE string, ": "", // userLoginId,只做关联
        userloginname   TYPE string, ": "", // 用户登录账号名
        username        TYPE string, ": "" // 用户名/userName
      END OF ts_vendor_user .
  types:
    tt_vendor_user TYPE STANDARD TABLE OF ts_vendor_user WITH DEFAULT KEY .
  types:
    BEGIN OF ty_vendorinf,
        id                      TYPE string, ": "100_100621",
        name                    TYPE string, ": "广州市存德汽车配件有限公司",
        code                    TYPE string, ": "CD000001",
        unifiedsocialcreditcode TYPE string, ": "99JKL045639722339",
        regcode                 TYPE string, ": null,
        taxcode                 TYPE string, ": null,
        orgcode                 TYPE string, ": null,
        integration             TYPE string, ": true,
        contactperson           TYPE string, ": "林荣桂",
        contactnumber           TYPE string, ": "18869888688",
        email                   TYPE string, ": "",
        customermanager         TYPE string, ": "杨惠宁",
        customermanagerid       TYPE string, ": "286ED48A3B2A1EEA819D765659B954DC",
        enterprisecode          TYPE string, ": "e44cd000001",
        authenticated           TYPE string, ": true,
        enabled                 TYPE string, ": true,
        remark                  TYPE string, ": "2",
        source                  TYPE string, ": "CASS_DEVELOPMENT",
        registerchannel         TYPE string, ": "BACKGROUND",
        createdby               TYPE string, ": "superadmin",
        createdstamp            TYPE string, ": 1455515593000,
        lastupdatedby           TYPE string, ": "mandy",
        lastupdatedstamp        TYPE string, ": 1668736337000
      END OF ty_vendorinf .
  types TS_VENDORINF type TY_VENDORINF .
  types:
    BEGIN OF ts_store_service,
        opentype            TYPE string,
        openflag            TYPE string,
        limittimeexperience TYPE string,
      END OF ts_store_service .
  types:
    BEGIN OF ts_store_list,
        id TYPE string,": "1400054748",
        internalId TYPE string,": "w4LyC0PEUaIEEB5HxYB",
        name TYPE string,": "测试店铺0",
        storeType TYPE string,": "GENERAL",
        provinceGeoId TYPE string,": null,
        provinceGeoName TYPE string,": null,
        cityGeoId TYPE string,": null,
        cityGeoName TYPE string,": null,
        countyGeoId TYPE string,": null,
        countyGeoName TYPE string,": null,
        villageGeoId TYPE string,": null,
        villageGeoName TYPE string,": null,
        vendorId TYPE string,": null,
        vendorCode TYPE string,": "44055000",
        vendorName TYPE string,": "多方同行调货供应商1_558929506",
        enabled TYPE string,": true,
        customerManager TYPE string,": "彭磊",
        levelCode TYPE string,": null,
        createdStamp TYPE string,": "2026-02-06 15:03:02",
        signServices TYPE string,": null
      END OF ts_store_list .
  types:
    tt_store_list TYPE STANDARD TABLE OF ts_store_list .

  methods UPDATE_STORE_BY_STOREID
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2 .
  methods ADD_MERCHANT_SIGNINFO
    importing
      !IV_DATA type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_SIGNINFO) type ZMER_S_SIGNINFO .
  methods PUBLISH_MERCHANT_ACCOUNT
    importing
      !IV_BODY type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_SIGNINFO) type DATA .
  methods ADD_MERCHANT_COMPANYTAGS
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_INFO) type STRING .
  methods ADD_MERCHANT_VENCARINFO
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_CARINFO) type ZMER_S_CARINFO .
  methods ADD_MERCHANT_ACCOUNTDTO
    importing
      value(IV_BODY) type STRING
    exporting
      !EV_MSG type BAPIRET2 .
  methods SINGLEREMIND_MERCHANT
    importing
      !IV_BODY type STRING
    exporting
      value(ES_MSG) type BAPIRET2
      !ES_APPROVECON type TS_APPROVECON .
  methods GET_MERCHANT_BASICCONFIG
    importing
      value(IV_STOREID) type STRING optional
    exporting
      value(ET_CONFSTATUS) type ZMER_T_CONFSTATUS
      value(EV_MSG) type BAPIRET2 .
  methods GET_MERCHANT_OPENSERVICE
    importing
      value(IV_OPENTYPE) type STRING
      value(IV_STOREID) type STRING
    exporting
      value(ES_DATA) type TS_STORE_SERVICE
      value(EV_MSG) type BAPIRET2 .
  methods GET_MERCHANT_ONLINE_LIST
    importing
      value(IV_BODY) type STRING optional
    exporting
      value(ET_DATA) type TT_ONLINE_INFO
      value(EV_MSG) type BAPIRET2 .
  methods GET_RECTIFICATION_LETTER
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_URL) type STRING
      value(EV_MSG) type BAPIRET2 .
  methods SEND_RECTIFICATION_LETTER
    importing
      value(IV_BODY) type STRING
    exporting
      value(ES_RECTIFICATION) type ZMER_S_RECTIFICATION
      value(EV_MSG) type BAPIRET2 .
  methods SEND_MERCHANT_PUNISHINFO
    importing
      value(IV_BODY) type STRING
    exporting
      !EV_MSG type BAPIRET2 .
  methods UPDATE_OFFLINE_AUDIT
    importing
      value(IV_BODY) type STRING
    exporting
      value(ES_RETURN) type TY_OFFLINEAUDIT
      value(ES_MSG) type BAPIRET2 .
  methods GET_CHECKLIST_BYSTOREID
    importing
      value(IV_STOREID) type STRING optional
    exporting
      value(ET_CHECKLIST) type ZMER_T_CHECKLIST
      value(EV_MSG) type BAPIRET2 .
  methods GET_VENOFF_SCORE
    importing
      value(IV_STOREID) type STRING
      value(IV_DATE) type STRING
    exporting
      value(ET_SCORELIST) type ZMER_T_VENSCORE
      value(EV_MSG) type BAPIRET2 .
  methods FORCE_OFFLINE_QUIT
    importing
      value(IV_BODY) type STRING optional
    exporting
      value(ES_MSG) type BAPIRET2
      value(ES_RETURN) type TY_FORECEQUIT .
  methods GET_QUOTE_ZONE
    importing
      value(IV_GUID) type STRING
    returning
      value(QUOTEZONE) type STRING .
  methods UPDATE_VEN_MANAGER
    importing
      value(IV_BODY) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2 .
  methods UPDATE_STOREAPPLY_AUDIT
    importing
      value(IV_BODY) type STRING
    exporting
      !ES_VENSAPPLY type ZMER_S_STOREAPPLY_AUDIT
      !EV_MSG type BAPIRET2 .
  methods GET_MERCHANT_CONTRACT_DETAIL
    importing
      value(IV_CONTRACTID) type STRING optional
    exporting
      value(ES_DETAIL) type TS_CONTRACT_DETAIL
      value(EV_MSG) type BAPIRET2 .
  methods GET_MERCHANT_CONTRACT_BYSTORE
    importing
      value(IV_BODY) type STRING optional
    exporting
      value(ET_CONTRACT) type TT_SOTRE_CONTRACT
      value(EV_MSG) type BAPIRET2 .
  methods GET_MERCHANT_CONTRACT_FEE
    importing
      value(IV_STOREID) type STRING optional
    exporting
      value(ES_FEEINFO) type TS_CONTRACT_FEEINFO
      value(EV_MSG) type BAPIRET2 .
  methods GET_MERCHANT_FEE_BY_CONTRACT
    importing
      value(IV_CONTRACTID) type STRING optional
    exporting
      value(ES_FEEINFO) type TS_FEEINFO
      value(EV_MSG) type BAPIRET2 .
  methods GET_MERCHANT_CONTRACT_PDF
    importing
      value(IV_CONTRACTID) type STRING optional
    exporting
      value(EV_URL) type STRING
      value(EV_MSG) type BAPIRET2 .
  methods GET_MERCHANT_PAYMETHOD
    importing
      value(IV_STOREID) type STRING optional
    exporting
      value(EV_PAYMETHOD) type STRING
      value(EV_MSG) type BAPIRET2 .
  methods GET_MERCHANT_DEADLINE
    importing
      value(IV_STOREID) type STRING optional
    exporting
      value(ET_DEADLINE) type ZMER_T_VALUE
      value(EV_MSG) type BAPIRET2 .
  methods GET_VEN_DETAIL
    importing
      value(IV_COMPANYID) type STRING optional
    exporting
      !ES_VENINFO type ZSINT_COMPANIES_INFO
      !EV_MSG type BAPIRET2 .
  methods GET_STORE_INVOICECONFIG
    importing
      value(IV_PRODUCTSTOREID) type STRING
    exporting
      value(ES_OUTPUT) type ZMER_S_INVOICECONFIG
      value(EV_MSG) type BAPIRET2 .
  methods GET_CONFIGURATION_BYCODE
    importing
      value(IV_CODE) type STRING optional
    exporting
      !ES_CONFIGURATION type ZMER_S_CONFIGURATION
      !EV_MSG type BAPIRET2 .
  methods GET_VENSTORE_APPLY
    importing
      value(IV_STOREID) type STRING optional
    exporting
      !ES_STOREAPPLY type ZMER_S_STOREAPPLY
      !EV_MSG type BAPIRET2 .
  methods GET_STORE_BY_VENDORID
    importing
      !VENDORID type STRING
    exporting
      !ET_STOREINF type TT_STOREINF
      !ES_MSG type BAPIRET2 .
  methods GET_VENPRODUCT_CHECK
    importing
      value(IV_STOREID) type STRING
    exporting
      value(ES_DATA) type TS_PRODUCTCHECK
      value(EV_MSG) type BAPIRET2 .
  methods GET_VENSTOCK_RESULT
    importing
      value(IV_STOREID) type STRING
    exporting
      value(ET_STOCKRESULT) type TT_STOCKRESULT
      value(EV_MSG) type BAPIRET2 .
  methods GET_VENSTOCK_OVERVIEW
    importing
      value(IV_BODY) type STRING
    exporting
      value(ET_STOCKOVERVIEW) type TS_STOCKOVELIST
      value(EV_MSG) type BAPIRET2 .
  methods GET_VENSTOCK_BRAND
    importing
      value(IV_STOREID) type STRING
    exporting
      value(ET_STOCKBRAND) type TT_STOCKBRANDLIST
      value(EV_MSG) type BAPIRET2 .
  methods GET_VENSTOCK_DETAIL
    importing
      value(IV_BODY) type STRING
    exporting
      value(ET_STOCKDETAIL) type TS_STOCKOVELIST
      value(EV_MSG) type BAPIRET2 .
  methods GET_BSR_V2_INITIAL_TAGS
    importing
      value(IV_STOREID) type STRING
      value(IV_MONTH) type STRING optional
      value(IV_DATE) type STRING optional
    exporting
      value(ET_BSRTAGS) type TT_BSRTAG_INITIAL
      !EV_MSG type BAPIRET2 .
  methods GET_BSR_V2_TAGS
    importing
      value(IV_CODE) type STRING
      value(IV_STOREID) type STRING
      value(IV_MONTH) type STRING optional
      value(IV_DATE) type STRING optional
    exporting
      value(ES_BSRTAGS) type TS_BARTAG_V2
      !EV_MSG type BAPIRET2 .
  methods GET_BSR_TAGS
    importing
      value(IV_STOREID) type STRING
      value(IV_MONTH) type STRING optional
      value(IV_DATE) type STRING optional
    exporting
      value(EV_BSRTAGS) type ZMER_S_BSRTAGS
      !EV_MSG type BAPIRET2 .
  methods GET_BSR_CURRENT
    importing
      value(IV_STOREID) type STRING
      value(IV_CODE) type STRING
      value(IV_MONTH) type STRING
      value(IV_DATE) type STRING
    exporting
      value(EV_CURRENT) type ZMER_S_CURRENT
      value(EV_MSG) type BAPIRET2 .
  methods GET_BSR_V2_EXCEPTION_INFO
    importing
      value(IV_BODY) type STRING
    exporting
      value(ES_EXCEPTION) type TS_EXCEPTION_INFO
      value(EV_MSG) type BAPIRET2 .
  methods GET_BSR_V2_CURRENT
    importing
      value(IV_STOREID) type STRING
      value(IV_CODE) type STRING
      value(IV_MONTH) type STRING
      value(IV_DATE) type STRING
    exporting
      value(EV_CURRENT) type ZMER_S_CURRENT
      value(EV_MSG) type BAPIRET2 .
  methods GET_BSR_CHILDSCORE
    importing
      value(IV_STOREID) type STRING
      value(IV_CODE) type STRING
      value(IV_DATE) type STRING
      !IV_MONTH type STRING
    exporting
      !ET_CHILDSCORE type ZMER_T_CHILDSCORE
      !EV_MSG type BAPIRET2 .
  methods GET_BSR_CURRENTTENDENCY
    importing
      value(IV_STOREID) type STRING
      value(IV_MONTH) type STRING
      value(IV_DATE) type STRING
      value(IV_CODE) type STRING
    exporting
      !EV_MSG type BAPIRET2
      !EV_TENDENCY type ZMER_S_TENDENCY .
  methods GET_BSR_V2_SUNBURST
    importing
      value(IV_STOREID) type STRING
      value(IV_MONTH) type STRING
      value(IV_DATE) type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ES_SUNBURST type TS_SUNBURST .
  methods GET_BSR_V2_CURRENTTENDENCY
    importing
      value(IV_STOREID) type STRING
      value(IV_MONTH) type STRING
      value(IV_DATE) type STRING
      value(IV_CODE) type STRING
    exporting
      !EV_MSG type BAPIRET2
      !EV_TENDENCY type ZMER_S_TENDENCY .
  methods GET_BSR_ODERREVALUATION
    importing
      value(IV_CODE) type STRING
      value(IV_STOREID) type STRING
      value(IV_MONTH) type STRING
      value(IV_DATE) type STRING
      value(IV_CURRENTPAGE) type STRING
      value(IV_PAGESIZE) type STRING
    exporting
      !EV_ORDEREVALUATION type ZMER_S_ORDEREVALUATION
      !EV_MSG type BAPIRET2 .
  methods GET_BSR_AFEVALUATION
    importing
      value(IV_STOREID) type STRING
      value(IV_MONTH) type STRING
      value(IV_DATE) type STRING
      value(IV_CURRENTPAGE) type STRING
      value(IV_PAGESIZE) type STRING
    exporting
      !EV_AFEVALUATION type ZMER_S_AFEVALUATION
      !EV_MSG type BAPIRET2 .
  methods GET_BSR_EXCEPTION
    importing
      value(IV_STOREID) type STRING
      value(IV_DATE) type STRING
      value(IV_MONTH) type STRING
    exporting
      !ET_EXCEPTION type ZMER_T_EXCEPTION
      !EV_MSG type BAPIRET2 .
  methods GET_BSR_RETURNORDER
    importing
      value(IV_STOREID) type STRING
      value(IV_MONTH) type STRING
      value(IV_DATE) type STRING
      value(IV_CURRENTPAGE) type STRING
      value(IV_PAGESIZE) type STRING
    exporting
      !EV_RETURNORDER type ZMER_S_RETURNORDER
      !EV_MSG type BAPIRET2 .
  methods GET_BSR_CANCELORDER
    importing
      value(IV_STOREID) type STRING
      value(IV_MONTH) type STRING
      value(IV_DATE) type STRING
      value(IV_CURRENTPAGE) type STRING
      value(IV_PAGESIZE) type STRING
    exporting
      !EV_CANCELORDER type ZMER_S_CANCELORDER
      !EV_MSG type BAPIRET2 .
  methods GET_ANALYSIS_VIEW_NOPAGES
    importing
      value(IV_BODY) type STRING optional
      value(IV_REQUESTTYPE) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type DATA .
  methods GET_FACILITYIES
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type TS_FACILITIES .
  methods GET_FACILITYIES_BYPARAMETER
    importing
      value(IV_ENDDATE) type STRING optional
      value(IV_IDORNAME) type STRING optional
      value(IV_PAGE) type I optional
      value(IV_SIZE) type I optional
      value(IV_STARTDATE) type STRING optional
      value(IV_WAREHOUSETYPE) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type TS_FACILITIES .
  methods GET_FACILITYIES_BYTYPE
    importing
      value(IV_FACILITYTYPE) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type TS_FACILITIES-CONTENT .
  methods GET_CREDITCODE_COUNT
    importing
      value(IV_CREDITCODE) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type DATA .
  methods GET_STORENAME_LIST
    importing
      value(IV_STORENAME) type STRING optional
      value(IV_STORECODE) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type TT_STORE_LIST .
  methods GET_STORENAME_COUNT
    importing
      value(IV_STORENAME) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type DATA .
  methods GET_USERCELLPHONE_COUNT
    importing
      value(IV_CELLPHONE) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type TS_CELLPHONE_USER .
  methods GET_VENDORCODE_BYUSERLOGINID
    importing
      value(IV_USERLOGINID) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type TS_USERLOGINID_VENDORCODE .
  methods GET_VENDORNAME_COUNT
    importing
      value(IV_VENDORNAME) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type DATA .
  methods GET_USER_VENDOR_RELATION
    importing
      value(IV_VENDORID) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type TT_VENDOR_USER .
  methods GET_ANALYSIS_VIEW
    importing
      value(IV_BODY) type STRING optional
      value(IV_REQUESTTYPE) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type DATA .
  methods FREEPOSTAGECOUPON_COMPLETE
    importing
      value(IV_BODY) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type STRING .
  methods REPAIR_COMPENSATION_COMPLETE
    importing
      value(IV_BODY) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type TS_RETURN .
  methods REPAIR_COMPENSATION_REJECT
    importing
      value(IV_BODY) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type TS_RETURN .
  methods GET_ANALYSIS_PARTSBRANDS
    importing
      value(STOREID) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_DATA) type TT_ASALYSIS_BRAND .
  methods GET_ANALYSIS_CARBRANDS
    importing
      value(STOREID) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_DATA) type TT_ASALYSIS_BRAND .
  methods GET_ANALYSIS_HEAD
    importing
      value(STOREID) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type TS_ANALYSIS_HEAD .
  methods GET_COMPANY_FEATURE
    importing
      value(COMPANYID) type STRING optional
      value(FEATUREID) type STRING optional
    exporting
      value(ES_FEATURE) type TS_FEATURE
      value(EV_MSG) type BAPIRET2 .
  methods GET_BACKLOGS_LIST
    importing
      value(IV_STOREID) type STRING
      value(IV_USERLOGINID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_BACKLOGS_RETURN) type TS_BACKLOGS_RETURN .
  methods GET_QUOTEPRICE_EXC
    importing
      !IV_STOREID type STRING
      !IV_SEARCHTYPE type STRING
      !IV_PAGENUM type STRING
      !IV_PAGESIZE type STRING
    exporting
      !ES_QUOTEPRICE type TS_QUOTEPRICE_RETURN
      !EV_MSG type BAPIRET2 .
  methods GET_EXC_STATISTICS
    importing
      !IV_STOREID type STRING
      !IV_PERIOD type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ES_HIS_STATISTICS type TS_HISSTATISTICS_RETURN
      !ES_STATISTICS type TS_STATISTICSEVENT_RETURN
      !ES_ALL_STATISTICS type TS_ALLSTATISTICS_RETURN .
  methods EXC_FEEDBACK
    importing
      !IV_FEEDBACKREASON type STRING
      !IV_ID type STRING
      !IV_STOREID type STRING
    exporting
      !EV_MSG type BAPIRET2
      !IV_RETURN type STRING .
  methods GET_VENDORCODE_BY_CELLPHONE
    importing
      value(IV_CELLPHONE) type STRING optional
    exporting
      value(IV_VENDORCODE) type STRING
      value(IV_VENDORID) type STRING
      value(IV_USERLOGINID) type STRING .
  methods GET_INDICATORS_LIST
    importing
      !IV_STOREID type STRING
      !IV_USERLOGINID type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ES_INDICATORS_RETURN type TS_INDICATORS_RETURN .
  methods GET_VENDORINF_BYSTOREID
    importing
      value(IV_STOREID) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type TS_VENDORINF .
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



CLASS ZCL_ICEC_MERCHANT_API IMPLEMENTATION.


  METHOD add_merchant_accountdto.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:BEGIN OF ls_account,
           productstoreid TYPE string,
           applytime      TYPE string,
         END OF ls_account.
    DATA:lv_rfcdest TYPE rfcdest.
    DATA: lv_body TYPE string.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT'
      AND method = 'ADD_MERCHANT_ACCOUNTDTO'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    lv_body = iv_body.
    DATA:lv_title TYPE string.
    lv_title = '新增供应商账号(ZCL_ICEC_MERCHANT_API->ADD_MERCHANT_ACCOUNTDTO)'.
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

    IF lv_out IS NOT INITIAL . "解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = ls_account ) .
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
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_requestbody = lv_body iv_responsebody = lv_out ).
    ENDIF.

  ENDMETHOD.


  METHOD add_merchant_companytags.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'TAG'
      AND method = 'ADD_MERCHANT_COMPANYTAGS'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    lv_title = '商家上下申请通过后同步(ZCL_ICEC_MERCHANT_API->ADD_MERCHANT_COMPANYTAGS)'.
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
                          data = es_info ) .


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


  METHOD add_merchant_signinfo.

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
      WHERE service = 'MERCHANT'
      AND method = 'ADD_MERCHANT_SIGNINFO'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    lv_title = '上线申请通过后通知平台签约(ZCL_ICEC_MERCHANT_API->ADD_MERCHANT_SIGNINFO)'.
    lv_body = iv_data.
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
                         data = es_signinfo ) .


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


  METHOD add_merchant_vencarinfo.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'TAG'
      AND method = 'ADD_MERCHANT_VENCARINFO'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    lv_title = '商家上线申请通过后同步汽车品牌数据给会员(ZCL_ICEC_MERCHANT_API->ADD_MERCHANT_VENCARINFO)'.
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
                          data = es_carinfo ) .


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


  METHOD exc_feedback.
    DATA lv_uri          TYPE string.
    DATA lv_rfcdest      TYPE rfcdest.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_body TYPE string.
    DATA lv_title TYPE string.
    DATA(lo_api) = NEW zcl_icec_api( ).

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'EXC_FEEDBACK'.
    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                          ELSE ls_ztint_icec_api-rfcdest ).

    lv_body = |\{ "feedbackReason": "{ iv_feedbackreason }","id": "{ iv_id }", "storeId": "{ iv_storeid }"\}|.

    CONDENSE lv_body NO-GAPS.
    "调用接口
*    lv_title = '根据店铺仓库送达区域批量查询配送时效接口(ZCL_ICEC_INQUIRY_API->GET_STORE_DELIVERY)'.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
*       iv_title        = lv_title
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.

    IF lv_out IS NOT INITIAL ."解析json
*      TRY.
*          /ui2/cl_json=>deserialize(
*                      EXPORTING
*                         json = lv_out
*                      CHANGING
*                         data =  iv_return ).
*          ev_msg-type = 'S'.
*          ev_msg-id = '200'.
*          ev_msg-message = 'JSON成功解析'.
*        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).
*          ev_msg-type = 'E'.
*          ev_msg-id = '404'.
*          ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
*        CATCH cx_root.
*          ev_msg-type = 'E'.
*          ev_msg-id = 404.
*          ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
*      ENDTRY.
      iv_return = lv_out.
    ENDIF.
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = ev_msg ).
    ENDIF.


  ENDMETHOD.


  METHOD force_offline_quit.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_body TYPE string.
    DATA: lv_out TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'FORCE_OFFLINE_QUIT'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title TYPE string.
    lv_title = '强制下线接口(ZCL_ICEC_MERCHANT_API->FORCE_OFFLINE_QUI)'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
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
        ev_msg          = es_msg.

    IF lv_out = 'true' .  "解析json
      es_msg-type = 'S'.
      es_return-code = lv_out.
    ELSE.
      es_msg-type = 'E'.
      es_msg-message = '接口处理失败!'.
    ENDIF.
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = es_msg iv_requestbody = lv_body iv_responsebody = lv_out ).
    ENDIF.
  ENDMETHOD.


METHOD freepostagecoupon_complete.

  DATA:lv_uri          TYPE string,
       lv_rfcdest      TYPE rfcdest,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.
  DATA es_punishinfo TYPE zmer_s_punishinfo .
  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'COUPON' AND method = 'FREEPOSTAGECOUPON_COMPLETE'.

  lv_uri = ls_ztint_icec_api-url.

  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
  ELSE ls_ztint_icec_api-rfcdest ).

  ls_content_type-content_type = 'application/json;charset=UTF-8'.
  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  CALL METHOD lo_api->post_data(
    EXPORTING
      iv_rfcdest      = lv_rfcdest "'PLATFORM'
      iv_uri          = lv_uri
      is_content_type = ls_content_type
      iv_body         = iv_body
    IMPORTING
      json_out        = lv_out
      ev_msg          = ev_msg
                        ).
  IF lv_out IS NOT INITIAL .
*      "解析json
*      TRY.
*
*          /ui2/cl_json=>deserialize(
*                      EXPORTING
*                         json = lv_out
*                      CHANGING
*                         data = es_data ).
*          ev_msg-type = 'S'.
*          ev_msg-id = '200'.
*          ev_msg-message = 'JSON成功解析'.
*        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).
*          ev_msg-type = 'E'.
*          ev_msg-id = '404'.
*          ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
*        CATCH cx_root.
*          ev_msg-type = 'E'.
*          ev_msg-id = 404.
*          ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
*      ENDTRY.
    es_data = lv_out.
  ELSE.
    ev_msg-type = 'E'.
    ev_msg-id = '400'.
    ev_msg-message = '请检查系统传入参数'.
  ENDIF.
  IF ls_ztint_icec_api-nolog IS INITIAL.
  save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
  ENDIF.

ENDMETHOD.


  METHOD get_analysis_carbrands.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_ANALYSIS_CARBRANDS'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                         ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{storeId}' IN lv_uri WITH storeid.

    DATA: lv_body TYPE string.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_analysis_head.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_ANALYSIS_HEAD'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                         ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{storeId}' IN lv_uri WITH storeid.

    DATA: lv_body TYPE string.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD GET_ANALYSIS_PARTSBRANDS.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_ANALYSIS_PARTSBRANDS'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                         ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{storeId}' IN lv_uri WITH storeid.

    DATA: lv_body TYPE string.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_analysis_view.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_ANALYSIS_VIEW'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{requestType}' IN lv_uri WITH iv_requesttype.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                         ELSE ls_ztint_icec_api-rfcdest ).

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_analysis_view_nopages.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    IF iv_requesttype EQ 'STORE_BSR_VIEW'.
      SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'MERCHANT' AND method = 'GET_ANALYSIS_BSRVIEW_NOPAGES'.
      lv_uri = ls_ztint_icec_api-url.
    ELSE.
      SELECT SINGLE * FROM ztint_icec_api INTO @ls_ztint_icec_api
        WHERE service = 'MERCHANT' AND method = 'GET_ANALYSIS_VIEW_NOPAGES'.
      lv_uri = ls_ztint_icec_api-url.
      REPLACE '{requestType}' IN lv_uri WITH iv_requesttype.
    ENDIF.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                         ELSE ls_ztint_icec_api-rfcdest ).

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_backlogs_list.
    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_BACKLOGS_LIST'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                          ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    REPLACE '{userLoginId}' IN lv_uri WITH iv_userloginid.

    DATA: lv_body TYPE string.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
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
                         data = es_backlogs_return ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_bsr_afevaluation.


    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_BSR_AFEVALUATION'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    REPLACE '{month}' IN lv_uri WITH iv_month.
    REPLACE '{date}' IN lv_uri WITH iv_date.
    REPLACE '{currentPage}' IN lv_uri WITH iv_currentpage.
    REPLACE '{pageSize}' IN lv_uri WITH iv_pagesize.

    DATA: lv_body TYPE string.

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
                         data = ev_afevaluation ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD GET_BSR_CANCELORDER.


    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_BSR_CANCELORDER'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    REPLACE '{month}' IN lv_uri WITH iv_month.
    REPLACE '{date}' IN lv_uri WITH iv_date.
    REPLACE '{currentPage}' IN lv_uri WITH iv_currentpage.
    REPLACE '{pageSize}' IN lv_uri WITH iv_pagesize.

    DATA: lv_body TYPE string.

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
                         data = ev_cancelorder ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_bsr_childscore.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_BSR_CHILDSCORE'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    REPLACE '{code}' IN lv_uri WITH iv_code.
    REPLACE '{month}' IN lv_uri WITH iv_month.
    REPLACE '{date}' IN lv_uri WITH iv_date.

    DATA: lv_body TYPE string.

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
                         data = et_childscore ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD get_bsr_current.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_BSR_CURRENT'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    REPLACE '{code}' IN lv_uri WITH iv_code.
    REPLACE '{month}' IN lv_uri WITH iv_month.
    REPLACE '{date}' IN lv_uri WITH iv_date.

    DATA: lv_body TYPE string.

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
                         data = ev_current ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.



  ENDMETHOD.


  METHOD get_bsr_currenttendency.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_BSR_CURRENTTENDENCY'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    REPLACE '{code}' IN lv_uri WITH iv_code.
    REPLACE '{month}' IN lv_uri WITH iv_month.
    REPLACE '{date}' IN lv_uri WITH iv_date.

    DATA: lv_body TYPE string.

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
                         data = ev_tendency ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD get_bsr_exception.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_BSR_EXCEPTION'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    REPLACE '{month}' IN lv_uri WITH iv_month.
    REPLACE '{date}' IN lv_uri WITH iv_date.

    DATA: lv_body TYPE string.

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
                         data = et_exception ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_bsr_oderrevaluation.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_BSR_ORDERVALUATION'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    REPLACE '{code}' IN lv_uri WITH iv_code.
    REPLACE '{month}' IN lv_uri WITH iv_month.
    REPLACE '{date}' IN lv_uri WITH iv_date.
    REPLACE '{currentPage}' IN lv_uri WITH iv_currentpage.
    REPLACE '{pageSize}' IN lv_uri WITH iv_pagesize.

    DATA: lv_body TYPE string.

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
                         data = ev_orderevaluation ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD GET_BSR_RETURNORDER.


    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_BSR_RETURNORDER'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    REPLACE '{month}' IN lv_uri WITH iv_month.
    REPLACE '{date}' IN lv_uri WITH iv_date.
    REPLACE '{currentPage}' IN lv_uri WITH iv_currentpage.
    REPLACE '{pageSize}' IN lv_uri WITH iv_pagesize.

    DATA: lv_body TYPE string.

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
                         data = ev_returnorder ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_bsr_tags.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_BSR_TAGS'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    REPLACE '{month}' IN lv_uri WITH iv_month.
    REPLACE '{date}' IN lv_uri WITH iv_date.

    DATA: lv_body TYPE string.

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
                         data = ev_bsrtags ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD get_bsr_v2_current.
    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_BSR_V2_CURRENT'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                          ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    REPLACE '{code}' IN lv_uri WITH iv_code.
    REPLACE '{month}' IN lv_uri WITH iv_month.
    REPLACE '{date}' IN lv_uri WITH iv_date.

    DATA: lv_body TYPE string.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest " 'PLATFORM'
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
                         data = ev_current ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.



  ENDMETHOD.


  METHOD get_bsr_v2_currenttendency.
    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_BSR_V2_CURRENTTENDENCY'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                         ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    REPLACE '{code}' IN lv_uri WITH iv_code.
    REPLACE '{month}' IN lv_uri WITH iv_month.
    REPLACE '{date}' IN lv_uri WITH iv_date.

    DATA: lv_body TYPE string.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest" 'PLATFORM'
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
                         data = ev_tendency ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD get_bsr_v2_exception_info.
    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_BSR_V2_EXCEPTION_INFO'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                          ELSE ls_ztint_icec_api-rfcdest ).
**
** {
**  "code": "S2201",
**  "date": "",
**  "month": "202306",
**  "pageNum": "1",
**  "pageSize": "100",
**  "storeId": "HL000001"
**}
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest " 'PLATFORM'
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
                         data = es_exception ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.



  ENDMETHOD.


  METHOD GET_BSR_V2_INITIAL_TAGS.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_BSR_V2_INITIAL_TAGS'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                        ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    REPLACE '{month}' IN lv_uri WITH iv_month.
    REPLACE '{date}' IN lv_uri WITH iv_date.

    DATA: lv_body TYPE string.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
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
                         data = et_bsrtags ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD get_bsr_v2_sunburst.
    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_BSR_V2_SUNBURST'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                         ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    REPLACE '{month}' IN lv_uri WITH iv_month.
    REPLACE '{date}' IN lv_uri WITH iv_date.

    DATA: lv_body TYPE string.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest " 'PLATFORM'
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
                         data = es_sunburst ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD get_bsr_v2_tags.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_BSR_V2_TAGS'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                          ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{code}' IN lv_uri WITH iv_code.
    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    REPLACE '{month}' IN lv_uri WITH iv_month.
    REPLACE '{date}' IN lv_uri WITH iv_date.

    DATA: lv_body TYPE string.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
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
                         data = es_bsrtags ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD GET_CHECKLIST_BYSTOREID.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'VENOFF'
      AND method = 'GET_CHECKLIST_BYSTOREID'.

    lv_uri = ls_ztint_icec_api-url.


    REPLACE  '{storeId}' IN lv_uri WITH iv_storeid.
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
        ev_msg          = eV_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_checklist ).


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


  METHOD get_company_feature.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT'
      AND method = 'GET_COMPANY_FEATURE'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{companyId}' IN lv_uri WITH companyid.
    REPLACE '{featureId}' IN lv_uri WITH featureid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
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
                         data = es_feature ).


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


METHOD get_configuration_bycode.
  DATA:lv_uri          TYPE string,
       lv_rfcdest      TYPE rfcdest,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'MERCHANT'
        AND method = 'GET_CONFIGURATION_BYCODE'.

  lv_uri = ls_ztint_icec_api-url.

  REPLACE '{parentKey}' IN lv_uri WITH iv_code.

  ls_content_type-content_type = 'application/json;charset=UTF-8'.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS NOT INITIAL THEN ls_ztint_icec_api-rfcdest ELSE 'PLATFORM' ).

  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  CALL METHOD lo_api->get_data(
    EXPORTING
      iv_rfcdest      = lv_rfcdest
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
        data = es_configuration ).

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


METHOD GET_CREDITCODE_COUNT.

  DATA:lv_uri          TYPE string,
       lv_body         TYPE string,
       lv_rfcdest      TYPE rfcdest,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'MERCHANT' AND method = 'GET_CREDITCODE_COUNT'.

  lv_uri = ls_ztint_icec_api-url.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
  ELSE ls_ztint_icec_api-rfcdest ).

*  lv_body = |\{"endDate":"{ iv_enddate }","idOrName":"{ iv_idorname }","page":"{ iv_page }","size":"{ iv_size }","startDate":"{ iv_startdate }","warehouseType":"{ iv_warehousetype }"\}|.

lv_body = |\{"unifiedSocialCreditCode": "{ iv_creditcode }"\}|.

  ls_content_type-content_type = 'application/json;charset=UTF-8'.
  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  CALL METHOD lo_api->post_data(
    EXPORTING
      iv_rfcdest      = lv_rfcdest "'PLATFORM'
      iv_uri          = lv_uri
      is_content_type = ls_content_type
      iv_body         = lv_body
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
  ELSE.
    ev_msg-type = 'E'.
    ev_msg-id = '400'.
    ev_msg-message = '请检查系统传入参数'.
  ENDIF.
 IF ls_ztint_icec_api-nolog IS INITIAL.
 save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
 ENDIF.


ENDMETHOD.


METHOD get_exc_statistics.
  DATA:lv_uri          TYPE string,
       lv_rfcdest      TYPE rfcdest,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.
  DATA lv_method TYPE string.
  lv_method = COND #( WHEN iv_period EQ 'ALL' THEN 'GET_ALL_STATISTICS'
  WHEN iv_period IS INITIAL THEN 'GET_STATISTICS'
  ELSE 'GET_HISTORY_STATISTICS').

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'MERCHANT' AND method = @lv_method.

  lv_uri = ls_ztint_icec_api-url.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
  ELSE ls_ztint_icec_api-rfcdest ).

  REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
  REPLACE '{period}' IN lv_uri WITH iv_period.

  DATA: lv_body TYPE string.

  ls_content_type-content_type = 'application/json;charset=UTF-8'.
  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  CALL METHOD lo_api->get_data(
    EXPORTING
      iv_rfcdest      = lv_rfcdest "'PLATFORM'
      iv_uri          = lv_uri
      is_content_type = ls_content_type
    IMPORTING
      json_out        = lv_out
      ev_msg          = ev_msg
                        ).
  IF lv_out IS NOT INITIAL .
    "解析json
    TRY.
        CASE lv_method.
          WHEN 'GET_HISTORY_STATISTICS'.
            /ui2/cl_json=>deserialize(
            EXPORTING
              json = lv_out
            CHANGING
            data = es_his_statistics ).
          WHEN 'GET_STATISTICS'.
            /ui2/cl_json=>deserialize(
            EXPORTING
              json = lv_out
            CHANGING
            data = es_statistics ).
          WHEN 'GET_ALL_STATISTICS'.
            /ui2/cl_json=>deserialize(
            EXPORTING
              json = lv_out
            CHANGING
            data =  es_all_statistics ).
        ENDCASE.
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
  ELSE.
    ev_msg-type = 'E'.
    ev_msg-id = '400'.
    ev_msg-message = '请检查系统传入参数'.
  ENDIF.
 IF ls_ztint_icec_api-nolog IS INITIAL.
 save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
 ENDIF.
ENDMETHOD.


  METHOD get_facilityies.

    DATA:lv_uri          TYPE string,
         lv_body         TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_FACILITYIES'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                         ELSE ls_ztint_icec_api-rfcdest ).

    lv_body = |\{"page": "1","size": "100","warehouseType": "YUN"\}|.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
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
                         data = es_data ).

          DATA:lt_ware TYPE STANDARD TABLE OF ztint_warehouse,
               ls_ware TYPE ztint_warehouse.
          lt_ware = VALUE #( FOR wa IN es_data-content ( warehouse = wa-facilityid
                                                         warehousedesc = wa-facilityname
                                                         yunflg = 'X' ) ).
          DELETE FROM ztint_warehouse WHERE yunflg = 'X'.
          MODIFY ztint_warehouse FROM TABLE lt_ware.

          ev_msg-type = 'S'.
          ev_msg-id = '200'.
          ev_msg-message = 'JSON成功解析'.
*------add by wuzy 24.04.2024 17:22:04 begin
*-共享仓创建供应商主数据
          IF lt_ware IS NOT INITIAL .
            CALL FUNCTION 'Z_FMFI_SHARED_WAREHOUSE_VENDOR'
              IN BACKGROUND TASK
              TABLES
                it_ware = lt_ware.
            COMMIT WORK .
          ENDIF.
*------add by wuzy 24.04.2024 17:22:04 end
        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).
          ev_msg-type = 'E'.
          ev_msg-id = '404'.
          ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
        CATCH cx_root.
          ev_msg-type = 'E'.
          ev_msg-id = 404.
          ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
      ENDTRY.
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


METHOD get_facilityies_byparameter.

  DATA:lv_uri          TYPE string,
       lv_body         TYPE string,
       lv_rfcdest      TYPE rfcdest,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.
  DATA es_punishinfo TYPE zmer_s_punishinfo .
  IF iv_page IS INITIAL.
    iv_page = 1.
  ENDIF.
  IF iv_size IS INITIAL.
    iv_size = 15.
  ENDIF.
  IF iv_warehousetype IS INITIAL.
    iv_warehousetype = 'NO'.
  ENDIF.
  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'MERCHANT' AND method = 'GET_FACILITYIES_BYPARAMETER'.

  lv_uri = ls_ztint_icec_api-url.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
  ELSE ls_ztint_icec_api-rfcdest ).

  lv_body = |\{"endDate":"{ iv_enddate }","idOrName":"{ iv_idorname }","page":"{ iv_page }","size":"{ iv_size }","startDate":"{ iv_startdate }","warehouseType":"{ iv_warehousetype }"\}|.

  ls_content_type-content_type = 'application/json;charset=UTF-8'.
  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  CALL METHOD lo_api->post_data(
    EXPORTING
      iv_rfcdest      = lv_rfcdest "'PLATFORM'
      iv_uri          = lv_uri
      is_content_type = ls_content_type
      iv_body         = lv_body
    IMPORTING
      json_out        = lv_out
      ev_msg          = ev_msg
                        ).
  IF lv_out IS NOT INITIAL .
    replace '"@class":"com.casstime.ec.cloud.spi.PagedModelsImpl",' WITH '' INTO lv_out.
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
  ELSE.
    ev_msg-type = 'E'.
    ev_msg-id = '400'.
    ev_msg-message = '请检查系统传入参数'.
  ENDIF.
 IF ls_ztint_icec_api-nolog IS INITIAL.
 save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
 ENDIF.

ENDMETHOD.


METHOD get_facilityies_bytype.

  DATA:lv_uri          TYPE string,
       lv_body         TYPE string,
       lv_rfcdest      TYPE rfcdest,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.
  DATA es_punishinfo TYPE zmer_s_punishinfo .

  IF iv_facilitytype IS INITIAL.
    iv_facilitytype  = 'YUN'.
  ENDIF.
  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'MERCHANT' AND method = 'GET_FACILITYIESBYTYPE'.

  lv_uri = ls_ztint_icec_api-url.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
  ELSE ls_ztint_icec_api-rfcdest ).
  REPLACE '{facilitytype}' IN lv_uri WITH iv_facilitytype.


  ls_content_type-content_type = 'application/json;charset=UTF-8'.

  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  CALL METHOD lo_api->get_data(
    EXPORTING
      iv_rfcdest      = lv_rfcdest
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
  ELSE.
    ev_msg-type = 'E'.
    ev_msg-id = '400'.
    ev_msg-message = '请检查系统传入参数'.
  ENDIF.
 IF ls_ztint_icec_api-nolog IS INITIAL.
 save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
 ENDIF.

ENDMETHOD.


  METHOD get_indicators_list.
    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_INDICATORS_LIST'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                          ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    REPLACE '{userLoginId}' IN lv_uri WITH iv_userloginid.

    DATA: lv_body TYPE string.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
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
                         data = es_indicators_return ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_merchant_basicconfig.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT'
      AND method = 'GET_MERCHANT_BASICCONFIG'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.

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
                         data = et_confstatus ).


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


  METHOD get_merchant_contract_bystore.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_out TYPE string.
    DATA lv_value TYPE string.
    DATA:lv_rfcdest TYPE rfcdest.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_MERCHANT_CONTRACT_BYSTORE'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

    CONDENSE lv_uri.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest
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
                         data = et_contract ).
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


  METHOD get_merchant_contract_detail.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_out TYPE string.
    DATA lv_value TYPE string.
    DATA:lv_rfcdest TYPE rfcdest.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_MERCHANT_CONTRACT_DETAIL'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).


    REPLACE '{iv_contractid}' IN lv_uri WITH iv_contractid.

    CONDENSE lv_uri.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest
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
                         data = es_detail ).


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


  METHOD get_merchant_contract_fee.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_out TYPE string.
    DATA lv_value TYPE string.
    DATA:lv_rfcdest TYPE rfcdest.
    DATA:lv_body TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_MERCHANT_CONTRACT_FEE'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{iv_storeId}' IN lv_uri WITH iv_storeid.

    CONDENSE lv_uri.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
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
                         data = es_feeinfo ).
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


  METHOD get_merchant_contract_pdf.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_out TYPE string.
    DATA lv_value TYPE string.
    DATA:lv_rfcdest TYPE rfcdest.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_MERCHANT_CONTRACT_PDF'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).


    REPLACE '{iv_contractid}' IN lv_uri WITH iv_contractid.

    CONDENSE lv_uri.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = ev_url
        ev_msg          = ev_msg
                          ).
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = ev_url ev_msg = ev_msg ).
   ENDIF.






  ENDMETHOD.


  METHOD get_merchant_deadline.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_out TYPE string.

    DATA :lt_idvalue TYPE STANDARD TABLE OF zmer_s_idvalue,
          ls_idvalue TYPE zmer_s_idvalue.
    DATA  lt_time TYPE STANDARD TABLE OF zmer_s_configvalue.
    DATA lv_value TYPE string.

    DATA:ls_time TYPE  zcl_icec_merchant_api=>ty_deadline.
    DATA:lt_list TYPE STANDARD TABLE OF zcl_icec_merchant_api=>ty_deadline.

    DATA lt_configinfolist TYPE STANDARD TABLE OF zmer_s_configinfolist WITH DEFAULT KEY.


    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT'
      AND method = 'GET_MERCHANT_VENDEADLINE'.

    lv_uri = ls_ztint_icec_api-url.


    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.

    CONDENSE lv_uri.
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
                         data = lt_list ).


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

      IF lt_list IS NOT INITIAL.


*        LOOP AT lt_list INTO ls_time.
*          DATA i TYPE n VALUE 1.
*          do 6 TIMES.
*          IF ls_time-configinfolist[ i ]-configkey = 'TIME_CONFIG'.
*            TRY.
*
*                /ui2/cl_json=>deserialize(
*                            EXPORTING
*                               json = ls_time-configinfolist[ i ]-configvalue
*                            CHANGING
*                              data = et_deadline ).
*
*
*                ev_msg-type = 'S'.
*                ev_msg-id = '200'.
*                ev_msg-message = 'JSON成功解析'.
*              CATCH cx_json_illegal_syntax INTO DATA(lo_syntax01).
*                ev_msg-type = 'E'.
*                ev_msg-id = '404'.
*                ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
*              CATCH cx_root.
*                ev_msg-type = 'E'.
*                ev_msg-id = 404.
*                ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
*            ENDTRY.
*
*          ENDIF.
*          i = i + 1.
*          ENDDO.
*        ENDLOOP.

        LOOP AT lt_list INTO ls_time .
          lt_configinfolist = ls_time-configinfolist.

          LOOP AT lt_configinfolist INTO DATA(ls_configvalue) WHERE configkey = 'TIME_CONFIG'.
            ls_idvalue-id = ls_configvalue-id.
*            ls_idvalue-value =  ls_configvalue-configvalue .
            lv_value = ls_configvalue-configvalue.
            "解析json
            TRY.

                /ui2/cl_json=>deserialize(
                            EXPORTING
                               json = lv_value
*                            json = ls_idvalue-value
                            CHANGING
*                              data = et_deadline ).
                             data = lt_time ).


                ev_msg-type = 'S'.
                ev_msg-id = '200'.
                ev_msg-message = 'JSON成功解析'.
              CATCH cx_json_illegal_syntax INTO DATA(lo_syntax01).
                ev_msg-type = 'E'.
                ev_msg-id = '404'.
                ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
              CATCH cx_root.
                ev_msg-type = 'E'.
                ev_msg-id = 404.
                ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
            ENDTRY.

            ls_idvalue-value = lt_time.
            APPEND ls_idvalue TO lt_idvalue.
          ENDLOOP.
        ENDLOOP.

        MOVE-CORRESPONDING lt_idvalue TO et_deadline.
      ENDIF.

    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.






  ENDMETHOD.


  METHOD get_merchant_fee_by_contract.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_out TYPE string.
    DATA lv_value TYPE string.
    DATA:lv_rfcdest TYPE rfcdest.
    DATA:lv_body TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_MERCHANT_FEE_BY_CONTRACT'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{iv_contractId}' IN lv_uri WITH iv_contractid.

    CONDENSE lv_uri.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest
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
                         data = es_feeinfo ).
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


  METHOD get_merchant_online_list.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT'
      AND method = 'GET_MERCHANT_ONLINE_LIST'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                            ELSE ls_ztint_icec_api-rfcdest ).
**{
**  "storeId": "GZZQ0001",
**  "page": 1,
**  "size": 10
**}

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.



  ENDMETHOD.


  METHOD get_merchant_openservice.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT'
      AND method = 'GET_MERCHANT_OPENSERVICE'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                            ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    REPLACE '{openType}' IN lv_uri WITH iv_opentype.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.



  ENDMETHOD.


  METHOD get_merchant_paymethod.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_out TYPE string.
    DATA lv_value TYPE string.
    DATA:lv_rfcdest TYPE rfcdest.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_MERCHANT_PAYMETHOD'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).


    REPLACE '{iv_storeId}' IN lv_uri WITH iv_storeid.

    CONDENSE lv_uri.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = ev_paymethod
        ev_msg          = ev_msg
                          ).
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = ev_paymethod ev_msg = ev_msg ).
   ENDIF.






  ENDMETHOD.


  METHOD get_quoteprice_exc.
    DATA lv_uri          TYPE string.
    DATA lv_rfcdest      TYPE rfcdest.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_body TYPE string.
    DATA lv_title TYPE string.
    DATA(lo_api) = NEW zcl_icec_api( ).

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_QUOTEPRICE_EXC'.
    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                          ELSE ls_ztint_icec_api-rfcdest ).

    lv_body = |\{ "pageNum": "{ iv_pagenum }","pageSize": "{ iv_pagesize }","searchType": "{ iv_searchtype }", "storeId": "{ iv_storeid }"\}|.
    CONDENSE lv_body NO-GAPS.
    "调用接口
*    lv_title = '根据店铺仓库送达区域批量查询配送时效接口(ZCL_ICEC_INQUIRY_API->GET_STORE_DELIVERY)'.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
*       iv_title        = lv_title
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.

    IF lv_out IS NOT INITIAL ."解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data =  es_quoteprice ).
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


  METHOD get_quote_zone.

    CHECK iv_guid IS NOT INITIAL.

    SELECT * FROM ztint_online_zon INTO TABLE @DATA(areazone) WHERE guid = @iv_guid.
*全国供应商：省直辖市特别行政区>=5或者地级市>=40
*区域供应商：<1省直辖市特别行政区<5或者1<地级市<40或者城市=1区县>5或者城市=1区县<=5但是覆盖了该城市的所有区县
*末端供应商：城市=1区县<=5但是没有覆盖该城市的所有区县

    CHECK areazone IS NOT INITIAL.
    DATA(lt_prov) = areazone.
    SORT lt_prov BY provincegeoid.
    DELETE ADJACENT DUPLICATES FROM lt_prov COMPARING provincegeoid.

    DATA(lv_prov) = lines( lt_prov ).
    IF lv_prov >= 5.
      quotezone = '全国供应商'.
      EXIT.
    ELSEIF lv_prov > 1.
      quotezone = '区域供应商'.
      EXIT.
    ENDIF.

    DATA(lt_city) = areazone.
    SORT lt_city BY citygeoid.
    DELETE ADJACENT DUPLICATES FROM lt_city COMPARING citygeoid.

    DATA(lv_city) = lines( lt_city ).
    IF lv_city >= 40.
      quotezone = '全国供应商'.
      EXIT.
    ELSEIF lv_city > 1.
      quotezone = '区域供应商'.
      EXIT.
    ENDIF.
    DATA(lt_county) = areazone.
    SORT lt_county BY countygeoid.
    DELETE ADJACENT DUPLICATES FROM lt_county COMPARING countygeoid.

    DATA(lv_county) = lines( lt_county ).
    IF lv_county > 5.
      quotezone = '区域供应商'.
      EXIT.
    ELSEIF lv_county = 1 AND lt_county[ 1 ]-countygeoid IS INITIAL."只选到市，然后区都是空的
      quotezone =  '区域供应商'.
      EXIT.
    ELSE.
      "获取该城市的所有区域数量，看看是否已经全覆盖
      READ TABLE lt_city INTO DATA(ls_city) INDEX 1.
      IF sy-subrc EQ 0.
        SELECT COUNT( * ) INTO @DATA(lv_count) FROM ztint_geo WHERE parentgeoid = @ls_city-citygeoid AND enabled = 'X'.
        IF lv_county = lv_count.
          quotezone = '区域供应商'.
          EXIT.
        ELSE.
          quotezone = '末端供应商'.
          EXIT.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD get_rectification_letter.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'VENOFF'
      AND method = 'GET_RECTIFICATION_LETTER'.

    lv_uri = ls_ztint_icec_api-url.

    DATA: lv_body TYPE string.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_body = iv_body.
    DATA:lv_title TYPE string.
    lv_title = '获取整改函信息(ZCL_ICEC_MERCHANT_API->GET_RECTIFICATION_LETTER)'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
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
                         data = ev_url ).


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


METHOD GET_STORENAME_COUNT.

  DATA:lv_uri          TYPE string,
       lv_body         TYPE string,
       lv_rfcdest      TYPE rfcdest,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'MERCHANT' AND method = 'GET_STORENAME_COUNT'.

  lv_uri = ls_ztint_icec_api-url.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
  ELSE ls_ztint_icec_api-rfcdest ).


*lv_body = |\{ "cityGeoId": "","companyZoneId": "","countyGeoId": "","createdStampFrom": "","createdStampTo": "","customerManager": "",|
*&& |"enabled": false,"id": "","name": "{ iv_storename }","pageId": "","pageNum": "","pageSize": "","provinceGeoId": "","signServices": [""],|
*&& | "test": false,"type": "","vendorId": ""\}|.

*lv_body = |\{ "name": "{ iv_storename }","enabled": true \}|.
 lv_body = |\{ "name": "{ iv_storename }" \}|.
  ls_content_type-content_type = 'application/json;charset=UTF-8'.
  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  CALL METHOD lo_api->post_data(
    EXPORTING
      iv_rfcdest      = lv_rfcdest "'PLATFORM'
      iv_uri          = lv_uri
      is_content_type = ls_content_type
      iv_body         = lv_body
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
  ELSE.
    ev_msg-type = 'E'.
    ev_msg-id = '400'.
    ev_msg-message = '请检查系统传入参数'.
  ENDIF.
 IF ls_ztint_icec_api-nolog IS INITIAL.
 save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
 ENDIF.


ENDMETHOD.


METHOD GET_STORENAME_LIST.

  DATA:lv_uri          TYPE string,
       lv_body         TYPE string,
       lv_rfcdest      TYPE rfcdest,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'MERCHANT' AND method = 'GET_STORENAME_LIST'.

  lv_uri = ls_ztint_icec_api-url.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
  ELSE ls_ztint_icec_api-rfcdest ).


*lv_body = |\{ "cityGeoId": "","companyZoneId": "","countyGeoId": "","createdStampFrom": "","createdStampTo": "","customerManager": "",|
*&& |"enabled": false,"id": "","name": "{ iv_storename }","pageId": "","pageNum": "","pageSize": "","provinceGeoId": "","signServices": [""],|
*&& | "test": false,"type": "","vendorId": ""\}|.

*lv_body = |\{ "name": "{ iv_storename }","enabled": true \}|.
 lv_body = |[\{ "code": "{ iv_storecode }","name": "{ iv_storename }" \}]|.
  ls_content_type-content_type = 'application/json;charset=UTF-8'.
  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  CALL METHOD lo_api->post_data(
    EXPORTING
      iv_rfcdest      = lv_rfcdest "'PLATFORM'
      iv_uri          = lv_uri
      is_content_type = ls_content_type
      iv_body         = lv_body
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
  ELSE.
    ev_msg-type = 'E'.
    ev_msg-id = '400'.
    ev_msg-message = '请检查系统传入参数'.
  ENDIF.
 IF ls_ztint_icec_api-nolog IS INITIAL.
 save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
 ENDIF.


ENDMETHOD.


  METHOD get_store_by_vendorid.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT'
      AND method = 'GET_STORE_BY_VENDORID'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{vendorId}' IN lv_uri WITH vendorid.

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
                         data = et_storeinf ).

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


  METHOD get_store_invoiceconfig.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT'
      AND method = 'GET_STORE_INVOICECONFIG'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{productStoreId}' IN lv_uri WITH iv_productstoreid.

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
                         data = es_output ).

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


METHOD GET_USERCELLPHONE_COUNT.

  DATA:lv_uri          TYPE string,
       lv_body         TYPE string,
       lv_rfcdest      TYPE rfcdest,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'MERCHANT' AND method = 'GET_USERCELLPHONE_COUNT'.

  lv_uri = ls_ztint_icec_api-url.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
  ELSE ls_ztint_icec_api-rfcdest ).


  REPLACE '{cellphone}' IN lv_uri WITH iv_cellphone.


  ls_content_type-content_type = 'application/json;charset=UTF-8'.

  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  CALL METHOD lo_api->get_data(
    EXPORTING
      iv_rfcdest      = lv_rfcdest
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
  ELSE.
    ev_msg-type = 'E'.
    ev_msg-id = '400'.
    ev_msg-message = '请检查系统传入参数'.
  ENDIF.
 IF ls_ztint_icec_api-nolog IS INITIAL.
 save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
 ENDIF.


ENDMETHOD.


METHOD GET_USER_VENDOR_RELATION.

  DATA:lv_uri          TYPE string,
       lv_body         TYPE string,
       lv_rfcdest      TYPE rfcdest,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.
  DATA es_punishinfo TYPE zmer_s_punishinfo .

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'MERCHANT' AND method = 'GET_USER_VENDOR_RELATION'.

  lv_uri = ls_ztint_icec_api-url.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
  ELSE ls_ztint_icec_api-rfcdest ).
  REPLACE '{vendorId}' IN lv_uri WITH iv_vendorId.


  ls_content_type-content_type = 'application/json;charset=UTF-8'.

  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  CALL METHOD lo_api->get_data(
    EXPORTING
      iv_rfcdest      = lv_rfcdest
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
  ELSE.
    ev_msg-type = 'E'.
    ev_msg-id = '400'.
    ev_msg-message = '请检查系统传入参数'.
  ENDIF.
 IF ls_ztint_icec_api-nolog IS INITIAL.
 save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
 ENDIF.

ENDMETHOD.


METHOD get_vendorcode_byuserloginid.

  DATA:lv_uri          TYPE string,
       lv_body         TYPE string,
       lv_rfcdest      TYPE rfcdest,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'MERCHANT' AND method = 'GET_VENDORCODE_BYUSERLOGINID'.

  lv_uri = ls_ztint_icec_api-url.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
  ELSE ls_ztint_icec_api-rfcdest ).


  REPLACE '{userLoginId}' IN lv_uri WITH iv_userloginid.


  ls_content_type-content_type = 'application/json;charset=UTF-8'.

  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  CALL METHOD lo_api->get_data(
    EXPORTING
      iv_rfcdest      = lv_rfcdest
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
  ELSE.
    ev_msg-type = 'E'.
    ev_msg-id = '400'.
    ev_msg-message = '请检查系统传入参数'.
  ENDIF.
 IF ls_ztint_icec_api-nolog IS INITIAL.
 save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
 ENDIF.


ENDMETHOD.


METHOD get_vendorcode_by_cellphone.

  DATA(lo_merchant) = NEW zcl_icec_merchant_api( ).

  lo_merchant->get_usercellphone_count( EXPORTING iv_cellphone = iv_cellphone IMPORTING ev_msg = DATA(ev_msg3) es_data = DATA(ls_return) ).
  IF ls_return-joinparty = 'X'.  "表示有挂靠在组织下
    "获取挂靠在那个组织下
    lo_merchant->get_vendorcode_byuserloginid( EXPORTING iv_userloginid = ls_return-userloginid IMPORTING ev_msg = DATA(ev_msg5) es_data = DATA(ls_code) ).
    iv_vendorcode = ls_code-code.
    iv_vendorid = ls_code-id.
  ENDIF.
  iv_userloginid = ls_return-userloginid.

ENDMETHOD.


  method GET_VENDORINF_BYSTOREID.

  DATA:lv_uri          TYPE string,
       lv_body         TYPE string,
       lv_rfcdest      TYPE rfcdest,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'MERCHANT' AND method = 'GET_VENDORINF_BYSTOREID'.

  lv_uri = ls_ztint_icec_api-url.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
  ELSE ls_ztint_icec_api-rfcdest ).


  REPLACE '{storeId}' IN lv_uri WITH iv_storeId.


  ls_content_type-content_type = 'application/json;charset=UTF-8'.

  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  CALL METHOD lo_api->get_data(
    EXPORTING
      iv_rfcdest      = lv_rfcdest
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
  ELSE.
    ev_msg-type = 'E'.
    ev_msg-id = '400'.
    ev_msg-message = '请检查系统传入参数'.
  ENDIF.
 IF ls_ztint_icec_api-nolog IS INITIAL.
 save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
 ENDIF.

  endmethod.


METHOD GET_VENDORNAME_COUNT.

  DATA:lv_uri          TYPE string,
       lv_body         TYPE string,
       lv_rfcdest      TYPE rfcdest,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'MERCHANT' AND method = 'GET_VENDORNAME_COUNT'.

  lv_uri = ls_ztint_icec_api-url.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
  ELSE ls_ztint_icec_api-rfcdest ).

*  lv_body = |\{"endDate":"{ iv_enddate }","idOrName":"{ iv_idorname }","page":"{ iv_page }","size":"{ iv_size }","startDate":"{ iv_startdate }","warehouseType":"{ iv_warehousetype }"\}|.

*lv_body = |\{ "cityGeoId": "","code": "","companyZoneId": "","countyGeoId": "","createdStampFrom": "","createdStampTo": "","customerManager": "",|
*&& |"enabled": null,"id": "","name": "{ iv_vendorname }","pageNum": "","pageSize": "","provinceGeoId": "","regCode": "","test": null,"unifiedSocialCreditCode": ""\}|.

lv_body = |\{ "enabled":true,"name": "{ iv_vendorname }" \}|.

  ls_content_type-content_type = 'application/json;charset=UTF-8'.
  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  CALL METHOD lo_api->post_data(
    EXPORTING
      iv_rfcdest      = lv_rfcdest "'PLATFORM'
      iv_uri          = lv_uri
      is_content_type = ls_content_type
      iv_body         = lv_body
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
  ELSE.
    ev_msg-type = 'E'.
    ev_msg-id = '400'.
    ev_msg-message = '请检查系统传入参数'.
  ENDIF.
 IF ls_ztint_icec_api-nolog IS INITIAL.
 save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
 ENDIF.


ENDMETHOD.


  METHOD get_venoff_score.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'VENOFF'
      AND method = 'GET_VENOFF_SCORE'.

    lv_uri = ls_ztint_icec_api-url.


    REPLACE  '{storeId}' IN lv_uri WITH iv_storeid.
    REPLACE '{date}' IN lv_uri WITH iv_date.
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
                         data = et_scorelist ).


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


  METHOD get_venproduct_check.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_VENPRODUCT_CHECK'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.

    DATA: lv_body TYPE string.

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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD get_venstock_brand.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_VENSTOCK_BRAND'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{subjectId}' IN lv_uri WITH iv_storeid.

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
                         data = et_stockbrand ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD get_venstock_detail.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_VENSTOCK_DETAIL'.

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
        ev_msg          = ev_msg ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_stockdetail ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD get_venstock_overview.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_VENSTOCK_OVERVIEW'.

    lv_uri = ls_ztint_icec_api-url.

    DATA: lv_body TYPE string.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA:lv_title TYPE string.
    lv_title = '获取库存对接概览(ZCL_ICEC_MERCHANT_API->GET_VENSTOCK_OVERVIEW)'.
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
        ev_msg          = ev_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_stockoverview ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD get_venstock_result.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'GET_VENSTOCK_RESULT'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{subjectId}' IN lv_uri WITH iv_storeid.

    DATA: lv_body TYPE string.

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
                         data = et_stockresult ).
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD get_venstore_apply.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT'
      AND method = 'GET_VENSTORE_APPLY'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{StoreId}' IN lv_uri WITH iv_storeid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title TYPE string.
    lv_title = '获取店铺开设申请详情(ZCL_ICEC_MERCHANT_API->GET_VENSTORE_APPLY)'.

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
                        data = es_storeapply ).

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


  METHOD get_ven_detail.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'USER' AND method = 'GET_VEN_DETAIL'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE  '{companyId}' IN lv_uri WITH iv_companyid.
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
                         data = es_veninfo ).

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


  METHOD publish_merchant_account.

    DATA: lv_str TYPE  zcl_json=>json.
    TYPES:      BEGIN OF ty_product,
                  id        TYPE string,
                  inventory TYPE  zcl_json=>json,
                END OF ty_product.
    DATA:lt_product TYPE SORTED TABLE OF ty_product WITH UNIQUE KEY id.
    DATA: lt_inventorys TYPE zprod_t_inventorys.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_rfcdest TYPE rfcdest.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT'
      AND method = 'PUBLISH_MERCHANT_ACCOUNT'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    lv_body = iv_body.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = lv_rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
*       iv_title        = lv_title
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
                         data = es_signinfo ) .

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
*    IF ev_msg-type = 'E'.
*
*      CALL FUNCTION 'MESSAGE_TEXT_BUILD'
*      EXPORTING
*        msgid = sy-msgid
*        msgnr = sy-msgno
*        msgv1 =  sy-msgv1
*        msgv2 = sy-msgv2
*        msgv3 = sy-msgv3
*        msgv4 = sy-msgv4
*        IMPORTING
*        message_text_output = ev_msg-message.
*    ENDIF.
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_requestbody = lv_body iv_responsebody = lv_out ).
    ENDIF.

  ENDMETHOD.


  METHOD REPAIR_COMPENSATION_COMPLETE.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'REPAIR' AND method = 'REPAIR_COMPENSATION_COMPLETE'.

    lv_uri = ls_ztint_icec_api-url.

    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                         ELSE ls_ztint_icec_api-rfcdest ).

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
    ENDIF.
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
    ENDIF.

  ENDMETHOD.


  METHOD REPAIR_COMPENSATION_REJECT.

    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'REPAIR' AND method = 'REPAIR_COMPENSATION_REJECT'.

    lv_uri = ls_ztint_icec_api-url.

    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                         ELSE ls_ztint_icec_api-rfcdest ).

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.
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


  METHOD send_merchant_punishinfo.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA es_punishinfo TYPE zmer_s_punishinfo .
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT'
      AND method = 'SEND_MERCHANT_PUNISHINFO'.

    lv_uri = ls_ztint_icec_api-url.

    DATA: lv_body TYPE string.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_body = iv_body.
    DATA:lv_title TYPE string.
    lv_title = '发送处罚函(ZCL_ICEC_MERCHANT_API->SEND_MERCHANT_PUNISHINFO)'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
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
                         data = es_punishinfo ).
          IF es_punishinfo-orderid IS NOT INITIAL.
            ev_msg-type = 'S'.
            ev_msg-id = '200'.
            ev_msg-message = 'JSON成功解析'.
          ELSE.
            ev_msg-type = 'E'.
            ev_msg-id = '400'.
            ev_msg-message = '请检查系统传入参数'.
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
    ELSE.
      ev_msg-type = 'E'.
      ev_msg-id = '400'.
      ev_msg-message = '请检查系统传入参数'.

    ENDIF.
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
    ENDIF.


  ENDMETHOD.


  METHOD send_rectification_letter.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'VENOFF'
      AND method = 'SEND_RECTIFICATION_LETTER'.

    lv_uri = ls_ztint_icec_api-url.

    DATA: lv_body TYPE string.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_body = iv_body.
    DATA:lv_title TYPE string.
    lv_title = '发送整改函(ZCL_ICEC_MERCHANT_API->SEND_RECTIFICATION_LETTER)'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
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
                         data = es_rectification ).


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


  METHOD singleremind_merchant.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_body TYPE string.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'SINGLEREMIND_MERCHANT'.

    lv_uri = ls_ztint_icec_api-url.
    ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    lv_body = iv_body.
    CALL METHOD lo_api->put_data
      EXPORTING
        iv_rfcdest      = ls_ztint_icec_api-rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
      IMPORTING
        json_out        = lv_out
        ev_msg          = es_msg.

    IF lv_out IS NOT INITIAL .  "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_approvecon ) .
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


  METHOD update_offline_audit.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_body TYPE string.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'UPDATE_OFFLINE_AUDIT'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    lv_body = iv_body.
    DATA:lv_title TYPE string.
    lv_title = '拓展审核主动申请下线结果(ZCL_ICEC_MERCHANT_API->UPDATE_OFFLINE_AUDIT)'.
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

    IF lv_out IS NOT INITIAL .  "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_return ) .
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


  METHOD update_storeapply_audit.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_body TYPE string.
    DATA lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT'
      AND method = 'UPDATE_STOREAPPLY_AUDIT'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title TYPE string.
    lv_title = '同步店铺开设申请审核结果至平台(ZCL_ICEC_MERCHANT_API->UPDATE_STOREAPPLY_AUDIT)'.

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
        ev_msg          = ev_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                          data = es_vensapply ) .


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


  METHOD update_store_by_storeid.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT'
      AND method = 'UPDATE_STORE_BY_STOREID'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    lv_title = '店铺信息修改后同步数据给平台(ZCL_ICEC_MERCHANT_API->UPDATE_STORE_BY_STOREID)'.
    lv_body = iv_body.
    CALL METHOD lo_api->put_data
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

*          /ui2/cl_json=>deserialize(
*                      EXPORTING
*                         json = lv_out
*                      CHANGING
*                          data = DATA(es_carinfo) ) .


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


  METHOD update_ven_manager.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MERCHANT' AND method = 'UPDATE_VEN_MANAGER'.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out    TYPE string,
          lv_output TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    CALL METHOD lo_api->put_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = iv_body
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.
    IF lv_out IS NOT INITIAL.
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out

                         CHANGING
                         data = lv_output  ).
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
ENDCLASS.
