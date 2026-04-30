class ZCL_ICEC_BILLCOMMON_API definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF ts_invoice_list,
        classifyid     TYPE string, "TZD230405006474",
        billgroupid    TYPE string, "230405002627",
        billcyclestart TYPE string, "1680624000000,
        billcycleend   TYPE string, "1680710398000,
        dealamount     TYPE string, "119.18,
        invoicegroupid TYPE string, "23041707094",
        classifytype   TYPE string, "BUYERBILL",
        billcycle      TYPE string, "2023-04-05 ~ 2023-04-05",
        invoicetime    TYPE string, "1681700094000,
        handletype     TYPE string, "null,
        transferstatus TYPE string, "null,
        applicationid  TYPE string, "null
      END OF ts_invoice_list .
  types:
    BEGIN OF ts_invmap_info,
        partylabel              TYPE string, "供应商名称：",
        partyname               TYPE string, "深圳开思内部测试店铺-修改",
        invoicemarkerstorecode  TYPE string, "SZCASS01",
        invoicemarkerstorename  TYPE string, "深圳开思内部测试店铺-修改",
        invoicemarkervendorcode TYPE string, "SZCASS01",
        invoicemarkervendorname TYPE string, "深圳开思时代无限供应公司",
        invoiceamount           TYPE string, "36594.500000,
        shipmentcompany         TYPE string, """,
        shipmentnumber          TYPE string, """,
        invoicemethod           TYPE string, "electronic",
        pushmethod              TYPE string, "platform",
        contactinfo             TYPE string, """
      END OF ts_invmap_info .
  types:
    BEGIN OF ts_invmap_list,
        invoiceid            TYPE string, "23041706369",
        billgroupid          TYPE string, "null,
        billamount           TYPE string, "null,
        shipmentcompany      TYPE string, """,
        shipmentnumber       TYPE string, """,
        invoicenumber        TYPE string,                   "324324",
        invoicecode          TYPE string, "null,
        invoiceamount        TYPE string, "36594.500000,
        invoicefileurl       TYPE string, "https://cusaccount.oss-cn-shenzhen.aliyuncs.com/hwbeta/invoice/000460467104_59827753_1681700089212_NfccTpxRStpQ.pdf",
        description          TYPE string, "null,
        createdby            TYPE string, "ksseller1",
        updateby             TYPE string, "ksseller1",
        lastupdatedstamp     TYPE string, "null,
        lastupdatedtxstamp   TYPE string, "1681700094000,
        createdstamp         TYPE string, "null,
        createdtxstamp       TYPE string, "1681700094000,
        invoicegroupid       TYPE string, "23041707094",
        invoicemethod        TYPE string, "electronic",
        invoicetype          TYPE string, " null,
        pushmethod           TYPE string, "platform",
        contactinfo          TYPE string, """,
        appversion           TYPE string, "null,
        invoicecolor         TYPE string, "null,
        invoicestatus        TYPE string, "null,
        redstatus            TYPE string, "null,
        allelectricinvoiceno TYPE string, "null
      END OF ts_invmap_list .
  types:
    BEGIN OF ts_invoice_map,
        billgroupinfo   TYPE ts_invmap_info,
        invoiceinfolist TYPE STANDARD TABLE OF ts_invmap_list WITH DEFAULT KEY,
        invoicetype     TYPE string,
      END OF ts_invoice_map .
  types:
    BEGIN OF ts_settledeal_record,
        companycode        TYPE string, " 维修厂代码
        companyname        TYPE string, " 维修厂名称
        createddate        TYPE string, " 创建时间
        orderamount        TYPE string, " 订单金额
        orderid            TYPE string, " 订单ID
        returnreportamount TYPE string, " 退货金额
        returnreportdate   TYPE string, " 退货时间
        returnreportid     TYPE string, " 退货单号
        returnreportreason TYPE string, " 退货原因
        returnreportstate  TYPE string, " 退货状态（中文）
        settledate         TYPE string, " 结算时间
        storecode          TYPE string, " 店铺代码
        storename          TYPE string, " 店铺名称
        suppliergroupid    TYPE string, " 所属供应组编码
        suppliergroupname  TYPE string, " 所属供应组
        vendorname         TYPE string, " 供应商名称
      END OF ts_settledeal_record .
  types:
    BEGIN OF ts_settledeal,
        page      TYPE string, "
        records   TYPE STANDARD TABLE OF ts_settledeal_record WITH DEFAULT KEY,
        size      TYPE string, "
        totalnum  TYPE string, "
        totalpage TYPE string, "
      END OF ts_settledeal .
  types:
    BEGIN OF ts_waitsettlereasondesc,
        remark         TYPE string, "备注
        returnreportid TYPE string, "退货单
      END OF ts_waitsettlereasondesc .
  types:
    BEGIN OF ts_wsdeal_record,
        buyercompanycode       TYPE string, "维修厂公司代码
        buyercompanyid         TYPE string, "维修厂公司ID
        buyercompanyname       TYPE string, "维修厂公司名称
        dealamount             TYPE string, "金额,单位：元
        dealdate               TYPE string, "订单时间
        dealid                 TYPE string, "订单编号
        dealtype               TYPE string, "订单类型
        dealtypedesc           TYPE string, "订单类型描述
        flagshipstorecode      TYPE string, "托盘店铺代码
        flagshipstoreid        TYPE string, "托盘店铺Id
        flagshipstorename      TYPE string, "托盘店铺名称
        onwersuppliergroupid   TYPE string, "归属连队id
        onwersuppliergroupname TYPE string, "归属连队名称
        originaldealid         TYPE string, "原订单编号：dealType为Return时有
        reasontype             TYPE string, "未加入原因类型
        remark                 TYPE string, "原因描述
        returnreporthandledesc TYPE string, "退货单处理状态中文描述
        returnreporthandleflag TYPE string, "退货单处理状态标记
        sendorreturnfinishtime TYPE string, "发货/退货完成时间
        storecode              TYPE string, "店铺代码
        storeid                TYPE string, "店铺Id
        storename              TYPE string, "店铺名称
        vendorcode             TYPE string, "供应商公司代码
        vendorid               TYPE string, "供应商公司ID
        vendorname             TYPE string, "供应商公司名称
        waitsettlereason       TYPE string, "未加入原因
        waitsettlereasondescs  TYPE STANDARD TABLE OF ts_waitsettlereasondesc WITH DEFAULT KEY, "原因描述
      END OF ts_wsdeal_record .
  types:
    BEGIN OF ts_waitsettledeal,
        page      TYPE string,
        size      TYPE string,
        totalnum  TYPE string,
        totalpage TYPE string,
        records   TYPE STANDARD TABLE OF ts_wsdeal_record WITH DEFAULT KEY,
      END OF ts_waitsettledeal .
  types:
    tt_billid TYPE STANDARD TABLE OF string .
  types:
    BEGIN OF ty_cassloandetail,
        recordid(50)         TYPE c, ": "L2003090008058",
        recorddate           TYPE string, ": 1583733755000,
        partyid              TYPE string, ": "JSeJ4Ar53V0GX7QwSrd",
        orderid              TYPE string, ": "S2003090000692",
        customername         TYPE string, ": "贵阳观山湖众享汽车服务有限公司",
        companycode          TYPE string, ": null,
        createdby            TYPE string, ": "5e573074f1b24d0001bdb718",
        createdbyname        TYPE string, ": "吴大勇",
        invoicetype          TYPE string, ": "A",
        creditamount         TYPE string, ": 40.660000,
        creditamountactual   TYPE string, ": 40.660000,
        punishamounttotal    TYPE string, ": null,
        repaymentamount      TYPE string, ": null,
        refundamount         TYPE string, ": null,
        maxdeadline          TYPE string, ": 25,
        freeinterestdeadline TYPE string, ": null,
        overdueflag          TYPE string, ": null,
        overduedays          TYPE string, ": null,
        punishamountrate     TYPE string,
        updatepunishtime     TYPE string, ": null,
        creditstatus         TYPE string, ": "REPAYMENTING",
        paytosupplierstatus  TYPE string, ": "PAYING",
        paymentmethodid      TYPE string,
        paymentmethodiddesc  TYPE string,
        paymentmethoddesc    TYPE string,
        lastupdatedstamp     TYPE string, ": 1583733688000,
        lastupdatedtxstamp   TYPE string, ": 1583733688000,
        createdstamp         TYPE string, ": 1583733688000,
        createdtxstamp       TYPE string, ": 1583733688000,
        repaymentamounttime  TYPE string, ": null
        baddebtfla           TYPE string, "坏账标识
      END OF ty_cassloandetail .
  types:
    tt_cassloanlist TYPE STANDARD TABLE OF ty_cassloandetail WITH DEFAULT KEY .
  types:
    BEGIN OF ty_cassloandtos,
        recordid(50)       TYPE c, ": "L2003040003006",
        creditstatus       TYPE string, ": "REPAYMENED",
        statusdate         TYPE string, ": 1583306615000,
        statususerlogin    TYPE string, ": "5e40b5570384e40001c5ae58",
        statususername     TYPE string, ": "何福琼",
        changereason       TYPE string, ": "单结还款成功，还款金额：0.010000",
        lastupdatedstamp   TYPE string, ": null,
        lastupdatedtxstamp TYPE string, ": null,
        createdstamp       TYPE string, ": null,
        createdtxstamp     TYPE string, ": null,
        imgurl             TYPE string, ": null
      END OF ty_cassloandtos .
  types:
    BEGIN OF ty_cassloanprocess,
        casscreditrecordstatusdtos TYPE STANDARD TABLE OF ty_cassloandtos WITH DEFAULT KEY,
      END OF ty_cassloanprocess .
  types:
    BEGIN OF ts_billheader,
        billid                TYPE string,
        billtypeenum          TYPE string,
        billownertypeenum     TYPE string,
        billstatusenum        TYPE string,
        storeid               TYPE string,
        storecode             TYPE string,
        storename             TYPE string,
        storetype             TYPE string,
        flagshipstoreid       TYPE string,
        flagshipstorecode     TYPE string,
        flagshipstorename     TYPE string,
        billownertype         TYPE string,
        vendorid              TYPE string,
        vendorcode            TYPE string,
        vendorname            TYPE string,
        createdtime           TYPE string,
        cycletimestart        TYPE string,
        cycletimeend          TYPE string,
        createbyid            TYPE string,
        createbyname          TYPE string,
        createbyphone         TYPE string,
        invoiceflag           TYPE string,
        invoicestatus         TYPE string,
        overdueflag           TYPE string,
        freezeflag            TYPE string,
        baddebtflag           TYPE string,
        billamount            TYPE string, "对账总额：账单金额
        checkbillamount       TYPE string, "对账金额
        cassdiscountamount    TYPE string,
        sumdebitamount        TYPE string, "累计违约金：分组罚息金额求和
        sumdeductdebitamount  TYPE string, "累计扣减违约金：分组扣减罚息金额求和
        sumneedpaydebitamount TYPE string, "累计应还违约金 = 累计违约金-累计扣减违约金
        repaypunishamount     TYPE string, "已还违约金"
        waitpaydebitamount    TYPE string, "待还违约金：累计应还违约金 - 已还违约金"
        acturalamount         TYPE string, "实际账单金额：维修厂（还款总额 = 账单金额 + 累计应还违约金 （统计所有的，不排除已还的））、 供应商（应收总额）
        buyerrepayamount      TYPE string, "已还本金
        waitbuyerrepayamount  TYPE string, "待还本金
        alreadypayamount      TYPE string, "已还金额：已还本金 + 已还罚息"
        waitpayamount         TYPE string, "待还金额： 待还本金 + 待还违约金")
        iscanadjust           TYPE string,
        iscanrepayment        TYPE string,
        sumunpayamount        TYPE string,
        sumuninvoiceamount    TYPE string,
        repaymentdeadline     TYPE string,
        billversion           TYPE string,
      END OF ts_billheader .
  types:
    BEGIN OF ts_billtype,
        billid            TYPE string,
        billtypeenum      TYPE string,
        billownertypeenum TYPE string,
        billstatusenum    TYPE string,
        storeid           TYPE string,
        storecode         TYPE string,
        storename         TYPE string,
        storetype         TYPE string,
        flagshipstoreid   TYPE string,
        flagshipstorecode TYPE string,
        flagshipstorename TYPE string,
        billownertype     TYPE string,
        vendorid          TYPE string,
        vendorcode        TYPE string,
        vendorname        TYPE string,
        createdtime       TYPE string,
        cycletimestart    TYPE string,
        cycletimeend      TYPE string,
        createbyid        TYPE string,
        createbyname      TYPE string,
        createbyphone     TYPE string,
        invoiceflag       TYPE string,
        invoicestatus     TYPE string,
        overdueflag       TYPE string,
        freezeflag        TYPE string,
        baddebtflag       TYPE string,
        billamount        TYPE string, "账单金额
        repaymentdeadline TYPE string,
      END OF ts_billtype .
  types:
    tt_string TYPE STANDARD TABLE OF string .
  types:
    BEGIN OF ts_groupfinattr,
        partsgroupid       TYPE string,
        maxfreedays        TYPE string, "最大免息天数
        overduedays        TYPE string, "逾期天数
        punishrate         TYPE string,
        punishamount       TYPE string,
        deductpunishamount TYPE string, "扣减罚息金额
        repaypunishamount  TYPE string, "已还罚息金额
        evidenceflag       TYPE string,
        lastupdateby       TYPE string,
      END OF ts_groupfinattr .
  types:
    BEGIN OF ts_billgrouplist,
        partsgroupid               TYPE string,
        partsgrouptype             TYPE string,
        billgroupid                TYPE string,
        billgrouptype              TYPE string, "物流费分组类型 GARAGE：维修厂 SUPPLIER：供应商
        buyerstoreid               TYPE string, "买方code 物流费分组类型GARAGE->维修厂code / 物流费分组类型SUPPLIER->供应商code
        buyerstorecode             TYPE string, "买方ID 物流费分组类型GARAGE->维修厂ID / 物流费分组类型SUPPLIER->供应商ID
        buyerstorename             TYPE string,
        sellerstoreid              TYPE string,
        sellerstorecode            TYPE string,
        sellerstorename            TYPE string,
        sellerenterpriseid         TYPE string,
        sellerstoretype            TYPE string,
        flagshipstoreid            TYPE string,
        flagshipstorecode          TYPE string,
        flagshipstorename          TYPE string,
        vendorid                   TYPE string,
        vendorcode                 TYPE string,
        vendorname                 TYPE string,
        buyercheckflag             TYPE string, "买方对账标记 1: 已核对 0：未核对
        buyercheckamount           TYPE string, "买方对账金额
        buyerpaystatus             TYPE string, "买方付款状态1: 已付款 0：未付款
        buyerfullpaytime           TYPE string, "买方完全还款时间
        sellercheckflag            TYPE string,
        sellercheckamount          TYPE string,
        sellerpaystatus            TYPE string,
        sellerpayno                TYPE string,
        sellerpaytime              TYPE string,
        sellerpaymentmethodid      TYPE string,
        sellercasswalletinfo       TYPE string,
        finishcheckflag            TYPE string,
        iscanfinishcheck           TYPE string,
        iscanrollbackfinishcheck   TYPE string,
        iscanadjust                TYPE string,
        dealquantity               TYPE string,
        companypayquantity         TYPE string,
        needpayamount              TYPE string, "买方应付金额: 买方对账金额 + 买方应付罚息
        buyerrepayamount           TYPE string, "买方已还本金
        waitpaybuyerrepayamount    TYPE string, "买方待还本金
        needpaypunishamount        TYPE string, "买方应付罚息: 买方罚息 - 买方扣减罚息
        waitpaypunishamount        TYPE string, "买方待还罚息: 买方应付罚息 - 买方已付罚息
        alreadypayamount           TYPE string, "买方已还金额: 买方已还本金 + 买方已还罚息
        waitpayamount              TYPE string, "买方待还金额: 买方待还本金 + 买方待还罚息
        cassdiscountamount         TYPE string,
        shipfeeamount              TYPE string,
        sellergroupamount          TYPE string,
        repaymentdeadline          TYPE string,
        overdueflag                TYPE string,
        invoiceflag                TYPE string,
        invoicestatus              TYPE string,
        invoicemethod              TYPE string,
        invoicetime                TYPE string,
        freezedflag                TYPE string,
        freezedtime                TYPE string,
        baddebtflag                TYPE string,
        baddebttime                TYPE string,
        exclusiveflag              TYPE string,
        exclusiveamount            TYPE string,
        dedicatedinvoiceflag       TYPE string,
        casspayguaranteeflag       TYPE string,
        partsgroupfinanceattribute TYPE ts_groupfinattr,
        partsgrouppayattribute     TYPE string,
        handletype                 TYPE string,
        status                     TYPE string,
        applyfrom                  TYPE string,
        applicationid              TYPE string,
        createdtime                TYPE string,
        createdby                  TYPE string,
      END OF ts_billgrouplist .
  types:
    BEGIN OF ts_billgroup,
        totalnum  TYPE string,
        totalpage TYPE string,
        page      TYPE string,
        size      TYPE string,
        records   TYPE STANDARD TABLE OF ts_billgrouplist WITH DEFAULT KEY,
      END OF ts_billgroup .
  types:
    BEGIN OF ts_dealitemattributes,
        dealid         TYPE string,
        itemsequenceid TYPE string,
        attributename  TYPE string,
        attributevalue TYPE string,
      END OF ts_dealitemattributes .
  types:
    BEGIN OF ts_item,
        dealid               TYPE string,
        itemsequenceid       TYPE string,
        buyerstoreid         TYPE string,
        buyerstorecode       TYPE string,
        buyerstorename       TYPE string,
        sellerstoreid        TYPE string,
        sellerstorecode      TYPE string,
        sellerstorename      TYPE string,
        dealtime             TYPE string,
        buyername            TYPE string,
        productid            TYPE string,
        productname          TYPE string,
        productnumber        TYPE string,
        productbrandcode     TYPE string,
        productbrandname     TYPE string,
        partsnumber          TYPE string,
        productquantity      TYPE string,
        buyercheckamount     TYPE string,
        sellercheckamount    TYPE string,
        cassdiscountprice    TYPE string,
        cassdiscounttaxprice TYPE string,
        invoicetaxrate       TYPE string,
        shipnumber           TYPE string,
        bizqualitycode       TYPE string,
        feequalitycode       TYPE string,
        feequalityname       TYPE string,
        standardname         TYPE string,
        categoryname         TYPE string,
        sellerstoretype      TYPE string,
        flagshipstoreid      TYPE string,
        flagshipstorecode    TYPE string,
        flagshipstorename    TYPE string,
        vendorid             TYPE string,
        vendorcode           TYPE string,
        vendorname           TYPE string,
        dealitemattributes   TYPE STANDARD TABLE OF ts_dealitemattributes WITH DEFAULT KEY,
      END OF ts_item .
  types:
    BEGIN OF ts_billitem,
        totalnum  TYPE string,
        totalpage TYPE string,
        page      TYPE string,
        size      TYPE string,
        records   TYPE STANDARD TABLE OF ts_item WITH DEFAULT KEY,
      END OF ts_billitem .
  types:
    BEGIN OF ts_tracerecord,
        billid        TYPE string,
        tracecode     TYPE string,
        showparty     TYPE string,
        showparam     TYPE string,
        showcontent   TYPE string,
        createdbyid   TYPE string,
        createdbyname TYPE string,
        createdtime   TYPE string,
      END OF ts_tracerecord .
  types:
    BEGIN OF ts_trace,
        totalnum  TYPE string,
        totalpage TYPE string,
        page      TYPE string,
        size      TYPE string,
        records   TYPE STANDARD TABLE OF ts_tracerecord WITH DEFAULT KEY,
      END OF ts_trace .
  types:
    BEGIN OF ts_partsbillitem,
        dealid             TYPE string, "交易单据ID
        ximuflag           TYPE string, "金融平台标记 1：属于 0：不属于
        financeflag        TYPE string, "融资订单标记 1：融资 0：非融资
        financeamount      TYPE string, "融资手续费
        punishamount       TYPE string, "订单罚息金额
        deductpunishamount TYPE string, "扣减罚息金额
        repaypunishamount  TYPE string, "已还罚息金额
        overduedays        TYPE string, "逾期天数
      END OF ts_partsbillitem .
  types:
    BEGIN OF ts_partsbillitemdetail,
        dealid                  TYPE string, "交易单据ID
        originalsource          TYPE string, "单据来源 system：系统 Manual：人工
        dealtype                TYPE string, "交易类型 SaleOrder：订单 Return：退货单
        biztype                 TYPE string, "业务类型 PARTS 配件交易 SHIP_FEE 物流费用
        paytype                 TYPE string, "支付类型 在线支付、挂账、单结
        cashpaymethod           TYPE string, "具体在线支付的方式
        invoiceflag             TYPE string, "是否需要发票 1：需要 0：不需要
        dealtime                TYPE string,
        buyername               TYPE string, "下单人姓名
        buyerstoreid            TYPE string, "买方店铺ID
        buyerstorecode          TYPE string, "买方店铺代码
        buyerstorename          TYPE string, "买方店铺名称
        sellerstoreid           TYPE string, "卖方店铺ID
        sellerstorecode         TYPE string, "卖方店铺ID
        sellerstorename         TYPE string, "卖方店铺名称
        flagshipstoreid         TYPE string, "旗舰店铺ID：托盘模式专用
        sellerenterpriseid      TYPE string, "卖方公司ID
        sellerstoretype         TYPE string, "卖方公司类型(供应商信息有值)
        flagshipstorecode       TYPE string, "托盘店铺code(供应商信息有值)
        flagshipstorename       TYPE string, "托盘店铺名称(供应商信息有值)
        vendorid                TYPE string, "供应商id
        vendorcode              TYPE string, "供应商代码
        vendorname              TYPE string, "供应商名称
        buyercheckflag          TYPE string, "买方对账标记 1: 已核对 0：未核对
        needpayamount           TYPE string, "买方应付金额: 买方对账金额 + 买方应付罚息
        buyercheckamount        TYPE string, "买方对账金额
        buyerrepayamount        TYPE string, "买方已还本金
        waitpaybuyerrepayamount TYPE string, "买方待还本金：买方对账金额 - 买方已还本金
        needpaypunishamount     TYPE string, "买方应还罚息金额 ：订单罚息金额 - 扣减罚息金额
        waitpaypunishamount     TYPE string, "买方待还罚息： 买方应还罚息 - 买方已还罚息
        alreadypayamount        TYPE string, "买方已还金额：买方已还本金 + 买方已还罚息
        waitpayamount           TYPE string, "买方待还金额：买方待还本金 + 买方待还罚息
        buyercheckcomment       TYPE string, "买方对账说明
        buyerpaymonthflag       TYPE string, "买方月结标记 1：月结 0：非月结
        sellercheckflag         TYPE string, "卖方对账标记 1: 已核对 0：未核对
        sellercheckamount       TYPE string, "卖方对账金额
        sellercheckcomment      TYPE string, "卖方对账说明
        sellerpaymonthflag      TYPE string, "卖方月结标记 1：月结 0：非月结
        cassdiscountamount      TYPE string, "开思券金额
        originaldealid          TYPE string, "原交易单号
        shipmentmethod          TYPE string, "物流方式
        casspayguaranteeflag    TYPE string, "开始兜底标记 1：兜底 0：不兜底
        exclusiveflag           TYPE string, "专属交易标记 1：专属 0：非专属
        feecalculateflag        TYPE string, "是否计算佣金 1：计算 0：不计算
        shipfeeamount           TYPE string, "物流费：维修厂配件账单的分组交易列表才有
        ishasreturndeal         TYPE string, "是否存在退货：配件账单的销售订单才有SalesOrder
        dealfinanceattribute    TYPE ts_partsbillitem,
        dealstatus              TYPE string,
      END OF ts_partsbillitemdetail .
  types:
    tt_partsbillitemdetail TYPE STANDARD TABLE OF ts_partsbillitemdetail WITH DEFAULT KEY .
  types:
    BEGIN OF ts_shipfeebillitemdetail,
        shipfeeid               TYPE string, "维修厂：订单运费单/订单运费单退单 供应商：运费单/运费但退单
        dealid                  TYPE string, "关联的订单字符串
        dealids                 TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "
        relationid              TYPE string, "关联的单据字符串
        relationids             TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "
        logisticsorderid        TYPE string, "关联小狮单据字符串
        logisticsorderids       TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "
        shipfeeamount           TYPE string, "单据运费实际金额
        relationamount          TYPE string, "关联单据金额
        shipfeetype             TYPE string, "物流费用类型：ORDER_SHIP_FEE:订单运费单 ORDER_SHIP_FEE_REFUND:订单运费退款单 WAY_BILL:运费单 WAY_BILL_REFUND:运费退款单 PLATFORM_ALLOWANCE:平台补贴单
        paytype                 TYPE string, "支付类型: 在线支付、挂账、单结
        delivertype             TYPE string, "配送类型字符串: wholion同城送 xiaoma跨城送
        delivertypes            TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "
        dealtime                TYPE string, "
        garagestoreid           TYPE string, "维修厂ID
        garagestorecode         TYPE string, "维修厂代码
        garagestorename         TYPE string, "维修厂名称
        garageamount            TYPE string, "维修厂承担金额
        supplierstoreid         TYPE string, "供应商ID
        supplierstorecode       TYPE string, "供应商代码
        supplierstorename       TYPE string, "供应商名称
        supplieramount          TYPE string, "供应商承担金额
        logisticsstoreid        TYPE string, "物流商id
        logisticsstorecode      TYPE string, "物流商代码
        logisticsstorename      TYPE string, "物流商名字
        logisticscheckamount    TYPE string, "物流商对账金额
        platformallowanceamount TYPE string, "平台补贴金额
        buyercheckflag          TYPE string, "买方对账标记 1: 已核对 0：未核对
        sellercheckflag         TYPE string, "卖方对账标记 1: 已核对 0：未核对
        buyername               TYPE string, "下单人姓名
        invoiceflag             TYPE string, "是否需要发票 1：需要 0：不需要
        originalsource          TYPE string, "订单来源：system系統 Manual虚拟
      END OF ts_shipfeebillitemdetail .
  types:
    tt_shipfeebillitemdetail TYPE STANDARD TABLE OF ts_shipfeebillitemdetail WITH DEFAULT KEY .
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
  types:
    BEGIN OF ts_billgroup_invoice,
        billlist   TYPE STANDARD TABLE OF ts_invoice_list WITH DEFAULT KEY,
        resultsmap TYPE ts_invoice_map,
      END OF ts_billgroup_invoice .
  types:
    BEGIN OF ts_logistics_list,
        desc TYPE string,
        time TYPE string,
      END OF ts_logistics_list .
  types:
    BEGIN OF ts_logistics_inf,
        expresscode               TYPE string,
        expressname               TYPE string,
        expressno                 TYPE string,
        receivetel                TYPE string,
        sendertel                 TYPE string,
        expressstatus             TYPE string,
        expressstatusdesc         TYPE string,
        remark                    TYPE string,
        invoicelogisticstracelist TYPE STANDARD TABLE OF ts_logistics_list WITH DEFAULT KEY,
      END OF ts_logistics_inf .

  methods GET_BILL_GROUPS_LIST
    importing
      value(IV_BODY) type STRING
    exporting
      value(ES_BILLGROUP) type ZINTS_S_BILLGROUP
      value(ES_MSG) type BAPIRET2 .
  methods GET_BILL_GROP_SHIPFEE
    importing
      value(IV_CLASSIFYID) type STRING optional
    exporting
      value(ET_GROUPSHIPFEE) type ZINTS_T_GROUPSHIPFEE
      value(EV_MSG) type BAPIRET2 .
  methods GET_BILL_ITEM_LIST
    importing
      value(IV_BODY) type STRING
    exporting
      value(ES_ITEMLIST) type ZINTS_S_BILLITEMLIST
      value(ES_MSG) type BAPIRET2 .
  methods GET_BILL_GROUP_PAYMENTLIST
    importing
      value(IV_BODY) type STRING
    exporting
      value(ET_GROUPPAYMENT) type ZINTS_T_GROUPPAYMENTLIST
      value(EV_MSG) type BAPIRET2 .
  methods GET_SHIPMENT_GROUP_PAYMENTLIST
    importing
      value(IV_BODY) type STRING
    exporting
      value(ES_SHIPMENTLIST) type ZINTS_S_SHIPMENTGROUPLIST
      value(ES_MSG) type BAPIRET2 .
  methods GET_BILL_OPERATE_RECORDS
    importing
      value(IV_CLASSIFYID) type STRING
    exporting
      value(ET_BILLRECORDS) type ZINTS_T_BILLRECORDS
      value(EV_MSG) type BAPIRET2 .
  methods GET_BILL_DETAIL
    importing
      !IV_CLASSIFYID type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ES_BILLDETAIL type ZINTS_S_BILLDETAIL .
  methods GET_RB_BILL_DETAIL
    importing
      !IV_BILLID type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ES_BILLHEADER type TS_BILLHEADER .
  methods GET_RB_BILL_HEADER
    importing
      value(IV_BILLID) type STRING
      value(IV_TYPE) type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ES_BILLHEADER type TS_BILLHEADER .
  methods GET_RB_BILL_TYPE
    importing
      value(IV_BILLID) type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ES_BILLTYPE type TS_BILLTYPE .
  methods GET_RB_BILL_TRACERECORDS
    importing
      value(IV_BILLID) type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ES_TRACE type TS_TRACE .
  methods GET_RB_BILLID_BYGROUPID
    importing
      !IV_BILLGROUPID type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ET_BILL type TT_STRING .
  methods GET_BUYERBILLALL_AMOUNT
    importing
      value(IV_COMPANYID) type STRING
    exporting
      value(ES_BILLALL) type ZINTS_S_BILLALLAMOUNT
      value(EV_MSG) type BAPIRET2 .
  methods GET_ORDER_STATUS
    importing
      value(IV_BODY) type STRING
    exporting
      value(ET_ORDERSTATUS) type ZINTS_T_ORDERSTATUS
      value(ES_MSG) type BAPIRET2 .
  methods GET_ISORDER_RETURN
    importing
      value(IV_BODY) type STRING
    exporting
      value(ET_HASRETURN) type ZINTS_T_HASRETURN
      value(ES_MSG) type BAPIRET2 .
  methods GET_BILL_LIST
    importing
      value(IV_BODY) type STRING
    exporting
      value(ET_BILLLIST) type ZINTS_T_BILLLIST
      value(ES_MSG) type BAPIRET2 .
  methods GET_CASSLOAN_DETAIL
    importing
      value(IV_CASSLOAN) type STRING optional
    exporting
      value(ES_MSG) type BAPIRET2
      value(ES_CASSLOANDETAIL) type TY_CASSLOANDETAIL .
  methods GET_CASSLOAN_LIST
    importing
      value(IV_BODY) type STRING optional
    exporting
      value(ES_MSG) type BAPIRET2
      value(ET_LIST) type TT_CASSLOANLIST .
  methods GET_CASSLOAN_PROCESS
    importing
      value(IV_RECORDID) type STRING optional
    exporting
      value(ES_MSG) type BAPIRET2
      value(ES_PROCESS) type TY_CASSLOANPROCESS .
  methods GET_PARTQUALITYMAP
    importing
      value(IV_BODY) type STRING
    exporting
      !ES_BRANDQUALITY type ZINTS_S_NEWBRANDQUALITYMAP
      value(ES_MSG) type BAPIRET2 .
  methods GET_BILLID_BY_BILLGROUPID
    importing
      value(IV_BODY) type STRING
    exporting
      value(ES_RETURN) type BAPIRET2
      value(ET_ID) type TT_BILLID .
  methods GET_RB_BILL_BILLGROUPS_ITEM
    importing
      value(IV_BILLID) type STRING
      value(IV_TYPE) type STRING
      value(IV_BILLGROUPID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_PARTSBILL) type TT_PARTSBILLITEMDETAIL
      value(ET_SHIPFEEBILL) type TT_SHIPFEEBILLITEMDETAIL .
  methods GET_RB_BILL_GROUPS_LIST
    importing
      value(IV_BILLID) type STRING
      value(IV_TYPE) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_BILLGROUP) type TS_BILLGROUP .
  methods GET_RB_BILL_ITEMS_LIST
    importing
      value(IV_BILLID) type STRING
      value(IV_PAGE) type STRING
      value(IV_SIZE) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_BILLITEM) type TS_BILLITEM .
  methods UPDATE_OVERDUE_FOLLOW
    importing
      value(IV_BODY) type STRING
    returning
      value(EV_MSG) type BAPIRET2 .
  methods SAVE_DINGTALK
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2 .
  methods SET_COST_DETAIL
    importing
      value(DATA) type TY_COST_DATA
    exporting
      !EV_MSG type BAPIRET2
    returning
      value(RETURN) type TY_RETURN .
  methods GET_WAITSETTLEDEAL_PAGE
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type TS_WAITSETTLEDEAL .
  methods GET_SETTLEDEAL_PAGE
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type TS_SETTLEDEAL .
  methods GET_RB_BILL_GGROUPS_INVOICE
    importing
      value(IV_BILLGROUPID) type STRING
      value(IV_CLASSIFYTYPE) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_INVOICEINFO) type TS_BILLGROUP_INVOICE .
  methods GET_LOGISTICS_INF_BY_NUM
    importing
      value(IV_EXPRESSNO) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_LOGISTICS_INF) type TS_LOGISTICS_INF .
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



