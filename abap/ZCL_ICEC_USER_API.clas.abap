CLASS zcl_icec_user_api DEFINITION
PUBLIC
FINAL
CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
*钱包交易流水
      BEGIN OF ts_tradedata,
        amount             TYPE string, "// 交易金额
        counterparty       TYPE string, "// 交易对手方
        id                 TYPE string, "// id
        merchantcode       TYPE string, "// 商户号
        merchantname       TYPE string, "// 商户名称
        merchantorderno    TYPE string, "// 商户订单号
        moneyflow          TYPE string, "// 资金流向
        tradedate          TYPE string, "// 交易时间
        trademode          TYPE string, "// 业务类型编码
        tradename          TYPE string, "// 业务类型
        tradeorderno       TYPE string, "// 支付单号
        tradepayorderno    TYPE string, "// 交易单号
        traderefundorderno TYPE string, "// 交易退单号
        tradestatus        TYPE string, "// 交易状态
        walletaccountname  TYPE string, "// 会员名称
        walletbalance      TYPE string, "// 钱包余额
        walletcode         TYPE string, "// 钱包ID
      END OF ts_tradedata .
    TYPES:
      BEGIN OF ts_tradeflow,
        data      TYPE STANDARD TABLE OF ts_tradedata WITH DEFAULT KEY, "
        pagenum   TYPE string, "// null
        pagesize  TYPE string, "// null
        remarkmap TYPE string, "// null
        totalnum  TYPE string, "// null
      END OF ts_tradeflow .
    TYPES:
      BEGIN OF ts_wallet_tradeflow,
        code         TYPE string,
        errormessage TYPE string,
        data         TYPE ts_tradeflow,
      END OF ts_wallet_tradeflow .
    TYPES:
      BEGIN OF ts_goldcoin ,
        providedcount TYPE string,
        reason        TYPE string,
        tag           TYPE string,
      END OF ts_goldcoin .
    TYPES:
    tt_goldcoin TYPE STANDARD TABLE OF ts_goldcoin WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_asrecord,
        id                 TYPE string,
        garagecompanyid    TYPE string,
        garagerightid      TYPE string,
        rightid            TYPE string,
        righttype          TYPE string,
        aftersaleid        TYPE string,
        actualdeductamount TYPE string,
        externalusedamount TYPE string,
        usedstamp          TYPE string,
      END OF ts_asrecord .
    TYPES:
*  types TS_GROUPINFO .
      BEGIN OF ts_groupinfo,
        companycount     TYPE string,
        companygroupcode TYPE string,
        companygroupflag TYPE string,
        companygroupid   TYPE string,
        companygroupname TYPE string,
        companygrouptype TYPE string,
*  companyList TYPE STANDARD TABLE OF string,
        createdstamp     TYPE string,
        nabled           TYPE string,
      END OF ts_groupinfo .
    TYPES:
      BEGIN OF ts_companylevels,
        companyid       TYPE string,
        companyname     TYPE string,
        companycode     TYPE string,
        levelstar       TYPE string,
        provincegeoid   TYPE string,
        provincegeoname TYPE string,
        citygeoid       TYPE string,
        citygeoname     TYPE string,
        countygeoid     TYPE string,
        countygeoname   TYPE string,
        creditlevel     TYPE string,
      END OF ts_companylevels .
    TYPES:
      BEGIN OF ts_rolelist,
        roleid   TYPE string,
        rolename TYPE string,
      END OF ts_rolelist .
    TYPES:
    tt_rolelist TYPE STANDARD TABLE OF ts_rolelist WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_useroles,
        id           TYPE string,
        companyid    TYPE string,
        roleid       TYPE string,
        rolename     TYPE string,
        platformid   TYPE string,
        platformtype TYPE string,
      END OF ts_useroles .
    TYPES:
    tt_useroles TYPE STANDARD TABLE OF ts_useroles WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_recvenlist,
        dealofmonth TYPE string,
        quoterate   TYPE string,
        returnrate  TYPE string,
        storename   TYPE string,
        storecode   TYPE string,
        storestatus TYPE string,
        invoicetype TYPE string,
      END OF ts_recvenlist .
    TYPES:
    tt_recvenlist TYPE STANDARD TABLE OF ts_recvenlist WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_userlist,
        id            TYPE string,
        userloginid   TYPE string,
        userloginname TYPE string,
        username      TYPE string,
        contactnumber TYPE string,
        position      TYPE string,
        createdstamp  TYPE string,
      END OF ts_userlist .
    TYPES:
    tt_userlist TYPE STANDARD TABLE OF ts_userlist WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_cus_account,
        customermanager TYPE string, "姓名
        userloginname   TYPE string, "登录账号名
        userloginid     TYPE string,
        username        TYPE string,
        cellphone       TYPE string,
        contactnumber   TYPE string,
        position        TYPE string,
        createdstamp    TYPE string,
        enabled         TYPE string,
      END OF ts_cus_account .
    TYPES:
    tt_cus_account TYPE STANDARD TABLE OF ts_cus_account WITH DEFAULT KEY .
    TYPES:
