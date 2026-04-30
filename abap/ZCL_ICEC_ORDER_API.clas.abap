CLASS zcl_icec_order_api DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPE-POOLS zord .

    TYPES:
      BEGIN OF ts_f2border_content,
        orderid         TYPE string,
        ordertype       TYPE string,
        purchaserid     TYPE string,
        customername    TYPE string,
        storeid         TYPE string,
        suppliername    TYPE string,
        orderamount     TYPE string,
        createdtime     TYPE string,
        orderstatus     TYPE string,
        needinvoice     TYPE string,
        invoicetype     TYPE string,
        goodsitem       TYPE string,
        productquantity TYPE string,
      END OF ts_f2border_content .
    TYPES:
      BEGIN OF ts_f2border_data,
        content          TYPE STANDARD TABLE OF ts_f2border_content WITH DEFAULT KEY,
        number           TYPE int4, ": 0,
        size             TYPE int4, ": 100,
        totalelements    TYPE int4, ": 17,
        totalpages       TYPE int4, ": 1,
        first            TYPE string, ": true,
        last             TYPE string, ": true,
        numberofelements TYPE int4, ": 17
      END OF ts_f2border_data .
    TYPES:
      BEGIN OF ts_f2border,
        code TYPE string,
        data TYPE ts_f2border_data,
      END OF ts_f2border .
    TYPES:
      BEGIN OF ts_ksbsdata,
        orderid     TYPE string,
        policykey   TYPE string,
        includeflag TYPE string,
      END OF ts_ksbsdata .
    TYPES:
      BEGIN OF ts_ksbs,
        code         TYPE string,
        errormessage TYPE string,
        data         TYPE STANDARD TABLE OF ts_ksbsdata WITH DEFAULT KEY,
      END OF ts_ksbs .
    TYPES:
      BEGIN OF ts_subbasecategorydto,
        cataloglevelcode   TYPE string, "分类代码
        cataloglevelname   TYPE string, "分类名称
        cataloglevelnum    TYPE string, "分类级别
        subbasecategorydto TYPE string, "子级分类
      END OF ts_subbasecategorydto .
    TYPES:
      BEGIN OF ts_basecategeory,
        cataloglevelcode   TYPE string, "分类代码
        cataloglevelname   TYPE string, "分类名称
        cataloglevelnum    TYPE string, "分类级别
        subbasecategorydto TYPE ts_subbasecategorydto, "子级分类
      END OF ts_basecategeory .
    TYPES:
      BEGIN OF ts_oelist,
        oebrandcode TYPE string, "oe厂牌编码
        oebrandname TYPE string, "oe厂牌名称
        oecode      TYPE string, "oe编码
        oecodetrim  TYPE string, "oe code（去除空格）
      END OF ts_oelist .
    TYPES:
      BEGIN OF ts_productattributedtos,
        attrname  TYPE string, "属性名
        attrtype  TYPE string, "属性类型：属性名对应的code值
        attrvalue TYPE string, "属性值
      END OF ts_productattributedtos .
    TYPES:
      BEGIN OF ts_suitedetail_img,
        imageid       TYPE string, "图片ID
        imageidx      TYPE string, "图片ID
        imagename     TYPE string, "图片名称
        imagetypecode TYPE string, "图片类型编码
        imagetypename TYPE string, "图片类型名称
        imageurl      TYPE string, "链接
      END OF ts_suitedetail_img .
    TYPES:
      BEGIN OF ts_suitedetail_prd,
        basecategeory        TYPE ts_basecategeory, "基础分类
        brandcode            TYPE string, "品牌Id
        brandname            TYPE string, "品牌名称
        categorycode         TYPE string, "品类编码
        categoryname         TYPE string, "品类名称
        description          TYPE string, "商家描述
        inquiryid            TYPE string, "询价单id
        internalnum          TYPE string, "商家编码
        internalnumtrim      TYPE string, "去空格商家编码
        mainflag             TYPE string, "主配件标识
        mallproductid        TYPE string, "商城商品商品id
        oelist               TYPE STANDARD TABLE OF ts_oelist WITH DEFAULT KEY, "OE信息
        partcode             TYPE string, "配件code
        partcodetrim         TYPE string, "配件code（去除空格）
        partname             TYPE string, "配件名称
        partnum              TYPE string, "零件号
        partnumtrim          TYPE string, "去空格零件号
        partsname            TYPE string, "零件名称
        productattributedtos TYPE STANDARD TABLE OF ts_productattributedtos WITH DEFAULT KEY, "商品属性信息
        productid            TYPE string, "id
        productimage         TYPE STANDARD TABLE OF ts_suitedetail_img WITH DEFAULT KEY,
        productname          TYPE string, "商品名称
        productstoreid       TYPE string, "店铺id
        producttype          TYPE string, "套件标识,SUIT_PARTS : 套件
        productversion       TYPE string, "商品版本号
        quality              TYPE string, "品质Id
        qualityname          TYPE string, "品质名称
        quantity             TYPE string, "数量
        quotationid          TYPE string, "报价单ID
        quotationremarks     TYPE string, "商品报价备注
        recommend            TYPE string, "推荐
        remark               TYPE string, "备注
        smallimageurl        TYPE string, "小图
        standardname         TYPE string, "标名名称
        standardnamecode     TYPE string, "标名编码
      END OF ts_suitedetail_prd .
    TYPES:
      BEGIN OF ts_suitedetail,
        brandcode     TYPE string, "厂牌ID
        datasource    TYPE string, "数据来源
        remark        TYPE string, "备注
        requestid     TYPE string, "套件请求ID
        storeid       TYPE string, "店铺ID
        suitecode     TYPE string, "套件code
        suiteid       TYPE string, "套件id
        suitename     TYPE string, "套件名称
        suitetypecode TYPE string, "套件类型code
        suitetypename TYPE string, "套件类型名称
        products      TYPE STANDARD TABLE OF ts_suitedetail_prd WITH DEFAULT KEY,
        suiteimage    TYPE STANDARD TABLE OF ts_suitedetail_img WITH DEFAULT KEY,
      END OF ts_suitedetail .
    TYPES:
      BEGIN OF ts_suiteinfo_data,
        id          TYPE string, "查询Id，PLATMALL场景对应商品ID（同时必传version），INQUIRY场景对应报价结果ID，ORDER场景对应订单ID对应请求实体中ProductSuiteRequest.id
        itemid      TYPE string, "订单场景对应的是订单条目ID, 其他场景暂不涉及此字段
        productid   TYPE string, "唯一商品id
        version     TYPE string, "商品版本号
        suitedetail TYPE ts_suitedetail,
      END OF ts_suiteinfo_data .
    TYPES:
      BEGIN OF ts_suiteinfo,
        code         TYPE string,
        data         TYPE STANDARD TABLE OF ts_suiteinfo_data WITH DEFAULT KEY,
        errormessage TYPE string,
      END OF ts_suiteinfo .
    TYPES:
      BEGIN OF ts_quotesource ,
        photodescription TYPE string, ": "", // 缩略图展示绝对地址
        resourcesize     TYPE string, ": "", // 资源文件大小，单位KB
        resourcetype     TYPE string, ": "", // 资源类型,视频/图片
        businesstype     TYPE string, "
        resourcevalue    TYPE string, ": "" // 资源值，图片/视频绝对地址
      END OF ts_quotesource .
    TYPES:BEGIN OF ts_description,
            descriptiontype  TYPE string,
            descriptionvalue TYPE string,
          END OF ts_description.
    TYPES:
      BEGIN OF ts_ordquotesource,
        productid         TYPE string,
        imageanddescinfos TYPE STANDARD TABLE OF ts_quotesource WITH DEFAULT KEY,
        descriptions      TYPE STANDARD TABLE OF ts_description WITH DEFAULT KEY,
      END OF ts_ordquotesource .
    TYPES:
      tt_quotesource TYPE STANDARD TABLE OF ts_ordquotesource WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ty_productattribute,
        attrname  TYPE string,
        attrvalue TYPE string,
      END OF ty_productattribute .
    TYPES:
      tt_productattribute TYPE STANDARD TABLE OF ty_productattribute .
    TYPES:
      BEGIN OF ty_product_snapshot,
        orderid                      TYPE string,
        productid                    TYPE string,
        orderitemseqid               TYPE string,
        standardname                 TYPE string,
        productattributesnapshotdtos TYPE STANDARD TABLE OF ty_productattribute WITH DEFAULT KEY,
      END OF ty_product_snapshot .
    TYPES:
      BEGIN OF ts_orderstatus,
        changereason             TYPE string, ": "string",
        createdstamp             TYPE string, ": "2020-10-16T18:58:27.988Z",
        createdtxstamp           TYPE string, ": "2020-10-16T18:58:27.988Z",
        lastupdatedstamp         TYPE string, ": "2020-10-16T18:58:27.988Z",
        lastupdatedtxstamp       TYPE string, ": "2020-10-16T18:58:27.988Z",
        orderid                  TYPE string, ": "string",
        orderitemseqid           TYPE string, ": "string",
        orderpaymentpreferenceid TYPE string, ": "string",
        orderstatusid            TYPE string, ": "string",
        statusdatetime           TYPE string, ": "2020-10-16T18:58:27.988Z",
        statusid                 TYPE string, ": "string",
        statususerlogin          TYPE string, ": "string"
      END OF ts_orderstatus .
    TYPES:
      BEGIN OF ty_progress,
        orderstatusid            TYPE string, ": "8200507000041",
        statusid                 TYPE string, ": "ORDER_WAIT_PAYED",
        statusdesc               TYPE string, ": "订单提交成功，等待付款",
        orderid                  TYPE string, ": "S2005070000485",
        orderitemseqid           TYPE string, ": null,
        orderpaymentpreferenceid TYPE string, ": null,
        statusdatetime           TYPE string, ": 1588820875000,
        statususerlogin          TYPE string, ": "dywszf",
        changereason             TYPE string, ": null
      END OF ty_progress .
    TYPES:
      tt_progress TYPE STANDARD TABLE OF ty_progress .
    TYPES:
      BEGIN OF ty_aftersalescalculate,
        orderid                   TYPE string,
        goldremainadjustment      TYPE string,
        couponremainadjustment    TYPE string,
        payonlineremainadjustment TYPE string,
        flowremainadjustment      TYPE string,
        goldcounttotal            TYPE string,
        goldamount                TYPE string,
        couponamount              TYPE string,
        payonlineamount           TYPE string,
        flowamount                TYPE string,
        cassdiscount              TYPE string,
        cassdiscounttaxamount     TYPE string,
        returnamount              TYPE string,
      END OF ty_aftersalescalculate .
    TYPES:
      BEGIN OF ty_as,
        asid                     TYPE string,
        goldcounttotal           TYPE string,
        goldamount               TYPE string,
        totalquantity	           TYPE string,
        returnamount             TYPE string,
        returncassdiscount       TYPE string,
        createdtime	             TYPE string,
        createdby	               TYPE string,
        createdname	             TYPE string,
        type                     TYPE string,
        attrstate	               TYPE string,
        reasonid                 TYPE string,
        comments                 TYPE string,
        packageimgpath           TYPE string,
        detailimgpath	           TYPE string,
        statusid                 TYPE string,
        currenthandeluserloginid TYPE string,
        currenthandelusername	   TYPE string,
        logisticscompany         TYPE string,
        logisticstracknum	       TYPE string,
        logisticscomment         TYPE string,
        originalsource           TYPE string,
        platformhandelmethod     TYPE string,
        cassdiscounttaxamount	   TYPE string,
        typedesc                 TYPE string,
        statusdesc               TYPE string,
        reasondesc               TYPE string,
        isreceived               TYPE string,
        isinstalled	             TYPE string,
        isintact                 TYPE string,
        iscontact2supplier       TYPE string,
        nextlimittime	           TYPE string,
        couponamount             TYPE string,
        originalsourcetype       TYPE string,
        currentplace             TYPE string,
        parentid                 TYPE string,
        causeofcomplaint         TYPE string,
        lastupdatedstamp         TYPE string,
        lastupdatedtxstamp       TYPE string,
        createdstamp             TYPE string,
        createdtxstamp           TYPE string,
        garagecompanyid	         TYPE string,
        suppliercompanyid	       TYPE string,
        applyuserid	             TYPE string,
      END OF ty_as .
    TYPES:
      BEGIN OF ty_userinfo,
        asid                    TYPE string,
        asrepairuserid          TYPE string,
        asrepairusername        TYPE string,
        asrepaircompanyname	    TYPE string,
        asrepaircompanyid	      TYPE string,
        asrepaircompanycode	    TYPE string,
        asrepaircontectid	      TYPE string,
        assuppliercompanyid	    TYPE string,
        assuppliercompanyname	  TYPE string,
        assupplierstoreid	      TYPE string,
        assupplierstorename	    TYPE string,
        assuppliercontectid	    TYPE string,
        asrepairwarzeno	        TYPE string,
        assupplierlogistictype  TYPE string,
        asrepairroleid          TYPE string,
        asrepairlogistictype    TYPE string,
        asrepairlogistictypedes	TYPE string,
        asplatformcontectid	    TYPE string,
        lastupdatedstamp        TYPE string,
        lastupdatedtxstamp      TYPE string,
        createdstamp            TYPE string,
        createdtxstamp          TYPE string,
      END OF ty_userinfo .
    TYPES:
      BEGIN OF ty_orders,
        asid                TYPE string,
        orderid	            TYPE string,
        orderitemseqid      TYPE string,
        inquiryid	          TYPE string,
        orderitemtypeid	    TYPE string,
        productid	          TYPE string,
        productname	        TYPE string,
        quantity            TYPE string,
        productbrandname    TYPE string,
        productbrandid      TYPE string,
        quality	            TYPE string,
        qualityname	        TYPE string,
        productnum          TYPE string,
        productoem          TYPE string,
        internalnum	        TYPE string,
        goldcount	          TYPE string,
        goldprice	          TYPE string,
        unitprice	          TYPE string,
        actualprice	        TYPE string,
        amount              TYPE string,
        cassdiscountprice	  TYPE string,
        aftersalespolicys	  TYPE string,
        coupondiscountprice	TYPE string,
        originalsellerprice	TYPE string,
        lastupdatedstamp    TYPE string,
        lastupdatedtxstamp  TYPE string,
        createdstamp        TYPE string,
        createdtxstamp      TYPE string,
        itemadjustments	    TYPE string,
      END OF ty_orders .
    TYPES:
      BEGIN OF ty_statusinfo,
        id                 TYPE string,
        asid               TYPE string,
        asstatusid         TYPE string,
        handlereason       TYPE string,
        handleusername     TYPE string,
        handleuserid       TYPE string,
        handletime         TYPE string,
        handlemessage	     TYPE string,
        repairdesc         TYPE string,
        supplierdesc       TYPE string,
        platformdesc       TYPE string,
        visualstate	       TYPE string,
        dealmessage	       TYPE string,
        lastupdatedstamp   TYPE string,
        lastupdatedtxstamp TYPE string,
        createdstamp       TYPE string,
        createdtxstamp     TYPE string,
        imgs               TYPE string,
        visible4repairer   TYPE string,
        visible4supplier   TYPE string,
        visible4platform   TYPE string,
      END OF ty_statusinfo .
    TYPES:
      BEGIN OF ty_returnreport,
        returnreportid         TYPE string,
        returnid               TYPE string,
        returntime             TYPE string,
        paymentmethod	         TYPE string,
        suppliername           TYPE string,
        supplierproductstoreid TYPE string,
        customerspartyid       TYPE string,
        customersname	         TYPE string,
        companyid	             TYPE string,
        companyname	           TYPE string,
        discount               TYPE string,
        returnamount           TYPE string,
        createdby	             TYPE string,
        orderid	               TYPE string,
        sellerreturnamount     TYPE string,
        cassdiscountamount     TYPE string,
        goldcointotal	         TYPE string,
        goldcoinamount         TYPE string,
        paymonthly             TYPE string,
        returncostfee	         TYPE string,
        orderstoretype         TYPE string,
        lastupdatedstamp       TYPE string,
        lastupdatedtxstamp     TYPE string,
        createdstamp           TYPE string,
        createdtxstamp         TYPE string,
      END OF ty_returnreport .
    TYPES:
      BEGIN OF ty_orderhistoryinfo,
        orderid	           TYPE string,
        origianlprice	     TYPE string,
        inquiryid	         TYPE string,
        productstoreid     TYPE string,
        historyreturncount TYPE string,
      END OF ty_orderhistoryinfo .
    TYPES:
      BEGIN OF ty_aftersales,
        as                             TYPE ty_as,
        userinfo                       TYPE ty_userinfo,
        orders                         TYPE STANDARD TABLE OF ty_orders WITH DEFAULT KEY,
        statusinfo                     TYPE STANDARD TABLE OF ty_statusinfo WITH DEFAULT KEY,
        returnreport                   TYPE ty_returnreport,
        postaladdressresultforrepairer TYPE string,
        postaladdressresultforsupplier TYPE string,
        postaladdressresultforplatform TYPE string,
        orderstatusid                  TYPE string,
        orderhistoryinfo               TYPE ty_orderhistoryinfo,
        returnreportfees               TYPE string,
      END OF ty_aftersales .
    TYPES:
      BEGIN OF ty_as_status,
        asid     TYPE string,
        type     TYPE string,
        statusid TYPE string,
      END OF ty_as_status .
    TYPES:
      tt_as_status TYPE STANDARD TABLE OF ty_as_status WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ty_manufacturer,
        id   TYPE string, "厂商id
        name TYPE string, "厂商名称
      END OF ty_manufacturer .
    TYPES:
      BEGIN OF ty_prepositivewarehousecontact,
        contactperson TYPE string, "联系人
        address       TYPE string, "地址
        contactphone  TYPE string, "联系电话
      END OF ty_prepositivewarehousecontact .
    TYPES:
      BEGIN OF ty_prepositivewarehouse,
        id                             TYPE string, "前置仓id
        name                           TYPE string, "前置仓名称
        prepositivewarehousecontactdto TYPE ty_prepositivewarehousecontact, "前置仓联系信息
      END OF ty_prepositivewarehouse .
    TYPES:
      BEGIN OF ty_labelbindinfo,
        manufacturerdto                TYPE ty_manufacturer, "厂商信息
        prepositivewarehousedto        TYPE ty_prepositivewarehouse, "前置仓信息
        prepositivewarehousecontactdto TYPE ty_prepositivewarehousecontact, "前置仓联系信息
      END OF ty_labelbindinfo .
    TYPES:
      BEGIN OF ty_label_info,
        code                     TYPE string,
        aftersalelabelstatuscode TYPE string,
        aftersalelabelstatusname TYPE string,
        storeid                  TYPE string,
        storename                TYPE string,
        orderid                  TYPE string,
        ordertime                TYPE string,
        businesssource           TYPE string, "业务源 STORE：店铺 MANUFACTURER：厂商 PREPOSITIVE_WAREHOUSE：前置仓
        labelstatus              TYPE string, "溯源码状态：（INITIALIZED：初始化） （STOCKED: 已入库） （PRE_ALLOCATED: 预分配） （ALLOCATED: 已分配） （CANCELLED: 已注销）
        labelbindinfodto         TYPE ty_labelbindinfo, "溯源码绑定信息信息
      END OF ty_label_info .
    TYPES:
      tt_label_info TYPE STANDARD TABLE OF ty_label_info WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ty_labelbind,
        code            TYPE string,
        labelid         TYPE string,
        storid          TYPE string,
        purchaseorderid TYPE string,
        orderid         TYPE string,
        waybillid       TYPE string,
        itemid          TYPE string, "物品id
        itemtype        TYPE string, "物品id类型
        productid       TYPE string,
      END OF ty_labelbind .
    TYPES:
      BEGIN OF ty_product_info,
        id              TYPE string,
        code            TYPE string,
        labelbinddto    TYPE ty_labelbind,
