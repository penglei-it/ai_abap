class ZCL_ICEC_INQUIRY_API definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF ts_quotesupplier_status,
            storeid  TYPE string,
            statusid TYPE string,
            perc     TYPE string,
          END OF ts_quotesupplier_status .
  types:
    tt_quotesupplier_status TYPE STANDARD TABLE OF ts_quotesupplier_status WITH DEFAULT KEY .
  types:
    BEGIN OF ts_inqattribute,
        attributetype  TYPE string,
        attributevalue TYPE string,
      END OF ts_inqattribute .
  types:
    tt_inqattribute TYPE STANDARD TABLE OF ts_inqattribute WITH DEFAULT KEY
                              WITH NON-UNIQUE SORTED KEY type COMPONENTS attributetype .
  types:
    BEGIN OF ts_cold_check,
        inquiryid  TYPE string,
        datasource TYPE string,
      END OF ts_cold_check .
  types:
    tt_cold_check TYPE STANDARD TABLE OF ts_cold_check WITH DEFAULT KEY .
  types:
    BEGIN OF ts_discount_detail,
        id                TYPE string,
        discountname      TYPE string,
        amountofftype     TYPE string,
        amountofftypename TYPE string,
        requireamount     TYPE string,
        offamount         TYPE string,
      END OF ts_discount_detail .
  types:
    BEGIN OF ts_discount_promotion,
        promotioncode       TYPE string,
        promotiontype       TYPE string,
        productcoverage     TYPE string,
        productcoveragename TYPE string,
        promotionname       TYPE string,
        effectdate          TYPE string,
        expiredate          TYPE string,
        lastupdatetime      TYPE string,
        discounts           TYPE STANDARD TABLE OF ts_discount_detail WITH DEFAULT KEY,
      END OF ts_discount_promotion .
  types:
    BEGIN OF ts_discount,
        storeid    TYPE string,
        productid  TYPE string,
        promotions TYPE STANDARD TABLE OF ts_discount_promotion WITH DEFAULT KEY,
      END OF ts_discount .
  types:
    tt_discount TYPE STANDARD TABLE OF ts_discount WITH DEFAULT KEY .
  types:
    BEGIN OF ts_discount_new,
        requestid  TYPE string, "报价结果ID
        promotions TYPE STANDARD TABLE OF ts_discount_promotion WITH DEFAULT KEY,
      END OF ts_discount_new .
  types:
    tt_discount_new TYPE STANDARD TABLE OF ts_discount_new WITH DEFAULT KEY .
  types:
    BEGIN OF ts_quoteprice_extra,
        inquiryid             TYPE string,
        cassselectedsupplyids TYPE STANDARD TABLE OF string WITH DEFAULT KEY,
      END OF ts_quoteprice_extra .
  types:
    BEGIN OF ts_tyreinq_prop,
        propertyvaluecode TYPE string,
        propertyvaluename TYPE string,
      END OF ts_tyreinq_prop .
  types:
    BEGIN OF ts_tyrebp,
        brandcode TYPE string,
        brandname TYPE string,
        patterns  TYPE STANDARD TABLE OF ts_tyreinq_prop WITH DEFAULT KEY,
      END OF ts_tyrebp .
  types:
    BEGIN OF ts_tyreprop,
        propertytypecode TYPE string,
        propertytypename TYPE string,
        valuelist        TYPE STANDARD TABLE OF ts_tyreinq_prop WITH DEFAULT KEY,
      END OF ts_tyreprop .
  types:
    BEGIN OF ts_tryeinq_extinfo ,
        originalpictureflag TYPE string,
        tyrebrandpatterns   TYPE STANDARD TABLE OF ts_tyrebp WITH DEFAULT KEY,
        pictureurls         TYPE STANDARD TABLE OF string WITH DEFAULT KEY,
        properties          TYPE STANDARD TABLE OF ts_tyreprop WITH DEFAULT KEY,
        remark              TYPE string,
      END OF ts_tryeinq_extinfo .
  types:
    BEGIN OF ts_feedbackinfo,
        causekey    TYPE string, "反馈原因key",
        causetype   TYPE string, "反馈类型",
        title       TYPE string, "反馈内容",
        useradddesc TYPE string, "其他时内容
      END OF ts_feedbackinfo .
  types:
    BEGIN OF ts_feedback,
        inquiryid      TYPE string,
        feedbackuserid TYPE string,
        createstamp    TYPE string,
        causelist      TYPE STANDARD TABLE OF ts_feedbackinfo WITH DEFAULT KEY,
      END OF ts_feedback .
  types:
    tt_feedback TYPE STANDARD TABLE OF ts_feedback WITH DEFAULT KEY .
  types:
    BEGIN OF ts_neworder,
        createdby        TYPE string, ", // 创建人
        createdstamp     TYPE string, ", // 创建时间
        lastupdatedstamp TYPE string, ", // 修改时间
        orderid          TYPE string, ", // 订单ID
        shoppinglistid   TYPE string, ", // 询价单ID
        statusid         TYPE string, ", // 状态
        userneedsitemid  TYPE string, "// 报价结果ID
      END OF ts_neworder .
  types:
    BEGIN OF ts_newquotepinkagedto,
        pinkagetype   TYPE string, ", // 包邮类型
        pinkagevalue  TYPE string, ": null, // 包邮值
        subsidyamount TYPE string, ": null // 补贴金额
      END OF ts_newquotepinkagedto .
  types:
    BEGIN OF ts_newcashstepprice,
        btprice       TYPE string, ": null, // 买家税前价
        maxnum        TYPE string, ", // 阶梯数量最大值
        minnum        TYPE string, ", // 阶梯数量最小值
        price         TYPE string, ": null, // 买家税后价
        sellerbtprice TYPE string, ": null, // 卖家税前价
        sellerprice   TYPE string, ": null, // 卖家税后价
        sortid        TYPE string, "// 排序
      END OF ts_newcashstepprice .
  types:
    BEGIN OF ts_newstepprice,
        cashstepprice   TYPE ts_newcashstepprice,
        sortid          TYPE string, ", // 排序
        userneedsitemid TYPE string, ", // 报价条目ID
        minnum          TYPE string, ", // 阶梯数量最小值
        maxnum          TYPE string, ", // 阶梯数量最大值
        price           TYPE string, ": null, // 买家税后价
        btprice         TYPE string, ": null, // 买家税前价
        sellerprice     TYPE string, ": null, // 卖家税后价
        sellerbtprice   TYPE string, ": null // 卖家税前价
      END OF ts_newstepprice .
  types:
    BEGIN OF ts_newstoreweekday,
        autoquote      TYPE string, "// null
        manuallyquote  TYPE string, ": null
        nextweekday    TYPE string, ", // null
        nowisweekday   TYPE string, ": null
        storeid        TYPE string, ", // null
        todayisweekday TYPE string, ": null
      END OF ts_newstoreweekday .
  types:
    BEGIN OF ts_newwholionlogisticsdto,
        deliveryname        TYPE string, ", // 配送名称
        deliverytime        TYPE string, ", // 配送时长
        deliverytype        TYPE string, ", // 配送Type
        distance            TYPE string, ", // 配送距离
        iswholion           TYPE string, ": false, // 是否支持小狮
        originfee           TYPE string, ": null, // 未折扣前的金额
        transporttime       TYPE string, ", // 运送时长，分钟
        vehiclemode         TYPE string, ", // 运送车型
        wholionlogisticsfee TYPE string, ": null // 小狮应收运费金额
      END OF ts_newwholionlogisticsdto .
  types:
    BEGIN OF ts_newquotedpriceresults,
        aftersalesnapshot            TYPE string, ", // 售后快照
        aiscore                      TYPE string, ": null, // AI评分
        aiscoresortvalue             TYPE string, ", // AI评分排序序号
        arrivaltime                  TYPE string, ", // 最快到货时间
        atboxfee                     TYPE string, ": null, // 含税钉箱费
        atbuyerandboxfee             TYPE string, ": null, // 买家含税总费用（报价+钉箱费）
        atsellerandboxfee            TYPE string, ": null, // 卖家含税总费用（报价+钉箱费）
        availablilitysale            TYPE string, ", // 最新可用零件号
        biddingsortvalue             TYPE string, ", // 竞价排序序号 - 暂不用
        boshauthorizationflag        TYPE string, ": false, // 博世授权经销商标识
        branddescription             TYPE string, ", // 品牌描述Url
        brandid                      TYPE string, ", // 品牌ID
        brandname                    TYPE string, ", // 品牌名
        btboxfee                     TYPE string, ": null, // 不含税钉箱费
        btbuyerandboxfee             TYPE string, ": null, // 买家含税总费用（报价+钉箱费）
        btprice                      TYPE string, ": null, // 免税价格
        btpricesortvalue             TYPE string, ", // 税前价格排序序号
        btsellerandboxfee            TYPE string, ": null, // 卖家不含税总费用（报价+钉箱费）
        cityid                       TYPE string, ", // 询价城市
        combinedrecommenddescription TYPE string, ", // 组合配件描述
        combinedrecommendstatus      TYPE string, ", // 组合配件状态
        countrydistance              TYPE string, ": null, // 报价结果发货地所在区到维修厂所在区的直线距离
        createdby                    TYPE string, ", // 创建人
        createdstamp                 TYPE string, ", // 创建时间
        deliverytime                 TYPE string, ", // 预计发货时间
        deliverytimesortvalue        TYPE string, ", // 小狮物流时效排序序号
        description                  TYPE string, ", // 商品描述
        distancesortvalue            TYPE string, ", // 距离排序序号
        distributesource             TYPE string, ", // 用户、系统指定
        effective                    TYPE string, ", // 有效
        exceptionwarningdescription  TYPE string, ", // 问题配件问题描述
        exceptionwarningstatus       TYPE string, ", // 问题配件状态
        exclusiveflag                TYPE string, ", // 专属供应商标识
        garagecompanyid              TYPE string, ", // 维修厂公司Id
        garageopeninvoicetype        TYPE string, ", // 维修厂开票类型
        hotsale                      TYPE string, "// 是否为促销商品
        id                           TYPE string, ", // 报价条目userNeedsItemId
        inquirycreatedby             TYPE string, ", // 询价单创建人ID
        inquiryid                    TYPE string, ", // 询价单ID
        invoicetype                  TYPE string, ", // VAT:增值税专票；NORMAL:普票;BOTH:都可以
        iteminvoiceflag              TYPE string, ", // 能否开对项发票
        itemorder                    TYPE string, ", // 竞价排名序号
        lastupdatedstamp             TYPE string, ", // 修改时间
        location                     TYPE string, ", // 发货地
        locationname                 TYPE string, ", // 发货地名称
        needpackage                  TYPE string, ", // 是否需要打包
        notcommonsupplier            TYPE string, ", // 不属于常用供应商:0否,即属于;1是,即不属于
        oldpartsnum                  TYPE string, ", // 译码结果零件号
        openinvoicetype              TYPE string, ", // YES:开票；NO:不开票;BOTH:都可以
        orders                       TYPE STANDARD TABLE OF ts_neworder WITH DEFAULT KEY, ": [ // 下单日志
        originoenumber               TYPE string, ", // 译码结果
        originalassort               TYPE string, ", // 原厂配套标识：0否，1是
        originalsortvalue            TYPE string, ", // 原厂优先排序序号
        parttype                     TYPE string, ", // 零件类型
        partsbrandquality            TYPE string, ", // 零件品牌品质
        partsbrandqualitytype        TYPE string, ", // 零件品牌品质类型;原厂件、品牌件、拆车件、原厂再制造、其他
        partsname                    TYPE string, ", // 零件名
        partsnum                     TYPE string, ", // 零件号
        price                        TYPE string, ": null, // 销售价
        priceadjustmentrulesid       TYPE string, ", // 流量调节规则ID
        pricesortvalue               TYPE string, ", // 税后价格排序序号
        productid                    TYPE string, ", // 商品ID
        productpicturelist           TYPE string, ", // 商品图片
        producttype                  TYPE string, ", // 商品类型：现货or调货
        productsetcode               TYPE string, ", // 套件编码
        productsetid                 TYPE string, ", // 套件ID
        qualitychannel               TYPE string, ", // 品质渠道
        qualitylayer                 TYPE string, ", // 品质分层
        qualitysortvalue             TYPE string, ", // 品质排序序号
        quantity                     TYPE string, ", // 数量
        quotepinkagedto              TYPE ts_newquotepinkagedto, ": { // 包邮信息
        quoteuser                    TYPE string, ", // 报价员
        quoteditemnewestflag         TYPE string, ", // 供应商最新报价标识
        quotedpriceitemid            TYPE string, ", // 报价条目ID
        recommend                    TYPE string, ", // 商家力荐标识：0否，1是
        remark                       TYPE string, ", // 备注
        resolveresultid              TYPE string, ", // 译码结果ID
        resolveresultname            TYPE string, ", // 译码结果名称
        ruleid                       TYPE string, ", // 竞价排名规则类型
        sellstatus                   TYPE string, ", // 销售状态UserNeedsItemSellStatusEnum
        sellstatusname               TYPE string, ", // 销售状态名称UserNeedsItemSellStatusEnum
        selltype                     TYPE string, ", // 销售类型
        sellerbtprice                TYPE string, ": null, // 卖家税前价
        sellerprice                  TYPE string, ": null, // 卖家税后价
        showboschintegration         TYPE string, ": false, // 博世易佳分标识
        showreplacementparts         TYPE string, ": false, // 替换件标识
        showed                       TYPE string, ": false, // 默认false，不展示。
        source                       TYPE string, ", // 报价类型UserNeedsItemSourceEnum
        stepprices                   TYPE STANDARD TABLE OF ts_newstepprice WITH DEFAULT KEY, ":  // 阶梯价
        storeflag                    TYPE string, ", // 供应商标识
        storeid                      TYPE string, ", // 店铺ID
        storename                    TYPE string, ", // 店铺名称
        storepackageinfo             TYPE string, ", // 商家包邮信息, 具体说明： -1: 不显示; 0: 只显示包邮标识; 大于0: 显示具体的金额包邮标识
        storeservicearea             TYPE string, ", // 店铺服务范围
        storeweekday                 TYPE ts_newstoreweekday, ": { // 供应商休息日相关
        supplierbasearea             TYPE string, ", // 相对位置，外省、同省、同市
        suppliercompanyid            TYPE string, ", // 供应商公司ID
        supplierscore                TYPE string, ": null, // 商家评分
        supplierscoresortvalue       TYPE string, ", // 商家评分排序序号
        taxrate                      TYPE string, ": null, // 税率
        timesortvalue                TYPE string, ", // 时间排序序号
        top                          TYPE string, ": false, // 是否置顶
        transporttimeforsort         TYPE string, ": null, // 小狮配送配送时长
        unsaleableremark             TYPE string, ", // 禁售原因
        unsaleablestatus             TYPE string, ", // 禁售与不建议购买的标志
        whetherproductset            TYPE string, ", // 是否套件,Y:是;N:否
        wholionlogisticsdto          TYPE ts_newwholionlogisticsdto , ":  // 小狮配送物流信息
      END OF ts_newquotedpriceresults .
  types:
    BEGIN OF ts_newresolveresult,
        resolveid          TYPE string, ", // 译码单ID
        selected           TYPE string, ": false, // 是否选中
        selltype           TYPE string, ", // 销售类型
        source             TYPE string, ", // 报价类型UserNeedsSourceEnum
        decodesource       TYPE string, ", // 译码来源
        hasorder           TYPE string, ": false, // 是否已下单
        hidden             TYPE string, ": false, // 是否隐藏
        id                 TYPE string, ", // 译码结果ID
        inquiryid          TYPE string, ", // 询价单ID
        inquiryitemid      TYPE string, ", // 需求ID
        issuggest          TYPE string, ", // 是否推荐
        needpackage        TYPE string, ", // 是否需要打包
        competitiveprice   TYPE string,
        quotedpriceresults TYPE STANDARD TABLE OF ts_newquotedpriceresults WITH DEFAULT KEY,
        partsname          TYPE string, ", // 标准名称
        partsnum           TYPE string, ", // 零件号
        quantity           TYPE string, ", // 数量
        recommendamount    TYPE string, ", // 推荐购买数量
        referenceitemid    TYPE string, ", // 报价条目
        referenceprice     TYPE string, ": null, // 参考价格
        remark             TYPE string, ", // 译码备注
        standardname       TYPE string, ", // 旧标名
        standardnamecode   TYPE string, ", // 标名code
        status4skey        TYPE string, ", // 4S纠错|补充状态Status4sEnum
        status4svalue      TYPE string, ", // 4S纠错|补充状态名称Status4sEnum
        statusid           TYPE string, ", // 状态ID
        statusname         TYPE string, "// 状态名称
      END OF ts_newresolveresult .
  types:
    BEGIN OF ts_newinquiryitem,
        id              TYPE string, ", // 需求ID
        inquiryid       TYPE string, ", // 询价单ID
        needsname       TYPE string, "
        remark          TYPE string, "需求备注
        quotestatusid   TYPE string, "
        quotestatusname TYPE string, "
        quantity        TYPE string,
        hasorder        TYPE string, "// 是否已下单
        resolveresults  TYPE STANDARD TABLE OF ts_newresolveresult WITH DEFAULT KEY, ": // 译码结果
        source          TYPE string, ", // 来源UserNeedsSourceEnum
        statusid        TYPE string, ", // 状态ID
        statusname      TYPE string, "// 状态名称
      END OF ts_newinquiryitem .
  types:
    BEGIN OF ts_newinquiry,
        id                TYPE string, ": "B22081802671",
        resolveid         TYPE string, "B22081808519",
        inquirystatusid   TYPE string, "QUOTE",
        isnewinquiry      TYPE string, "N",
        inquirytype       TYPE string, "COMMON_INQUIRY",
        vin               TYPE string,
        carbrandid        TYPE string,
        carbrandname      TYPE string,
        enginetype        TYPE string,
        carmodelname      TYPE string,
        issimpleinquiry   TYPE string,
        insurancedirect   TYPE string,
        garagecompanyid   TYPE string,
        garagecompanyname TYPE string,
        addressid         TYPE string,
        openinvoicetype   TYPE string,
        createdby         TYPE string,
        villagegeoid      TYPE string,
        geocityid         TYPE string,
        countygeoid       TYPE string,
        resolvestatusid   TYPE string, "DECODED",
      END OF ts_newinquiry .
  types:
    BEGIN OF ts_newinqdetail_r,
        status          TYPE string,
        message         TYPE string,
        accidentinquiry TYPE string,
        inquiry         TYPE ts_newinquiry,
        inquiryitems    TYPE STANDARD TABLE OF ts_newinquiryitem WITH DEFAULT KEY,
      END OF ts_newinqdetail_r .
  types:
    BEGIN OF ts_dataresources,
        dataresourceid   TYPE string,
        objectinfo       TYPE string,
        createdby        TYPE string, ", // 创建人
        createdstamp     TYPE string, ", // 创建时间
        lastupdatedstamp TYPE string, ", // 修改时间
        mimetypeid       TYPE string, ": "", // 附件类型MimeTypeEnum
      END OF ts_dataresources .
  types:
    BEGIN OF ts_decodelist,
        inquiryid        TYPE string,
        decoderesultid   TYPE string,
        partsnum         TYPE string,
        quantity         TYPE string,
        partsname        TYPE string,
        competitiveprice TYPE string,
        dataresources    TYPE STANDARD TABLE OF ts_dataresources WITH DEFAULT KEY,
        remark           TYPE string,
      END OF ts_decodelist .
  types:
    BEGIN OF ts_newuserneed,
        shoppinglistid              TYPE string,
        needid                      TYPE string,
        quantity                    TYPE string,
        needsname                   TYPE string,
        remark                      TYPE string,
        dataresources               TYPE STANDARD TABLE OF ts_dataresources WITH DEFAULT KEY,
        inquirybodydecoderesultlist TYPE TABLE OF ts_decodelist WITH DEFAULT KEY,
      END OF ts_newuserneed .
  types:
    BEGIN OF ts_newinquiry_decode,
        userneeds TYPE STANDARD TABLE OF ts_newuserneed WITH DEFAULT KEY,
      END OF ts_newinquiry_decode .
  types:
    BEGIN OF ts_quoteresourcedesc,
        type  TYPE string, ": "", // 描述类型
        value TYPE string, ": "" // 描述值
      END OF  ts_quoteresourcedesc .
  types:
    BEGIN OF ts_quoteresourceinfo,
        businesstype     TYPE string, ": "", // 业务类型
        id               TYPE string, ": "", // 主键Id
        mimetype         TYPE string, ": "", // 资源类型,视频图片
        photodescription TYPE string, ": "", // 图片描述的资源地址
        resourcesize     TYPE string, ": "", // 资源的文件大小,单位KB
        resourcevalue    TYPE string, ": "", // 资源地址
        textdescription  TYPE string, ": "" // 文字描述
      END OF ts_quoteresourceinfo .
  types:
    BEGIN OF ts_quoteresource,
        descriptions       TYPE STANDARD TABLE OF ts_quoteresourcedesc WITH DEFAULT KEY, " 报价描述信息
        inquiryid          TYPE string, ": "", // 询价单Id
        quotationproductid TYPE string, ": "", // 报价结果Id
        resources          TYPE STANDARD TABLE OF ts_quoteresourceinfo WITH DEFAULT KEY, ": [ // 报价资源信息 图片/视频
        storeid            TYPE string, ": "" // 店铺Id
      END OF ts_quoteresource .
  types:
    tt_quoteresource TYPE STANDARD TABLE OF ts_quoteresource WITH DEFAULT KEY .
  types:
    BEGIN OF ts_commonbrand,
        partsbrandid   TYPE string, ": "SMC",
        partsbrandname TYPE string, ": "SMC"
      END OF ts_commonbrand .
  types:
    tt_commonbrand TYPE STANDARD TABLE OF ts_commonbrand WITH DEFAULT KEY .
  types:
    BEGIN OF ts_series,
        carbrandid   TYPE string, ": "LANDROVER",
        locationid   TYPE string, ": "2",
        locationname TYPE string, ": "进口路虎",
        seriesid     TYPE string, ": "8-2",
        serieszh     TYPE string, ": "揽胜星脉",
        seriesen     TYPE string, ": "揽胜星脉",
      END OF ts_series .
  types:
    BEGIN OF ts_interbrand,
        storeid       TYPE string,
        partsbrandids TYPE STANDARD TABLE OF string WITH DEFAULT KEY,
      END OF ts_interbrand .
  types:
    BEGIN OF ts_quotablecategories,
        key   TYPE string,
        value TYPE string,
      END OF ts_quotablecategories .
  types:
    BEGIN OF ts_carbrand,
        brandid                TYPE string, ": "LANDROVER",
        brandname              TYPE string, ": "路虎",
        qualities              TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "
        inquirytypes           TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "
        quotablecategoryrange  TYPE string,