*查询客户金币流水明细
      BEGIN OF ts_goldcoin_records_content,
        approveflowname    TYPE string, "// 审批流名称
        balance            TYPE string, "// 金币账户余额
        businessareaname   TYPE string, "// 业务领域
        companycode        TYPE string, "// 公司code
        companyid          TYPE string, "// 公司ID
        createdby          TYPE string, "// 创建者
        createdbyname      TYPE string, "// 按名称创建
        createdstamp       TYPE string, "// 创建时间
        dealnumber         TYPE string, "// 收支数量，扣减时用负数
        dealtype           TYPE string, "// 收支类型
        desc               TYPE string, "// 流水描述
        externalid         TYPE string, "// 外部ID
        garagename         TYPE string, "// 维修厂名称
        goldcoinaccountid  TYPE string, "// 金币账户ID
        id                 TYPE string, "// id
        orderid            TYPE string, "// 订单ID
        providetypename    TYPE string, "// 提供类型名称
        reasonremark       TYPE string, "// 发放理由备注（维修厂用户查看）
        reasontype         TYPE string, "// 发放理由
        relatedordernumber TYPE string, "// 关联订单号
        remark             TYPE string, "// 备注（后台查看）
      END OF ts_goldcoin_records_content .

    TYPES:
      BEGIN OF ts_goldcoin_records,
        content          TYPE STANDARD TABLE OF ts_goldcoin_records_content WITH DEFAULT KEY,
        first            TYPE string, "// null
        last             TYPE string, "// null
        number           TYPE string, "// null
        numberofelements TYPE string, "// null
        size             TYPE string, "// null
        "sort": {}, // null
        totalelements    TYPE string, "// null
        totalpages       TYPE string, "// null
      END OF ts_goldcoin_records.

    TYPES:
*查询个人金币账户收支流水
      BEGIN OF ts_goldcoin_content,
        approveflowname    TYPE string, "// 审批流名称
        balance            TYPE string, "// 金币账户余额
        businessareaname   TYPE string, "// 业务领域
        companycode        TYPE string, "// 公司code
        companyid          TYPE string, "// 公司ID
        createdby          TYPE string, "// 创建者
        createdbyname      TYPE string, "// 按名称创建
        createdstamp       TYPE string, "// 创建时间
        dealnumber         TYPE string, "// 收支数量，扣减时用负数
        dealtype           TYPE string, "// 收支类型
        desc               TYPE string, "// 流水描述
        externalid         TYPE string, "// 外部ID
        garagename         TYPE string, "// 维修厂名称
        goldcoinaccountid  TYPE string, "// 金币账户ID
        id                 TYPE string, "// id
        orderid            TYPE string, "// 订单ID
        providetypename    TYPE string, "// 提供类型名称
        reasonremark       TYPE string, "// 发放理由备注（维修厂用户查看）
        reasontype         TYPE string, "// 发放理由
        relatedordernumber TYPE string, "// 关联订单号
        remark             TYPE string, "// 备注（后台查看）
      END OF ts_goldcoin_content .
    TYPES:
      BEGIN OF ts_goldcoin_metadata,
        number        TYPE string, "// null
        size          TYPE string, "// null
        totalelements TYPE string, "// null
        totalpages    TYPE string, "// null
      END OF ts_goldcoin_metadata .
    TYPES:
      BEGIN OF ts_goldcoin_tradeflow,
        content          TYPE STANDARD TABLE OF ts_goldcoin_content WITH DEFAULT KEY, "// null
        first            TYPE string, "// null
        last             TYPE string, "// null
        metadata         TYPE ts_goldcoin_metadata, "// null
        number           TYPE string, "// null
        numberofelements TYPE string, "// null
        size             TYPE string, "// null
        sort             TYPE string, "// null
        totalelements    TYPE string, "// null
        totalpages       TYPE string, "// null
      END OF ts_goldcoin_tradeflow .
    TYPES:
*钱包账户查询
      BEGIN OF ts_bindcards,"// 绑定银行卡信息
        bankname             TYPE string, "// 银行名称/开户行
        bankcode             TYPE string, "// 银行编码
        cardtailno           TYPE string, "// 银行卡尾号
        cardno               TYPE string, "// 银行卡号
        bindcardtype         TYPE string, "// 绑卡类型：CP:个人账户 CE:对公账户
        cardholder           TYPE string, "// 持卡人姓名/户名
        remainnumber         TYPE string, "// 预留手机号
        createdtime          TYPE string, "// 绑卡申请时间
        cardtype             TYPE string, "// 卡种 1 借记卡  2 信用卡
        authenticationstatus TYPE string, "// 鉴权状态  0:鉴权失败  1:鉴权中  2:鉴权成功
        bizno                TYPE string, "// 唯一业务号
        cnsmrseqno           TYPE string, "// 交易流水号
        enterprisetype       TYPE string, "// 企业类型
      END OF ts_bindcards .
    TYPES:
      BEGIN OF ts_channelaccountbalances,"// 钱包子账户信息
        channelsubaccount     TYPE string, "// 渠道子账户
        channelmembercode     TYPE string, "// 渠道会员编码
        channelsubaccounttype TYPE string, "// 账户类型(1:普通账户2:商户账户)
        availablebalance      TYPE string, "// 可用余额
        withdrawalbalance     TYPE string, "// 可提现余额
        frozenbalance         TYPE string, "// 冻结余额
      END OF ts_channelaccountbalances .
    TYPES:
      BEGIN OF ts_receivingaccount,"// 指定收款账号信息
        pactstatus TYPE string, "// 授权协议签署状态;0:未签署,1:已签署
        storeid    TYPE string, "// 店铺id
        vendorid   TYPE string, "// 供应商id
        walletcode TYPE string, "// 指定收款账号
      END OF ts_receivingaccount .
    TYPES:
      BEGIN OF ts_enterprisewallet,"// 企业钱包账户信息
        walletcode             TYPE string, "// 会员id
        wallettype             TYPE string, "// cp-个人钱包 ce-企业钱包
        walletstatus           TYPE string, "// 0-未开通 1-已实名 2-未实名
        createddate            TYPE string, "// 注册时间
        receivingaccount       TYPE ts_receivingaccount, "// 指定收款账号信息
        enterprisename         TYPE string, "// 会员名称
        availablebalance       TYPE string, "// 钱包余额
        withdrawalbalance      TYPE string, "// 可提现余额
        frozenbalance          TYPE string, "// 冻结余额
        channelaccountbalances TYPE STANDARD TABLE OF ts_channelaccountbalances WITH DEFAULT KEY, "// 钱包子账户信息
        bindcards              TYPE STANDARD TABLE OF ts_bindcards WITH DEFAULT KEY, "// 绑定银行卡信息
      END OF ts_enterprisewallet .
    TYPES:
      BEGIN OF ts_personwallets,"// 用户钱包
        accountid         TYPE string, "// 一账通id
        availablebalance  TYPE string, "// 钱包余额
        frozenbalance     TYPE string, "// 冻结余额
        telephone         TYPE string, "// 用户手机号
        userloginid       TYPE string, "// 登录账号id
        userloginname     TYPE string, "// 登录账号
        username          TYPE string, "// 用户名
        walletcode        TYPE string, "// 钱包会员id
        walletpermission  TYPE string, "// 1-管理员权限 2-使用权限 3-无
        walletstatus      TYPE string, "// 0-未开通 1-已实名 2-未实名
        wallettype        TYPE string, "// cp-个人钱包 ce-企业钱包
        walletuserid      TYPE string, "// 钱包用户id
        walletusername    TYPE string, "// 钱包会员名称
        withdrawalbalance TYPE string, "// 可提现余额
      END OF ts_personwallets .
    TYPES:
      BEGIN OF ts_wallets,
        enterprisewallet TYPE ts_enterprisewallet, "// 企业钱包账户信息
        personwallets    TYPE STANDARD TABLE OF  ts_personwallets WITH DEFAULT KEY, "// 用户钱包
      END OF ts_wallets .
    TYPES:
      BEGIN OF ts_walletinf,
        code        TYPE string,
        data        TYPE ts_wallets,
        erromessage TYPE string,
      END OF ts_walletinf .
    TYPES:
      "add --权益类型
      BEGIN OF ts_useful_rights,
        rightid       TYPE string,  "权益Id
        righttype     TYPE string,  "权益类型
        righttypename TYPE string,  "权益类型名称
        aftersaletype TYPE string,  "售后类型
      END OF ts_useful_rights .
    TYPES:
    tt_useful_rights TYPE STANDARD TABLE OF ts_useful_rights WITH DEFAULT KEY .
    TYPES:
    "订单条目(配件)
    BEGIN OF ts_order2aftersale.