*        labelbindDTO       TYPE STANDARD TABLE OF ty_labelbind WITH DEFAULT KEY,
        labelstatus     TYPE string,
        qrcodedata      TYPE string,
        randomcode      TYPE string,
        batchcode       TYPE string,
        serialcode      TYPE string,
        batchserialcode TYPE string,
      END OF ty_product_info .
    TYPES:
      tt_product_info TYPE STANDARD TABLE OF ty_product_info WITH DEFAULT KEY .
    TYPES:
      BEGIN OF  ty_aftersalecreatedresult,
        aftersalesid   TYPE string,
        issuccess      TYPE string,
        failurereasons TYPE string,
      END OF ty_aftersalecreatedresult .
    TYPES:
      BEGIN OF ts_note,
        orderid          TYPE string,
        id               TYPE string,
        commentfrom      TYPE string,
        commentto        TYPE string,
        notetext         TYPE string,
        createdby        TYPE string,
        createdstamp     TYPE string,
        lastupdatedby    TYPE string,
        lastupdatedstamp TYPE string,
      END OF ts_note .
    TYPES:
      tt_note TYPE STANDARD TABLE OF ts_note .
    TYPES:
      BEGIN OF ty_childlist,
        id    TYPE  string,
        key   TYPE  string,
        value TYPE  string,
      END OF ty_childlist .
    TYPES:
      tt_childlist TYPE STANDARD TABLE OF ty_childlist WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ty_policy,
        itemid              TYPE string,
        orderid             TYPE string,
        orderitemseqid      TYPE string,
        createdby           TYPE string, "创建人
        createdtime         TYPE string, "创建时间
        desc                TYPE string, "描述
        explanation         TYPE string, "售后说明
        icon                TYPE string, "售后图标链接
        id                  TYPE string, "服务id
        key                 TYPE string, "政策类型
        lastupdatedby       TYPE string, "最后更新人
        lastupdatedtime     TYPE string, "最后更新时间
        title               TYPE string, "标题
        url                 TYPE string, "售后跳转链接
        value               TYPE string, "政策值
        displayname         TYPE string, "显示标题
        display             TYPE string, "是否展示
        innersort           TYPE int4, "组内排序字段
        scenarioid          TYPE string, "应用场景ID
        servicecategorycode TYPE string, "标签类型,文本类:TEXT;赔偿类:COMPENSATION;退货类:RETURN;质保类:QA;假赔类:FC
        technicalinstructor TYPE string, "指导员名称
        floattext           TYPE string, "浮窗说明文案
        cellphone           TYPE string, "手机电话
        repairdocumenturl   TYPE string,
        groupid             TYPE string, "分组id
        childlist           TYPE STANDARD TABLE OF ty_childlist WITH DEFAULT KEY,
      END OF ty_policy .
    TYPES:
      BEGIN OF ts_salepolicy,
        code         TYPE string,
        data         TYPE ty_policy,
        errormessage TYPE  string,
      END OF ts_salepolicy .
    TYPES:
      BEGIN OF ty_order,
        orderid TYPE string,
      END OF ty_order .
    TYPES:
      tt_orders TYPE STANDARD TABLE OF ty_orders WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ty_productids,
        productid TYPE string,
      END OF ty_productids .
    TYPES:
      tt_productids TYPE STANDARD TABLE OF ty_productids WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ty_salepolicy,
        orderid        TYPE string,
        itemid         TYPE string,
        orderitemseqid TYPE string,
        policys        TYPE STANDARD TABLE OF ty_policy WITH DEFAULT KEY,
      END OF ty_salepolicy .
    TYPES:
      BEGIN OF ty_salepolicy_data,
        code         TYPE string,
        data         TYPE STANDARD TABLE OF ty_salepolicy WITH DEFAULT KEY,
        errormessage TYPE  string,
      END OF ty_salepolicy_data .
    TYPES:
      BEGIN OF ty_salepolicy_v2,
        productid TYPE string,
        policys   TYPE STANDARD TABLE OF ty_policy WITH DEFAULT KEY,
      END OF ty_salepolicy_v2 .
    TYPES:
      BEGIN OF ty_salepolicy_datav2,
        code         TYPE string,
        data         TYPE STANDARD TABLE OF ty_salepolicy_v2 WITH DEFAULT KEY,
        errormessage TYPE  string,
      END OF ty_salepolicy_datav2 .
    TYPES:
      BEGIN OF ts_ordheader_buy,
        companycode        TYPE string, "公司客户代码
        companydisplayname TYPE string, "公司简称
        companyid          TYPE string, "公司ID
        companyname        TYPE string, "公司全称
      END OF ts_ordheader_buy .
    TYPES:
      BEGIN OF ts_ordheader,
        amount             TYPE string, "总价(商品原价总金额)
        buyer              TYPE ts_ordheader_buy, "订单买家信息
        createby           TYPE string, "订单提交人
        evaluatestatus     TYPE string, "订单评价状态
        inquiryid          TYPE string, "订单询价ID
        internalcode       TYPE string, "测试订单标识
        invoicestatus      TYPE string, "订单开票状态 A-开票 B-不开票
        orderdate          TYPE string, "订单下单时间
        orderid            TYPE string, "订单编号
        ordername          TYPE string, "订单名称
        orderstoretype     TYPE string, "null
        ordertypeid        TYPE string, "订单类型
        ordertypeiddesc    TYPE string, "null
        originalsource     TYPE string, "订单来源:PLATMALL-商城订单,DIRECTIONAL-定向采购订单,INQUIRYORDER-询价订单,PREPARE_GOODS-备货协议订单,GROUP_BUY-拼团订单
        originalsourcedesc TYPE string, "订单来源描述
        statusid           TYPE string, "订单状态
        statusiddesc       TYPE string, "订单状态描述
      END OF ts_ordheader .
    TYPES:
      "paymentGroupId
      BEGIN OF ts_paymentgroupid,
        isneedtopay    TYPE string, ": false, // 是否需要跳转到支付页，true:需要，此时有paymentGroupId;false:不需要，此时支付分组可能为空
        paymentgroupid TYPE string, ": "" // 支付组ID
      END OF ts_paymentgroupid .
    TYPES:
      BEGIN OF ts_tradefee,
        dealid             TYPE string, "交易编号
        dealitemsequenceid TYPE string, "订单条目序号
        sellerstoreid      TYPE string, "卖方店铺ID
        sellerstorecode    TYPE string, "卖方店铺代码
        sellerenterpriseid TYPE string, "卖方企业ID
        buyerstoreid       TYPE string, "买方店铺ID
        buyerstorecode     TYPE string, "买方店铺代码
        costtype           TYPE string, "费用类型
        costamount         TYPE string, "费用金额
        joinflag           TYPE string, "加入账单标记(0:未加入,1:已加入)
        calculatemethod    TYPE string, "算费方式： NUM(按个数)； PRE(按比例）
        originalratio      TYPE string, "原始比例
        calculateratio     TYPE string, "实际计算比例
        virtualflag        TYPE string, "是否为虚拟调账单，0为真实，1为虚拟'
        discountamount     TYPE string, "优惠金额
        discountmethod     TYPE string, "优惠方式：BRAND_ACTIVITY(品牌优惠季) BRAND_LEVEL(品牌件5折优惠) BIG_ORDER(大单封顶) CHANNEL_FEE(通道费)
        ruleid             TYPE string, "规则id
        originaldealamount TYPE string, "原始订单金额
        cassdiscountamount TYPE string, "开思券金额
        dealtime           TYPE string, "下单时间戳
      END OF ts_tradefee .
    TYPES:
      tt_tradefee TYPE STANDARD TABLE OF ts_tradefee WITH DEFAULT KEY .

    DATA:
      tt_labelbind TYPE STANDARD TABLE OF ty_labelbind .

    METHODS get_orders_attributes
      IMPORTING
        VALUE(iv_orderids) TYPE string
      EXPORTING
        VALUE(es_out)      TYPE zord_t_attributes
        VALUE(ev_msg)      TYPE bapiret2 .
    METHODS get_order_detail_data
      IMPORTING
        VALUE(iv_orderid)    TYPE string
        VALUE(iv_showsource) TYPE string
      EXPORTING
        VALUE(es_out)        TYPE zord_s_orderdetail
        VALUE(ev_msg)        TYPE bapiret2 .
    METHODS get_order_processinfo_data
      IMPORTING
        VALUE(iv_orderid)    TYPE string
        VALUE(iv_showsource) TYPE string
      EXPORTING
        VALUE(et_out)        TYPE zord_t_orderprocess
        VALUE(ev_msg)        TYPE bapiret2 .
    METHODS get_order_shipments_data
      IMPORTING
        VALUE(iv_orderid)    TYPE string
        VALUE(iv_showsource) TYPE string
      EXPORTING
        VALUE(et_out)        TYPE zord_t_ordershipment
        VALUE(ev_msg)        TYPE bapiret2 .
    METHODS get_order_shipments_location
      IMPORTING
        VALUE(iv_shipmentnumber) TYPE string
      EXPORTING
        VALUE(et_out)            TYPE zord_s_orderlocation
        VALUE(ev_msg)            TYPE bapiret2 .
    METHODS get_order_payment_data
      IMPORTING
        !iv_orderid          TYPE string
        VALUE(iv_showsource) TYPE string DEFAULT 'PLATFORM'
      EXPORTING
        !es_out              TYPE zord_s_orderpayment
        !ev_msg              TYPE bapiret2 .
    METHODS get_order_paymentgroupid
      IMPORTING
        VALUE(iv_orderids)    TYPE string
        VALUE(iv_userloginid) TYPE string
      EXPORTING
        !es_out               TYPE ts_paymentgroupid
        !ev_msg               TYPE bapiret2 .
    METHODS get_order_returndeadline_data
      IMPORTING
        VALUE(iv_orderid)  TYPE string
      EXPORTING
        VALUE(ev_deadline) TYPE string
        VALUE(ev_msg)      TYPE bapiret2 .
    METHODS get_order_header_data
      IMPORTING
        VALUE(iv_orderid) TYPE string
      EXPORTING
        VALUE(es_header)  TYPE ts_ordheader
        VALUE(ev_msg)     TYPE bapiret2 .
    METHODS get_order_note_data
      IMPORTING
        VALUE(iv_orderid)    TYPE string
        VALUE(iv_showsource) TYPE string
      EXPORTING
        VALUE(et_out)        TYPE zord_t_ordernote
        VALUE(ev_msg)        TYPE bapiret2 .
    METHODS get_order_note_data_new
      IMPORTING
        VALUE(iv_orderid) TYPE string
      EXPORTING
        VALUE(et_note)    TYPE tt_note
        VALUE(ev_msg)     TYPE bapiret2 .
    METHODS update_order_cancelquantity
      IMPORTING
        !iv_orderid        TYPE string
        !iv_orderitemseqid TYPE string
        !iv_offset         TYPE string
      EXPORTING
        VALUE(ev_msg)      TYPE bapiret2 .
    METHODS get_order_aftersales_calculate
      IMPORTING
        VALUE(iv_body)                 TYPE string
        VALUE(iv_orderid)              TYPE string
        VALUE(iv_asid)                 TYPE string
      EXPORTING
        VALUE(ev_msg)                  TYPE bapiret2
        VALUE(es_aftersales_calculate) TYPE ty_aftersalescalculate .
    METHODS update_order_note
      IMPORTING
        !iv_body      TYPE string
      RETURNING
        VALUE(es_msg) TYPE bapiret2 .
    METHODS update_loaction_tmsfee
      IMPORTING
        !iv_body      TYPE string
      RETURNING
        VALUE(es_msg) TYPE bapiret2 .
    METHODS get_aftersales_status
      IMPORTING
        VALUE(iv_body)      TYPE string OPTIONAL
      EXPORTING
        VALUE(et_as_status) TYPE tt_as_status
        !es_msg             TYPE bapiret2 .
    METHODS get_aftersales_order
      IMPORTING
        !iv_returnorder TYPE string
      EXPORTING
        !es_msg         TYPE bapiret2
        !es_aftersales  TYPE ty_aftersales .
    METHODS get_order_progress_byid
      IMPORTING
        VALUE(iv_order)    TYPE string
      EXPORTING
        VALUE(et_progress) TYPE tt_progress
        VALUE(es_msg)      TYPE bapiret2 .
    METHODS get_order_cancel_reason
      IMPORTING
        VALUE(iv_orderid)      TYPE string
      EXPORTING
        VALUE(es_cancelreason) TYPE zord_s_order_cancelreason
        VALUE(es_msg)          TYPE bapiret2 .
    METHODS get_as_label_info
      IMPORTING
        VALUE(iv_code) TYPE string OPTIONAL
      EXPORTING
        !es_label_info TYPE ty_label_info
        !ev_msg        TYPE bapiret2 .
    METHODS get_aslabel_linkproduct_info
      IMPORTING
        VALUE(iv_code)      TYPE string
      EXPORTING
        VALUE(es_labelbind) TYPE ty_labelbind
        !ev_msg             TYPE bapiret2 .
    METHODS get_order_snapshot_product
      IMPORTING
        VALUE(iv_orderid)         TYPE string
        VALUE(iv_orderitemid)     TYPE string
      EXPORTING
        VALUE(es_productsnapshot) TYPE ty_product_snapshot
        VALUE(ev_msg)             TYPE bapiret2 .
    METHODS get_order_status_byid
      IMPORTING
        VALUE(iv_order)  TYPE string
      EXPORTING
        VALUE(ev_status) TYPE string
        VALUE(es_msg)    TYPE bapiret2 .
    METHODS create_aftersale
      IMPORTING
        VALUE(iv_body) TYPE string OPTIONAL
      EXPORTING
        !es_result     TYPE ty_aftersalecreatedresult
        !ev_msg        TYPE bapiret2 .
    METHODS get_order_quoteresource
      IMPORTING
        VALUE(iv_body)          TYPE string
      EXPORTING
        VALUE(ev_msg)           TYPE bapiret2
        VALUE(et_quoteresource) TYPE tt_quotesource .
    METHODS get_salepolicy
      IMPORTING
        !key                 TYPE string
        !value               TYPE string
        VALUE(showsource)    TYPE string DEFAULT 'PLATFORM'
        VALUE(terminal)      TYPE string DEFAULT 'APP'
        !scenarioid          TYPE string
      EXPORTING
        !ev_msg              TYPE bapiret2
      RETURNING
        VALUE(es_salepolicy) TYPE ts_salepolicy .
    METHODS get_aftersale_policyv2
      IMPORTING
        VALUE(terminal)        TYPE string DEFAULT 'PC'
        VALUE(showsource)      TYPE string OPTIONAL
        VALUE(it_productids)   TYPE tt_productids OPTIONAL
        VALUE(productids)      TYPE string OPTIONAL
        VALUE(version)         TYPE string OPTIONAL
        VALUE(companyid)       TYPE string OPTIONAL
        VALUE(postaladdressid) TYPE string OPTIONAL
        !userloginid           TYPE string
      EXPORTING
        !ev_msg                TYPE bapiret2
      RETURNING
        VALUE(data)            TYPE ty_salepolicy_datav2 .
    METHODS get_aftersale_policy
      IMPORTING
        VALUE(terminal)   TYPE string DEFAULT 'PC'
        VALUE(showsource) TYPE string DEFAULT 'SELLER'
        VALUE(it_order)   TYPE tt_orders
        VALUE(version)    TYPE string OPTIONAL
      EXPORTING
        !ev_msg           TYPE bapiret2
      RETURNING
        VALUE(data)       TYPE ty_salepolicy_data .
    METHODS get_suite_product_detail
      IMPORTING
        VALUE(iv_body)      TYPE string
      EXPORTING
        VALUE(ev_msg)       TYPE bapiret2
        VALUE(es_suiteinfo) TYPE ts_suiteinfo .
    METHODS get_ksbs_order_flg
      IMPORTING
        VALUE(iv_orderid) TYPE string OPTIONAL
      EXPORTING
        VALUE(ev_msg)     TYPE bapiret2
        VALUE(es_data)    TYPE ts_ksbs .
    METHODS get_trade_fee
      IMPORTING
        VALUE(iv_body) TYPE string
      EXPORTING
        VALUE(ev_msg)  TYPE bapiret2
        VALUE(et_data) TYPE tt_tradefee .
    METHODS get_f2border_h
      IMPORTING
        !iv_body TYPE string
      EXPORTING
        !ev_msg  TYPE bapiret2
        !es_data TYPE ts_f2border .
PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS get_path
      IMPORTING
        VALUE(iv_service) TYPE ztint_icec_api-service
        VALUE(iv_method)  TYPE ztint_icec_api-method
      RETURNING
        VALUE(ev_url)     TYPE ztint_icec_api-url .
    METHODS save_api_log
      IMPORTING
        VALUE(ev_msg)          TYPE bapiret2 OPTIONAL
        VALUE(iv_commit)       TYPE char01 OPTIONAL
        VALUE(iv_keyvalue)     TYPE string OPTIONAL
        VALUE(iv_responsebody) TYPE string OPTIONAL
        VALUE(iv_requestbody)  TYPE string OPTIONAL .
ENDCLASS.



CLASS ZCL_ICEC_ORDER_API IMPLEMENTATION.


  METHOD create_aftersale.
    DATA:lv_data TYPE string.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri =  get_path( EXPORTING iv_service = 'AFTERSALE' iv_method = 'CREATE_AFTERSALE').

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    lv_title = '新建权益工单同步至平台创建售后申请单(ZCL_ICEC_ORDER_API->CREATE_AFTERSALE)'.
    lv_body = lv_data.
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

    IF lv_out IS NOT INITIAL ."解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_result  ).


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

    SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'AFTERSALE' AND method = 'CREATE_AFTERSALE'.
    IF lv_nolog_1 IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
    ENDIF.

  ENDMETHOD.


  METHOD get_aftersales_order.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    lv_uri =  get_path( EXPORTING iv_service = 'AFTERSALES' iv_method = 'GET_AFTERSALES_ORDER' ).

    REPLACE '{returnReportId}' IN lv_uri WITH iv_returnorder.
    CONDENSE lv_uri.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = es_msg
                          ).

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json = json_out
          CHANGING
            data = es_aftersales  ).
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
   SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'AFTERSALES' AND method = 'GET_AFTERSALES_ORDER'.
   IF lv_nolog_1 IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = json_out ev_msg = es_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_aftersales_status.
    DATA:lv_data TYPE string.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    lv_uri =  get_path( EXPORTING iv_service = 'AFTERSALE' iv_method = 'GET_AFTERSALE_STATUS').

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    lv_title = '获取售后申请单状态(ZCL_ICEC_ORDER_API->GET_AFTERSALE_STATUS)'.
    lv_body = lv_data.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = iv_body
        iv_title        = lv_title
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = es_msg.

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json = json_out
          CHANGING
            data = et_as_status ).
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
   SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'AFTERSALE' AND method = 'GET_AFTERSALE_STATUS'.
   IF lv_nolog_1 IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = json_out ev_msg = es_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD get_aftersale_policy.
    DATA:lv_uri          TYPE string,
         lv_out          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA lv_body TYPE string.
    DATA(lo_api) = NEW zcl_icec_api( ).
    DATA:lv_rfcdest TYPE rfcdest.
    DATA:lv_title TYPE string.
    DATA:lv_orderids TYPE string.

    CHECK it_order IS NOT INITIAL.
    LOOP AT it_order INTO DATA(ls_order).
      lv_orderids = COND #( WHEN lv_orderids IS INITIAL THEN |"{ ls_order-orderid }"|
                            ELSE |{ lv_orderids },"{ ls_order-orderid }"| ).
    ENDLOOP.
    lv_orderids = |[{ lv_orderids }]|.
    lv_body = '{' && |"orderIds": { lv_orderids },"pageType": "","showSource": "{ showSource }","terminal": "{ terminal }","version": { version }| && '}'.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_icecapi)  WHERE service = 'SALEPOLICY' AND method = 'GET_AFTERSALE_POLICY'.
    lv_uri = ls_icecapi-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_rfcdest = COND #( WHEN ls_icecapi-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_icecapi-rfcdest ).
    "调用接口

    lv_title = '查询售后政策及展示名称-售后(ZCL_ICEC_ORDER_API->GET_AFTERSALE_POLICY)'.
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
                         data = data   ).
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

   IF ls_icecapi-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_aftersale_policyv2.
    DATA:lv_uri          TYPE string,
         lv_out          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA lv_body TYPE string.
    DATA(lo_api) = NEW zcl_icec_api( ).
    DATA:lv_rfcdest TYPE rfcdest.
    DATA:lv_title TYPE string.
    DATA:lv_productids TYPE string.

    lv_productids = productids.
    LOOP AT it_productids INTO DATA(ls_productid).
      lv_productids = COND #( WHEN lv_productids IS INITIAL THEN |"{ ls_productid-productid }"|
                            ELSE |{ lv_productids },"{ ls_productid-productid }"| ).
    ENDLOOP.
    lv_productids = |[{ lv_productids }]|.
    lv_body = '{' && |"businessGroup": "INQUIRY","companyId": "{ companyid }","postalAddressId": "{ postaladdressid }",| &&
               |"showSource":"{ showsource }","terminal": "{ terminal }","userLoginId":"{ userLoginId }","version": { version },"productIds":{ lv_productids }| && '}'.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_icecapi)  WHERE service = 'SALEPOLICY' AND method = 'GET_AFTERSALE_POLICYV2'.
    lv_uri = ls_icecapi-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    lv_rfcdest = COND #( WHEN ls_icecapi-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_icecapi-rfcdest ).
    "调用接口

    lv_title = '查询售后政策及展示名称-售前(ZCL_ICEC_ORDER_API->GET_AFTERSALE_POLICYV2)'.
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
                         data = data   ).
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

   IF ls_icecapi-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_aslabel_linkproduct_info.
    DATA es_product_info TYPE ty_product_info.
    DATA et_label LIKE STANDARD TABLE OF es_labelbind.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    lv_uri = get_path( EXPORTING iv_service = 'LABEL' iv_method = 'GET_ASLABEL_LINKPRODUCT_INFO' ).
    REPLACE '{code}' IN lv_uri WITH iv_code.
    CONDENSE lv_uri.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = ev_msg
                          ).

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json = json_out
          CHANGING
            data = es_product_info  ).
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
   SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'LABEL' AND method = 'GET_ASLABEL_LINKPRODUCT_INFO'.
   IF lv_nolog_1 IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = json_out  ev_msg = ev_msg ).
   ENDIF.

    IF es_product_info-labelbinddto IS NOT INITIAL.
      MOVE-CORRESPONDING es_product_info-labelbinddto TO es_labelbind.
      CLEAR:es_product_info.
    ENDIF.


  ENDMETHOD.


  METHOD get_as_label_info.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    lv_uri =  get_path( EXPORTING iv_service = 'LABEL' iv_method = 'GET_AS_LABEL_INFO').

    REPLACE '{code}' IN lv_uri WITH iv_code.
    CONDENSE lv_uri.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = ev_msg
                          ).

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json = json_out
          CHANGING
            data = es_label_info  ).
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
   SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'LABEL' AND method = 'GET_AS_LABEL_INFO'.
   IF lv_nolog_1 IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = json_out  ev_msg = ev_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_f2border_h.

    DATA:lv_uri          TYPE string,
         lv_out          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_rfcdest TYPE rfcdest.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_icecapi)
        WHERE service = 'F2BORDER' AND method = 'GET_F2BORDER_H'.
    lv_uri = ls_icecapi-url.
    lv_rfcdest = COND #( WHEN ls_icecapi-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_icecapi-rfcdest ).
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA:lv_title TYPE string.
    lv_title = '获取F2B订单列表(ZCL_ICEC_ORDER_API->GET_F2BORDER_H)'.
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
                         data =  es_data   ).
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


  METHOD get_ksbs_order_flg.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'ORDER' AND method = 'GET_KSBS_ORDER_FLG'.

    DATA:lv_uri          TYPE string,
         lv_body         TYPE string,
         lv_rfcdest      TYPE rfcdest,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'
                          ELSE ls_ztint_icec_api-rfcdest ).
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA:lv_title TYPE string.

    lv_body = |\{"orderIds":["{ iv_orderid }"],"policyKey": "KSBS0001"\}|.

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
    IF lv_out IS NOT INITIAL.
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data =  es_data   ).
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


  METHOD GET_ORDERS_ATTRIBUTES.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_rfcdest type rfcdest.


    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_api) WHERE service = 'ORDERDETAIL' AND method = 'GET_ORDERS_ATTRIBUTES'.
    lv_uri = ls_api-url.
    lv_rfcdest = cond #( when ls_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE LS_API-rfcdest ).

    REPLACE '{orderids}' IN lv_uri WITH iv_orderids.
    CONDENSE lv_uri.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest"'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = ev_msg
                          ).

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json = json_out
          CHANGING
            data = es_out  ).
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
   IF ls_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = json_out  ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_order_aftersales_calculate.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'AFTERSALE' AND method = 'GET_AFTERSALES_CALCULATE'.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{orderId}' IN lv_uri WITH iv_orderid.
    REPLACE '{asId}' IN lv_uri WITH iv_asid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA:lv_title TYPE string.
    lv_title = '获取售后项目优惠计算详情(ZCL_ICEC_ORDER_API->GET_ORDER_AFTERSALES_CALCULATE)'.
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
                         data =  es_aftersales_calculate   ).
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


  METHOD get_order_cancel_reason.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    lv_uri =  get_path( EXPORTING iv_service = 'ORDER' iv_method = 'GET_ORDER_CANCEL_REASON' ).

    REPLACE '{orderId}' IN lv_uri WITH iv_orderid.
    CONDENSE lv_uri.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = es_msg ).

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json = json_out
          CHANGING
            data = es_cancelreason  ).
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
   SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'ORDER' AND method = 'GET_ORDER_CANCEL_REASON'.
   IF lv_nolog_1 IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = json_out ev_msg = es_msg ).
   ENDIF.

  ENDMETHOD.


  METHOD get_order_detail_data.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype,
         lv_rfcdest type rfcdest.