*       quotablecategories     TYPE STANDARD TABLE OF string WITH DEFAULT KEY,
        quotablecategories     TYPE STANDARD TABLE OF ts_quotablecategories WITH DEFAULT KEY,
        specialtycategoryrange TYPE string,
*        specialtycategories    TYPE STANDARD TABLE OF string WITH DEFAULT KEY,
        specialtycategories    TYPE STANDARD TABLE OF ts_quotablecategories WITH DEFAULT KEY,
        enabled                TYPE string,
        series                 TYPE STANDARD TABLE OF ts_series WITH DEFAULT KEY,
      END OF ts_carbrand .
  types:
    tt_carbrand TYPE STANDARD TABLE OF ts_carbrand WITH DEFAULT KEY .
  types:
    BEGIN OF ty_fgoods,
        findgoodsid TYPE string,
        inquiryid   TYPE string,
      END OF ty_fgoods .
  types:
    BEGIN OF ty_misssku,
        inquiryid     TYPE string,
        stockoutcount TYPE int4,
      END OF ty_misssku .
  types:
    tt_misssku TYPE STANDARD TABLE OF ty_misssku WITH DEFAULT KEY .
  types:
    BEGIN OF ts_fgoodsstatus ,
        inquiryid TYPE string,
        statusid  TYPE string,
      END OF ts_fgoodsstatus .
  types:
    tt_fgoodsstatus TYPE STANDARD TABLE OF ts_fgoodsstatus WITH DEFAULT KEY .
  types:
    BEGIN OF ts_enablefindgoods,
        inquiryid        TYPE string,
        resolveresultids TYPE STANDARD TABLE OF string WITH DEFAULT KEY,
      END OF ts_enablefindgoods .
  types:
    tt_enablefindgoods TYPE STANDARD TABLE OF ts_enablefindgoods WITH DEFAULT KEY .
  types:
    BEGIN OF ts_etalabels,
        logisticsservicetype TYPE string,
        etashow              TYPE string,
        distributiontime     TYPE string,
      END OF ts_etalabels .
  types:
    BEGIN OF ts_eta,
        productid  TYPE string,
        defaulteta TYPE string,
        etalabels  TYPE STANDARD TABLE OF ts_etalabels WITH DEFAULT KEY,
      END OF ts_eta .
  types:
    tt_eta TYPE STANDARD TABLE OF ts_eta WITH DEFAULT KEY .
  types:
    BEGIN OF ts_userneed,
        id                      TYPE string, ": "1954898610623758336",
        inquiryid               TYPE string, ": "B22100807228",
        needsname               TYPE string, ": "机油格",
        quantity                TYPE string, ": 1,
        statusid                TYPE string, ": "DECODED",
        source                  TYPE string, ": "MANUAL_ENTRY",
        createdstamp            TYPE string, ": 1665200949000,
        lastupdatedstamp        TYPE string, ": 1665200950000,
        quotedpriceresultnumber TYPE string, ": 0,
        hasorder                TYPE string, ": false
      END OF ts_userneed .
  types:
    tt_userneed TYPE STANDARD TABLE OF ts_userneed WITH DEFAULT KEY .
  types:
    BEGIN OF ts_decode,
        inquiryid        TYPE string, "询价单ID
        inquiryitemid    TYPE string, "需求ID
        id               TYPE string, "译码结果ID
        partsname        TYPE string, "标准名称
        partsnum         TYPE string, "零件号
        quantity         TYPE string, "数量
        source           TYPE string, "报价类型UserNeedsSourceEnum
        selltype         TYPE string, "销售类型
        remark           TYPE string, "备注
        standardname     TYPE string, "标名
        standardnamecode TYPE string, "新标名code
        statusid         TYPE string, "状态ID
        statusname       TYPE string, "状态名称
        competitiveprice TYPE string, "4S店价格
        categorycode     TYPE string, "品类
      END OF ts_decode .
  types:
    tt_decode TYPE STANDARD TABLE OF ts_decode WITH DEFAULT KEY .
  types:
    BEGIN OF ts_pinkagelabel,
        activityid     TYPE string, "参加的活动id（匹配上活动时不为空）
        activitysource TYPE string, "活动来源:店铺包邮活动store,平台包邮活动platform
        pinkagelabel   TYPE string, "包邮活动标签展示文案（匹配上活动时不为空）
        productid      TYPE string, "商品唯一标识,和入参一一对应返回
      END OF ts_pinkagelabel .
  types:
    tt_pinkagelabel TYPE STANDARD TABLE OF ts_pinkagelabel WITH DEFAULT KEY .
  types:
      "配套花纹报价id
    BEGIN OF ty_item,
        id TYPE  string,
      END OF ty_item .
  types:
    tt_item TYPE STANDARD TABLE OF ty_item .
  types:
    BEGIN OF ty_facility,
        facilityid TYPE string,
      END OF ty_facility .
  types:
    BEGIN OF ty_storeandfacilities,
        storeid    TYPE string, "仓库id
        facilityid TYPE string, "店铺id
      END OF ty_storeandfacilities .
  types:
    BEGIN OF ty_storeandfacilities1,
        storeid     TYPE string, "仓库id
        facilityids TYPE STANDARD TABLE OF  ty_facility WITH DEFAULT KEY, "店铺id
      END OF ty_storeandfacilities1 .
  types:
    BEGIN OF ty_storeinf,
        villagegeoid       TYPE string,
        countygeoid        TYPE string,
        citygeoid          TYPE string,
        provincegeoid      TYPE string,
        storeandfacilities TYPE STANDARD TABLE OF ty_storeandfacilities1 WITH DEFAULT KEY,
      END OF ty_storeinf .
  types:
    tt_storeinf TYPE STANDARD TABLE OF ty_storeinf WITH DEFAULT KEY .
  types:
      "商家配送时效出参
    BEGIN OF ty_storedeliveryitem,
        destinationgeoid     TYPE string, "送达区域geoId
        duration             TYPE string, "时效（单位小时
        durationdescription  TYPE string, "时效描述
        durationdescriptions TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "时效描述
        facilityid           TYPE string, "仓库id
        storeid              TYPE string, "店铺id
      END OF ty_storedeliveryitem .
  types:
    tt_storedelivery TYPE STANDARD TABLE OF ty_storedeliveryitem WITH NON-UNIQUE SORTED KEY store COMPONENTS storeid facilityid .
  types:
    BEGIN OF ty_price,   "报价结果价格
        price     TYPE p LENGTH 13 DECIMALS 2,
        pricetype TYPE string,
      END OF ty_price .
  types:
    BEGIN OF ty_attribute,   "报价结果属性
        sourceid       TYPE string,
        sourcetype     TYPE string,
        attributetype  TYPE string,
        attributevalue TYPE string,
      END OF ty_attribute .
  types:
    BEGIN OF ty_resource,   "报价结果资源
        resourcename  TYPE string,
        resourcevalue TYPE string,
      END OF ty_resource .
  types:
    BEGIN OF ty_virtualtelnumber,
        bindnum           TYPE string,
        calldeadlinestamp TYPE string,
        extendnum         TYPE string,
        virtualnum        TYPE string,
      END OF ty_virtualtelnumber .
  types:
    BEGIN OF ty_quoproduct,    "报价结果
        categorycode                  TYPE string,
        createdby                     TYPE string,
        createddate                   TYPE string,
        demandid                      TYPE string,
        lastupdatedby                 TYPE string,
        lastupdateddate               TYPE string,
        locationid                    TYPE string,
        locationname                  TYPE string,
        organizationid                TYPE string,
        organizationname              TYPE string,
        parttype                      TYPE string,
        partsbrandcode                TYPE string,
        partsbrandname                TYPE string,
        partsbrandqualityid           TYPE string,
        partsname                     TYPE string,
        partsnum                      TYPE string,
        quantity                      TYPE int4,
        quotationdemanditemid         TYPE string,
        quotationid                   TYPE string,
        quotationpricelist            TYPE STANDARD TABLE OF ty_price WITH DEFAULT KEY,
        quotationproductattributelist TYPE STANDARD TABLE OF ty_attribute WITH DEFAULT KEY,
        quotationproductid            TYPE string,
        quotationproductresourcelist  TYPE STANDARD TABLE OF ty_resource WITH DEFAULT KEY,
        quotedtype                    TYPE string,
        remark                        TYPE string,
        sourceid                      TYPE string,
        sourcetype                    TYPE string,
        standardnamecode              TYPE string,
        statusid                      TYPE string,
        stockuptime                   TYPE int4,
        stockuptype                   TYPE string,
      END OF ty_quoproduct .
  types:
    BEGIN OF ty_quotation,
        outofstockstoreids   TYPE STANDARD TABLE OF string WITH DEFAULT KEY,
        partsname            TYPE string,
        partsnumber          TYPE string,
        quotationproductlist TYPE STANDARD TABLE OF ty_quoproduct WITH DEFAULT KEY,
        standarditemid       TYPE string,
        tyreorientation      TYPE string,
        unquotestoreids      TYPE STANDARD TABLE OF string WITH DEFAULT KEY,
      END OF ty_quotation .
  types:
    tt_quotation TYPE STANDARD TABLE OF ty_quotation WITH DEFAULT KEY .
  types:
    BEGIN OF ty_inqfile,
        inquiryid         TYPE string,
        createdby         TYPE string,
        lastupdatedby     TYPE string,
        lastupdatedstampy TYPE string,
        createdstamp      TYPE string,
        mediatype         TYPE string, "资源类型
        typedescription   TYPE string,
        typeid            TYPE string, "业务类型
        url               TYPE string,
      END OF ty_inqfile .
  types:
    tt_inqfile TYPE STANDARD TABLE OF ty_inqfile WITH DEFAULT KEY .
  types:
    BEGIN OF ty_clarifiedqualities7,
        quality TYPE string,
        type    TYPE string,
      END OF ty_clarifiedqualities7 .
  types:
    tt_clarifiedqualities7 TYPE STANDARD TABLE OF ty_clarifiedqualities7 WITH DEFAULT KEY .
  types:
    BEGIN OF ty_systemdefaultqualities8,
        quality TYPE string,
        type    TYPE string,
      END OF ty_systemdefaultqualities8 .
  types:
    BEGIN OF ty_resolveresults6,
        clarifiedqualities TYPE tt_clarifiedqualities7,
        clarifiedtype      TYPE string,
        partsname          TYPE string,
        partsnum           TYPE string,
        resolveresultid    TYPE string,
      END OF ty_resolveresults6 .
  types:
    BEGIN OF ty_publishqualities5,
        quality TYPE string,
        type    TYPE string,
      END OF ty_publishqualities5 .
  types:
    tt_publishqualities5 TYPE STANDARD TABLE OF ty_publishqualities5 WITH DEFAULT KEY .
  types:
    tt_resolveresults6 TYPE STANDARD TABLE OF ty_resolveresults6 WITH DEFAULT KEY .
  types:
    tt_systemdefaultqualities8 TYPE STANDARD TABLE OF ty_systemdefaultqualities8 WITH DEFAULT KEY .
  types:
    BEGIN OF ty_userneedsqualities4,
        needname               TYPE string,
        userneedid             TYPE string,
        publishqualities       TYPE tt_publishqualities5,
        resolveresults         TYPE tt_resolveresults6,
        systemdefaultqualities TYPE tt_systemdefaultqualities8,
      END OF ty_userneedsqualities4 .
  types:
    BEGIN OF ty_inquiryqualityrecords3,
        quality TYPE string,
        type    TYPE string,
      END OF ty_inquiryqualityrecords3 .
  types:
    BEGIN OF ty_defaultqualities2,
        quality TYPE string,
        type    TYPE string,
      END OF ty_defaultqualities2 .
  types:
    tt_userneedsqualities4 TYPE STANDARD TABLE OF ty_userneedsqualities4 WITH DEFAULT KEY .
  types:
    tt_inquiryqualityrecords3 TYPE STANDARD TABLE OF ty_inquiryqualityrecords3 WITH DEFAULT KEY .
  types:
    tt_defaultqualities2 TYPE STANDARD TABLE OF ty_defaultqualities2 WITH DEFAULT KEY .
  types:
    BEGIN OF ty_quality,
        defaultqualities      TYPE tt_defaultqualities2,
        inquiryid             TYPE string,
        inquiryqualityrecords TYPE tt_inquiryqualityrecords3,
        userneedsqualities    TYPE tt_userneedsqualities4,
      END OF ty_quality .
  types:
    BEGIN OF ts_addressinfos,
        addressid       TYPE  string, "地址ID
        countygeoid     TYPE  string, "区Id
        countygeoname   TYPE  string, "区名称
        geocityid       TYPE  string, "市ID'
        geocityname     TYPE  string, "市名称'
        geoprovinceid   TYPE  string, "省份ID
        geoprovincename TYPE  string, "省名称'
        villagegeoid    TYPE  string, "街道Id
        villagegeoname  TYPE  string, "街道名字
      END OF ts_addressinfos .
  types:
    BEGIN OF ts_inquirybaseinfos,
        appendinquiryqualities    TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "询价单追加品质需求
        inquiryqualities          TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "询价单品质需求
        cloudbase                 TYPE  string, "云仓
        createdby                 TYPE  string, " 创建人
        createdstamp              TYPE  string, " 创建时间
        customerserviceid         TYPE  string, " 是否被领取
        customerserviceqq         TYPE  string, " 发布源
        expiredstamp              TYPE  string, " 过期时间
        inquiryamount             TYPE  string, "询价单总金额
        inquiryid                 TYPE  string, " 询价单id
        inquirytype               TYPE  string , "询价单类型InquiryTypeEnum
        insurancecompanycode      TYPE  string, "保险公司编码
        insurancecompanyshortname TYPE  string, "保险公司简称
        insurancedirect           TYPE  string, "是否保险直供
        internalcode              TYPE  string, "有无内部编码
        invoicetype               TYPE  string, " 发票类型
        isaccident                TYPE  string, "是否中端车事故单
        isanonymous               TYPE  string , "是否匿名; 0 : 实名 ; 1 : 匿名
        ismarkinquiry             TYPE  int4, "1为新询价单，0为旧询价单
        isneedwholeprice          TYPE  int4, " 0不需要到店价，1需要到店价
        isnewinquiry              TYPE  string, " 是否为新客询价单
        isrequireiteminvoice      TYPE  int4, " 0为不需要对项发票，1为需要对项发票
        isskipdecode              TYPE  int4, " SkipDecodeEnum 1已跳过译码的
        lastupdatedstamp          TYPE  string, " 修改时间
        needcount                 TYPE  int4, " 需求数量
        newversion                TYPE  string, " 新版本 是：Y,否：其他
        noreplacement             TYPE  string, " 是否需要替换件
        openinvoicetype           TYPE  string, " YES:开票；NO:不开
        quality                   TYPE  string, " 品质
        resolvebegindate          TYPE  string, "开始译码时间
        resolveenddate            TYPE  string, "译码结束时间
        resolvestatus             TYPE  string, " 解析状态:Y已解析N未解析C继续解析'
        resolveusername           TYPE  string, " 译码员名字
        shoppinglisttypeid        TYPE  string, " 询价单类型ID
        sourceid                  TYPE  string, " 译码单ID
        statusid                  TYPE  string, " 状态ID
        username                  TYPE  string, " 联系人
      END OF ts_inquirybaseinfos .
  types:
    BEGIN OF ty_inquirycarinfos,
        carbrandid     TYPE  string, "汽车品牌
        carbrandname   TYPE  string, "车品牌名称
        carmodelid     TYPE  string, "车型ID
        carmodelname   TYPE  string, "车型名称
        chassisid      TYPE  string, "底盘号
        enginetype     TYPE  string, "销售车型名称'
        epcmodelcode   TYPE  string , "epc车型id
        epcmodelname   TYPE  string, "epc车型名称
        inquiryid      TYPE  string, "询价单id
        licenseplate   TYPE  string, "车牌
        locationid     TYPE  string, "主机厂ID
        locationname   TYPE  string, "主机厂名称
        productiondate TYPE  string, "出厂日期
        seriesen       TYPE  string, "车系英文名称
        seriesid       TYPE  string, "车系ID
        serieszh       TYPE  string, "车系中文名称
        vehicletype    TYPE  string, "'销售车型ID'
        vin            TYPE  string, "vin码
      END OF ty_inquirycarinfos .
  types:
    BEGIN OF ty_inquirytaginfos,
        id        TYPE  int4, "id
        inquiryid TYPE  string, "询价单号ID-->shoppingListId
        tagtype   TYPE  string, "标签类型
        tagvalue  TYPE  string, "标签值
      END OF ty_inquirytaginfos .
  types:
    BEGIN OF ts_inquiryuserinfos,
        contactnumber     TYPE  string, "'机号码
        corporateid       TYPE  string, "主账号ID
        corporatename     TYPE  string, "主账号名称
        garagecompanyid   TYPE  string, "公司账号ID
        garagecompanyname TYPE  string, "公司名称
        groupuserid       TYPE  string, "'集团用户ID'
        groupusername     TYPE  string, "'集团用户名称'
        username          TYPE  string, "'联系人'
      END OF ts_inquiryuserinfos .
  types:
    BEGIN OF ts_inquiryhead,
        addressinfos     TYPE  ts_addressinfos, "地址信息
        address          TYPE  ts_addressinfos, "地址信息
        inquirybaseinfos TYPE  ts_inquirybaseinfos, "询价单自带信息
        inquirycarinfos  TYPE ty_inquirycarinfos, "车辆信息
        inquirytaginfos  TYPE STANDARD TABLE OF ty_inquirytaginfos WITH DEFAULT KEY, "询价标签信息
        inquiryuserinfos TYPE ts_inquiryuserinfos, "询价标签信息
      END OF ts_inquiryhead .
  types:
*    "冷库询价单抬头
*    TYPES:
*      BEGIN OF ts_inquirybaseinfos,
*        inquiryid            TYPE string, ": "B23020104747",
*        createdby            TYPE string, ": "61eb7715bd22310001d46d85",
*        createdstamp         TYPE string, ": 1675266354000,
*        username             TYPE string, ": "订单自动化",
*        lastupdatedstamp     TYPE string, ": 1675418700000,
*        needcount            TYPE string, ": 1,
*        expiredstamp         TYPE string, ": 1675418400000,
*        inquirytype          TYPE string, ": "COMMON_INQUIRY",
*        sourceid             TYPE string, ": "B23020108296",
*        invoicetype          TYPE string, ": "VAT",
*        isnewinquiry         TYPE string, ": "N",
*        resolvestatus        TYPE string, ": "DECODED",
*        resolvebegindate     TYPE string, ": 1675266355000,
*        resolveenddate       TYPE string, ": 1675266355000,
*        resolveusername      TYPE string, ": "系统",
*        openinvoicetype      TYPE string, ": "NO",
*        noreplacement        TYPE string, ": "N",
*        isanonymous          TYPE string, ": "0",
*        isskipdecode         TYPE string, ": 0,
*        ismarkinquiry        TYPE string, ": 1,
*        isrequireiteminvoice TYPE string, ": 0,
*        isneedwholeprice     TYPE string, ": 0,
*        inquiryamount        TYPE string, ": 0,
*      END OF ts_inquirybaseinfos.
*    "冷库询价单详情
    BEGIN OF ts_storelayers1,
        storeid             TYPE string, ": "GZATQ001",
        score               TYPE string, ": 0,
        productexpandnum    TYPE string, ": "2",
        quotationproductids TYPE STANDARD TABLE OF string WITH DEFAULT KEY, ":
      END OF ts_storelayers1 .
  types:
    BEGIN OF ts_brandconfigs,
        id                 TYPE string, ": "BMW11020BMW",
        brandcode          TYPE string, ": "BMW",
        categorycode       TYPE string,                     ": "11020",
        descriptionpchref  TYPE string, ": "https://www.cassmall.com/mall/public/activity/product/#/advertising?adId=128",
        descriptionapphref TYPE string, ": "cassapp://route/rn/ADCouponsLandingPage?query={\"adId\":\"128\"}",
        sales              TYPE string, ": "",
        goodrate           TYPE string, ": ""
      END OF ts_brandconfigs .
  types:
    BEGIN OF ts_sublayers1,
        sublayerid        TYPE string, ": "653b6fba42bac500013c51d9-OTHER_LAYER-BMW-ORIGINAL_CURRENCY",
        sublayername      TYPE string, ": "宝马-原厂(非国内4S)",
        brandcode         TYPE string, ": "BMW",
        brandname         TYPE string, ": "宝马",
        qualitycode       TYPE string, ": "ORIGINAL_CURRENCY",
        qualityname       TYPE string, ": "原厂(非国内4S)",
        totalscore        TYPE string, ": 0,
        sublayerexpandnum TYPE string, ": 3,
        showadvflag       TYPE string, ": false,
        brandconfigs      TYPE ts_brandconfigs, ":
        storelayers       TYPE STANDARD TABLE OF ts_storelayers1 WITH DEFAULT KEY,
      END OF ts_sublayers1 .
  types:
    BEGIN OF ts_layers1,
        layerid        TYPE string, ": "",
        layercode      TYPE string, ": "OTHER_LAYER",
        layername      TYPE string, ": "其他",
        layerexpandnum TYPE string, ": 3,
        sublayers      TYPE STANDARD TABLE OF ts_sublayers1 WITH DEFAULT KEY, ":
      END OF ts_layers1 .
  types:
    BEGIN OF ts_quotationproducts1,
        quotationproductid     TYPE string, ": "653b6fcb11deb70001f97da1",
        remark                 TYPE string, ": "无库存",
        inquiryid              TYPE string, ": "B23102709253",
        resolveresultid        TYPE string, ": "653b6fba42bac500013c51d9",
        storeid                TYPE string, ": "GZATQ001",
        storename              TYPE string, ": "广州奥天奇汽配",
        storeservicearea       TYPE string, ": "NATION",
        productid              TYPE string, ": "20941166848559595520",
        producttype            TYPE string, ": "FINISHED_GOODS",
        partsnum               TYPE string, ": "37116796925",
        partsname              TYPE string, ": "减震",
        parttype               TYPE string, ": "ORIGINAL_PARTS",
        brandid                TYPE string, ": "BMW",
        brandname              TYPE string, ": "宝马",
        price                  TYPE string, ": 111,
        btprice                TYPE string, ": 105.71,
        btboxfee               TYPE string, ": 0,
        atboxfee               TYPE string, ": 0,
        btbuyerandboxfee       TYPE string, ": 105.71,
        atbuyerandboxfee       TYPE string, ": 111,
        sellerpriceandboxfee   TYPE string, ": 0,
        sellerbtpriceandboxfee TYPE string, ": 0,
        selltype               TYPE string, ": "",
        partsbrandquality      TYPE string, ": "ORIGINAL_CURRENCY",
        hotsale                TYPE string, ": "N",
        quantity               TYPE string, ": 1,
        sellstatus             TYPE string, ": "ORDERED",
        source                 TYPE string, ": "AUTO",
        arrivaltime            TYPE string, ": 0,
        location               TYPE string, ": "CN_SZFTC",
        locationname           TYPE string, ": "深圳福田仓",
        createdstamp           TYPE string, ": 1698394059000,
        lastupdatedstamp       TYPE string, ": 1698394205000,
        createdby              TYPE string, ": "system",
        isreplacement          TYPE string, ": false,
        replacementtype        TYPE string, ": "PLATFORM_REPLACE","STORE_REPLACE","REPLACE_PART"
        isshowpartsnum         TYPE string, ": false,
        totalscore             TYPE string, ": 0,
        isordered              TYPE string, ": true,
        showadvflag            TYPE string, ": false
      END OF ts_quotationproducts1 .
  types:
    BEGIN OF ts_decoderesults,
        decoderesultid        TYPE string, ": "63da8932fb022f0001d87922",
        inquiryid             TYPE string, ": "B23020104747",
        partsnum              TYPE string, ": "17 11 7 802 662",
        quantity              TYPE string, ": 1,
        remark                TYPE string, ": "",
        partsname             TYPE string, ": "火花塞",
        statusid              TYPE string, ": "QUOTE",
        createdby             TYPE string, ": "61eb7715bd22310001d46d85",
        competitiveprice      TYPE string,                  ": 3520,
        userneedsid           TYPE string, ": "1997115979542220800",
        source                TYPE string, ": "AUTO",
        selltype              TYPE string, ": "COMMON",
        adjustmentproducttype TYPE string, ": "ROUTINE",
        issuggest             TYPE string, ": "",
        needpackage           TYPE string, ": "N",
        decodesource          TYPE string, ": "MASTER_DATA_AUTO",
        decoderid             TYPE string, ": "system",
        referenceprice        TYPE string, ": 0,
        standardname          TYPE string, ": "火花塞",
        standardnamecode      TYPE string, ": "109210001",
        categorycode          TYPE string,                  ": "10921",
        layers                TYPE STANDARD TABLE OF ts_layers1 WITH DEFAULT KEY, ": [],
        quotationproducts     TYPE STANDARD TABLE OF ts_quotationproducts1 WITH DEFAULT KEY, ": []
      END OF ts_decoderesults .
  types:
    BEGIN OF ts_userneeds,
        needid                TYPE string, ": "1997115979542220800",
        inquiryid             TYPE string, ": "B23020104747",
        needsname             TYPE string, ": "火花塞",
        quantity              TYPE string, ": 1,
        remark                TYPE string, ": "",
        createdby             TYPE string, ": "61eb7715bd22310001d46d85",
        statusid              TYPE string, ": "DECODED",
        competitiveprice      TYPE string, ": "3520.0",
        source                TYPE string, ": "MANUAL_ENTRY",
        issuggest             TYPE string, ": "N",
        selltype              TYPE string, ": "COMMON",
        adjustmentproducttype TYPE string, ": "ROUTINE",
        referenceprice        TYPE string, ": 0,
        standardname          TYPE string, ": "火花塞",
        categorycode          TYPE string,                  ": "10921",
        dataresources         TYPE STANDARD TABLE OF ts_dataresources WITH DEFAULT KEY,
        decoderesults         TYPE STANDARD TABLE OF ts_decoderesults WITH DEFAULT KEY,  ":
      END OF ts_userneeds .
  types:
    BEGIN OF ts_decoderesultnavigation,
        userneedid        TYPE string, ": "1997115979542220800",
        decoderesultid    TYPE string, ": "63da8932fb022f0001d87922",
        partsnum          TYPE string, ": "17 11 7 802 662",
        partsname         TYPE string, ": "火花塞",
        showorderedflag   TYPE string, ": false,
        quotestatus       TYPE string, ": "已报价",
        quoteresultnumber TYPE string, ": 0
      END OF ts_decoderesultnavigation .
  types:
    BEGIN OF ts_userneedsnavigation,
        userneedsid            TYPE string, ": "1997115979542220800",
        needsname              TYPE string, ": "火花塞",
        source                 TYPE string, ": "MANUAL_ENTRY",
        decoderesultnavigation TYPE STANDARD TABLE OF ts_decoderesultnavigation WITH DEFAULT KEY, ": [
      END OF ts_userneedsnavigation .
  types:
    BEGIN OF ts_coldinquiry_detail,
        userneeds           TYPE STANDARD TABLE OF ts_userneeds WITH DEFAULT KEY,
        userneedsnavigation TYPE STANDARD TABLE OF ts_userneedsnavigation WITH DEFAULT KEY,
      END OF ts_coldinquiry_detail .
  types:
*------------   "冷库询价单详情
    BEGIN OF ts_label,
        adids           TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "广告ID
        adlocationid    TYPE string, "广告位置ID
        floatingcontent TYPE string, "标签浮窗文案
        labelid         TYPE string, "标签ID
        labelname       TYPE string, "标签名称
        labeltype       TYPE string, "标签类型
        labeltypename   TYPE string, "标签类型名
        url             TYPE string, "跳转url
      END OF ts_label .
  types:
    BEGIN OF ts_labelad,
        labels      TYPE STANDARD TABLE OF ts_label WITH DEFAULT KEY, "广告标签
        showadvflag TYPE string, "是否展示广告标识
      END OF ts_labelad .
  types:
    BEGIN OF ts_sortad,
        adids        TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "广告id
        adlocationid TYPE string, "广告位置ID
        locationrank TYPE string, "推广位置
        showadvflag  TYPE string, "是否展示广告标识
      END OF ts_sortad .
  types:
    BEGIN OF ts_quotationproducts,
        alwaysshow             TYPE string, "是否一定要展示
        arrivaltime            TYPE string, "最快到货时间: xx天
        atboxfee               TYPE string, "税后钉箱费
        atbuyerandboxfee       TYPE string, "买家含税总费用（免税报价+免税钉箱费）
        brandid                TYPE string, "品牌id
        brandname              TYPE string, "品牌名
        brandpartsremark       TYPE string, "品牌件规格备注
        brandpartsurls         TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "品牌件规格图片
        btboxfee               TYPE string, "税前钉箱费
        btbuyerandboxfee       TYPE string, "买家含税总费用（含税报价+含税钉箱费）
        btprice                TYPE string, "免税价格
        createdby              TYPE string, "创建人
        createdstamp           TYPE string, "创建时间
        description            TYPE string, "商品描述
        distance               TYPE string, "距离
        garagecompanyid        TYPE string, "维修厂公司id
        hotsale                TYPE string, "是否为促销商品
        inquiryid              TYPE string, "询价单号
        isordered              TYPE string, "是否已采
        isquotationnoinventory TYPE string, "是否系统报价无库存
        isreplacement          TYPE string, "是否替换件 true 是替换件
        replacementtype        TYPE string, ": "PLATFORM_REPLACE","STORE_REPLACE","REPLACE_PART"
        isshowpartsnum         TYPE string, "是否显示零件号
        labelad                TYPE ts_labelad, " 标签广告
        lastupdatedstamp       TYPE string, "最后更新时间
        location               TYPE string, "发货地id
        locationname           TYPE string, "发货地名称
        originalassort         TYPE string, "原厂配套标识.0否1是
        parttype               TYPE string, "零件类型
        partition              TYPE string, "分区
        partsbrandquality      TYPE string, "零件品牌品质
        partsname              TYPE string, "零件名
        partsnum               TYPE string, "零件号
        price                  TYPE string, "销售价
        priceadjustmentrulesid TYPE string, "价格调节ID
        productid              TYPE string, "商品id
        productsetcode         TYPE string, "套件编码
        productsetid           TYPE string, "套件id
        producttype            TYPE string, "商品类型：FINISHED_GOODS or DISPATCH_GOODS
        quantity               TYPE string, "数量
        quotationid            TYPE string, "报价单id
        quotationproductid     TYPE string, "报价结果id
        quotedtime             TYPE string, "报出时间
        remark                 TYPE string, "商家备注
        resolveresultid        TYPE string, "译码结果id
        sellstatus             TYPE string, "销售状态
        selltype               TYPE string, "销售类型
        sellerbtprice          TYPE string, " 卖家免税价格
        sellerbtpriceandboxfee TYPE string, "卖家免税销售价（免税报价+免税钉箱费）
        sellerprice            TYPE string, "卖家含税价格
        sellerpriceandboxfee   TYPE string, "卖家含税销售价（含税报价+含税钉箱费）
        showadvflag            TYPE string, "是否展示广告标识
        sortad                 TYPE ts_sortad, "排序广告
        source                 TYPE string, "来源
        storecategoryscore     TYPE string, "报价结果店铺类别分数
        storeid                TYPE string, "店铺id
        storename              TYPE string, " 店铺名
        storeservicearea       TYPE string, "店铺服务范围
        suppliercompanyid      TYPE string, "供应商id
        taxrate                TYPE string, "税率
        totalscore             TYPE string, "报价结果总分
        whetherproductset      TYPE string, "是否套件
      END OF ts_quotationproducts .
  types:
    BEGIN OF ts_storelayers,
        storeid             TYPE string,
        quotationproductids TYPE STANDARD TABLE OF string WITH DEFAULT KEY,
      END OF ts_storelayers .
  types:
    BEGIN OF ts_sublayers,
        sublayername                TYPE string,
        brandcode                   TYPE string, ": "SPEZET",
        brandname                   TYPE string, ": "埃森",
        ispartcategorycertification TYPE string, ": false,   //是否有配套资质，true为配套资质，false为无配套资质
        storelayers                 TYPE STANDARD TABLE OF ts_storelayers WITH DEFAULT KEY,
      END OF ts_sublayers .
  types:
    BEGIN OF ts_layers,
        layercode        TYPE string,
        layername        TYPE string,
        layerdescription TYPE string,
        sublayers        TYPE STANDARD TABLE OF ts_sublayers WITH DEFAULT KEY,
      END OF ts_layers .
  types:
    BEGIN OF ts_decoderesult,
        adjustmentproducttype TYPE string, ", // 调节商品类型
        boxfee                TYPE string, " 钉箱费
        categorycode          TYPE string, "品类code
        competitiveprice      TYPE string, " 4s店价格
        competitiveversion    TYPE string, "4s价格版本
        createdby             TYPE string, "创建人
        dataresources         TYPE STANDARD TABLE OF ts_dataresources WITH DEFAULT KEY, ": [ // 译码贴图
        decoderesultid        TYPE string, "译码结果ID
        decodesource          TYPE string, "译码来源
        decoderid             TYPE string, "译码员id
        inquiryid             TYPE string, "询价单ID
        issuggest             TYPE string, "建议"
        needpackage           TYPE string, "是否需要打包
        orderid               TYPE string, "订单id
        partsname             TYPE string, "零件名称
        partsnum              TYPE string, "零件号
        quality               TYPE string, "品质
        quantity              TYPE string, "数量
        layers                TYPE STANDARD TABLE OF ts_layers WITH DEFAULT KEY,
        quotationproducts     TYPE STANDARD TABLE OF ts_quotationproducts WITH DEFAULT KEY,
        recommendamount       TYPE string, "推荐购买数量
        referenceitemid       TYPE string, "报价条目
        referenceprice        TYPE string, "参考价格
        remark                TYPE string, " 备注
        selltype              TYPE string, "销售类型
        source                TYPE string, "来源
        standardname          TYPE string, "旧标准名称
        standardnamecode      TYPE string, "标准名称code
        status4skey           TYPE string, "4S纠错状态key
        status4svalue         TYPE string, "4S纠错状态描述
        statusid              TYPE string, "状态
        userneedsid           TYPE string, "原始需求id
      END OF ts_decoderesult .
  types:
    BEGIN OF ts_inqquotabody_uneed,
        adjustmentproducttype TYPE string, ", // 调节商品类型
        categorycode          TYPE string, ", // 品类code
        competitiveprice      TYPE string, ", // 4S店价格
        competitiveversion    TYPE string, ", // 4s价格版本
        createdby             TYPE string, ", // 创建人
        dataresources         TYPE STANDARD TABLE OF ts_dataresources WITH DEFAULT KEY,
        decoderesults         TYPE STANDARD TABLE OF ts_decoderesult WITH DEFAULT KEY,
        decodesource          TYPE string, ", // 译码来源
        description           TYPE string, ", // 描述
        inquiryid             TYPE string, ", // 询价单ID
        issuggest             TYPE string, ", // null
        needid                TYPE string, ", // 需求ID
        needpackage           TYPE string, ", // 是否需要打包
        needsname             TYPE string, ", // 客户需求(配件名称)
        orderid               TYPE string, ", // 订单ID
        pid                   TYPE string, ", // null
        quantity              TYPE string, ", // 数量
        referenceprice        TYPE string, " // 参考价格
        remark                TYPE string, ", // 备注
        selltype              TYPE string, ", // 销售类型
        source                TYPE string, ", // null
        standardname          TYPE string, ", // 标准名称
        standardnamecode      TYPE string, ", // 标准名称code
        statusid              TYPE string, " // 状态
        itemreturnflag        TYPE string, "//退回标志
      END OF ts_inqquotabody_uneed .
  types:
    BEGIN OF ts_inqquotabody,
        userneeds TYPE STANDARD TABLE OF ts_inqquotabody_uneed WITH DEFAULT KEY,
      END OF ts_inqquotabody .
  types:
    BEGIN OF ts_stepprice,
        btprice       TYPE string, "买家税前价
        maxnum        TYPE string, "阶梯数量最大值
        minnum        TYPE string, "阶梯数量最小值
        price         TYPE string, "买家税后价
        sellerbtprice TYPE string, "卖家税前价
        sellerprice   TYPE string, "卖家税后价
        sortid        TYPE string, "排序
      END OF ts_stepprice .
  types:
    BEGIN OF ts_storequoteitemresult,
        resolveresultid   TYPE string, "译码结果ID
        userneedsitemid   TYPE string, "报价条目ID
        productid         TYPE string, "商品ID
        aftersalesnapshot TYPE string, "售后快照
        "aftersalepoliciesinfos TYPE STANDARD TABLE OF ts_aftersalepoliciesinfo WITH DEFAULT KEY, "售后
        stepprices        TYPE STANDARD TABLE OF ts_stepprice WITH DEFAULT KEY, "阶梯价格
      END OF ts_storequoteitemresult .
  types:
    BEGIN OF ts_storequoteitem,
        quotedpriceitemid     TYPE string, "报价条目id
        resolveresultid       TYPE string, "译码结果ID
        source                TYPE string, "分配的类型：系统报价、人工报价、系统人工都有
        status                TYPE string, "此译码条目下的报价状态，已报价，报价中，未分配，报缺货，重新译码
        storeid               TYPE string, "店铺ID
        storename             TYPE string, "店铺名称
        storequoteitemresults TYPE STANDARD TABLE OF ts_storequoteitemresult WITH DEFAULT KEY, "供应商报价结果
      END OF ts_storequoteitem .
  types:
    BEGIN OF ts_supquotadetail,
        storeid              TYPE string, "店铺ID
        storename            TYPE string, "店铺名称
        wholeorderquote      TYPE string, "是否整单报出（原始需求维度）
        unquoteresolveids    TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "报价中的译码结果id'
        outofstockresolveids TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "报缺货的译码结果id