*      orderId type string,  "订单id
*      orderSeqId type string,"条目id
*      quantity type string,"数量
            INCLUDE TYPE zsint_orderlist.
    TYPES:
  END OF ts_order2aftersale .
    TYPES:
      BEGIN OF ts_rightorder2aftersale,
        garagecompanyid  TYPE string, "维修厂id
        order2aftersales TYPE STANDARD TABLE OF ts_order2aftersale WITH DEFAULT KEY, "配件
        rightid          TYPE string,  "权益类型id
        righttype        TYPE string, "权益类型
      END OF ts_rightorder2aftersale .
    TYPES:
      "--权益是否可用
      BEGIN OF ts_right_enable_rule,
        rightenable     TYPE string,  "是否可用
        usefultimes     TYPE string,  "可用次数
        rightamount     TYPE string,  "权益金额(快处快赔/无忧退货，金额共用)
        rightenabledesc TYPE string,  "前端文案交互
        overfifteen     TYPE string,  "
      END OF ts_right_enable_rule .
    TYPES:
    "订单不支持售后原因接口--平台售后申请按钮是否可点接口--add at 2021.09.22
    tt_order_input TYPE STANDARD TABLE OF string .                                  "订单号
    TYPES:
      BEGIN OF ts_order_item_button,
        orderid             TYPE string, "订单号
        orderitemseqid      TYPE string, "订单行号
        candisplay          TYPE string, "能否展示按钮
        cannotdisplayreason TYPE string, "不展示按钮的原因
        canclick            TYPE string, "能否点击按钮
        cannotclickreason   TYPE string, "不可点击按钮的原因
      END OF ts_order_item_button .
    TYPES:
      BEGIN OF ts_order_button,
        orderid             TYPE string, "订单号
        candisplay          TYPE string, "能否展示按钮
        cannotdisplayreason TYPE string, "不展示按钮的原因
        canclick            TYPE string, "能否点击按钮
        cannotclickreason   TYPE string, "不可点击按钮的原因
        itemdisplay         TYPE STANDARD TABLE OF ts_order_item_button WITH DEFAULT KEY,
      END OF ts_order_button .
    TYPES:
    tt_order_button TYPE STANDARD TABLE OF ts_order_button WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ty_customergroup,
        companyid       TYPE string,
        customergroupid TYPE string,
        result          TYPE string,
      END OF ty_customergroup .
    TYPES:
    tt_customergroup TYPE STANDARD TABLE OF ty_customergroup WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ty_storeinf,
        contactnumber     TYPE string, "联系电话
        contactperson     TYPE string, "联系人
        createdby         TYPE string, "创建人
        createdstamp      TYPE string, "创建时间
        customermanager   TYPE string, "客户经理
        customermanagerid TYPE string, "客户经理id
        email             TYPE string, "邮箱
        enabled           TYPE string, "是否有效
        fulfillparty      TYPE string, "是否履约方
        grouponly         TYPE string, "是否仅供供应集团客户
        id                TYPE string, "店铺id
        lastupdatedby     TYPE string, "最后更新人
        lastupdatedstamp  TYPE string, "最后更新时间
        name              TYPE string, "店铺名称
        remark            TYPE string, "店铺名称
        storeflag         TYPE string, "店铺标识（4S--4S；FACILITATOR--服务商；BRANDING--品牌商；4S_WARRANTY--全国4S联保；4S_SUPPORT--全国4S技术支持）轮胎品牌厂商（TIRE_BRAND_MANUFACTURER）、轮胎战略供应商（TIRE_STRATEGIC_SUPPLIER）、轮胎服务商（TIRE_FACILITATOR）
        storeinternalid   TYPE string, "店铺内部id
        storetype         TYPE string, "店铺类型（AGENT: 托盘商、DISTRIBUTOR：代理商、GENERAL：普通）
      END OF ty_storeinf .
    TYPES:
    tt_storeinf TYPE STANDARD TABLE OF ty_storeinf WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ty_custag,
        categoryid   TYPE string, "标签分类Id
        categoryname TYPE string, "标签分类名称
        companyid    TYPE string, "公司Id
        createdby    TYPE string, "创建人
        createdstamp TYPE string, "创建时间
        id           TYPE string, "标签Id
        tagcode      TYPE string, "标签编码
        tagname      TYPE string, "标签名称
      END OF ty_custag .
    TYPES:
    tt_custag TYPE STANDARD TABLE OF ty_custag WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ty_save_custag,
        businesstype  TYPE string, "业务类型
        conditiontype TYPE string, " 标签条件类型：下单周期、询价周期、认证周期、售中次数、售后次数、下单次数、询价次数、咨询次数、工单次数
        companyid     TYPE string, "公司ID
        externalid    TYPE string, "单据ID
        number        TYPE string, "次数，如不需要生成下n单标签，可填写0
        operator      TYPE string, "操作人
      END OF ty_save_custag .
    TYPES:
      BEGIN OF ty_tag,
        tagid      TYPE string,
        categoryid TYPE string,
        code       TYPE string,
        name       TYPE string,
        remark     TYPE string,
        enabled    TYPE string,
      END OF ty_tag .
    TYPES:
      BEGIN OF ty_tagsnapshot,
        companyid  TYPE string,
        externalid TYPE string,
        tags       TYPE STANDARD TABLE OF  ty_tag WITH DEFAULT KEY,
      END OF ty_tagsnapshot .
    TYPES:
      BEGIN OF ty_legalinf,
        authorizedcellphone TYPE string, "授权人手机号
        authorizedidentity  TYPE string, "授权人证件号
        authorizedname      TYPE string, "授权人姓名
        companyid           TYPE string, "店铺/维修厂ID
        legalcellphone      TYPE string, "法人手机号
        legalidentity       TYPE string, "法人证件号
        legalname           TYPE string, "法人姓名
        profilestatus       TYPE string, "资料状态
      END OF ty_legalinf .
    TYPES:
    tt_legalinf TYPE STANDARD TABLE OF ty_legalinf WITH DEFAULT KEY .

    METHODS update_customer_manager
      IMPORTING
        !iv_body TYPE string
      EXPORTING
        !es_msg  TYPE bapiret2 .
    METHODS get_usercompanyid_roles
      IMPORTING
        VALUE(iv_companyid) TYPE string
        !iv_body            TYPE string
      EXPORTING
        VALUE(ev_msg)       TYPE bapiret2
        VALUE(et_useroles)  TYPE tt_useroles .
    METHODS get_userlist_bycompanyid
      IMPORTING
        VALUE(iv_companyid) TYPE string
      EXPORTING
        VALUE(ev_msg)       TYPE bapiret2
        VALUE(et_userlist)  TYPE tt_userlist .
    METHODS get_userslist_byuserloginids
      IMPORTING
        VALUE(iv_data)     TYPE string
      EXPORTING
        VALUE(et_userlist) TYPE zuser_t_userslist
        VALUE(ev_msg)      TYPE bapiret2 .
    METHODS delete_companytags_bycompanyid
      IMPORTING
        !iv_data              TYPE string
      EXPORTING
        VALUE(ev_msg)         TYPE bapiret2
        VALUE(es_companytags) TYPE zuser_s_companytags .
    METHODS add_companytags_bycompanyid
      IMPORTING
        !iv_data              TYPE string
      EXPORTING
        VALUE(ev_msg)         TYPE bapiret2
        VALUE(es_companytags) TYPE zuser_s_companytags .
    METHODS get_companylevels_bycompanyid
      IMPORTING
        VALUE(iv_companyid)     TYPE string
      EXPORTING
        VALUE(es_companylevels) TYPE ts_companylevels
        VALUE(ev_msg)           TYPE bapiret2 .
    METHODS get_roleslist_bycompanyandrole
      IMPORTING
        VALUE(iv_companytype) TYPE string DEFAULT 'SUPPLIER'
        VALUE(iv_roletype)    TYPE string DEFAULT 'COMMON'
      EXPORTING
        !et_rolelist          TYPE tt_rolelist
        !ev_msg               TYPE bapiret2 .
    METHODS get_goldcoin_records
      IMPORTING
        VALUE(iv_recordquery) TYPE string OPTIONAL
      EXPORTING
        !ev_msg               TYPE bapiret2
        !ev_data              TYPE ts_goldcoin_records .
    METHODS get_goldcoin_tradeflow
      IMPORTING
        VALUE(iv_userloginid) TYPE string OPTIONAL
        VALUE(iv_pagenum)     TYPE string OPTIONAL
        VALUE(iv_pagesize)    TYPE string OPTIONAL
      EXPORTING
        !ev_msg               TYPE bapiret2
        !es_data              TYPE ts_goldcoin_tradeflow .
    METHODS get_walletinf_bycompanyid
      IMPORTING
        VALUE(iv_type)    TYPE string OPTIONAL
        VALUE(iv_queryid) TYPE string OPTIONAL
      EXPORTING
        !ev_msg           TYPE bapiret2
        !es_walletinf     TYPE ts_walletinf .
    METHODS get_cusaccount_bycompanyid
      IMPORTING
        VALUE(iv_companyid) TYPE string OPTIONAL
      EXPORTING
        !ev_msg             TYPE bapiret2
        !et_cusaccount      TYPE tt_cus_account .
    METHODS get_userslist_byuserloginname
      IMPORTING
        VALUE(iv_loginname) TYPE string
      EXPORTING
        VALUE(es_userlist)  TYPE zuser_s_userlist
        VALUE(ev_msg)       TYPE bapiret2 .
    METHODS update_company_info
      IMPORTING
        !iv_body TYPE string
      EXPORTING
        !es_msg  TYPE bapiret2 .
    METHODS get_companygroup_info
      IMPORTING
        VALUE(iv_companygroupid) TYPE string
      EXPORTING
        VALUE(ev_msg)            TYPE bapiret2
        VALUE(es_output)         TYPE ts_groupinfo .
    METHODS get_garage_useful_rights
      IMPORTING
        VALUE(iv_garagecompanyid) TYPE string
      EXPORTING
        !es_msg                   TYPE bapiret2
        !et_output                TYPE tt_useful_rights .
    METHODS get_whether_useful_right
      IMPORTING
        VALUE(is_order2aftersales) TYPE ts_rightorder2aftersale
      EXPORTING
        !es_msg                    TYPE bapiret2
        !es_output                 TYPE ts_right_enable_rule .
    METHODS get_rightrecord_byasid
      IMPORTING
        !iv_asid   TYPE string
      EXPORTING
        !ev_msg    TYPE bapiret2
        !es_record TYPE ts_asrecord .
    METHODS get_order_aftersale_button
      IMPORTING
        VALUE(it_orderid) TYPE tt_order_input
      EXPORTING
        !ev_msg           TYPE bapiret2
        !et_displaybutton TYPE tt_order_button .
    METHODS get_customergroups_exit
      IMPORTING
        VALUE(it_customergroup) TYPE tt_customergroup OPTIONAL
      EXPORTING
        !ev_msg                 TYPE bapiret2
        !et_customergroup       TYPE tt_customergroup .
    METHODS get_user_store_listbyids
      IMPORTING
        VALUE(iv_body) TYPE string
      EXPORTING
        !es_msg        TYPE bapiret2
        !et_storeinf   TYPE tt_storeinf .
    METHODS get_companytags
      IMPORTING
        VALUE(companyid) TYPE string
      EXPORTING
        !ev_msg          TYPE bapiret2
        !et_custag       TYPE tt_custag .
    METHODS save_companytags
      IMPORTING
        VALUE(es_custag) TYPE ty_save_custag
      EXPORTING
        !ev_msg          TYPE bapiret2 .
    METHODS get_companytags_byexternalid
      IMPORTING
        VALUE(externalid) TYPE string
      EXPORTING
        !es_custag        TYPE ty_tagsnapshot
        !ev_msg           TYPE bapiret2 .
    METHODS get_company_legalauthorized
      IMPORTING
        !iv_body           TYPE string
      EXPORTING
        !ev_msg            TYPE bapiret2
      RETURNING
        VALUE(et_legalinf) TYPE tt_legalinf .
    METHODS get_company_goldcoin
      IMPORTING
        VALUE(iv_body) TYPE string
      EXPORTING
        VALUE(ev_msg)  TYPE bapiret2
        VALUE(et_data) TYPE tt_goldcoin .
    METHODS get_wallet_tradeflow
      IMPORTING
        VALUE(iv_body) TYPE string
      EXPORTING
        VALUE(ev_msg)  TYPE bapiret2
        VALUE(es_data) TYPE ts_wallet_tradeflow .
    METHODS get_recvenlist
      IMPORTING
        VALUE(iv_brandcode)  TYPE string
        !iv_body             TYPE string
      EXPORTING
        VALUE(ev_msg)        TYPE bapiret2
        VALUE(et_recvenlist) TYPE tt_recvenlist .
  PROTECTED SECTION.