**    lv_uri =  get_path( EXPORTING iv_service = 'ORDERDETAIL' iv_method = 'GET_ORDER_DETAIL_DATA').

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_api) WHERE service = 'ORDERDETAIL' AND method = 'GET_ORDER_DETAIL_DATA'.
    lv_uri = ls_api-url.
    lv_rfcdest = cond #( when ls_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE LS_API-rfcdest ).

    REPLACE '{orderId}' IN lv_uri WITH iv_orderid.
    REPLACE '{showSource}' IN lv_uri WITH iv_showsource.
    CONDENSE lv_uri.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = lv_rfcdest"'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = ev_msg
                          ).

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json = json_out
          CHANGING
            data = es_out  ).
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
   IF ls_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = json_out  ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_order_header_data.

    DATA:lv_uri          TYPE string,
         lv_rfcdest type rfcdest,
         ls_content_type TYPE zapi_s_contenttype.

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_api)
        WHERE service = 'ORDER' AND method = 'GET_ORDER_HEADER_DATA'.
    lv_uri = ls_api-url.
    lv_rfcdest = cond #( when ls_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE LS_API-rfcdest ).

    REPLACE '{orderId}' IN lv_uri WITH iv_orderid.
    CONDENSE lv_uri.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = ev_msg
                          ).

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json = json_out
          CHANGING
            data = es_header  ).
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
   IF ls_api-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = json_out ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_order_note_data.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    lv_uri =  get_path( EXPORTING iv_service = 'ORDERPAYMENT' iv_method = 'GET_ORDER_NOTE_DATA' ).

    REPLACE '{orderId}' IN lv_uri WITH iv_orderid.
    REPLACE '{showSource}' IN lv_uri WITH iv_showsource.
    CONDENSE lv_uri.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = ev_msg
                          ).

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json = json_out
          CHANGING
            data = et_out  ).
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
   SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'ORDERPAYMENT' AND method = 'GET_ORDER_NOTE_DATA'.
   IF lv_nolog_1 IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = json_out ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_order_note_data_new.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    lv_uri =  get_path( EXPORTING iv_service = 'ORDERPAYMENT' iv_method = 'GET_ORDER_NOTE_DATA_NEW' ).

    REPLACE '{orderId}' IN lv_uri WITH iv_orderid.
    CONDENSE lv_uri.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = ev_msg
                          ).

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json = json_out
          CHANGING
            data = et_note  ).
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
   SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'ORDERPAYMENT' AND method = 'GET_ORDER_NOTE_DATA_NEW'.
   IF lv_nolog_1 IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = json_out ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