*        storequoteitems      TYPE TABLE OF ts_storequoteitem WITH DEFAULT KEY, " 供应商报价条目
      END OF ts_supquotadetail .
  types:
    tt_supquotadetail TYPE STANDARD TABLE OF ts_supquotadetail WITH DEFAULT KEY .
  types:
    BEGIN OF ts_promotion_item,
        productid            TYPE string, "2149533227082960914",
        storeid              TYPE string, "GZDAL001",
        trialunitprice       TYPE string, "54,
        trialtotalprice      TYPE string, "108,
        trialadjustment      TYPE string, "6,
        trialtotaladjustment TYPE string, "12,
      END OF ts_promotion_item .
  types:
    BEGIN OF ts_promotion_data,
        trialtotalprice                TYPE string,
        originaltotalprice             TYPE string,
        promotioncalculateproductitems TYPE STANDARD TABLE OF ts_promotion_item WITH DEFAULT KEY,
      END OF ts_promotion_data .
  types:
    BEGIN OF ts_promotion,
        code TYPE string,
        data TYPE ts_promotion_data,
      END OF ts_promotion .
  types:
    BEGIN OF ts_bsfgoodres,
        enabledistribution TYPE string,
        reasoncode         TYPE string,
        reason             TYPE string,
      END OF ts_bsfgoodres .
  types:
      "询价单预算接口
    BEGIN OF ts_productitems,
        productid         TYPE string, ": "6752aa5f1aeb5400017e2fc9",商品ID，询价场景是报价结果ID 商城场景是商品ID
        originalunitprice TYPE string,                  ": 1500,原始基础单价【商家报价】
        baseunitprice     TYPE string,                  ": 1500,显示基础单价
        quantity          TYPE string, ": 1,商品数量
        unitprice         TYPE string,                  ": 1455,成交单价[优惠后的价格]-预估价
        perdiscountamount TYPE string, ": 45,每件商品优惠金额
        subdiscountamount TYPE string, ": 45,商品优惠金额小计
        adjustments       TYPE string, ": null价格优惠调节
      END OF ts_productitems .
  types:
    BEGIN OF ts_calculationlable,
        productid                TYPE string, ": "6752aa5f1aeb5400017e2fc9",商品ID，询价场景是报价结果ID 商城场景是商品ID
        promotiontemplateid      TYPE string, ": "1",促销模板ID
        promotiontypeid          TYPE string, ": null,促销活动类型
        promotionname            TYPE string, ": "国内品牌件97折",促销名称
        promotiontypedisplayname TYPE string, ": "严选折扣卡",促销类型显示名称
        displayname              TYPE string, ": "享9.7折",促销显示名称
        displaylocation          TYPE string, ": "LABEL",促销显示名位置，label:商品条目上标签形式，dropdownlist:商家活动为下拉框形式显示
        sort                     TYPE string, ": 1,显示排序，折扣卡暂无排序需求
        recommend                TYPE string, ": true,是否为推荐促销,true:表示推荐
        issueorganizationtype    TYPE string, ": "PLATFORM",归属组织 : 商家(SUPPLIER),平台(PLATFORM)
        issueorganizationid      TYPE string, ": "CASS"归属组织，开思(CASS)
      END OF ts_calculationlable .
  types:
    BEGIN OF ts_calculationdata,
        productitems TYPE STANDARD TABLE OF ts_productitems WITH DEFAULT KEY, ":促销优惠后的价格信息[仅返回有优惠的数据]
        labels       TYPE STANDARD TABLE OF  ts_calculationlable WITH DEFAULT KEY, "促销优惠显示的促销优惠信息[[2024.5月之后的商家促销活动]
*            summaries": null,促销金额计算汇总
*              storesummaries": null,店铺促销汇总
*              quotationpromotions": [],报价结果促销信息活动清单[2024.5月之前的商家促销活动]
*              preferentialprices": [],报价结果促销预估价[2024.5月之前的商家促销预估计]
*              recommend": null选择报价商家促销推荐+商家促销优惠价格计算
      END OF ts_calculationdata .
  types:
    BEGIN OF ts_calculations,
        code         TYPE string, ": 200,
        errormessage TYPE string, ": null,
        data         TYPE ts_calculationdata, ": {
      END OF ts_calculations .
  types:
      "询价单备注异常原因与处置措施
    BEGIN OF ts_remarkrule,
        inquiryid             TYPE string, ": "B25022111952",     询价单号
        quotationproductid    TYPE string, ": "67b7d891b509010001c20a61",     询价单号
        productid             TYPE string, ": "22688295122636308790",     商品id
        quoteuserid           TYPE string, ": "system",     报价员
        resolvepartsname      TYPE string, ": "水箱",     译码零件名
        resolvepartsnum       TYPE string, ": "LR152200",     译码零件号
        storeid               TYPE string, ": "5100001554",     店铺ID
        storename             TYPE string, ": "路虎捷豹旗舰店（四川）",     店铺名称
        quotetime             TYPE string, ": 1740101778000,     报价时间
        controlmeasuretype    TYPE string, ": "COLLAPSE_QUOTATION_RESULTS",     处置方式ID
        quotetype             TYPE string, ": "AUTO",     报价方式
        carbrandid            TYPE string, ": "LANDROVER",     汽车品牌ID
        carbrandname          TYPE string, ": "路虎",     汽车品牌
        partsbrandid          TYPE string, ": "LANDROVER",     配件品牌ID
        partsbrandname        TYPE string, ": "路虎",     配件品牌
        partsbrandquality     TYPE string, ": "ORIGINAL_INLAND_4S",     配件品质
        partsbrandqualityname TYPE string, ": "原厂(国内4S)",     配件品质名称
        stockstatus           TYPE string, ": "FINISHED_GOODS",     备货情况
        remark                TYPE string, ": "大库订货1-30天，下单前请与店铺客服沟通确认",     备注
        rulesource            TYPE string, ": "MANUAL_CONFIGURATION",     管控来源
        ruletype              TYPE string, ": "MISMATCH_IN_STOCKING_TIME",     命中规则类型
        ruletypename          TYPE string, ": "调货报现货",     命中规则类型名称
        rulename              TYPE string, ": "调货报现货",     规则名称
        ruleid                TYPE string, ": "GK2023110807480",     命中规则ID
        credibility           TYPE string, ": 100.00,     命中信度
        identifyresult        TYPE string, ": "NONE",     识别结果
        createdby             TYPE string, ": "system",     创建人
        createddate           TYPE string, ": 1740101780000,     创建时间
        lastupdatedby         TYPE string, ": "system",     更新人
        lastupdateddate       TYPE string, ": 1740101780000     更新时间
      END OF ts_remarkrule .
  types:
    tt_remarkrule TYPE STANDARD TABLE OF ts_remarkrule WITH DEFAULT KEY .
  types:
      "询价单预算接口入参
    BEGIN OF ts_productitem,
        storeid       TYPE string, ": "4400016109",店铺ID
        inquiryid     TYPE string, ": "B24120609261",询价单ID，询价单场景,此参数必传
        baseunitprice TYPE string,                     ": 1500,试算基础单价
        productid     TYPE string, ": "6752aa5f1aeb5400017e2fc9",商品ID，询价场景是报价结果ID 商城场景是商品ID
        mallproductid TYPE string, ": "21850081355386920970",商城商品ID，询报价场景此参数必传
        quantity      TYPE string, ": 1商品数量
      END OF ts_productitem .
  types:
    BEGIN OF ts_pricecalculateimport,
        businessgroup TYPE string, ": "INQUIRY",业务分组
        businessunit  TYPE string, ": "COMMON_INQUIRY",业务单元
        channel       TYPE string, ": "B2B",渠道
        client        TYPE string, ": "APP"客户端域
        companyid     TYPE string, ": "10431",维修厂公司ID
        userloginid   TYPE string, ": "668ceb27ef868400011ea37c",当前登录用户ID
        productitems  TYPE STANDARD TABLE OF ts_productitem WITH DEFAULT KEY, "匹配促销活动商品条目请求入参
      END OF ts_pricecalculateimport .

  methods ADD_INQUIRY_QUOTEAREA
    importing
      !IS_ADDQUOTEAREA type ZINQ_S_ADDQUOTEAREA
      !IV_ONLINE type STRING .
  methods BIND_INQUIRYVIRTUALTELNUM
    importing
      value(INQUIRYID) type STRING
    exporting
      !ES_TELNUM_INF type TY_VIRTUALTELNUMBER
      !EV_MSG type BAPIRET2 .
  methods CHECK_BDFGOODS_ASSIGN_STORE
    importing
      value(IV_INQUIRY) type STRING
      value(IV_STOREID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(EV_ENABLE) type STRING .
  methods CHECK_BDFGOODS_AUTH
    importing
      value(IV_INQUIRY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(EV_ENABLE) type STRING .
  methods CHECK_FINDSTOCK_AUTH
    importing
      value(IV_INQUIRYID) type STRING optional
    exporting
      !ET_FGOODSSTATUS type TT_FGOODSSTATUS
      !EV_MSG type BAPIRET2 .
  methods CREATE_FGOODS
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(EV_FGOODSID) type STRING .
  methods GET_ACCIDENT_QUOTA
    importing
      value(IV_STOREID) type STRING optional
    exporting
      !EV_MSG type BAPIRET2
      !ES_QUOTEAREA type ZINQ_S_QUOTEAREA .
  methods GET_AFTERSALEPOLICYS
    importing
      value(IV_COMPANYID) type STRING optional
      value(IV_POLICYGROUPLIST) type STRING optional
      value(ET_POLICYGROUPLIST) type ZINQ_T_POLICYGROUPLIST optional
    exporting
      !ET_POLICYDISPLAY type ZINQ_T_POLICYDISPLAY
      !EV_MSG type BAPIRET2 .
  methods GET_COLDINQUIRY_DETAIL
    importing
      value(IV_INQUIRYID) type STRING
      value(IV_PLATFORM) type STRING
    exporting
      value(ES_INQUIRYDETAIL) type TS_COLDINQUIRY_DETAIL
      value(EV_MSG) type BAPIRET2 .
  methods GET_COLDINQUIRY_HEADER
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      value(ES_INQUIRYHEAD) type TS_INQUIRYHEAD
      value(EV_MSG) type BAPIRET2 .
  methods GET_COLD_INQUIRY_CHECK
    importing
      value(IV_BODY) type STRING optional
    exporting
      !EV_MSG type BAPIRET2
      value(ET_CHECK) type TT_COLD_CHECK .
  methods GET_COLD_INQUIRY_HEAD
    importing
      value(IV_INQUIRYID) type STRING optional
    exporting
      !EV_MSG type BAPIRET2
    returning
      value(ES_INQHEAD) type TS_INQUIRYHEAD .
  methods GET_DEMAND_ORIGINALITEM
    importing
      value(IV_INQUIRYID) type STRING optional
    exporting
      !ET_ORIGINALITEM type ZINQ_T_DEMANDORIGINALITEM
      !EV_MSG type BAPIRET2 .
  methods GET_DEMAND_STANDARDITEM
    importing
      value(IV_INQUIRYID) type STRING optional
    exporting
      !ET_STANDARDITEMS type ZINQ_T_DEMANDSTANDARDITEM
      !EV_MSG type BAPIRET2 .
  methods GET_ETALABEL_SHOW
    importing
      value(IV_BODY) type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ET_DATA type TT_ETA .
  methods GET_FGOODS_ENABLE_SKU
    importing
      value(IV_BODY) type STRING optional
    exporting
      !ES_ENABLEFGOODS type TS_ENABLEFINDGOODS
      !EV_MSG type BAPIRET2 .
  methods GET_HELP_QUOTEDRESULT
    importing
      value(IV_BODY) type STRING
    exporting
      !ES_HELP_QUOTEDRESULT type ZINQ_S_HELP_QUOTEDRESULT
      !EV_MSG type BAPIRET2 .
  methods GET_INQ_PROXY_INF
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      !ES_INQPROXY type ZINQ_PROXY
      !EV_MSG type BAPIRET2 .
  methods GET_INQUIRYVIRTUALTELNUM
    importing
      value(INQUIRYID) type STRING
    exporting
      !ES_TELNUM_INF type TY_VIRTUALTELNUMBER
      !EV_MSG type BAPIRET2 .
  methods GET_INQUIRY_BASE_DETAIL
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      !ES_INQUIRYBASEDETAIL type ZINQ_S_BASEDETAIL
      !EV_MSG type BAPIRET2 .
  methods GET_INQUIRY_BRANDQUALITIES
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      value(ES_BRANDQUALITIES) type ZINQ_S_BRANDQUALITIES
      value(EV_MSG) type BAPIRET2 .
  methods GET_INQUIRY_CALCULATIONS
    importing
      value(IV_BODY) type STRING
    exporting
      value(ES_CALCULATIONS) type TS_CALCULATIONS
      value(EV_MSG) type BAPIRET2 .
  methods PREPARE_PRICECALCULATE_IMPORT
    importing
      value(IS_PRICECALCULATEIMPORT) type TS_PRICECALCULATEIMPORT
    returning
      value(ET_DATA) type TS_CALCULATIONDATA-PRODUCTITEMS .
  methods GET_INQUIRY_CARBRAND
    importing
      value(IV_STORE) type STRING
    returning
      value(CARBRAND) type TT_CARBRAND .
  methods GET_INQUIRY_CUSTOMIZEREMARK
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      value(ES_CUSTOMIZEREMARK) type ZINQ_S_CUSTOMIZEINQUIRYREMARK
      value(EV_MSG) type BAPIRET2 .
  methods GET_INQUIRY_ATTRIBUTE
    importing
      value(IV_INQUIRY) type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ET_DATA type TT_INQATTRIBUTE .
  methods GET_INQUIRY_DECODE
    importing
      value(IV_INQUIRY) type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ET_DATA type TT_DECODE .
  methods GET_INQUIRY_DETAIL
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      value(ES_INQUIRYDETAIL) type ZINQ_S_INQUIRYDETAIL
      value(EV_MSG) type BAPIRET2 .
  methods GET_INQUIRY_DISCOUNT
    importing
      !IV_BODY type STRING
    exporting
      !ET_DISCOUNTLIST type ZINQ_T_DISCOUNT
      !EV_MSG type BAPIRET2 .
  methods GET_INQUIRY_DISCOUNT_STORE
    importing
      !IV_BODY type STRING
    exporting
      !ET_DISCOUNTLIST type TT_DISCOUNT
      !EV_MSG type BAPIRET2 .
  methods GET_INQUIRY_DISCOUNT_STORE_V2
    importing
      !IV_BODY type STRING
    exporting
      !ET_DISCOUNTLIST type TT_DISCOUNT_NEW
      !EV_MSG type BAPIRET2 .
  methods GET_INQUIRY_EXCELLENTQUOTED
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_EXCELLENTQUOTED) type ZINQ_T_EXCELLENTQUOTED .
  methods GET_INQUIRY_FEEDBACK
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_DATA) type TT_FEEDBACK .
  methods GET_INQUIRY_IDENTIFICATION
    importing
      value(IV_BODY) type STRING
    exporting
      !ET_ITEM type TT_ITEM
      !EV_MSG type BAPIRET2 .
  methods GET_INQUIRY_ISHOTSTORAGE
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(LV_OUT) type STRING .
  methods GET_INQUIRY_LOWESTPRICE
    importing
      value(IV_INQUIRYID) type STRING
      value(IV_STOREIDS) type STRING
    exporting
      !EV_MSG type BAPIRET2
    returning
      value(ET_QUOTELOWEST) type ZINQ_T_QUOTELOWEST .
  methods GET_INQUIRY_MISSINGSKU
    importing
      value(INQUIRYID) type ZTICEC_INQUIRY_H-INQUIRYID
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_MISS) type TT_MISSSKU .
  methods GET_INQUIRY_OUTOFSTOCKQUOTE
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_OUTOFSTOCKQUOTE) type ZINQ_T_OUTOFSTOCKQUOTEDRESULT .
  methods GET_INQUIRY_PARTIMAGES
    importing
      value(IV_VIN) type STRING optional
      value(IV_PARTSNUM) type STRING optional
    exporting
      !EV_MSG type BAPIRET2
      !ET_PARTIMAGE type ZINQ_T_PARTIMAGES .
  methods GET_INQUIRY_PARTSBRAND_COMMON
    returning
      value(PARTSBRAND) type TT_COMMONBRAND .
  methods GET_INQUIRY_PARTSBRAND_INTER
    importing
      !IV_STORE type STRING
    returning
      value(PARTSBRAND) type TS_INTERBRAND .
  methods GET_INQUIRY_QUALITY
    importing
      value(IV_INQUIRYID) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_QUALITY) type TY_QUALITY .
  methods GET_INQUIRY_QUOTATIONDETAIL
    importing
      !IV_INQUIRYID type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_QUOTEDETAIL) type TT_SUPQUOTADETAIL .
  methods GET_INQUIRY_QUOTEAREA
    importing
      !IV_DATA type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_QUOTEAREA) type ZINQ_T_QUOTEAREA .
  methods GET_INQUIRY_QUOTEDETAIL_BYNEED
    importing
      value(IV_INQUIRYID) type STRING
      value(IV_USERNEEDS) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
    returning
      value(ES_INQBODY) type TS_INQQUOTABODY .
  methods GET_INQUIRY_QUOTEFILLRATE
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_QUOTEFILLRATE) type ZINQ_S_QUOTEFILLRATE .
  methods GET_INQUIRY_QUOTEPRICE_EXTRA
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_QUOTEEXTRA) type TS_QUOTEPRICE_EXTRA .
  methods GET_INQUIRY_QUOTERESOURCE
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_DATA) type TT_QUOTERESOURCE .
  methods GET_INQUIRY_REMARK
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      value(ES_REMARK) type ZINQ_S_INQUIRYREMARK
      value(EV_MSG) type BAPIRET2 .
  methods GET_INQUIRY_REMARKRULE
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      value(ET_REMARKRULE) type TT_REMARKRULE
      value(EV_MSG) type BAPIRET2 .
  methods GET_INQUIRY_RESOURCEFILE
    importing
      value(IV_INQUIRYID) type STRING optional
    exporting
      !EV_MSG type BAPIRET2
    returning
      value(ET_INQFILE) type TT_INQFILE .
  methods GET_INQUIRY_SNAPSHOT
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      !EV_MSG type BAPIRET2
    returning
      value(ES_INQBODY) type ZINQ_S_INQUIRYBODY .
  methods GET_INQUIRY_STEP_PRICE
    importing
      value(IV_BODY) type STRING optional
    exporting
      !ET_INQUIRY_PRICE type ZINQ_T_PRICE
      !EV_MSG type BAPIRET2 .
  methods GET_INQUIRY_STOREHOLIDAY
    importing
      value(IV_STOREID) type STRING
      value(IV_MONTHS) type STRING
    exporting
      value(ET_STOREHOLIDAY) type ZINQ_T_STORECONFHOLIDAY
      value(EV_MSG) type BAPIRET2 .
  methods GET_INQUIRY_STOREWEEKDAY
    importing
      value(IV_STOREID) type STRING
    exporting
      value(ES_STORYWEEKDAY) type ZINQ_S_STORECONFWEEKDAY
      value(EV_MSG) type BAPIRET2 .
  methods GET_INQUIRY_ASSIGNSUPPLIER
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_SUPPLIERQUOTES) type ZINQ_T_SUPPLIERQUOTES .
  methods GET_INQUIRY_SUPPLIERQUOTES
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_SUPPLIERQUOTES) type ZINQ_T_SUPPLIERQUOTES .
  methods GET_INQUIRY_TRACKRECORD
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_TRACKRECORD) type ZINQ_T_TRACKRECORD .
  methods GET_INQUIRY_USERNEEDS
    importing
      value(IV_INQUIRY) type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ET_DATA type TT_USERNEED .
  methods GET_INQUIRY_USERNEEDSITEMS
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_USERNEEDSITEMS) type ZINQ_T_USERNEEDSITEMS .
  methods GET_PINKAGE_SHOW
    importing
      value(IV_BODY) type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ET_DATA type TT_PINKAGELABEL .
  methods GET_PROMOTION_INFO
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_PROMMOTION) type TS_PROMOTION .
  methods GET_QUOTATIONSCHEME_DETAIL
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      value(ES_INQUIRYDETAIL) type ZINQ_S_INQUIRYDETAIL
      value(EV_MSG) type BAPIRET2 .
  methods GET_QUOTA_CUS
    importing
      value(IV_STOREID) type STRING optional
    exporting
      !EV_MSG type BAPIRET2
      !ET_QUOTACUS type ZINQ_T_QUOTACUS .
  methods GET_QUOTA_ISUSERFORMAN
    importing
      value(IV_STOREID) type STRING optional
    exporting
      !EV_MSG type BAPIRET2
      !ES_USERFORMAN type ZINQ_S_USERFORMAN .
  methods GET_QUOTE_STORELIST
    importing
      value(IV_DEMANDID) type STRING optional
    exporting
      !EV_MSG type BAPIRET2
      !ET_STORELIST type ZINQ_T_QUOTESTORELIST .
  methods GET_SIMPLEDEMAND_INFO
    importing
      value(IV_INQUIRYID) type STRING optional
    exporting
      !ES_SIMPLEDEMAND type ZINQ_S_SIMPLEDEMAND
      !EV_MSG type BAPIRET2 .
  methods GET_SIMPLEINQUIRY_BASICINFO
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      value(ES_SIMPLEINQUIRY) type ZINQ_S_SIMPLEINQUIRY
      value(EV_MSG) type BAPIRET2 .
  methods GET_SIMPLEQUOTATION_ITEM
    importing
      value(IV_BODY) type STRING optional
    exporting
      !ET_DEMANDITEM type ZINQ_T_QUOTATIONDEMANDITEM
      !EV_MSG type BAPIRET2 .
  methods GET_SIMPLEQUOTATION_LIST
    importing
      value(IV_INQUIRYID) type STRING optional
      value(IV_BODY) type STRING optional
    exporting
      !ET_SIMPLEQUOTATION type ZINQ_T_SIMPLEQUOTATION
      !EV_MSG type BAPIRET2 .
  methods GET_SIMPLEQUOTATION_RESULTS
    importing
      value(IV_INQUIRYID) type STRING optional
      value(IV_BODY) type STRING optional
    exporting
      !ET_QUOTATIONRESULTS type ZINQ_T_QUOTATIONRESULTS
      !EV_MSG type BAPIRET2 .
  methods GET_SIMPLE_RESOURCE
    importing
      value(IV_INQUIRYID) type STRING
    exporting
      !ES_DATA type ZINQ_S_INQUIRYRESOURCE
      !EV_MSG type BAPIRET2 .
  methods GET_STORE_DELIVERY
    importing
      value(IS_STOREINF) type TY_STOREINF
    exporting
      !ET_STOREINF type TT_STOREDELIVERY
      !EV_MSG type BAPIRET2 .
  methods GET_TIRE_INQUIRY_QUOTATION
    importing
      !IV_BODY type STRING
    exporting
      !ET_QUOTATION type TT_QUOTATION
      !EV_MSG type BAPIRET2 .
  methods GET_TRYE_INQUIRY_EXTENINFO
    importing
      value(IV_DEMANDID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DATA) type TS_TRYEINQ_EXTINFO .
  methods GET_VEN_OPENEDQUOTE
    importing
      value(IV_BODY) type STRING optional
    exporting
      value(EV_MSG) type BAPIRET2
      !ET_OPENEDQUOTA type ZINQ_T_OPENEDQUOTE .
  methods NEW_GET_INQUIRY_DECODE
    importing
      value(INQUIRY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DECODE) type TS_NEWINQUIRY_DECODE .
  methods NEW_GET_INQUIRY_DETAIL
    importing
      value(IV_INQUIRY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_DETAIL) type TS_NEWINQDETAIL_R .
  methods NEW_GET_INQUIRY_HEAD
    importing
      value(IV_INQUIRYID) type STRING optional
    exporting
      !EV_MSG type BAPIRET2
    returning
      value(ES_INQHEAD) type TS_INQUIRYHEAD .
  methods SAVE_BDFGOODS_ASSIGN_STORE
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_BSFGOODRES) type TS_BSFGOODRES .
  methods GET_INQUIRY_SUPPLIERQUOTE_STA
    importing
      value(INQUIRYID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_STATUS) type TT_QUOTESUPPLIER_STATUS .
  PROTECTED SECTION.