private section.

  methods SAVE_API_LOG
    importing
      value(EV_MSG) type BAPIRET2 optional
      value(IV_COMMIT) type CHAR01 optional
      value(IV_KEYVALUE) type STRING optional
      value(IV_REQUESTBODY) type STRING optional
      value(IV_RESPONSEBODY) type STRING optional .
ENDCLASS.



CLASS ZCL_ICEC_USER_API IMPLEMENTATION.


  METHOD add_companytags_bycompanyid.


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
      WHERE service = 'USER'
      AND method = 'ADD_COMPANYTAGS_BYCOMPANYID'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    lv_title = '新增维修厂公司标签(ZCL_ICEC_USER_API->ADD_COMPANYTAGS_BYCOMPANYID)'.
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
                         data = es_companytags ) .


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


  METHOD delete_companytags_bycompanyid.


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
      WHERE service = 'USER'
      AND method = 'DELETE_COMPANYTAGS_BYCOMPANYID'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.

    lv_body = iv_data.
    CALL METHOD lo_api->delete_data
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
                         data = es_companytags ) .


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


  METHOD get_companygroup_info.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'USER'
      AND method = 'GET_COMPANYGROUP_INFO'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyGroupId}' IN lv_uri WITH iv_companygroupid.

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg  iv_responsebody = lv_out ).
   ENDIF.
  ENDMETHOD.


  METHOD get_companylevels_bycompanyid.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'USER'
      AND method = 'GET_COMPANYLEVELS_BYCOMPANYID'.

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
        ev_msg          = DATA(ls_msg)
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_companylevels  ).


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


  METHOD get_companytags.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'TAG'
      AND method = 'GET_COMPANYTAGS'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{?companyId}' WITH companyid INTO lv_uri.
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
                         data = et_custag  ).

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


  METHOD get_companytags_byexternalid.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'TAG'
      AND method = 'GET_COMPANYTAGS_BYEXTERNALID'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{?externalId}' WITH externalid INTO lv_uri.
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
                         data = es_custag  ).
          DELETE es_custag-tags WHERE enabled = '' OR enabled = 'false'.
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


  METHOD get_company_goldcoin.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_out          TYPE string,
         lv_body         TYPE string,
         lv_title        TYPE string,
         lv_rfcdest      TYPE rfcdest.

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'USER' AND method = 'GET_COMPANY_GOLDCOIN'.
    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                          ELSE ls_ztint_icec_api-rfcdest ).

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    lv_title = '通过公司代码查询指定日期指定类型的金币统计'.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
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

    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_data ) .

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


  METHOD get_company_legalauthorized.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_body TYPE string.
    DATA lv_body1 TYPE string.
    DATA lv_title TYPE string.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'AGREEMENT' AND method = 'GET_COMPANY_LEGALAUTHORIZED'.
    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    "调用接口
    lv_title = '批量查询公司法人授权人信息(ZCL_ICEC_USER_API->GET_COMPANY_LEGALAUTHORIZED)'.
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
                         data =  et_legalinf ) .
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


  METHOD get_cusaccount_bycompanyid.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'USER'
      AND method = 'GET_CUSACCOUNT_BYCOMPANYID'.

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
                         data = et_cusaccount  ).

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


  METHOD get_customergroups_exit.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_body TYPE string.
    DATA lv_body1 TYPE string.
    DATA lv_title TYPE string.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'USER' AND method = 'GET_CUSTOMERGROUPS_EXIT'.
    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    LOOP AT it_customergroup INTO DATA(ls_group).
      lv_body1 =  '{' && |"customerGroupId":"{ ls_group-customergroupid }", "companyId":"{ ls_group-companyid }"| && '}'.
      lv_body = COND #( WHEN lv_body IS INITIAL THEN lv_body1 ELSE |{ lv_body1 },{ lv_body1 }| ).
      CLEAR lv_body1.
    ENDLOOP.
    lv_body = |[{ lv_body }]|.
    "调用接口
    lv_title = '批量查询客户分组(ZCL_ICEC_USER_API->GET_CUSTOMERGROUPS_EXIT)'.
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
                         data = et_customergroup ) .
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


  METHOD get_garage_useful_rights.

    DATA:lv_uri             TYPE string,
         lv_garagecompanyid TYPE string,
         ls_content_type    TYPE zapi_s_contenttype,
         lv_out             TYPE string.