METHOD get_order_paymentgroupid.
  DATA:lv_uri          TYPE string,
       ls_content_type TYPE zapi_s_contenttype.
  DATA:lv_rfcdest TYPE rfcdest.
  DATA:lv_body TYPE string.

  "取url
  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'ORDERPAYMENT' AND method = 'GET_ORDER_PAYMENTGROUPID'.

  lv_uri = ls_ztint_icec_api-url.
  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).
  REPLACE '{orderIds}' IN lv_uri WITH iv_orderids.
  REPLACE '{userLoginId}' IN lv_uri WITH iv_userloginid.
  CONDENSE lv_uri.

  ls_content_type-content_type = 'application/json;charset=UTF-8'.

  DATA(lo_api) = NEW zcl_icec_api( ).
  CALL METHOD lo_api->post_data(
    EXPORTING
      iv_rfcdest      = lv_rfcdest
      iv_body         = lv_body
      iv_uri          = lv_uri
      is_content_type = ls_content_type
    IMPORTING
      json_out        = DATA(json_out)
      ev_msg          = ev_msg
                        ).

  TRY.
      /ui2/cl_json=>deserialize(
      EXPORTING
        json = json_out
      CHANGING
      data = es_out  ).
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
 save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = json_out ev_msg = ev_msg ).
 ENDIF.