private section.

  methods SAVE_API_LOG
    importing
      value(EV_MSG) type BAPIRET2 optional
      value(IV_COMMIT) type CHAR01 optional
      value(IV_KEYVALUE) type STRING optional
      value(IV_RESPONSEBODY) type STRING optional
      value(IV_REQUESTBODY) type STRING optional .
ENDCLASS.



CLASS ZCL_ICEC_INQUIRY_API IMPLEMENTATION.


  METHOD add_inquiry_quotearea.

    DATA: lo_pi TYPE REF TO zco_si_sap_icec_update_vendor.
    DATA: ls_output TYPE zmt_icec_update_vendor_quote_a.
    DATA: ls_item LIKE LINE OF ls_output-mt_icec_update_vendor_quote_ar-quotation_areas.

    "校验店铺id不能为空
    CHECK is_addquotearea-storeid IS NOT INITIAL.

    "取现在的配置的报价范围

    IF iv_online IS NOT  INITIAL. "上线申请时同步给询报价

      ls_output-mt_icec_update_vendor_quote_ar-operator_id = 'kszs'.
      ls_output-mt_icec_update_vendor_quote_ar-store_id = is_addquotearea-storeid.
      ls_output-mt_icec_update_vendor_quote_ar-config_type = 'IN'.
      LOOP AT is_addquotearea-quotationareas INTO DATA(ls_area).
        CLEAR ls_item.
        ls_item-geo_id = ls_area-geoid.
        ls_item-geo_type = ls_area-geotype.
        APPEND ls_item TO ls_output-mt_icec_update_vendor_quote_ar-quotation_areas.
        CLEAR ls_area.
      ENDLOOP.

    ELSE.  "在现有基础上新增



    ENDIF.

    CREATE OBJECT lo_pi.
    TRY.
        CALL METHOD lo_pi->si_sap_icec_update_vendor_quot
          EXPORTING
            output = ls_output.
      CATCH cx_ai_system_fault .
    ENDTRY.




  ENDMETHOD.


  METHOD bind_inquiryvirtualtelnum.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA: lv_body TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'BIND_INQUIRYVIRTUALTELNUM'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{?inquiryId}' IN lv_uri WITH inquiryid.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest )..
    lv_body = |"{ inquiryid }"|.
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
        ev_msg          = ev_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_telnum_inf ).
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
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out  ev_msg = ev_msg ).
    ENDIF.

  ENDMETHOD.


  METHOD check_bdfgoods_assign_store.
    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'CHECK_BDFGOODS_ASSIGN_STORE'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiry.
    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.

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
                         data = ev_enable ).


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


  METHOD check_bdfgoods_auth.
    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'CHECK_BDFGOODS_AUTH'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiry.

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
                         data = ev_enable ).


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


  METHOD check_findstock_auth.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'CHECK_FINDSTOCK_AUTH'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

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
                         data = et_fgoodsstatus ).


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


  METHOD create_fgoods.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY' AND method = 'CREATE_FGOODS'.

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
        json_out        = ev_fgoodsid
        ev_msg          = ev_msg
                          ).
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = ev_fgoodsid  ev_msg = ev_msg ).
    ENDIF.

  ENDMETHOD.


  METHOD get_accident_quota.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_ACCIDENT_QUOTA'.

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
                         data = es_quotearea  ).

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


  METHOD get_aftersalepolicys.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_body TYPE string.
    DATA lv_title TYPE string.
    DATA lv_policylist TYPE string.
    DATA lv_policygrouplist TYPE string.
    DATA(lo_api) = NEW zcl_icec_api( ).

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'SALEPOLICY' AND method = 'GET_AFTERSALEPOLICYS'.
    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    IF et_policygrouplist IS NOT INITIAL.
      LOOP AT et_policygrouplist INTO DATA(ls_policygrouplist).
        LOOP AT ls_policygrouplist-policylist INTO DATA(ls_policylist).
          lv_policylist = COND #( WHEN lv_policylist IS INITIAL THEN '{' &&
                                 |"key": "{ ls_policylist-key }","value": "{ ls_policylist-value }","url":"{ ls_policylist-url }"| && '}'
                                 ELSE |{ lv_policylist },| && '{' &&
                                 |"key": "{ ls_policylist-key }","value": "{ ls_policylist-value }","url":"{ ls_policylist-url }"| && '}' ).
          CLEAR:ls_policylist.
        ENDLOOP.
        lv_policygrouplist = COND #( WHEN lv_policygrouplist IS INITIAL THEN '{' &&
                                    |"sequenceId":"{ ls_policygrouplist-sequenceid }","policyList":[{ lv_policylist }]| && '}'
                                    ELSE |{ lv_policygrouplist },| && '{' &&
                                   |"sequenceId":"{ ls_policygrouplist-sequenceid }","policyList":[{ lv_policylist }]| && '}') .
        CLEAR:ls_policygrouplist,lv_policylist.
      ENDLOOP.
    ELSE.
      lv_policygrouplist = iv_policygrouplist.
    ENDIF.
    lv_body = '[{' && |"garageCompanyId":"{ iv_companyid }","sceneList": ["CASS"],"policyGroupList":[{ lv_policygrouplist }]| && '}]'.

    "调用接口
    lv_title = '获取售后政策展示信息(ZCL_ICEC_INQUIRY_API->GET_AFTERSALEPOLICYS)'.
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

    IF lv_out IS NOT INITIAL ."解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data =  et_policydisplay ).
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


  METHOD get_coldinquiry_detail.

    DATA:lv_uri          TYPE string,
         lv_body         TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY' AND method = 'GET_COLDINQUIRY_DETAIL'.

    lv_uri = ls_ztint_icec_api-url.

    DATA(lv_str1) = '{'.
    DATA(lv_str2) = '}'.
    lv_body = |{ lv_str1 }"inquiryId": "{ iv_inquiryid }| &&
    |","platform": " { iv_platform }| &&
    |","userNeedIds": [""]{ lv_str2 }|.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

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
        ev_msg          = ev_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_inquirydetail  ).


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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out  ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_coldinquiry_header.
    DATA lv_uri          TYPE string.
    DATA: ls_content_type TYPE zapi_s_contenttype,
          lv_rfc          TYPE rfcdest,
          lv_body         TYPE string.
    DATA lv_out TYPE string.
    DATA lv_title TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_COLDINQUIRY_HEADER'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfc = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                      ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    "调用接口
    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data
      EXPORTING
        iv_rfcdest      = lv_rfc "'PLATFORM'
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
                         data = es_inquiryhead ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out  ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_cold_inquiry_check.
    DATA lv_uri          TYPE string.
    DATA:lv_rfcdest TYPE rfcdest.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_body TYPE string.
    DATA lv_title TYPE string.
    DATA lv_policylist TYPE string.
    DATA lv_policygrouplist TYPE string.
    DATA(lo_api) = NEW zcl_icec_api( ).