*&---取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'AFTERSALE' AND method = 'GET_GARAGE_USEFUL_RIGHTS'.
    lv_uri = ls_ztint_icec_api-url.
    CALL METHOD cl_http_utility=>escape_url
      EXPORTING
        unescaped = iv_garagecompanyid
      RECEIVING
        escaped   = lv_garagecompanyid.
    REPLACE '{garageCompanyId}' IN  lv_uri WITH lv_garagecompanyid.

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = es_msg  iv_responsebody = lv_out ).
   ENDIF.

  ENDMETHOD.


METHOD get_goldcoin_records.

  DATA:
    ls_content_type TYPE zapi_s_contenttype,
    lv_out          TYPE string,
    lv_title        TYPE string,
    lv_uri          TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'WALLET' AND method = 'GET_GOLDCOIN_RECORDS'.
  lv_uri = ls_ztint_icec_api-url.
  REPLACE '{recordQuery}' IN lv_uri WITH iv_recordQuery.

  ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
  ls_content_type-content_type = 'application/json;charset=UTF-8'.

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
    REPLACE '"@class":"com.casstime.ec.cloud.spi.PagedModelsImpl",' WITH '' INTO lv_out.
    TRY.
        /ui2/cl_json=>deserialize(
        EXPORTING
          json = lv_out
        CHANGING
        data = ev_data  ).

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