ENDMETHOD.


  METHOD get_order_payment_data.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    lv_uri =  get_path( EXPORTING iv_service = 'ORDERPAYMENT' iv_method = 'GET_ORDER_PAYMENT_DATA' ).

    REPLACE '{orderId}' IN lv_uri WITH iv_orderid.
    REPLACE '{showSource}' IN lv_uri WITH iv_showsource.
    CONDENSE lv_uri.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = ev_msg
                          ).

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json = json_out
          CHANGING
            data = es_out  ).
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
   SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'ORDERPAYMENT' AND method = 'GET_ORDER_PAYMENT_DATA'.
   IF lv_nolog_1 IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = json_out ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_order_processinfo_data.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    lv_uri =  get_path( EXPORTING iv_service = 'ORDERPROCESS' iv_method = 'GET_ORDER_PROCESSINFO_DATA').

    REPLACE '{orderId}' IN lv_uri WITH iv_orderid.
    REPLACE '{showSource}' IN lv_uri WITH iv_showsource.
    CONDENSE lv_uri.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = ev_msg
                          ).

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json = json_out
          CHANGING
            data = et_out  ).
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
   SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'ORDERPROCESS' AND method = 'GET_ORDER_PROCESSINFO_DATA'.
   IF lv_nolog_1 IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = json_out  ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_order_progress_byid.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    lv_uri =  get_path( EXPORTING iv_service = 'ORDER' iv_method = 'GET_ORDER_PROGRESS_BYID' ).

    REPLACE '{orderId}' IN lv_uri WITH iv_order.
    CONDENSE lv_uri.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = es_msg
                          ).

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json = json_out
          CHANGING
            data = et_progress ).
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
   SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'ORDER' AND method = 'GET_ORDER_PROGRESS_BYID'.
   IF lv_nolog_1 IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_order iv_responsebody = json_out ev_msg = es_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_order_quoteresource.
    DATA:lv_uri          TYPE string,
         lv_out          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_icecapi)  WHERE service = 'ORDER' AND method = 'GET_ORDER_QUOTERESOURCE'.
    lv_uri = ls_icecapi-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    DATA:lv_rfcdest TYPE rfcdest.
    lv_rfcdest = COND #( WHEN ls_icecapi-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_icecapi-rfcdest ).
    "调用接口
    DATA:lv_title TYPE string.
    lv_title = '获取售后项目优惠计算详情(ZCL_ICEC_ORDER_API->GET_ORDER_QUOTERESOURCE)'.
    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'KLPLATFORM'
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
                         data =  et_quoteresource   ).
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

   IF ls_icecapi-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_order_returndeadline_data.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    lv_uri =  get_path( EXPORTING iv_service = 'ORDER' iv_method = 'GET_ORDER_RETURNDEADLINE_DATA' ).

    REPLACE '{orderId}' IN lv_uri WITH iv_orderid.
    CONDENSE lv_uri.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = ev_msg
                          ).

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json = json_out
          CHANGING
            data = ev_deadline  ).
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
   SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'ORDER' AND method = 'GET_ORDER_RETURNDEADLINE_DATA'.
   IF lv_nolog_1 IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = json_out ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_order_shipments_data.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    lv_uri =  get_path( EXPORTING iv_service = 'ORDERSHIPMENTS' iv_method = 'GET_ORDER_SHIPMENTS_DATA').

    REPLACE '{orderId}' IN lv_uri WITH iv_orderid.
    REPLACE '{showSource}' IN lv_uri WITH iv_showsource.
    CONDENSE lv_uri.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = ev_msg
                          ).

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json = json_out
          CHANGING
            data = et_out  ).
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
   SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'ORDERSHIPMENTS' AND method = 'GET_ORDER_SHIPMENTS_DATA'.
   IF lv_nolog_1 IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = json_out  ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_order_shipments_location.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    lv_uri =  get_path( EXPORTING iv_service = 'ORDERSHIPMENTS' iv_method = 'GET_ORDER_SHIPMENTS_LOCATION').

    REPLACE '{ShipmentNumber}' IN lv_uri WITH iv_shipmentnumber.
    CONDENSE lv_uri.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = ev_msg
                          ).

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json = json_out
          CHANGING
            data = et_out  ).
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
   SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'ORDERSHIPMENTS' AND method = 'GET_ORDER_SHIPMENTS_LOCATION'.
   IF lv_nolog_1 IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = json_out  ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_order_snapshot_product.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    lv_uri = get_path( EXPORTING iv_service = 'ORDERSNAPSHOT' iv_method = 'GET_ORDERSNAPSHOT_PRODUCT' ).

    REPLACE '{orderId}' IN lv_uri WITH iv_orderid.
    REPLACE '{orderItemId}' IN lv_uri WITH iv_orderitemid.
    CONDENSE lv_uri.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = ev_msg
                          ).

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json = json_out
          CHANGING
            data = es_productsnapshot  ).
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
   SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'ORDERSNAPSHOT' AND method = 'GET_ORDERSNAPSHOT_PRODUCT'.
   IF lv_nolog_1 IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_responsebody = json_out  ev_msg = ev_msg ).
   ENDIF.


  ENDMETHOD.


  METHOD get_order_status_byid.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.

    lv_uri =  get_path( EXPORTING iv_service = 'ORDER' iv_method = 'GET_ORDER_STATUS_BYID' ).

    REPLACE '{orderId}' IN lv_uri WITH iv_order.
    CONDENSE lv_uri.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = DATA(json_out)
        ev_msg          = es_msg
                          ).

    ev_status = json_out.