CLASS ZCL_ICEC_BILLCOMMON_API IMPLEMENTATION.


  METHOD get_billid_by_billgroupid.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'  AND method = 'GET_BILLID_BY_BILLGROUPID'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title TYPE string.
    lv_title = '根据账单分组获取账单ID(ZCL_ICEC_BILLCOMMON_API->GET_BILLID_BY_BILLGROUPID)'.
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
        ev_msg          = es_return ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_id ).


          es_return-type = 'S'.
          es_return-id = '200'.
          es_return-message = 'JSON成功解析'.
        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).
          es_return-type = 'E'.
          es_return-id = '404'.
          es_return-message = 'JSON解析异常，请检查系统传入参数'.
        CATCH cx_root.
          es_return-type = 'E'.
          es_return-id = 404.
          es_return-message = 'JSON解析异常，请检查系统传入参数'.
      ENDTRY.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = es_return iv_responsebody = lv_out iv_requestbody = lv_body ).
   ENDIF.

  ENDMETHOD.


  METHOD get_bill_detail.


    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'
      AND method = 'GET_BILL_DETAIL'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{classifyId}' IN lv_uri WITH iv_classifyid.

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
                         data = es_billdetail ).


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


  METHOD get_bill_grop_shipfee.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.
    DATA:lv_title TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'  AND method = 'GET_BILL_GROP_SHIPFEE'.

    lv_uri = ls_ztint_icec_api-url .
    REPLACE '{classifyId}' IN lv_uri WITH iv_classifyid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_title = '获取账单分组id对应的物流费(ZCL_ICEC_BILLCOMMON_API->GET_BILL_GROP_SHIPFEE)'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
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
                         data = et_groupshipfee ).


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


  METHOD get_bill_groups_list.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'  AND method = 'GET_BILL_GROUPS_LIST'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA:lv_title TYPE string.
    lv_title = '获取账单下分组列表(ZCL_ICEC_BILLCOMMON_API->GET_BILL_GROUPS_LIST)'.

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
                         data =  es_billgroup ).

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


  METHOD get_bill_group_paymentlist.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'  AND method = 'GET_BILL_GROUP_PAYMENTLIST'.

    lv_uri = ls_ztint_icec_api-url && iv_body.

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
                         data = et_grouppayment ).


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


  METHOD get_bill_item_list.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'  AND method = 'GET_BILL_ITEM_LIST'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title TYPE string.
    lv_title = '获取账单下交易记录(ZCL_ICEC_BILLCOMMON_API->GET_BILL_ITEM_LIST)'.
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
                         data =  es_itemlist ).

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


  METHOD get_bill_list.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'  AND method = 'GET_BILL_LIST'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title TYPE string.
    lv_title = '获取批量账单详情(ZCL_ICEC_BILLCOMMON->GET_BILL_LIST)'.
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
                         data =  et_billlist ).

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


  METHOD get_bill_operate_records.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'
      AND method = 'GET_BILL_OPERATE_RECORDS'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{classifyId}' IN lv_uri WITH iv_classifyid.

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
                         data = et_billrecords ).


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


  METHOD get_buyerbillall_amount.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'
      AND method = 'GET_BUYERBILLALL_AMOUNT'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{buyerCompanyId}' IN lv_uri WITH iv_companyid.

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
                         data = es_billall ).


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


  METHOD get_cassloan_detail.


    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'CASSLOAN'
      AND method = 'GET_CASSLOAN_DETAIL'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{recordId}' IN lv_uri WITH iv_cassloan.

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
                         data =  es_cassloandetail ).
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


  METHOD get_cassloan_list.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'CASSLOAN'  AND method = 'GET_CASSLOAN_LIST'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title TYPE string.
    lv_title = '批量获取单结最新状态(ZCL_ICEC_BILLCOMMON_API->GET_CASSLOAN_LIST)'.
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
                         data =  et_list ).

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


  METHOD get_cassloan_process.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'CASSLOAN'
      AND method = 'GET_CASSLOAN_PROCESS'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{recordId}' IN lv_uri WITH iv_recordid.

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
                         data =  es_process ).
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


  METHOD get_isorder_return.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'  AND method = 'GET_ISORDER_RETURN'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title TYPE string.
    lv_title = '获取账单分组下订单是否有退货(ZCL_ICEC_BILLCOMMON_API->GET_ISORDER_RETURN)'.
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
                         data =  et_hasreturn ).


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


  METHOD get_logistics_inf_by_num.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.


    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'  AND method = 'GET_LOGISTICS_INF_BY_NUM'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{expressNo}' IN lv_uri WITH iv_expressno.

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
                         data =  es_logistics_inf ).

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
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_responsebody = lv_out iv_requestbody = lv_body ).
   ENDIF.
  ENDMETHOD.


  METHOD get_order_status.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'  AND method = 'GET_ORDER_STATUS'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title TYPE string.
    lv_title = '获取分组下订单状态(ZCL_ICEC_BILLCOMMON_API->GET_ORDER_STATUS)'.
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
                         data =  et_orderstatus ).


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


  METHOD get_partqualitymap.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_rfcdest      TYPE rfcdest,
         lv_out          TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'  AND method = 'GET_PARTQUALITYMAP_NEW'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title TYPE string.
    lv_title = '获取配件品牌与收费品质对应关系表(ZCL_ICEC_BILLCOMMON_API->GET_PARTQUALITYMAP)'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest
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
                         data =  es_brandquality ).

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


  METHOD get_rb_billid_bygroupid.
    "账单重构-根据账单分组获取账单ID

    "账单重构-获取账单抬头详情
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out  TYPE string,
          lv_body TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'
      AND method = 'GET_RB_BILLID_BYGROUPID'.

    lv_uri = ls_ztint_icec_api-url.
    SPLIT iv_billgroupid AT ',' INTO TABLE DATA(lt_tab).
    LOOP AT lt_tab INTO DATA(ls_tab).
      lv_body = COND #( WHEN lv_body IS INITIAL THEN |["{ ls_tab }"|
                        ELSE |{ lv_body },"{ ls_tab }"| ).
    ENDLOOP.
    lv_body = |{ lv_body }]|.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_body         = lv_body
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
                         data = et_bill ).
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


  METHOD get_rb_bill_billgroups_item.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.
    DATA:lv_method TYPE ztint_icec_api-method.

    lv_method = COND #( WHEN iv_type = 'PARTS_BILL' THEN 'GET_RB_PARTSBILL_BILLGROUPS_ITEM'
                        WHEN iv_type = 'SHIP_FEE_BILL' THEN 'GET_RB_SHIPFEEBILL_BILLGROUPS_ITEM' ).

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'  AND method = @lv_method.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{billId}' IN lv_uri WITH iv_billid.
    REPLACE '{billgroupId}' IN lv_uri WITH iv_billgroupid.


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
        ev_msg          = ev_msg ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          CASE iv_type.
            WHEN 'PARTS_BILL'.
              /ui2/cl_json=>deserialize(
                          EXPORTING
                             json = lv_out
                          CHANGING
                             data =  et_partsbill ).
            WHEN 'SHIP_FEE_BILL'.
              /ui2/cl_json=>deserialize(
                          EXPORTING
                             json = lv_out
                          CHANGING
                             data =  et_shipfeebill ).

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
    ENDIF.
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_responsebody = lv_out iv_requestbody = lv_body ).
    ENDIF.
  ENDMETHOD.


  METHOD get_rb_bill_detail.

    "账单重构-获取账单抬头详情
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'
      AND method = 'GET_RB_BILL_DETAIL'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{billId}' IN lv_uri WITH iv_billid.

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
                         data = es_billheader ).
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


  METHOD get_rb_bill_ggroups_invoice.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.


    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'  AND method = 'GET_RB_BILL_GGROUPS_INVOICE'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{classifyType}' IN lv_uri WITH iv_classifytype  .
    REPLACE '{billGroupId}' IN lv_uri WITH iv_billgroupid .

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_body         = lv_body
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
                         data =  es_invoiceinfo ).

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
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_responsebody = lv_out iv_requestbody = lv_body ).
    ENDIF.
  ENDMETHOD.


  METHOD get_rb_bill_groups_list.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.
    DATA:lv_method TYPE ztint_icec_api-method.

    lv_method = COND #( WHEN iv_type = 'PARTS_BILL' THEN 'GET_RB_PARTSBILL_GROUPS_LIST'
                        WHEN iv_type = 'SHIP_FEE_BILL' THEN 'GET_RB_SHIPFEEBILL_GROUPS_LIST' ).

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'  AND method = @lv_method.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{billId}' IN lv_uri WITH iv_billid.

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
        ev_msg          = ev_msg ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data =  es_billgroup ).

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
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_responsebody = lv_out iv_requestbody = lv_body ).
    ENDIF.
  ENDMETHOD.


  METHOD get_rb_bill_header.

    "账单重构-获取账单抬头详情
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA:lv_method TYPE ztint_icec_api-method.
    lv_method = COND #( WHEN iv_type EQ 'PARTS_BILL' THEN 'GET_RB_PARTSBILL_HEADER'
                        WHEN iv_type EQ 'SHIP_FEE_BILL' THEN 'GET_RB_SHIPFEEBILL_HEADER'
                        WHEN iv_type EQ 'PARTS_BILL_SIMPLE' THEN 'GET_RB_PARTSBILL_HEADER_SIMPLE' ).
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api) WHERE service = 'BILLCOMMON' AND method = @lv_method.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{billId}' IN lv_uri WITH iv_billid.

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
                         data = es_billheader ).
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


  METHOD get_rb_bill_items_list.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'  AND method = 'GET_RB_PARTSBILL_ITEM_LIST'.

    lv_uri = ls_ztint_icec_api-url.
    IF iv_page IS INITIAL .
      iv_page = '1'.
    ENDIF.
    IF iv_size IS INITIAL.
      iv_size = '200'.
    ENDIF.
    REPLACE '{billId}' IN lv_uri WITH iv_billid.
    REPLACE '{page}' IN lv_uri WITH iv_page.
    REPLACE '{size}' IN lv_uri WITH iv_size.

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
        ev_msg          = ev_msg ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data =  es_billitem ).

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
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_responsebody = lv_out iv_requestbody = lv_body ).
    ENDIF.
  ENDMETHOD.


  METHOD get_rb_bill_tracerecords.

    "账单重构-获取账单抬头详情
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA:lv_method TYPE ztint_icec_api-method.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api) WHERE service = 'BILLCOMMON'
      AND method = 'GET_RB_BILL_TRACERECORDS'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{billId}' IN lv_uri WITH iv_billid.

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
                         data = es_trace-records ).
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


  METHOD get_rb_bill_type.

    "账单重构-获取账单抬头详情
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA:lv_method TYPE ztint_icec_api-method.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api) WHERE service = 'BILLCOMMON'
      AND method = 'GET_RB_BILL_TYPE'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{billId}' IN lv_uri WITH iv_billid.

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
                         data = es_billtype ).
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


  METHOD get_settledeal_page.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_rfcdest      TYPE rfcdest.
    DATA: lv_out TYPE string.
    DATA:lv_method TYPE ztint_icec_api-method.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api) WHERE service = 'BILLCOMMON' AND method = 'GET_SETTLEDEAL_PAGE'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
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


  METHOD get_shipment_group_paymentlist.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'  AND method = 'GET_SHIPMENT_GROUP_PAYMENTLIST'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title TYPE string.
    lv_title = '获取维修厂物流费账单下交易记录(ZCL_ICEC_BILLCOMMON_API->GET_SHIPMENT_GROUP_PAYMENTLIST)'.
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
                         data =  es_shipmentlist ).

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


  METHOD get_waitsettledeal_page.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_rfcdest      TYPE rfcdest.
    DATA: lv_out TYPE string.
    DATA:lv_method TYPE ztint_icec_api-method.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api) WHERE service = 'BILLCOMMON'
      AND method = 'GET_WAITSETTLEDEAL_PAGE'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

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


  METHOD save_dingtalk.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string,
         lv_out          TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'  AND method = 'SAVE_DINGTALK'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title TYPE string.
    lv_title = '审批流通过后生成供应商账单(ZCL_ICEC_BILLCOMMON_API->SAVE_DINGTALK)'.
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
        ev_msg          = ev_msg ).
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_responsebody = lv_out iv_requestbody = iv_body ).
    ENDIF.

  ENDMETHOD.


  METHOD set_cost_detail.

    DATA:lv_url          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_title TYPE string.
    DATA lv_body TYPE string.
    DATA lv_storeid TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BC' AND method = 'SET_COST_DETAIL'.

    lv_body = '{' && |"id": "{ data-id }","agreeTime": { data-agreetime },"approvalType": "{ data-approvaltype }","orderId": "{ data-orderid }" ,| &&
               |"amount": { data-amount },"partsName": "{ data-partsname }","partsPrice": 0,"compensationReason": "{ data-compensationreason }" | && '}'.

    lv_url = ls_ztint_icec_api-url.
    ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_title = '售后赔付、异常采购申请审批通过入库账单（ZCL_ICEC_BILLCOMMON_API=》SET_COST_DETAIL）'.
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
                         data = return  ).

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

      IF ls_ztint_icec_api-nolog IS INITIAL.
      save_api_log( EXPORTING iv_keyvalue = lv_url iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD update_overdue_follow.

    "账单重构-获取账单抬头详情
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out  TYPE string,
          lv_body TYPE string.
    types:BEGIN OF ts_return,
           code    TYPE string,
           message TYPE string,
         END OF ts_return.
    DATA:ls_return TYPE ts_return.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'BILLCOMMON'
      AND method = 'UPDATE_OVERDUE_FOLLOW'.

    lv_uri = ls_ztint_icec_api-url.
    lv_body = |{ iv_body }|.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_body         = lv_body
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
                         data = ls_return ).
          IF ls_return-code EQ 200.
            ev_msg-type = 'S'.
            ev_msg-id = '200'.
            ev_msg-message = 'JSON成功解析'.
          ELSE.
            ev_msg-type = 'E'.
            ev_msg-id = '400'.
            ev_msg-message = ls_return-message.
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
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