METHOD get_goldcoin_tradeflow.
  DATA:lv_uri          TYPE string,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'WALLET'
        AND method = 'GET_GOLDCOIN_TRADEFLOW'.

  IF iv_pagenum IS INITIAL.
    iv_pagenum = 1.
  ENDIF.
  IF iv_pagesize IS INITIAL.
    iv_pagesize = 20.
  ENDIF.

  lv_uri = ls_ztint_icec_api-url.
  REPLACE '{userLoginId}' IN lv_uri WITH iv_userloginid.
  REPLACE '{pageNum}' IN lv_uri WITH iv_pagenum.
  REPLACE '{pageSize}' IN lv_uri WITH iv_pagesize.

  ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
  ls_content_type-content_type = 'application/json;charset=UTF-8'.

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
    REPLACE '"@class": "com.casstime.ec.cloud.spi.PagedModelsImpl",' WITH '' INTO lv_out.
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


  METHOD get_order_aftersale_button.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_out TYPE string.
    DATA:lv_orderid TYPE string.

    CLEAR:lv_orderid.
    LOOP AT it_orderid INTO DATA(ls_id).
      IF lv_orderid IS INITIAL.
        lv_orderid = ls_id.
      ELSE.
        lv_orderid = lv_orderid && ',' && ls_id.  "订单ID列表,逗号分隔
      ENDIF.
    ENDLOOP.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'ORDER'
        AND method = 'GET_ORDER_AFTERSALE_BUTTON'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{orderIds}' IN lv_uri WITH lv_orderid.

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
                         data = et_displaybutton  ).

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


  METHOD get_recvenlist.
    DATA:lv_url          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'
      AND method = 'GET_REC_VEN_LIST'.

    lv_url = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA:lv_title TYPE string.
    lv_title = '批量通过汽车品牌获取推荐店铺报价'.
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


    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_recvenlist ) .

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
   save_api_log( EXPORTING iv_keyvalue = lv_url ev_msg = ev_msg  iv_requestbody = iv_body iv_responsebody = lv_out ).
   ENDIF.

  ENDMETHOD.


  METHOD get_rightrecord_byasid.

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
      WHERE service = 'USER' AND method = 'GET_RIGHTRECORD_BYASID'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{aftersaleId}' IN lv_uri WITH iv_asid.

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
                         data = es_record  ).

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


  METHOD get_roleslist_bycompanyandrole.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'USER'
      AND method = 'GET_ROLESLIST_BYCOMPANYTYPEANDROLETYPE'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyType}' IN lv_uri WITH iv_companytype.
    REPLACE '{roleType}' IN lv_uri WITH iv_roletype.

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
                         data = et_rolelist  ).
          DATA:lt_role TYPE STANDARD TABLE OF ztint_ven_role.
          lt_role = VALUE #( FOR wa IN et_rolelist ( id = wa-roleid vtext = wa-rolename ) ).
          MODIFY ztint_ven_role FROM TABLE lt_role.
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


  METHOD get_usercompanyid_roles.
    DATA:lv_url          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'USER'
      AND method = 'GET_USERCOMPANYID_ROLES'.

    lv_url = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA:lv_title TYPE string.
    lv_title = '批量通过userloginid获取公司对应的角色'.
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


    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_useroles ) .

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
   save_api_log( EXPORTING iv_keyvalue = lv_url ev_msg = ev_msg  iv_requestbody = iv_body iv_responsebody = lv_out ).
   ENDIF.

  ENDMETHOD.


METHOD get_userlist_bycompanyid.
  DATA:lv_uri          TYPE string,
       lv_rfcdest      TYPE rfcdest,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'USER'
        AND method = 'GET_USERLIST_BYCOMPANYID'.

  lv_uri = ls_ztint_icec_api-url.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
  ELSE ls_ztint_icec_api-rfcdest ).
  REPLACE '{companyId}' IN lv_uri WITH iv_companyid.
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
        data = et_userlist  ).

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


  METHOD get_userslist_byuserloginids.


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
      WHERE service = 'USER'
      AND method = 'GET_USERSLIST_BYUSERLOGINIDS'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    lv_title = '批量通过userloginid获取用户信息(ZCL_ICEC_USER_API->GET_USERSLIST_BYUSERLOGINIDS)'.
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
                         data = et_userlist ) .


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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg  iv_requestbody = lv_body iv_responsebody = lv_out ).
   ENDIF.


  ENDMETHOD.


  METHOD get_userslist_byuserloginname.


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
      WHERE service = 'USER'
      AND method = 'GET_USERSLIST_BYUSERLOGINNAME'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{loginName}' IN lv_uri WITH iv_loginname.

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
                         data = es_userlist ) .


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


  METHOD get_user_store_listbyids.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_out          TYPE string,
         lv_body         TYPE string,
         lv_title        TYPE string.

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'USER' AND method = 'GET_USER_STORE_LISTBYIDS'.
    lv_uri = ls_ztint_icec_api-url.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    lv_title = '通过店铺ids查询店铺(最多限制查询100条(ZCL_ICEC_USER_API->GET_USER_STORE_LISTBYIDS)'.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = iv_body
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
                         data = et_storeinf ) .

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