*    TRY.
*        /ui2/cl_json=>deserialize(
*          EXPORTING
*            json = json_out
*          CHANGING
*            data = ev_status ).
*        es_msg-type = 'S'.
*        es_msg-id = '200'.
*        es_msg-message = 'JSON成功解析'.
*      CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).
*        es_msg-type = 'E'.
*        es_msg-id = '404'.
*        es_msg-message = 'JSON解析异常，请检查系统传入参数'.
*      CATCH cx_root.
*        es_msg-type = 'E'.
*        es_msg-id = 404.
*        es_msg-message = 'JSON解析异常，请检查系统传入参数'.
*    ENDTRY.
   SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'ORDER' AND method = 'GET_ORDER_STATUS_BYID'.
   IF lv_nolog_1 IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_order iv_responsebody = json_out ev_msg = es_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_path.
    "取url
    SELECT SINGLE url FROM ztint_icec_api INTO ev_url
      WHERE service = iv_service
      AND method = iv_method.
  ENDMETHOD.


  METHOD get_salepolicy.
    DATA:lv_url          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_out TYPE string.
    DATA lt_level TYPE STANDARD TABLE OF ztint_venlevel_c WITH DEFAULT KEY.
    DATA ls_level LIKE LINE OF lt_level.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'POLICY'
      AND method = 'GET_SALEPOLICY'.

    lv_url = ls_ztint_icec_api-url.
    REPLACE '{K}' WITH key INTO lv_url.
    REPLACE '{V}' WITH value INTO lv_url.
    REPLACE '{SO}' WITH showsource INTO lv_url.
    REPLACE '{T}' WITH terminal INTO lv_url.
    REPLACE '{SC}' WITH scenarioid INTO lv_url.

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
                         data = es_salepolicy  ).
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


  METHOD get_suite_product_detail.