***    BODY = |\{"inquiryIds":["B23071702034", "B23071702035", "B23071702036"]}|.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY' AND method = 'GET_COLD_INQUIRY_CHECK'.
    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                         ELSE ls_ztint_icec_api-rfcdest ).

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

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

    IF lv_out IS NOT INITIAL ."解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data =  et_check ).
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


  METHOD get_cold_inquiry_head.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY_NEW' AND method = 'NEW_GET_INQUIRY_HEAD'.
    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.
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
    IF lv_out IS NOT INITIAL ."解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_inqhead ).
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


  METHOD get_demand_originalitem.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'SIMPLE-DEMAND' AND method = 'GET_DEMAND_ORIGINALITEM'.
    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{demandId}' IN lv_uri WITH iv_inquiryid.
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
    IF lv_out IS NOT INITIAL ."解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = ET_ORIGINALITEM ).
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


  METHOD get_demand_standarditem.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'SIMPLE-DEMAND' AND method = 'GET_DEMAND_STANDARDITEM'.
    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{demandId}' IN lv_uri WITH iv_inquiryid.
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
    IF lv_out IS NOT INITIAL ."解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_standarditems ).
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


  METHOD get_etalabel_show.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_ETALABEL_SHOW'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.

    lv_body = iv_body.
    DATA:lv_title TYPE string.
    lv_title = '获取ETA label设置(ZCL_ICEC_INQUIRY_API->GET_ETALABEL_SHOW)'.
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
          ev_msg-id = '404'.
          ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
      ENDTRY.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_requestbody = lv_body iv_responsebody = lv_out ).
   ENDIF.

  ENDMETHOD.


  METHOD get_fgoods_enable_sku.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY' AND method = 'GET_FGOODS_ENABLE_SKU'.

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
                         data = es_enablefgoods  ).


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


  METHOD get_help_quotedresult.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_title TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_HELP_QUOTEDRESULT'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_title = '根据需求单id查报出轮胎属性(ZCL_ICEC_INQUIRY_API->GET_HELP_QUOTEDRESULT)'.

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
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_help_quotedresult  ).

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


  METHOD get_inquiryvirtualtelnum.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRYVIRTUALTELNUM'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH inquiryid.
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
                         data = es_telnum_inf  ).


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


  METHOD GET_INQUIRY_ASSIGNSUPPLIER.


    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_SUPPLIERQUOTES'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

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
                         data = et_supplierquotes  ).


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


  METHOD get_inquiry_attribute.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out     TYPE string,
          lv_rfcdest TYPE rfcdest.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY_NEW' AND method = 'GET_INQUIRY_ATTRIBUTE'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{inquiryId}' INTO lv_uri WITH iv_inquiry.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.

    CALL METHOD lo_api->get_data
      EXPORTING
        iv_rfcdest      = lv_rfcdest " 'PLATFORM'
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
          ev_msg-id = '404'.
          ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
      ENDTRY.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_requestbody = lv_body iv_responsebody = lv_out ).
   ENDIF.

  ENDMETHOD.


  METHOD get_inquiry_base_detail.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_BASE_DETAIL'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{demandId}' IN lv_uri WITH iv_inquiryid.

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
                         data = es_inquirybasedetail  ).

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


  METHOD get_inquiry_brandqualities.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_BRANDQUALITIES'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

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
                         data = es_brandqualities ) .


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
   save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_responsebody = lv_out  ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD GET_INQUIRY_CALCULATIONS.
    DATA lv_uri          TYPE string.
    DATA: ls_content_type TYPE zapi_s_contenttype,
          lv_rfc          TYPE rfcdest,
          lv_body         TYPE string.
    DATA lv_out TYPE string.
    DATA lv_title TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_CALCULATIONS'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfc = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                      ELSE ls_ztint_icec_api-rfcdest ).

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    "调用接口
    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data
      EXPORTING
        iv_rfcdest      = lv_rfc "'PLATFORM'
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
                         data = es_calculations ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out  ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_inquiry_carbrand.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:ls_msg TYPE bapiret2.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_CARBRAND'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{storeId}' IN lv_uri WITH iv_store.
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
        ev_msg          = ls_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = carbrand  ).
          ls_msg-type = 'S'.
          ls_msg-id = '200'.
          ls_msg-message = 'JSON成功解析'.
        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).
          ls_msg-type = 'E'.
          ls_msg-id = '404'.
          ls_msg-message = 'JSON解析异常，请检查系统传入参数'.
        CATCH cx_root.
          ls_msg-type = 'E'.
          ls_msg-id = 404.
          ls_msg-message = 'JSON解析异常，请检查系统传入参数'.
      ENDTRY.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out  ev_msg = ls_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_inquiry_customizeremark.



    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_CUSTOMIZEREMARK'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

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
                         data = es_customizeremark  ).


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


  METHOD get_inquiry_decode.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out     TYPE string,
          lv_rfcdest TYPE rfcdest.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY_NEW' AND method = 'GET_INQUIRY_DECODE'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{inquiryId}' INTO lv_uri WITH iv_inquiry.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.

    DATA:lv_title TYPE string.
    lv_title = '获取询价单用户需求(ZCL_ICEC_INQUIRY_API->GET_INQUIRY_USERNEEDS)'.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = lv_rfcdest " 'PLATFORM'
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
          ev_msg-id = '404'.
          ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
      ENDTRY.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_requestbody = lv_body iv_responsebody = lv_out ).
   ENDIF.

  ENDMETHOD.


  METHOD get_inquiry_detail.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_DETAIL'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

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
                         data = es_inquirydetail  ).


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


  METHOD get_inquiry_discount.

    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_title TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_DISCOUNT'.

    "调用接口
    DATA(lo_api) = NEW zcl_icec_api( ).
    lv_title = '查询优惠券结果(ZCL_ICEC_INQUIRY_API->GET_INQUIRY_DISCOUNT)'.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_uri = ls_ztint_icec_api-url.

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
                         data = et_discountlist ).

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


  METHOD get_inquiry_discount_store.

    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_title TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_DISCOUNT_STORE'.

    "调用接口
    DATA(lo_api) = NEW zcl_icec_api( ).
    lv_title = '查询优惠券结果(ZCL_ICEC_INQUIRY_API->GET_INQUIRY_DISCOUNT)'.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_uri = ls_ztint_icec_api-url.

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
                         data = et_discountlist ).

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


  METHOD get_inquiry_discount_store_v2.

    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_title TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY_NEW'
      AND method = 'GET_INQUIRY_DISCOUNT_STORE'.

    "调用接口
    DATA(lo_api) = NEW zcl_icec_api( ).
    lv_title = '查询优惠券结果(ZCL_ICEC_INQUIRY_API->GET_INQUIRY_DISCOUNT)'.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_uri = ls_ztint_icec_api-url.

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
                         data = et_discountlist ).

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


  METHOD get_inquiry_excellentquoted.


    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_EXCELLENTQUOTED'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

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
                         data = et_excellentquoted  ).


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


  METHOD get_inquiry_feedback.
    DATA lv_uri          TYPE string.
    DATA: ls_content_type TYPE zapi_s_contenttype,
          lv_rfc          TYPE rfcdest,
          lv_body         TYPE string.
    DATA lv_out TYPE string.
    DATA lv_title TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_FEEDBACK'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfc = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                      ELSE ls_ztint_icec_api-rfcdest ).

    lv_body = iv_body.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    "调用接口
    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = lv_rfc "'PLATFORM'
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out  ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_inquiry_identification.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA et_data TYPE STANDARD TABLE OF string WITH DEFAULT KEY.
    DATA lv_title TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'TYRE-INQUIRY'
      AND method = 'GET_INQUIRY_IDENTIFICATION'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    "调用接口
    DATA(lo_api) = NEW zcl_icec_api( ).
    lv_title = '根据需求单id查是配套花纹的报价结果id(ZCL_ICEC_INQUIRY_API->GET_INQUIRY_IDENTIFICATION)'.
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
        ev_msg          = ev_msg.
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_data ).
          LOOP AT et_data INTO DATA(ls_data).
            et_item = VALUE #( BASE et_item ( id = ls_data ) ).
          ENDLOOP.

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


  METHOD get_inquiry_ishotstorage.
    DATA lv_uri          TYPE string.
    DATA: ls_content_type TYPE zapi_s_contenttype,
          lv_rfc          TYPE rfcdest,
          lv_body         TYPE string.

    DATA lv_title TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_ISHOTSTORAGE'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfc = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                      ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    "调用接口
    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data
      EXPORTING
        iv_rfcdest      = lv_rfc "'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
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
*                         data = es_data ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out  ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


METHOD get_inquiry_lowestprice.
  DATA:lv_uri          TYPE string,
       ls_content_type TYPE zapi_s_contenttype,
       lv_rfcdest      TYPE rfcdest.
  DATA: lv_out TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'INQUIRY'
        AND method = 'GET_INQUIRY_LOWESTPRICE'.

  lv_uri = ls_ztint_icec_api-url.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

  REPLACE '{demandId}' IN lv_uri WITH iv_inquiryid.
  REPLACE '{storeIds}' IN lv_uri WITH iv_storeids.
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
        data = et_quotelowest  ).


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


  METHOD get_inquiry_missingsku.

    DATA:lv_uri          TYPE string,
         lv_body         TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY' AND method = 'GET_INQUIRY_MISSINGSKU'.

    lv_uri = ls_ztint_icec_api-url.

    lv_body = |["{ inquiryid }"]|.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

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
        ev_msg          = ev_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_miss  ).


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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out  ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_inquiry_outofstockquote.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_OUTOFSTOCKQUOTE'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

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
                         data = et_outofstockquote  ).


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


  METHOD get_inquiry_partimages.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    TYPES:BEGIN OF ty_partimage,
            data TYPE STANDARD TABLE OF zinq_s_partimages WITH DEFAULT KEY,
          END OF ty_partimage.
    DATA ls_partimage TYPE ty_partimage.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_PARTIMAGES'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{vinCode}' IN lv_uri WITH iv_vin.
    REPLACE '{originalPart}' IN lv_uri WITH iv_partsnum.
    CONDENSE lv_uri NO-GAPS.

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
                         data = ls_partimage  ).
          et_partimage = ls_partimage-data.

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


  METHOD get_inquiry_partsbrand_common.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:ls_msg TYPE bapiret2.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_PARTSBRAND_COMMON'.

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
        ev_msg          = ls_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = partsbrand  ).


          ls_msg-type = 'S'.
          ls_msg-id = '200'.
          ls_msg-message = 'JSON成功解析'.
        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).
          ls_msg-type = 'E'.
          ls_msg-id = '404'.
          ls_msg-message = 'JSON解析异常，请检查系统传入参数'.
        CATCH cx_root.
          ls_msg-type = 'E'.
          ls_msg-id = 404.
          ls_msg-message = 'JSON解析异常，请检查系统传入参数'.
      ENDTRY.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out  ev_msg = ls_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_inquiry_partsbrand_inter.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:ls_msg TYPE bapiret2.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_PARTSBRAND_INTER'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{storeId}' IN lv_uri WITH iv_store.

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
        ev_msg          = ls_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = partsbrand ).


          ls_msg-type = 'S'.
          ls_msg-id = '200'.
          ls_msg-message = 'JSON成功解析'.
        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).
          ls_msg-type = 'E'.
          ls_msg-id = '404'.
          ls_msg-message = 'JSON解析异常，请检查系统传入参数'.
        CATCH cx_root.
          ls_msg-type = 'E'.
          ls_msg-id = 404.
          ls_msg-message = 'JSON解析异常，请检查系统传入参数'.
      ENDTRY.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = ls_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_inquiry_quality.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_QUALITY'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.
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
                         data = es_quality  ).


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


  METHOD get_inquiry_quotationdetail.


    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out     TYPE string,
          lv_rfcdest TYPE rfcdest.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY_NEW' AND method = 'GET_INQUIRY_QUOTATIONDETAIL'.

    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

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
                         data = et_quotedetail  ).
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


  METHOD get_inquiry_quotearea.


    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_QUOTEAREA'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.

    lv_body = iv_data.
    DATA:lv_title TYPE string.
    lv_title = '获取商家报价区域(ZCL_ICEC_INQUIRY_API->GET_INQUIRY_QUOTEAREA)'.
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
                         data = et_quotearea ) .


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


  METHOD get_inquiry_quotedetail_byneed.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_body         TYPE string.
    DATA: lv_out     TYPE string,
          lv_rfcdest TYPE rfcdest.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY_NEW' AND method = 'GET_INQUIRY_QUOTEDETAIL_BYNEED'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    lv_body = |\{"inquiryId": "{ iv_inquiryid }","platform": "PC","userNeedIds": [{ iv_userneeds }]\}|.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest " 'PLATFORM'
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
                         data = es_inqbody  ).


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


  METHOD get_inquiry_quotefillrate.


    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_QUOTEFILLRATE'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

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
                         data = es_quotefillrate  ).


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


  METHOD get_inquiry_quoteprice_extra.


    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_QUOTEPRICE_EXTRA'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

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
                         data = es_quoteextra ).


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


  METHOD get_inquiry_quoteresource.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY' AND method = 'GET_INQUIRY_QUOTERESOURCE'.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    DATA:lv_rfcdest TYPE rfcdest.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
    lv_body = iv_body.
    DATA:lv_title TYPE string.
    lv_title = '获取询价单拆车件图片视频(ZCL_ICEC_INQUIRY_API->GET_INQUIRY_QUOTERESOURCE)'.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = lv_rfcdest "'PLATFORM'
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
          ev_msg-id = '404'.
          ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
      ENDTRY.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_requestbody = lv_body iv_responsebody = lv_out ).
   ENDIF.

  ENDMETHOD.


  METHOD get_inquiry_remark.



    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_REMARK'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

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
                         data = es_remark  ).


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


  METHOD GET_INQUIRY_REMARKRULE.
    DATA lv_uri          TYPE string.
    DATA: ls_content_type TYPE zapi_s_contenttype,
          lv_rfc          TYPE rfcdest,
          lv_body         TYPE string.
    DATA lv_out TYPE string.
    DATA lv_title TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_REMARKRULE'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.
    lv_rfc = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                      ELSE ls_ztint_icec_api-rfcdest ).

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    "调用接口
    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data
      EXPORTING
        iv_rfcdest      = lv_rfc "'PLATFORM'
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
                         data = et_remarkrule ).
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out  ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_inquiry_resourcefile.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_RESOURCEFILE'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.
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
                         data = et_inqfile  ).


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


  METHOD get_inquiry_snapshot.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_rfcdest      TYPE rfcdest.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_SNAPSHOT'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{Inquiryid}' IN lv_uri WITH iv_inquiryid.
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
                         data = es_inqbody  ).


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


  METHOD get_inquiry_step_price.



    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_STEP_PRICE'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.

    lv_body = iv_body.
    DATA:lv_title TYPE string.
    lv_title = '获取询价阶梯价(ZCL_ICEC_INQUIRY_API->GET_INQUIRY_STEP_PRICE)'.
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
                         data = et_inquiry_price ) .

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


  METHOD get_inquiry_storeholiday.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    DATA: ls_storeholiday TYPE zinq_s_storeconfholiday.

    "二次报价休息日
    TYPES : lt_selecteddays TYPE  TABLE OF string WITH DEFAULT KEY.

    TYPES: BEGIN OF ls_dayrules,
             year         TYPE string,
             month        TYPE string,
             selecteddays TYPE lt_selecteddays,
           END OF ls_dayrules.
    TYPES: lt_dayrules TYPE STANDARD TABLE OF ls_dayrules WITH DEFAULT KEY.
    TYPES : lt_weekrules  TYPE TABLE OF  string WITH DEFAULT KEY.
    DATA: BEGIN OF ls_data ,
            cutoff    TYPE string,
            dayrules  TYPE lt_dayrules,
            weekrules TYPE lt_weekrules,
          END OF ls_data.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
             WHERE service = 'INQUIRY'
             "  AND method = 'GET_INQUIRY_STOREHOLIDAY'."
             AND method = 'GET_INQUIRY_STOREHOLIDAY_NEW'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.
    " REPLACE '{months}' IN lv_uri WITH iv_months.

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
                         data = ls_data  ).


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
      IF  ls_data IS NOT INITIAL.

        LOOP AT ls_data-dayrules INTO DATA(ls_day).
          CLEAR ls_storeholiday.
          ls_storeholiday-year  = ls_day-year.
          ls_storeholiday-month  = ls_day-month.
          ls_storeholiday-days  = ls_day-selecteddays.
          APPEND ls_storeholiday TO et_storeholiday.
        ENDLOOP.

      ENDIF.

    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_inquiry_storeweekday.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_STOREWEEKDAY'.

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
                         data = es_storyweekday  ).


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


  METHOD get_inquiry_supplierquotes.


    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_SUPPLIERQUOTES'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

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
                         data = et_supplierquotes  ).


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


  METHOD get_inquiry_supplierquote_sta.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_SUPPLIERQUOTE_STA'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH inquiryid.

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
                         data = es_status ).


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


  METHOD get_inquiry_trackrecord.


    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_TRACKRECORD'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

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
                         data = et_trackrecord  ).


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


  METHOD get_inquiry_userneeds.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out     TYPE string,
          lv_rfcdest TYPE rfcdest.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY_NEW' AND method = 'GET_INQUIRY_USERNEEDS'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.

    lv_body = |["{ iv_inquiry }"]|.
    DATA:lv_title TYPE string.
    lv_title = '获取询价单用户需求(ZCL_ICEC_INQUIRY_API->GET_INQUIRY_USERNEEDS)'.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = lv_rfcdest " 'PLATFORM'
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
          ev_msg-id = '404'.
          ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
      ENDTRY.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_requestbody = lv_body iv_responsebody = lv_out ).
   ENDIF.

  ENDMETHOD.


  METHOD get_inquiry_userneedsitems.


    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_INQUIRY_USERNEEDSITEMS'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

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
                         data = et_userneedsitems  ).


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