METHOD get_walletinf_bycompanyid.
  DATA:lv_uri          TYPE string,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'WALLET'
        AND method = 'GET_WALLETINF_BYCOMPANYID'.

  lv_uri = ls_ztint_icec_api-url.
  REPLACE '{type}' IN lv_uri WITH iv_type.
  REPLACE '{queryId}' IN lv_uri WITH iv_queryid.
  ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
  ls_content_type-content_type = 'application/json;charset=UTF-8'.

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
        data = es_walletinf ).

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


  METHOD GET_WALLET_TRADEFLOW.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_out          TYPE string,
         lv_body         TYPE string,
         lv_title        TYPE string,
         lv_rfcdest      TYPE rfcdest.

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'WALLET' AND method = 'GET_WALLET_TRADEFLOW'.
    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                          ELSE ls_ztint_icec_api-rfcdest ).

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = lv_rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = iv_body
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
                         data = es_data ) .

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


  METHOD get_whether_useful_right.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_out          TYPE string,
         lv_body         TYPE string,
         lv_title        TYPE string.

    CHECK is_order2aftersales-garagecompanyid IS NOT INITIAL.
    CHECK is_order2aftersales-order2aftersales[] IS NOT INITIAL.
    CHECK is_order2aftersales-rightid IS NOT INITIAL.
    CHECK is_order2aftersales-righttype IS NOT INITIAL.

    CLEAR:lv_uri,ls_content_type,lv_out,lv_body,lv_title.
    "转换Json
    lv_body = /ui2/cl_json=>serialize(
       data = is_order2aftersales
       compress = abap_false pretty_name = /ui2/cl_json=>pretty_mode-low_case ).
    REPLACE ALL OCCURRENCES OF 'garagecompanyid' IN  lv_body WITH 'garageCompanyId'.
    REPLACE ALL OCCURRENCES OF 'rightid' IN  lv_body WITH 'rightId'.
    REPLACE ALL OCCURRENCES OF 'righttype' IN  lv_body WITH 'rightType'.
    REPLACE ALL OCCURRENCES OF 'order2aftersales' IN  lv_body WITH 'order2Aftersales'.
    REPLACE ALL OCCURRENCES OF 'orderid' IN  lv_body WITH 'orderId'.
    REPLACE ALL OCCURRENCES OF 'orderseqid' IN  lv_body WITH 'orderSeqId'.

*&---取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'AFTERSALE' AND method = 'GET_WHETHER_USEFUL_RIGHT'.
    lv_uri = ls_ztint_icec_api-url.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    lv_title = '获取维修厂权益是否可用(ZCL_ICEC_USER_API->GET_WHETHER_USEFUL_RIGHT)'.
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


  METHOD save_companytags.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_out          TYPE string,
         lv_body         TYPE string,
         lv_title        TYPE string.
    DATA(lo_api) = NEW zcl_icec_api( ).
    TYPES:BEGIN OF ty_return,
            status TYPE string,
            error  TYPE string,
            messag TYPE string,
          END OF ty_return.
    DATA ls_return TYPE ty_return.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'TAG' AND method = 'SAVE_COMPANYTAGS'.
    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    lv_body = '{' &&
              |"businessType": "{ es_custag-businesstype }", "companyId": "{ es_custag-companyid }", "conditionType": "{ es_custag-conditiontype }", | &&
              |"externalId": "{ es_custag-externalid }","number": { es_custag-number }, "operator": "{ es_custag-operator }" | && '}'.
    "调用接口
    lv_title = '(标签快照保存ZCL_ICEC_USER_API->SAVE_COMPANYTAGS)'.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      =  ls_ztint_icec_api-rfcdest
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
                         data =  ls_return ) .
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


  method UPDATE_COMPANY_INFO.
        DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_body TYPE string.
    DATA: lv_title TYPE string.
    DATA: lv_out TYPE string.

        "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'USER' AND method = 'UPDATE_COMPANY_INFO'.

      lv_uri = ls_ztint_icec_api-url.

      ls_content_type-content_type = 'application/json;charset=UTF-8'.
      lv_title = '更新公司参数(ZCL_ICEC_USER_API->UPDATE_COMPANY_INFO)'.
      DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    lv_body = iv_body.
    CALL METHOD lo_api->put_data
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
                         data = lv_out ) .
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
  endmethod.


  METHOD update_customer_manager.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_body TYPE string.
    DATA: lv_title TYPE string.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'USER' AND method = 'UPDATE_CUSTOMER_MANAGER'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_title = '批量更新公司的客户经理/拓展经理 (ZCL_ICEC_USER_API->UPDATE_CUSTOMER_MANAGER)'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    lv_body = iv_body.
    CALL METHOD lo_api->put_data
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
                         data = lv_out ) .
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