****    {
****  "sceneType": "", // 查询场景类型：商城 PLATMALL, 询价 INQUIRY，订单 ORDER
****  "suiteRequests": [ // 请求信息实体
****    {
****      "id": "", // 查询Id，PLATMALL场景对应商品ID（同时必传version），INQUIRY场景对应报价结果ID，ORDER场景对应订单ID，
****      "itemId": "", // 条目ID，目前只有订单场景可能入参，目的是缩小查询范围
****      "version": "" // 商品版本号
****    }
****  ]
****}
    DATA:lv_uri          TYPE string,
         lv_out          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_rfcdest TYPE rfcdest.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_icecapi)  WHERE service = 'ORDER' AND method = 'GET_SUITE_PRODUCT_DETAIL'.
    lv_uri = ls_icecapi-url.
    lv_rfcdest = COND #( WHEN ls_icecapi-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_icecapi-rfcdest ).
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA:lv_title TYPE string.
    lv_title = '获取套件商品详情(ZCL_ICEC_ORDER_API->GET_SUITE_PRODUCT_DETAIL)'.
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
                         data =  es_suiteinfo   ).
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

   IF ls_icecapi-nolog IS INITIAL.
   save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
   ENDIF.
  ENDMETHOD.


  METHOD get_trade_fee.

    DATA:lv_uri          TYPE string,
         lv_out          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA:lv_rfcdest TYPE rfcdest.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_icecapi)
        WHERE service = 'ORDER' AND method = 'GET_TRADE_FEE'.
    lv_uri = ls_icecapi-url.
    lv_rfcdest = COND #( WHEN ls_icecapi-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_icecapi-rfcdest ).
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA:lv_title TYPE string.
    lv_title = '获取订单佣金收入详情(ZCL_ICEC_ORDER_API->GET_TRADE_FEE)'.
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
                         data =  et_data   ).
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

   IF ls_icecapi-nolog IS INITIAL.
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
    ls_apilog-msgtype = ev_msg-type.
    ls_apilog-msgid = ev_msg-id.
    ls_apilog-msg = ev_msg-message.
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


  METHOD update_loaction_tmsfee.
    DATA:lv_data TYPE string.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri =  get_path( EXPORTING iv_service = 'ORDER' iv_method = 'UPDATE_LOACTION_TMSFEE').

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
        ev_msg          = es_msg.
    SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'ORDER' AND method = 'UPDATE_LOACTION_TMSFEE'.
    IF lv_nolog_1 IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = es_msg ).
    ENDIF.
  ENDMETHOD.


  METHOD update_order_cancelquantity.
    DATA:lv_data TYPE string.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri =  get_path( EXPORTING iv_service = 'ORDER' iv_method = 'UPDATE_ORDER_CANCELQUANTITY').

    REPLACE ALL OCCURRENCES OF '{orderId}' IN lv_uri WITH iv_orderid.
    REPLACE ALL OCCURRENCES OF '{orderItemSeqId}' IN lv_uri WITH iv_orderitemseqid.
    REPLACE ALL OCCURRENCES OF '{offset}' IN lv_uri WITH iv_offset.
    lv_data = '{"orderId":"' && iv_orderid && '","orderItemSeqId":"' && iv_orderitemseqid &&  '","offset":"' && iv_offset && '"}'.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    lv_title = '更新订单项目可申请售后数量(ZCL_ICEC_ORDER_API->UPDATE_ORDER_CANCELQUANTITY)'.
    lv_body = lv_data.
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



    SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'ORDER' AND method = 'UPDATE_ORDER_CANCELQUANTITY'.
    IF lv_nolog_1 IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = lv_body iv_responsebody = lv_out ev_msg = ev_msg ).
    ENDIF.
  ENDMETHOD.


  METHOD update_order_note.
    DATA:lv_data TYPE string.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri =  get_path( EXPORTING iv_service = 'ORDER' iv_method = 'UPDATE_ORDER_NOTE').

    ls_content_type-content_type = 'application/json;charset=UTF-8'.
    DATA:lv_title TYPE string.
    lv_title = '更新订单备注信息(ZCL_ICEC_ORDER_API->UPDATE_ORDER_NOTE)'.
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
        ev_msg          = es_msg.
    SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) WHERE service = 'ORDER' AND method = 'UPDATE_ORDER_NOTE'.
    IF lv_nolog_1 IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = es_msg ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