METHOD get_inq_proxy_inf.
  DATA:lv_uri          TYPE string,
       lv_rfcdest      TYPE rfcdest,
       ls_content_type TYPE zapi_s_contenttype,
       lv_body         TYPE string.
  DATA lv_out TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'INQUIRY'
        AND method = 'GET_INQ_PROXY_INF'.

  lv_uri = ls_ztint_icec_api-url.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
  ls_content_type-content_type = 'application/json;charset=UTF-8'.

  lv_body = |\{"inquiryId": "{ iv_inquiryid }","statusId": "ALL"\}|.

  DATA(lo_api) = NEW zcl_icec_api( ).
  "调用接口
  CALL METHOD lo_api->post_data
    EXPORTING
      iv_rfcdest      = lv_rfcdest
      iv_uri          = lv_uri
      is_content_type = ls_content_type
      iv_body         = lv_body
    IMPORTING
      json_out        = lv_out
      ev_msg          = ev_msg.
  IF lv_out IS NOT INITIAL .
    REPLACE '"@class":"com.casstime.ec.cloud.spi.PagedModelsImpl",' WITH '' INTO lv_out.
    "解析json
    TRY.

        /ui2/cl_json=>deserialize(
        EXPORTING
          json = lv_out
        CHANGING
        data = es_inqproxy ).

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


  METHOD get_pinkage_show.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_PINKAGE_SHOW'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.

    lv_body = iv_body.
    DATA:lv_title TYPE string.
    lv_title = '获取商家活动满减包邮信息设置(ZCL_ICEC_INQUIRY_API->GET_PINKAGE_SHOW)'.
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
          ev_msg-id = '404'.
          ev_msg-message = 'JSON解析异常，请检查系统传入参数'.
      ENDTRY.
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_requestbody = lv_body iv_responsebody = lv_out ).
   ENDIF.
  ENDMETHOD.


  METHOD get_promotion_info.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_rfcdest TYPE rfcdest.
    DATA lv_out TYPE string.
    DATA lv_body TYPE string.
    DATA lv_title TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'PROMOTION' AND method = 'GET_PROMOTION_INFO'.
    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = ls_ztint_icec_api-rfcdest.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    lv_body = iv_body.
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
    IF lv_out IS NOT INITIAL ."解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_prommotion ).
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


  METHOD get_quotationscheme_detail.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_QUOTATIONSCHEME_DETAIL'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{headerId}' IN lv_uri WITH '1715799022749884416'.

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
                         data = es_inquirydetail  ).


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


  METHOD get_quota_cus.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_QUOTA_CUS'.

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
                         data = et_quotacus ).

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


  METHOD get_quota_isuserforman.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_QUOTA_ISUSERFORMAN'.

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
                         data = es_userforman  ).

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


METHOD get_quote_storelist.

  DATA:lv_uri          TYPE string,
       ls_content_type TYPE zapi_s_contenttype.
  DATA: lv_out     TYPE string,
        lv_rfcdest TYPE rfcdest.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'INQUIRY'
        AND method = 'GET_QUOTE_STORELIST'.

  lv_uri = ls_ztint_icec_api-url.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

  REPLACE '{demandId}' IN lv_uri WITH iv_demandid.

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
        data = et_storelist  ).

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


  METHOD get_simpledemand_info.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'SIMPLE-DEMAND' AND method = 'GET_SIMPLEDEMAND_INFO'.
    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{demandId}' IN lv_uri WITH iv_inquiryid.
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
    IF lv_out IS NOT INITIAL ."解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_simpledemand ).
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


  METHOD get_simpleinquiry_basicinfo.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_SIMPLEINQUIRY_BASICINFO'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

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
                         data = es_simpleinquiry  ).


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


  METHOD get_simplequotation_item.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_body TYPE string.
    DATA lv_title TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'SIMPLE-QUOTATION' AND method = 'GET_SIMPLEQUOTATION_ITEM'.
    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    lv_body = iv_body.
    lv_title = '获取中端车询价报价条目(ZCL_ICEC_INQUIRY_API->GET_SIMPLEQUOTATION_ITEM)'.
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

    IF lv_out IS NOT INITIAL ."解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data =  et_demanditem ).
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


  METHOD get_simplequotation_list.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_body TYPE string.
    DATA lv_title TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'SIMPLE-QUOTATION' AND method = 'GET_SIMPLEQUOTATION_LIST'.
    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{demandId}' IN lv_uri WITH iv_inquiryid.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    lv_body = iv_body.
    lv_title = '获取中端车询价报价单信息(ZCL_ICEC_INQUIRY_API->GET_SIMPLEQUOTATION_LIST)'.
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
    IF lv_out IS NOT INITIAL ."解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_simplequotation ).
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


  METHOD get_simplequotation_results.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_body TYPE string.
    DATA lv_title TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'SIMPLE-QUOTATION' AND method = 'GET_SIMPLEQUOTATION_RESULTS'.
    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{demandId}' IN lv_uri WITH iv_inquiryid.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    lv_body = iv_body.
    lv_title = '获取中端车询价报价结果(ZCL_ICEC_INQUIRY_API->GET_SIMPLEQUOTATION_RESULTS)'.
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

    IF lv_out IS NOT INITIAL ."解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data =  et_quotationresults ).
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


  METHOD get_simple_resource.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_SIMPLE_RESOURCE'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

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
    ENDIF.
   IF ls_ztint_icec_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = lv_out  ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_store_delivery.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_body TYPE string.
    DATA lv_facilityids TYPE string.
    DATA lv_storeandfacilities TYPE string.
    DATA lv_title TYPE string.
    DATA(lo_api) = NEW zcl_icec_api( ).

    DATA:lt_storeinf    TYPE tt_storedelivery,
         lv_count       TYPE int4,
         lt_facilityids TYPE STANDARD TABLE OF ty_facility.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'TYRE-INQUIRY' AND method = 'GET_STORE_DELIVERY'.
    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    LOOP AT is_storeinf-storeandfacilities INTO DATA(ls_storeandfacilities) GROUP BY ( storeid = ls_storeandfacilities-storeid
      size = GROUP SIZE index = GROUP INDEX ) ASSIGNING FIELD-SYMBOL(<grp_store>).
      lv_count = lv_count + 1.
      LOOP AT GROUP <grp_store> ASSIGNING FIELD-SYMBOL(<lfs_store>).
        APPEND LINES OF <lfs_store>-facilityids TO lt_facilityids.
      ENDLOOP.
      SORT lt_facilityids BY facilityid.
      DELETE ADJACENT DUPLICATES FROM lt_facilityids COMPARING facilityid.
      LOOP AT lt_facilityids INTO DATA(ls_facilityid).
        lv_facilityids = COND #( WHEN lv_facilityids IS INITIAL THEN |"{ ls_facilityid-facilityid }"|
                                 ELSE |{ lv_facilityids },"{ ls_facilityid-facilityid }"| ).
        CLEAR ls_facilityid.
      ENDLOOP.
      lv_facilityids = |[{ lv_facilityids }]|.
      lv_storeandfacilities = COND #( WHEN lv_storeandfacilities IS INITIAL THEN |\{"facilityIds":{ lv_facilityids },"storeId": "{ <grp_store>-storeid }"\}|
                                      ELSE |{ lv_storeandfacilities },\{"facilityIds":{ lv_facilityids },"storeId": "{ <grp_store>-storeid }"\}| ).

      IF lv_count = 90.
        lv_storeandfacilities = |[{ lv_storeandfacilities }]|.
        lv_body = |\{"cityGeoId": "{ is_storeinf-citygeoid }","countyGeoId": "{ is_storeinf-countygeoid }","provinceGeoId": "{ is_storeinf-provincegeoid }",| &&
                  |"villageGeoId": "{ is_storeinf-villagegeoid }","storeAndFacilities":{ lv_storeandfacilities }\}|.
        "调用接口
        lv_title = '根据店铺仓库送达区域批量查询配送时效接口(ZCL_ICEC_INQUIRY_API->GET_STORE_DELIVERY)'.
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

        IF lv_out IS NOT INITIAL ."解析json
          TRY.
              /ui2/cl_json=>deserialize(
                          EXPORTING
                             json = lv_out
                          CHANGING
                             data =  lt_storeinf ).
              APPEND LINES OF lt_storeinf TO et_storeinf.
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
        CLEAR:lv_count,lv_body,lv_storeandfacilities,lt_storeinf,lv_facilityids.
      ENDIF.
      CLEAR lv_facilityids.
    ENDLOOP.
    IF lv_count NE 0.
      lv_storeandfacilities = |[{ lv_storeandfacilities }]|.
      lv_body = |\{"cityGeoId": "{ is_storeinf-citygeoid }","countyGeoId": "{ is_storeinf-countygeoid }","provinceGeoId": "{ is_storeinf-provincegeoid }",| &&
                |"villageGeoId": "{ is_storeinf-villagegeoid }","storeAndFacilities":{ lv_storeandfacilities }\}|.
      "调用接口
      lv_title = '根据店铺仓库送达区域批量查询配送时效接口(ZCL_ICEC_INQUIRY_API->GET_STORE_DELIVERY)'.
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

      IF lv_out IS NOT INITIAL ."解析json
        TRY.
            /ui2/cl_json=>deserialize(
                        EXPORTING
                           json = lv_out
                        CHANGING
                           data =  lt_storeinf ).
            APPEND LINES OF lt_storeinf TO et_storeinf.
            ev_msg-type = 'S'.
            ev_msg-id = '200'.
            ev_msg-message = 'JSON成功解析'.
          CATCH cx_json_illegal_syntax INTO lo_syntax.
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
      CLEAR:lv_count,lv_body,lv_storeandfacilities,lt_storeinf.
    ENDIF.



  ENDMETHOD.


  METHOD get_tire_inquiry_quotation.

    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.
    DATA lv_title TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_TIRE_INQUIRY_QUOTATION'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    "调用接口
    DATA(lo_api) = NEW zcl_icec_api( ).
    lv_title = '根据需求单id查排序后报价结果(ZCL_ICEC_INQUIRY_API->GET_TIRE_INQUIRY_QUOTATION)'.
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
        ev_msg          = ev_msg.
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_quotation ).

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


  METHOD get_trye_inquiry_exteninfo.
    DATA lv_uri          TYPE string.
    DATA: ls_content_type TYPE zapi_s_contenttype,
          lv_rfc          TYPE rfcdest,
          lv_body         TYPE string.
    DATA lv_out TYPE string.
    DATA lv_title TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_TRYE_INQUIRY_EXTENINFO'.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfc = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                      ELSE ls_ztint_icec_api-rfcdest ).

    REPLACE '{demandId}' IN lv_uri WITH iv_demandid.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    "调用接口
    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data
      EXPORTING
        iv_rfcdest      = lv_rfc "'PLATFORM'
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out  ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_ven_openedquote.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'GET_VEN_OPENEDQUOTE'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.

    lv_body = iv_body.
    DATA:lv_title TYPE string.
    lv_title = '获取商家开启报价设置(ZCL_ICEC_INQUIRY_API->GET_VEN_OPENEDQUOTE)'.
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
                         data = et_openedquota ) .


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


  METHOD new_get_inquiry_decode.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY_NEW' AND method = 'NEW_GET_INQUIRY_DECODE'.
    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH inquiry.
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
    IF lv_out IS NOT INITIAL ."解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_decode ).
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


  METHOD new_get_inquiry_detail.

    DATA:lv_inqbody TYPE string.
    lv_inqbody = |\{"platform": "PC","showCashPrice": false,"userLoginId": "ERP"\}|.

    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY_NEW' AND method = 'NEW_GET_INQUIRY_DETAIL'.
    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiry.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        iv_body         = lv_inqbody
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg
                          ).
    IF lv_out IS NOT INITIAL ."解析json
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
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_inqbody iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD new_get_inquiry_head.
    DATA lv_uri          TYPE string.
    DATA ls_content_type TYPE zapi_s_contenttype.
    DATA lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY_NEW' AND method = 'NEW_GET_INQUIRY_HEAD'.
    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.
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
    IF lv_out IS NOT INITIAL ."解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_inqhead ).
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


METHOD prepare_pricecalculate_import.
  "prepare the body
  DATA:lv_body        TYPE string,
       lv_importbody  TYPE string,
       lv_productitem TYPE string.

  lv_body = |\{"promoIdentify": \{"businessGroup": "{ is_pricecalculateimport-businessgroup }","businessUnit": "{ is_pricecalculateimport-businessunit }",| &&
  |"channel": "{ is_pricecalculateimport-channel }","client": "{ is_pricecalculateimport-client }"\},"companyId": "{ is_pricecalculateimport-companyid }",| &&
  |"userLoginId": "{ is_pricecalculateimport-userloginid }","productItems": [|.

  LOOP AT is_pricecalculateimport-productitems INTO DATA(ls_productitem).
    DATA(lv_mod) = sy-tabix MOD 50.
    lv_productitem = COND #( WHEN lv_productitem IS INITIAL THEN |\{| ELSE |{ lv_productitem },\{| ).
    lv_productitem = |{ lv_productitem } "storeId": "{ ls_productitem-storeid }", "inquiryId": "{ ls_productitem-inquiryid }",| &&
    |"baseUnitPrice": "{ COND #( WHEN ls_productitem-baseunitprice IS INITIAL THEN 0 ELSE ls_productitem-baseunitprice  ) }",| &&
    |"productId": { ls_productitem-productid },"mallProductId": "{ ls_productitem-mallproductid }","quantity": { ls_productitem-quantity }\}| .
    IF lv_mod EQ 0.
      lv_importbody = |{ lv_body }{ lv_productitem }]\}|.
      NEW zcl_icec_inquiry_api( )->get_inquiry_calculations( EXPORTING iv_body = lv_importbody
      IMPORTING ev_msg = DATA(ls_msg) es_calculations = DATA(ls_calculations) ).
      APPEND LINES OF ls_calculations-data-productitems TO et_data.
      CLEAR:lv_mod,lv_importbody,lv_productitem,ls_calculations,ls_msg.
    ENDIF.
  ENDLOOP.

  IF lv_mod NE 0.
    lv_importbody = |{ lv_body }{ lv_productitem }]\}|.
    NEW zcl_icec_inquiry_api( )->get_inquiry_calculations( EXPORTING iv_body = lv_importbody
    IMPORTING ev_msg = ls_msg es_calculations = ls_calculations ).
    APPEND LINES OF ls_calculations-data-productitems TO et_data.
    CLEAR:lv_mod,lv_importbody,lv_productitem,ls_calculations,ls_msg.
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


  METHOD save_bdfgoods_assign_store.
    DATA:lv_uri          TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'INQUIRY'
      AND method = 'SAVE_BDFGOODS_ASSIGN_STORE'.

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
                         data = es_bsfgoodres ).


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
ENDCLASS.
