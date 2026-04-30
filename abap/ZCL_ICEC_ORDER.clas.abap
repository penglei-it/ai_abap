CLASS zcl_icec_order DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPE-POOLS zints .
    TYPE-POOLS zord .

    TYPES:
      BEGIN OF ts_ordhead_info,
        orderid        TYPE zticec_order_h-orderid,
        cusid          TYPE ztint_cus_inf-cusid,
        companyid      TYPE ztint_cus_inf-companyid,
        companycode    TYPE ztint_cus_inf-companycode,
        cusname        TYPE ztint_cus_inf-cusname,
        cuserid        TYPE ztint_cus_user-userid,
        cusername      TYPE ztint_user_inf-username,
        venid          TYPE ztint_ven_inf-venid,
        productstoreid TYPE zticec_order_h-productstoreid,
        vuserid        TYPE ztint_ven_user-userid,
        vusername      TYPE ztint_user_inf-username,
        statusid       TYPE zticec_order_h-statusid,
        createdate     TYPE zticec_order_h-createdate,
        createtime     TYPE zticec_order_h-createtime,
        amount         TYPE zticec_order_h-actualcurrencyamount,
      END OF ts_ordhead_info .
    TYPES:
      BEGIN OF ts_order,
        orderid              TYPE zticec_order_h-orderid,
        custcompanyid        TYPE zticec_order_h-custcompanyid,
        productstoreid       TYPE zticec_order_h-productstoreid,
        statusid             TYPE zticec_order_h-statusid,
        createdate           TYPE zticec_order_h-createdate,
        createtime           TYPE zticec_order_h-createtime,
        canceldate           TYPE zticec_order_h-canceldate,
        canceltime           TYPE zticec_order_h-canceltime,
        originalsource       TYPE zticec_order_h-originalsource,
        actualcurrencyamount TYPE zticec_order_h-actualcurrencyamount,
        carenergytype        TYPE zticec_order_h-carenergytype, "新能源标识-1-新能源
        bizcatid             TYPE zticec_order_cat-bizcatid,  "业务分类：A004-轮胎/A009-油品
        billno(50)           TYPE c,
        followsourcedesc     TYPE string,
        followtypedesc       TYPE string,
        followremark         TYPE string,
        followname           TYPE string,
      END OF ts_order .
    TYPES:
      tt_order TYPE STANDARD TABLE OF ts_order WITH DEFAULT KEY .
    TYPES:
*售后申请单
      BEGIN OF ts_asfilter,
        asid                  TYPE zticec_af_inf-asid,
        woid                  TYPE zticec_af_inf-woid,
        createdstampstr       TYPE zticec_af_inf-createdstampstr,
        lastupdatedtxstampstr TYPE zticec_af_inf-lastupdatedtxstampstr,
        newtype               TYPE zticec_af_inf-newtype,
        righttype             TYPE zticec_af_inf-righttype,
        type                  TYPE zticec_af_inf-type,
        childtype             TYPE zticec_af_inf-childtype,
        reasondesc            TYPE zticec_af_inf-reasondesc,
        returnamount          TYPE zticec_af_inf-returnamount,
        actualreturnamount    TYPE zticec_af_inf-actualreturnamount,
        statusid              TYPE zticec_af_inf-statusid,
        createdate            TYPE zticec_af_inf-createdate,
        createtime            TYPE zticec_af_inf-createtime,
        asrepaircompanyid     TYPE zticec_af_user-asrepaircompanyid,
        asrepaircompanyname   TYPE zticec_af_user-asrepaircompanyname,
        assupplierstoreid     TYPE zticec_af_user-assupplierstoreid,
        assupplierstorename   TYPE zticec_af_user-assupplierstorename,
        sellerstoreid         TYPE zticec_af_user-sellerstoreid, "服务商
        sellerstorename       TYPE zticec_af_user-sellerstorename,
        asrepairusername      TYPE zticec_af_user-asrepairusername,
        mangstatus            TYPE string,
        orderid               TYPE zticec_af_order-orderid,
        carbrandname          TYPE zticec_af_order-productbrandname,
        productname           TYPE zticec_af_order-productname,
        productnum            TYPE zticec_af_order-productnum,
        quantity              TYPE zticec_af_order-quantity,
        ksbsorder             TYPE zticec_order_h-ksbsorder,
        venid                 TYPE ztint_ven_inf-venid,
        cusid                 TYPE ztint_cus_inf-cusid,
        zoneid                TYPE ztint_cus_inf-zoneid,
        provincegeoname       TYPE ztint_cus_inf-provincegeoname,
        citygeoname           TYPE ztint_cus_inf-citygeoname,
        companycode           TYPE ztint_cus_inf-companycode,
      END  OF ts_asfilter .
    TYPES:
      tt_asfilter TYPE STANDARD TABLE OF ts_asfilter WITH DEFAULT KEY .
    TYPES:
*售后申请单对应订单
      BEGIN OF ts_asorder,
        asid             TYPE zticec_af_order-asid,
        orderid          TYPE       zticec_af_order-orderid,
        orderitemseqid   TYPE  zticec_af_order-orderitemseqid,
        productid        TYPE      zticec_af_order-productid,
        productname      TYPE  zticec_af_order-productname,
        quantity         TYPE    zticec_af_order-quantity,
        meins            TYPE   zticec_af_order-meins,
        productbrandid   TYPE   zticec_af_order-productbrandid,
        productbrandname TYPE   zticec_af_order-productbrandname,
        productnum       TYPE   zticec_af_order-productnum,
        goldcount        TYPE  zticec_af_order-goldcount,
        waers            TYPE  zticec_af_order-waers,
        goldprice        TYPE  zticec_af_order-goldprice,
        unitprice        TYPE   zticec_af_order-unitprice,
        actualprice      TYPE    zticec_af_order-actualprice,
        quality          TYPE   zticec_af_order-quality,
        qualityname      TYPE     zticec_af_order-qualityname,
        ksbsorder        TYPE   zticec_order_h-ksbsorder,
      END  OF ts_asorder .
    TYPES:
      tt_asorder TYPE STANDARD TABLE OF ts_asorder WITH DEFAULT KEY .
    TYPES:
      tt_cusinf TYPE STANDARD TABLE OF ztint_cus_inf WITH DEFAULT KEY .
    TYPES:
      tt_veninf TYPE STANDARD TABLE OF ztint_ven_inf WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_inqfilter,
        inquiryid     TYPE zticec_inquiry_h-inquiryid,
        custcompanyid TYPE zticec_inquiry_h-custcompanyid,
        amount        TYPE zticec_inquiry_h-amount,
        preamount     TYPE zticec_inquiry_t-preamount,
        createdate    TYPE zticec_inquiry_h-createdate,
        createtime    TYPE zticec_inquiry_h-createtime,
      END  OF ts_inqfilter .
    TYPES:
      tt_inqfilter TYPE STANDARD TABLE OF ts_inqfilter WITH DEFAULT KEY .
    TYPES:
*  types TS_PRODUCT_INFO .
      BEGIN OF ts_product_info,
*        purchaseorderid          TYPE string, "标签采购id
        productname              TYPE string, " 商品名称
        productcount             TYPE string, "商品数量
        orderid                  TYPE string, "商品订单
        ordertime                TYPE string, "商品下单时间
        productspecification     TYPE string, "商品规格
        brandname                TYPE string, "商品品牌
        buyeractualamount        TYPE string, "商品金额（单价-实付金额）
        saledisplayname          TYPE string, "商家名称
        salercontactnumber       TYPE string, "联系电话
        storeid                  TYPE string, "商家代码
        logisticscompanyname     TYPE string, "物流公司
        waybillid                TYPE string, "运单号
        buyerdiaplayname         TYPE string, "客户名称
        buyerreceiver            TYPE string, "收货人
        buyerreceiverphonenumber TYPE string, "手机号码
        cassqualityassurepolicy  TYPE string, "开思质保
        longassurepolicy         TYPE string, "超长质保
        qualityassurepolicy      TYPE string, "商家质保
        remainingtime            TYPE string, "剩余时长
      END OF ts_product_info .
    TYPES:
      tt_product_info TYPE STANDARD TABLE OF ts_product_info .
    TYPES:
      BEGIN OF ts_order_followinfo,
        billno               TYPE ztint_follow_inf-billno, "单据号
        cusid                TYPE ztint_follow_inf-cusid,   "客户ID
        companycode          TYPE ztint_cus_inf-companycode, "客户Code
        cusname              TYPE ztint_cus_inf-cusname, "客户名称
        displayname          TYPE ztint_cus_inf-displayname, "客户简称
        username             TYPE ztint_user_inf-username, "客户经理名称
        productstoreid       TYPE ztint_ven_inf-productstoreid, "商家代码
        vendisplay           TYPE ztint_ven_inf-displayname, "商家名称
        billtype             TYPE ztint_follow_inf-billtype,
        billtypedesc(50)     TYPE c, "单据类型
        partsname            TYPE ztint_follow_inf-partsname,   "配件名称
        partsnum             TYPE ztint_follow_inf-partsnum,  "配件号
        followname           TYPE ztint_follow_inf-followname,  "钉钉姓名
        followtype           TYPE ztint_follow_inf-followtype,
        followtypedesc(50)   TYPE c,  "跟进类型
        followsource         TYPE ztint_follow_inf-followsource,
        followsourcedesc(50) TYPE c, "  跟进来源
        followdate(10)       TYPE c,  "备注日期
        followtime(10)       TYPE c,  "备注时间
        followremark         TYPE ztint_follow_inf-followremark,  "跟进备注
        amount               TYPE zde_intamount, "金额
        orderamt             TYPE zde_intamount,  "金额
        provincegeoname      TYPE ztint_follow_inf-provincegeoname,   "省名称
        citygeoidname        TYPE ztint_follow_inf-citygeoidname,   "市名称
        countygeoidname      TYPE ztint_follow_inf-countygeoidname,   "区县名称
        zonename             TYPE ztint_follow_inf-zonename,  "战区名称
        positionname         TYPE ztint_follow_inf-positionname,  "创建人职位
      END OF ts_order_followinfo .
    TYPES:
      tt_order_followinfo TYPE STANDARD TABLE OF ts_order_followinfo WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_products,
        productid   TYPE string,
        storeid     TYPE string,
        facilityid  TYPE string,
        inquiryid   TYPE string,
        quantity    TYPE string,
        price       TYPE string,
        invoicetype TYPE string,
      END OF ts_products .
    TYPES:
      BEGIN OF ts_etaimport,
        garagecompanyid TYPE string,
        postaladdressid TYPE string,
        businesstype    TYPE string,
        terminal        TYPE string,
        products        TYPE STANDARD TABLE OF ts_products WITH DEFAULT KEY,
      END OF ts_etaimport .
    TYPES:
      tt_etashow TYPE STANDARD TABLE OF zcl_icec_inquiry_api=>ts_eta WITH DEFAULT KEY .
    TYPES:
      BEGIN OF ts_pinkageimport,
        addressid           TYPE string, "收货地址id，app旧版本非必传，app新版本必传，pc端必传
        businesstype        TYPE string, "业务场景：询报价:INQUIRY 商城:MALL 轮胎报价： TYREQUOTATION
        garagecompanyid     TYPE string,
        terminal            TYPE string, "终端标识 （PC|APP）
        productinforequests TYPE STANDARD TABLE OF ts_products WITH DEFAULT KEY,
      END OF ts_pinkageimport .
    TYPES:
      tt_pinkage TYPE STANDARD TABLE OF zcl_icec_inquiry_api=>ts_pinkagelabel WITH DEFAULT KEY .

    METHODS constructor
      IMPORTING
        VALUE(iv_userid)   TYPE ztint_user_inf-userid OPTIONAL
        VALUE(iv_username) TYPE ztint_user_inf-username OPTIONAL .
    METHODS get_order
      IMPORTING
        VALUE(iv_action)      TYPE char20
      EXPORTING
        VALUE(ev_msg)         TYPE bapiret2
      CHANGING
        VALUE(er_deep_entity) TYPE zcl_zgs_icerp_cassint_mpc_ext=>ts_deep_orderhomedetail .
    METHODS get_order_detail
      EXPORTING
        VALUE(ev_msg)         TYPE bapiret2
      CHANGING
        VALUE(er_deep_entity) TYPE zcl_zgs_icerp_cassint_mpc_ext=>ts_deep_orderhomedetail .
    METHODS get_order_processinfo
      EXPORTING
        VALUE(ev_msg)         TYPE bapiret2
      CHANGING
        VALUE(er_deep_entity) TYPE zcl_zgs_icerp_cassint_mpc_ext=>ts_deep_orderhomedetail .
    METHODS get_order_shipments
      EXPORTING
        VALUE(ev_msg)         TYPE bapiret2
      CHANGING
        VALUE(er_deep_entity) TYPE zcl_zgs_icerp_cassint_mpc_ext=>ts_deep_orderhomedetail .
    METHODS get_order_header_info
      IMPORTING
        VALUE(orderid) TYPE string
      RETURNING
        VALUE(es_head) TYPE ts_ordhead_info .
    METHODS get_order_overview_new_v2
      IMPORTING
        VALUE(so_canceldate)          TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_custcompanyname)     TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_originalsource)      TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_createdate)          TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_custcompanyid)       TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_inquirytype)         TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_shoppinglistid)      TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_zoneid)              TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_carbrandid)          TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_userid)              TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_citygeoid)           TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_statusid)            TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_paymentmethodtypeid) TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_createdname)         TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_productstoreid)      TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_companycode)         TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_orderid)             TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_cancelreason)        TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_canceltime)          TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_isproxy)             TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_operator)            TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(iv_orderby)             TYPE string OPTIONAL
        VALUE(iv_page)                TYPE string OPTIONAL
        VALUE(iv_size)                TYPE string OPTIONAL
        VALUE(iv_export)              TYPE string OPTIONAL
        VALUE(iv_classtype)           TYPE string OPTIONAL
        VALUE(iv_isdelete)            TYPE string OPTIONAL
        VALUE(is_excellist)           TYPE ztint_excel_list OPTIONAL
        VALUE(so_orderby)             TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_vin)                 TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_ordername)           TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_label)               TYPE /iwbep/t_mgw_select_option OPTIONAL
        VALUE(iv_usertype)            TYPE string OPTIONAL
        VALUE(so_custagid)            TYPE /iwbep/t_cod_select_options OPTIONAL
      RETURNING
        VALUE(es_data)                TYPE zcl_zgs_icerp_cassint_mpc_ext=>ts_deep_cassintorderhomeheader .
    METHODS get_order_overview_new
      IMPORTING
        VALUE(so_canceldate)          TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_custcompanyname)     TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_originalsource)      TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_createdate)          TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_custcompanyid)       TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_inquirytype)         TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_shoppinglistid)      TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_zoneid)              TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_carbrandid)          TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_userid)              TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_citygeoid)           TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_statusid)            TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_paymentmethodtypeid) TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_createdname)         TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_productstoreid)      TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_companycode)         TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_orderid)             TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_cancelreason)        TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_canceltime)          TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(iv_orderby)             TYPE string OPTIONAL
        VALUE(iv_page)                TYPE string OPTIONAL
        VALUE(iv_size)                TYPE string OPTIONAL
        VALUE(iv_export)              TYPE string OPTIONAL
        VALUE(iv_classtype)           TYPE string OPTIONAL
        VALUE(iv_isdelete)            TYPE string OPTIONAL
        VALUE(is_excellist)           TYPE ztint_excel_list OPTIONAL
        VALUE(so_orderby)             TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_ordername)           TYPE /iwbep/t_cod_select_options OPTIONAL
      RETURNING
        VALUE(es_data)                TYPE zcl_zgs_icerp_cassint_mpc_ext=>ts_deep_cassintorderhomeheader .
    METHODS get_order_overview
      IMPORTING
        VALUE(so_canceldate)          TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_custcompanyname)     TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_originalsource)      TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_createdate)          TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_custcompanyid)       TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_inquirytype)         TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_shoppinglistid)      TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_zoneid)              TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_carbrandid)          TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_userid)              TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_citygeoid)           TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_statusid)            TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_paymentmethodtypeid) TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_createdname)         TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_productstoreid)      TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_companycode)         TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_orderid)             TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(iv_orderby)             TYPE string OPTIONAL
        VALUE(iv_page)                TYPE string OPTIONAL
        VALUE(iv_size)                TYPE string OPTIONAL
        VALUE(iv_export)              TYPE string OPTIONAL
        VALUE(iv_classtype)           TYPE string OPTIONAL
        VALUE(iv_isdelete)            TYPE string OPTIONAL
        VALUE(is_excellist)           TYPE ztint_excel_list OPTIONAL
        VALUE(so_orderby)             TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_ordername)           TYPE /iwbep/t_cod_select_options OPTIONAL
      RETURNING
        VALUE(es_data)                TYPE zcl_zgs_icerp_cassint_mpc_ext=>ts_deep_cassintorderhomeheader .
    METHODS get_inq_overview_new
      IMPORTING
        !so_inquiryid         TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_cusname           TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_venname           TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_createdate        TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_statusid          TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_carbrandid        TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_sourceid          TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_inquirytype       TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_zoneid            TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_companycode       TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_userid            TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_citygeoid         TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_custcompanyid     TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_inquiryway        TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_foundstate        TYPE /iwbep/t_cod_select_options OPTIONAL
        !iv_orderby           TYPE string OPTIONAL
        !iv_page              TYPE string OPTIONAL
        !iv_size              TYPE string OPTIONAL
        !iv_export            TYPE string OPTIONAL
        !iv_classtype         TYPE string OPTIONAL
        VALUE(iv_isdelete)    TYPE string OPTIONAL
        !is_excellist         TYPE ztint_excel_list OPTIONAL
        !iv_terminal          TYPE string OPTIONAL
      RETURNING
        VALUE(er_deep_entity) TYPE zcl_zgs_icerp_cassint_mpc_ext=>ts_deep_cassintinqhomeheader .
    METHODS get_inq_overview_new_v2
      IMPORTING
        !so_inquiryid         TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_label             TYPE /iwbep/t_mgw_select_option OPTIONAL
        !so_personname        TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_isproxy           TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_vin               TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_cusname           TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_venname           TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_createdate        TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_statusid          TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_carbrandid        TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_sourceid          TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_inquirytype       TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_zoneid            TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_companycode       TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_userid            TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_citygeoid         TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_custcompanyid     TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_inquiryway        TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_foundstate        TYPE /iwbep/t_cod_select_options OPTIONAL
        !iv_orderby           TYPE string OPTIONAL
        !iv_page              TYPE string OPTIONAL
        !iv_size              TYPE string OPTIONAL
        !iv_usertype          TYPE string OPTIONAL
        !iv_export            TYPE string OPTIONAL
        !iv_classtype         TYPE string OPTIONAL
        VALUE(iv_isdelete)    TYPE string OPTIONAL
        !is_excellist         TYPE ztint_excel_list OPTIONAL
        !iv_terminal          TYPE string OPTIONAL
        VALUE(iv_isfollowed)  TYPE string OPTIONAL
        VALUE(so_custagid)    TYPE /iwbep/t_cod_select_options OPTIONAL
      RETURNING
        VALUE(er_deep_entity) TYPE zcl_zgs_icerp_cassint_mpc_ext=>ts_deep_cassintinqhomeheader .
    METHODS get_as_overview_new_v2
      IMPORTING
        !so_orderid           TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_zoneid            TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_cusname           TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_rtnreason         TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_venid             TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_followuser        TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_useright          TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_ksyx              TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_isappeal          TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_cusid             TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_status            TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_asid              TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_followasid        TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_type              TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_childtype         TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_newtype           TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_createdate        TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_zupdate           TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_mangstatus        TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_manager           TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_cargrade          TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_complex           TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_productnum        TYPE /iwbep/t_cod_select_options OPTIONAL
        !iv_dinguserid        TYPE string OPTIONAL
        !iv_onlyright         TYPE string OPTIONAL
        !iv_type              TYPE string OPTIONAL
        !iv_sortby            TYPE string OPTIONAL
        !iv_sortorder         TYPE string OPTIONAL
        !iv_isactivefollow    TYPE string OPTIONAL
        !iv_page              TYPE string OPTIONAL
        !iv_size              TYPE string OPTIONAL
        !iv_export            TYPE string OPTIONAL
      RETURNING
        VALUE(er_deep_entity) TYPE zcl_zgs_icerp_cassi_07_mpc_ext=>ts_deep_aftersalelistheader .
    METHODS get_inquiry_overview
      IMPORTING
        !so_inquiryid         TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_cusname           TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_createdate        TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_statusid          TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_carbrandid        TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_sourceid          TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_inquirytype       TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_zoneid            TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_companycode       TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_userid            TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_citygeoid         TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_custcompanyid     TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_inquiryway        TYPE /iwbep/t_cod_select_options OPTIONAL
        !iv_orderby           TYPE string OPTIONAL
        !iv_page              TYPE string OPTIONAL
        !iv_size              TYPE string OPTIONAL
        !iv_export            TYPE string OPTIONAL
        !iv_classtype         TYPE string OPTIONAL
        VALUE(iv_isdelete)    TYPE string OPTIONAL
        !is_excellist         TYPE ztint_excel_list OPTIONAL
      RETURNING
        VALUE(er_deep_entity) TYPE zcl_zgs_icerp_cassint_mpc_ext=>ts_deep_cassintinqhomeheader .
    METHODS get_inquiry_data_by_vendor
      IMPORTING
        !so_inquiryid      TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_cusname        TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_createdate     TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_statusid       TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_carbrandid     TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_sourceid       TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_inquirytype    TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_zoneid         TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_companycode    TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_userid         TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_citygeoid      TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_custcompanyid  TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_inquiryway     TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_ordered        TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(iv_isdelete) TYPE string OPTIONAL
      EXPORTING
        VALUE(et_inquiry)  TYPE zord_t_inquiry_info
        !et_inquiry_cus    TYPE zord_t_inquiry_info .
    METHODS nosign_currency_formatter
      IMPORTING
        VALUE(iv_input)  TYPE string
      RETURNING
        VALUE(ev_output) TYPE string .
    METHODS get_inquiry_data_by_customer
      IMPORTING
        !so_inquiryid      TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_cusname        TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_createdate     TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_statusid       TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_carbrandid     TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_sourceid       TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_inquirytype    TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_zoneid         TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_companycode    TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_userid         TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_citygeoid      TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_custcompanyid  TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_inquiryway     TYPE /iwbep/t_cod_select_options OPTIONAL
        !so_ordered        TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(iv_isdelete) TYPE string OPTIONAL
      EXPORTING
        VALUE(et_inquiry)  TYPE zord_t_inquiry_info
        !et_inquiry_cus    TYPE zord_t_inquiry_info .
    METHODS update_customerservice_note
      EXPORTING
        VALUE(msg)  TYPE bapiret2
      CHANGING
        VALUE(data) TYPE zcl_zgs_icerp_cassint_mpc_ext=>ts_deep_orderhomedetail OPTIONAL .
    METHODS get_order_follow_info
      IMPORTING
        VALUE(so_billno)     TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_billtype)   TYPE /iwbep/t_cod_select_options OPTIONAL
        VALUE(so_crtdate)    TYPE /iwbep/t_cod_select_options OPTIONAL
      RETURNING
        VALUE(et_followinfo) TYPE tt_order_followinfo .
    METHODS get_aslabel_product_detail
      IMPORTING
        VALUE(iv_code)           TYPE string
      EXPORTING
        VALUE(es_product_detail) TYPE ts_product_info .
    METHODS prepare_etalabel_improt
      IMPORTING
        VALUE(is_etaimport) TYPE ts_etaimport
      RETURNING
        VALUE(et_data)      TYPE tt_etashow .
    METHODS prepare_pinkage_import
      IMPORTING
        VALUE(is_pinkageimport) TYPE ts_pinkageimport
      RETURNING
        VALUE(et_data)          TYPE tt_pinkage .
  PROTECTED SECTION.
private section.

  data MV_REDO type C .
  data MV_CUS_CONDITION type CHAR01 .
  data MV_TYPE type ZTINT_REP_DATA-TYPE .
  data MV_USERID type ZTINT_USER_INF-USERID .
  data MT_REP_DATA type ZINTS_T_AUTHDATA .
  data MV_USERNAME type ZTINT_USER_INF-USERNAME .

  methods FILTER_ORDER_STATUS
    importing
      value(SO_ORDERID) type /IWBEP/T_COD_SELECT_OPTIONS
      value(IT_ORDER) type ZORD_T_ORDER_INFO
    exporting
      value(ET_ORDER_STATUS) type ZORD_T_ORDER_STATUS .
  methods SET_ORDER_OVERVIEW_NEW_V2
    importing
      value(IT_ORDER) type TT_ORDER optional
      value(SO_PAYMENTMETHODTYPEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_ORDERBY) type STRING optional
      value(IV_PAGE) type STRING optional
      value(IV_SIZE) type STRING optional
      value(IV_EXPORT) type STRING optional
      value(SO_STATUSID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IT_ORDER_CUS) type ZORD_T_ORDER_INFO optional
      value(IS_EXCELLIST) type ZTINT_EXCEL_LIST optional
      value(SO_ORDERBY) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_ISDELETE) type STRING optional
    exporting
      value(ER_DEEP_ENTITY) type ZCL_ZGS_ICERP_CASSINT_MPC_EXT=>TS_DEEP_CASSINTORDERHOMEHEADER .
  methods SET_ORDER_OVERVIEW_NEW
    importing
      value(IT_ORDER) type ZORD_T_ORDER_INFO optional
      value(IT_ORDER_STATUS) type ZORD_T_ORDER_STATUS optional
      value(SO_PAYMENTMETHODTYPEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_ORDERBY) type STRING optional
      value(IV_PAGE) type STRING optional
      value(IV_SIZE) type STRING optional
      value(IV_EXPORT) type STRING optional
      value(SO_STATUSID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IT_ORDER_CUS) type ZORD_T_ORDER_INFO optional
      value(IS_EXCELLIST) type ZTINT_EXCEL_LIST optional
      value(SO_ORDERBY) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_ISDELETE) type STRING optional
      value(ET_ORDER_NOCOMPANYID) type ZORD_T_ORDER_INFO optional
    exporting
      value(ER_DEEP_ENTITY) type ZCL_ZGS_ICERP_CASSINT_MPC_EXT=>TS_DEEP_CASSINTORDERHOMEHEADER .
  methods SET_ORDER_OVERVIEW
    importing
      value(IT_ORDER) type ZORD_T_ORDER_INFO optional
      value(IT_ORDER_STATUS) type ZORD_T_ORDER_STATUS optional
      value(SO_PAYMENTMETHODTYPEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_ORDERBY) type STRING optional
      value(IV_PAGE) type STRING optional
      value(IV_SIZE) type STRING optional
      value(IV_EXPORT) type STRING optional
      value(SO_STATUSID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IT_ORDER_CUS) type ZORD_T_ORDER_INFO optional
      value(IS_EXCELLIST) type ZTINT_EXCEL_LIST optional
      value(SO_ORDERBY) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_ISDELETE) type STRING optional
      value(ET_ORDER_NOCOMPANYID) type ZORD_T_ORDER_INFO optional
    exporting
      value(ER_DEEP_ENTITY) type ZCL_ZGS_ICERP_CASSINT_MPC_EXT=>TS_DEEP_CASSINTORDERHOMEHEADER .
  methods TIMESTAMP_FORMATTER
    importing
      value(IV_TIMESTAMP) type STRING
    exporting
      value(EV_DATE) type SY-DATUM
      value(EV_TIME) type SY-UZEIT
      value(EV_STRING) type DATA .
  methods GET_PERSON
    importing
      value(SO_USERID) type /IWBEP/T_COD_SELECT_OPTIONS optional
    exporting
      value(ET_USERLIST) type ZINTS_T_USERLIST .
  methods GET_USER_MVTYPE
    importing
      value(IV_ROLE) type ZTINT_AUTH_DATA-ZROLE .
  methods QUANTITY_FORMATTER
    importing
      value(IV_INPUT) type STRING
    returning
      value(EV_OUTPUT) type STRING .
  methods UN_QUANTITY_FORMATTER_DCM
    importing
      value(IV_INPUT) type STRING
    returning
      value(RV_OUTPUT) type ZDE_INTAMOUNT .
  methods CURRENCY_FORMATTER
    importing
      value(IV_INPUT) type STRING
    returning
      value(EV_OUTPUT) type STRING .
  methods UN_CURRENCY_FORMATTER
    importing
      value(IV_INPUT) type STRING
    returning
      value(RV_OUTPUT) type ZDE_INTAMOUNT .
  methods SET_ORDER_DETAIL
    importing
      value(IS_DETAIL) type ZORD_S_ORDERDETAIL
    exporting
      value(EV_MSG) type BAPIRET2
    changing
      value(CS_ENTITY) type ZCL_ZGS_ICERP_CASSINT_MPC_EXT=>TS_DEEP_ORDERHOMEDETAIL .
  methods SET_ORDER_PROCESSINFO
    importing
      value(IT_PROCESSINFO) type ZORD_T_ORDERPROCESS
    exporting
      value(EV_MSG) type BAPIRET2
    changing
      value(CS_ENTITY) type ZCL_ZGS_ICERP_CASSINT_MPC_EXT=>TS_DEEP_ORDERHOMEDETAIL .
  methods SET_ORDER_SHIPMENT
    importing
      value(IT_SHIPMENT) type ZORD_T_ORDERSHIPMENT
    exporting
      value(EV_MSG) type BAPIRET2
    changing
      value(CS_ENTITY) type ZCL_ZGS_ICERP_CASSINT_MPC_EXT=>TS_DEEP_ORDERHOMEDETAIL .
  methods GET_CANCEL_ORDER
    importing
      value(SO_DATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORDERID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_COMPANYID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_COMPANYCODE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_COMPANYNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSID) type /IWBEP/T_COD_SELECT_OPTIONS optional
    returning
      value(SO_CANCEL_ORDER) type /IWBEP/T_COD_SELECT_OPTIONS .
  methods GET_ORDER_DATA_BY_CUSTOMER
    importing
      value(SO_CUSTCOMPANYNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORIGINALSOURCE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CREATEDATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSTCOMPANYID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_INQUIRYTYPE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_SHOPPINGLISTID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ZONEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CARBRANDID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CITYGEOID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CREATEDNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_PRODUCTSTOREID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_COMPANYCODE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORDERID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CANCEL_ORDER) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_USERID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_ISDELETE) type STRING optional
      !SO_ORDERNAME type /IWBEP/T_COD_SELECT_OPTIONS
    exporting
      value(ET_ORDER) type ZORD_T_ORDER_INFO
      value(ET_ORDER_CUS) type ZORD_T_ORDER_INFO .
  methods GET_ORDER_DATA_NEW_V3
    importing
      value(SO_CUSTCOMPANYNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORIGINALSOURCE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CREATEDATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSTCOMPANYID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_INQUIRYTYPE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_SHOPPINGLISTID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_USERID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ZONEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CARBRANDID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CITYGEOID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CREATEDNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORDERNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_PRODUCTSTOREID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_COMPANYCODE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORDERID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CANCEL_ORDER) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_PAYMENTMETHODTYPEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ISPROXY) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_OPERATOR) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_ISDELETE) type STRING
      value(SO_CANCELDATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_STATUSID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CANCELREASON) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_VIN) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CANCELTIME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_CLASSTYPE) type STRING
      value(SO_LABEL) type /IWBEP/T_MGW_SELECT_OPTION optional
      value(IV_USERTYPE) type STRING optional
      value(SO_CUSTAGID) type /IWBEP/T_COD_SELECT_OPTIONS optional
    exporting
      value(ET_ORDER) type TT_ORDER .
  methods GET_ORDER_DATA_NEW_V2
    importing
      value(SO_CUSTCOMPANYNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORIGINALSOURCE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CREATEDATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSTCOMPANYID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_INQUIRYTYPE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_SHOPPINGLISTID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_USERID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ZONEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CARBRANDID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CITYGEOID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CREATEDNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORDERNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_PRODUCTSTOREID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_COMPANYCODE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORDERID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CANCEL_ORDER) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_PAYMENTMETHODTYPEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_ISDELETE) type STRING
      value(SO_CANCELDATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_STATUSID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CANCELREASON) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CANCELTIME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_CLASSTYPE) type STRING optional
    exporting
      value(ET_ORDER) type TT_ORDER .
  methods GET_ORDER_DATA
    importing
      value(SO_CUSTCOMPANYNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORIGINALSOURCE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CREATEDATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSTCOMPANYID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_INQUIRYTYPE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_SHOPPINGLISTID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_USERID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ZONEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CARBRANDID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CITYGEOID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CREATEDNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORDERNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_PRODUCTSTOREID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_COMPANYCODE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORDERID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CANCEL_ORDER) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_PAYMENTMETHODTYPEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_ISDELETE) type STRING
      value(SO_CANCELDATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_STATUSID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CANCELREASON) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CANCELTIME) type /IWBEP/T_COD_SELECT_OPTIONS optional
    exporting
      value(ET_ORDER) type ZORD_T_ORDER_INFO
      value(ET_ORDER_CUS) type ZORD_T_ORDER_INFO
      value(ET_ORDER_NOCOMPANYID) type ZORD_T_ORDER_INFO .
  methods GET_INQUIRY_DATA
    importing
      value(SO_INQUIRYID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CREATEDATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CARBRANDID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_SOURCEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_STATUSID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_INQUIRYTYPE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ZONEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_COMPANYCODE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CITYGEOID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSTCOMPANYID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORDERED) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_INQUIRYWAY) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_FOUNDSTATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_ISDELETE) type STRING optional
      value(SO_USERID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_VENNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_TERMINAL) type STRING optional
    exporting
      value(ET_INQUIRY) type ZORD_T_INQUIRY_INFO .
  methods SET_INQ_OVERVIEW_NEW
    importing
      value(IT_INQUIRY) type ZORD_T_INQUIRY_INFO optional
      value(IT_INQUIRY_CUS) type ZORD_T_INQUIRY_INFO optional
      value(IV_ORDERBY) type STRING optional
      value(IV_PAGE) type STRING optional
      value(IV_SIZE) type STRING optional
      value(IV_EXPORT) type STRING optional
      value(IV_ISDELETE) type STRING optional
      value(IS_EXCELLIST) type ZTINT_EXCEL_LIST optional
      value(IV_STATUS) type STRING optional
    returning
      value(ER_DEEP_ENTITY) type ZCL_ZGS_ICERP_CASSINT_MPC_EXT=>TS_DEEP_CASSINTINQHOMEHEADER .
  methods GET_INQUIRY_DATA_NEW_V2
    importing
      value(SO_INQUIRYID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CREATEDATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CARBRANDID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_SOURCEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_STATUSID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_INQUIRYTYPE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ZONEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_COMPANYCODE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CITYGEOID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSTCOMPANYID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORDERED) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_INQUIRYWAY) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_FOUNDSTATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_ISDELETE) type STRING optional
      value(SO_USERID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_VENNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_TERMINAL) type STRING optional
      value(IV_EXPORT) type STRING optional
      value(IV_ORDERBY) type STRING optional
      value(IV_PAGE) type STRING optional
      value(IV_SIZE) type STRING optional
    exporting
      value(ET_INQUIRY) type TT_INQFILTER
      value(EV_TOTALPAGE) type INT4
      value(EV_TOTALSIZE) type INT4 .
  methods SET_INQUIRY_OVERVIEW
    importing
      value(IT_INQUIRY) type ZORD_T_INQUIRY_INFO optional
      value(IT_INQUIRY_CUS) type ZORD_T_INQUIRY_INFO optional
      value(IV_ORDERBY) type STRING optional
      value(IV_PAGE) type STRING optional
      value(IV_SIZE) type STRING optional
      value(IV_EXPORT) type STRING optional
      value(IV_ISDELETE) type STRING optional
      value(IS_EXCELLIST) type ZTINT_EXCEL_LIST optional
    returning
      value(ER_DEEP_ENTITY) type ZCL_ZGS_ICERP_CASSINT_MPC_EXT=>TS_DEEP_CASSINTINQHOMEHEADER .
  methods GET_INQUIRY_DATA_NEW_V3
    importing
      value(SO_INQUIRYID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CREATEDATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CARBRANDID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_SOURCEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_STATUSID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_INQUIRYTYPE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ZONEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_COMPANYCODE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CITYGEOID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSTCOMPANYID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORDERED) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_INQUIRYWAY) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_FOUNDSTATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_ISDELETE) type STRING optional
      value(SO_USERID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_VENNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_TERMINAL) type STRING optional
      value(IV_EXPORT) type STRING optional
      value(IV_ORDERBY) type STRING optional
      value(IV_PAGE) type STRING optional
      value(IV_SIZE) type STRING optional
    exporting
      value(ET_INQUIRY) type TT_INQFILTER
      value(EV_TOTALPAGE) type INT4
      value(EV_TOTALSIZE) type INT4 .
  methods GET_INQUIRY_DATA_NEW
    importing
      value(SO_INQUIRYID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CREATEDATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CARBRANDID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_SOURCEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_STATUSID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_INQUIRYTYPE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ZONEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_COMPANYCODE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CITYGEOID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSTCOMPANYID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORDERED) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_INQUIRYWAY) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_FOUNDSTATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_ISDELETE) type STRING optional
      value(SO_USERID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_VENNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_TERMINAL) type STRING optional
    exporting
      value(ET_INQUIRY) type ZORD_T_INQUIRY_INFO .
  methods CREATE_ORDER_EXCEL
    importing
      !IT_ORDER type ZORD_T_ORD_EXCEL
      !IS_EXCELLIST type ZTINT_EXCEL_LIST .
  methods GET_AS_DATA_NEW_V4
    importing
      value(SO_ORDERID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ZONEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_RTNREASON) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_VENID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_FOLLOWUSER) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_USERIGHT) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_KSYX) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ISAPPEAL) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_STATUS) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ASID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_FOLLOWASID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_TYPE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CHILDTYPE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_NEWTYPE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CREATEDATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ZUPDATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_MANGSTATUS) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_MANAGER) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_COMPLEX) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CARGRADE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_PRODUCTNUM) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_DINGUSERID) type STRING optional
      value(IV_TYPE) type STRING optional
      value(IV_SORTBY) type STRING optional
      value(IV_SORTORDER) type STRING optional
      value(IV_ISACTIVEFOLLOW) type STRING optional
      value(IV_ONLYRIGHT) type STRING optional
      value(IV_EXPORT) type STRING optional
      value(IV_PAGE) type STRING optional
      value(IV_SIZE) type STRING optional
      value(IV_ORDERBY) type STRING optional
    exporting
      value(EV_TOTALPAGE) type INT4
      value(EV_TOTALSIZE) type INT4
      value(EV_TOTALAMOUNT) type ZDE_INTAMOUNT
      value(ET_AFTERSALE) type TT_ASFILTER
      value(ET_ASORDER) type TT_ASORDER
      value(ET_CUSINF) type TT_CUSINF
      value(ET_VENINF) type TT_VENINF .
  methods GET_INQUIRY_DATA_NEW_V4
    importing
      value(SO_INQUIRYID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_PERSONNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ISPROXY) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_LABEL) type /IWBEP/T_MGW_SELECT_OPTION optional
      value(SO_VIN) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CREATEDATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CARBRANDID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_SOURCEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_STATUSID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_INQUIRYTYPE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ZONEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_COMPANYCODE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CITYGEOID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSTCOMPANYID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORDERED) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_INQUIRYWAY) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_FOUNDSTATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_ISDELETE) type STRING optional
      value(SO_USERID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_VENNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_TERMINAL) type STRING optional
      value(IV_EXPORT) type STRING optional
      value(IV_PAGE) type STRING optional
      value(IV_SIZE) type STRING optional
      value(IV_ORDERBY) type STRING optional
      value(IV_USERTYPE) type STRING optional
      value(IV_ISFOLLOWED) type STRING optional
      value(SO_CUSTAGID) type /IWBEP/T_COD_SELECT_OPTIONS optional
    exporting
      value(EV_INQ) type STRING
      value(EV_TOTALPAGE) type INT4
      value(EV_TOTALSIZE) type INT4
      value(ET_INQUIRY) type TT_INQFILTER .
  methods CREATE_INQUIRY_EXCEL
    importing
      !IT_INQUIRY type ZORD_T_INQUIRY_EXCEL
      !IS_EXCELLIST type ZTINT_EXCEL_LIST .
  methods GET_ORDER_DATA_BY_VENDOR
    importing
      value(SO_CUSTCOMPANYNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORIGINALSOURCE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CREATEDATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSTCOMPANYID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_INQUIRYTYPE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_SHOPPINGLISTID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ZONEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CARBRANDID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CITYGEOID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CREATEDNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_PRODUCTSTOREID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_COMPANYCODE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ORDERID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CANCEL_ORDER) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_USERID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_ISDELETE) type STRING optional
      value(SO_ORDERNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_PAYMENTMETHODTYPEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
    returning
      value(ET_VEN_ORDER) type ZORD_T_ORDER_INFO .
  methods GET_ORDERED_INQUIRY
    importing
      value(SO_INQUIRYID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CREATEDATE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_INQUIRYTYPE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ZONEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_COMPANYCODE) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CITYGEOID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSTCOMPANYID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_INQUIRYWAY) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_SOURCEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CARBRANDID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IV_ISDELETE) type STRING optional
    returning
      value(SO_ORDERED) type /IWBEP/T_COD_SELECT_OPTIONS .
  methods SET_INQ_OVERVIEW_NEW_V1
    importing
      value(IT_INQUIRY_TMP) type ZORD_T_INQUIRY_INFO optional
      value(IT_INQUIRY_CUS) type ZORD_T_INQUIRY_INFO optional
      value(IV_ORDERBY) type STRING optional
      value(IV_PAGE) type STRING optional
      value(IV_SIZE) type STRING optional
      value(IV_EXPORT) type STRING optional
      value(IV_ISDELETE) type STRING optional
      value(IS_EXCELLIST) type ZTINT_EXCEL_LIST optional
      value(IV_STATUS) type STRING optional
      value(IV_TERMINAL) type STRING optional
    returning
      value(ER_DEEP_ENTITY) type ZCL_ZGS_ICERP_CASSINT_MPC_EXT=>TS_DEEP_CASSINTINQHOMEHEADER .
  methods SET_INQ_OVERVIEW_NEW_V2
    importing
      value(IT_INQUIRY) type TT_INQFILTER optional
      value(IV_INQ) type STRING optional
      value(IV_ORDERBY) type STRING optional
      value(IV_PAGE) type STRING optional
      value(IV_SIZE) type STRING optional
      value(IV_EXPORT) type STRING optional
      value(IV_ISDELETE) type STRING optional
      value(IS_EXCELLIST) type ZTINT_EXCEL_LIST optional
      value(IV_TERMINAL) type STRING optional
    returning
      value(ER_DEEP_ENTITY) type ZCL_ZGS_ICERP_CASSINT_MPC_EXT=>TS_DEEP_CASSINTINQHOMEHEADER .
  methods SET_AS_OVERVIEW_NEW_V2
    importing
      value(SO_COMPLEX) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_MANGSTATUS) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_VENID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_ZONEID) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(SO_CUSNAME) type /IWBEP/T_COD_SELECT_OPTIONS optional
      value(IT_AFTERSALE) type TT_ASFILTER optional
      value(IV_SORTORDER) type STRING optional
      value(IV_SORTBY) type STRING optional
      value(IV_ISACTIVEFOLLOW) type STRING optional
      value(IV_PAGE) type STRING optional
      value(IV_SIZE) type STRING optional
      value(IV_TOTAL) type INT4 optional
      value(IV_PAGETOTAL) type INT4 optional
      value(IV_TOTALAMOUNT) type ZDE_INTAMOUNT optional
      value(IV_EXPORT) type STRING optional
      value(IT_CUSINF) type TT_CUSINF optional
      value(IT_VENINF) type TT_VENINF optional
      value(IT_ASORDER) type TT_ASORDER optional
    returning
      value(ER_DEEP_ENTITY) type ZCL_ZGS_ICERP_CASSI_07_MPC_EXT=>TS_DEEP_AFTERSALELISTHEADER .
ENDCLASS.



CLASS ZCL_ICEC_ORDER IMPLEMENTATION.


  METHOD constructor.
    IF iv_userid IS NOT INITIAL.
      mv_userid = iv_userid.
    ENDIF.
    IF iv_username IS NOT INITIAL.
      mv_username = iv_username.
    ENDIF.
  ENDMETHOD.


  METHOD create_inquiry_excel.
***拼接抬头
    DATA:lv_excel_head TYPE string.
    lv_excel_head = |序号| && |{ cl_abap_char_utilities=>horizontal_tab }询价单号| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }单据标签| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }金额| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }类型| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }汽车品牌| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }VIN| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }需求SKU| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }译码SKU| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }报价SKU| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }下单SKU| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }客户名称| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }客户代码| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }客户经理| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }提交时间| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }创建人名称| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }状态| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }找货状态| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }询价来源| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }战区| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }省| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }市| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }区| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }跟进来源| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }跟进类型| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }跟进备注| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }最近跟进人| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }是否代客下单| &&
                    |{ cl_abap_char_utilities=>horizontal_tab }代客下单人|.
    IF it_inquiry IS NOT INITIAL.
      DATA(lo_excel) = NEW zcl_cassint_excel( ).
      DATA(es_return) = lo_excel->upload_excel(
            EXPORTING it_data = it_inquiry
                      iv_header = lv_excel_head
                      iv_noticeid = 'INQUIRYDOWN'
                      is_excellist = is_excellist ).
    ENDIF.
  ENDMETHOD.


  METHOD create_order_excel."创建订单下载模板

******拼接抬头
***    DATA:lv_excel_head TYPE string.
***    lv_excel_head = |序号| && |{ cl_abap_char_utilities=>horizontal_tab }订单编号| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }订单来源| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }订单名称| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }询价单号| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }汽车品牌| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }SKU| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }是否开票| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }客户名称| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }客户代码| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }客户经理| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }战区| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }省| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }市| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }区| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }下单人| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }店铺代码| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }店铺名称| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }拓展经理| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }优惠(￥)| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }订单金额(￥)| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }下单时间| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }状态| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }取消时间| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }取消原因| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }跟进来源| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }跟进类型| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }跟进备注| &&
***                    |{ cl_abap_char_utilities=>horizontal_tab }最近跟进人|.
***    IF it_order IS NOT INITIAL.
***      DATA(lo_excel) = NEW zcl_cassint_excel( ).
***      DATA(es_return) = lo_excel->upload_excel(
***            EXPORTING it_data = it_order
***                      iv_header = lv_excel_head
***                      iv_noticeid = 'ORDERDOWN'
***                      is_excellist = is_excellist ).
***    ENDIF.


    CHECK it_order IS NOT INITIAL.

    DATA:lt_fieldcat TYPE lvc_t_fcat.
    DATA:lt_exceldata TYPE REF TO data.
    FIELD-SYMBOLS:<tab_out> TYPE ANY TABLE.

    CREATE DATA lt_exceldata TYPE zord_t_ord_excel.
    ASSIGN lt_exceldata->* TO <tab_out>.

    DATA(lo_excel) = NEW zcl_cassint_excel( ).

    <tab_out> = CORRESPONDING #( it_order ).

    lt_fieldcat = VALUE #(
        ( fieldname = 'SNO' coltext = '序号' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'ORDERID' coltext = '订单编号' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'OPERATOR' coltext = '代下单人' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'ORDERLABEL' coltext = '单据标签' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'ORIGINALSOURCEDESC' coltext = '订单来源' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'ORDERNAME' coltext = '订单名称' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'WHETHERPRODUCTSET' coltext = '是否套件' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'SHOPPINGLISTID' coltext = '询价单号' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'VHVIN' coltext = 'VIN码' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'CARBRANDNAME' coltext = '汽车品牌' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'NEEDCOUNT' coltext = 'SKU' datatype ='INT4' colddictxt = 'R' )
        ( fieldname = 'INVOICETYPE' coltext = '是否开票' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'CUSTCOMPANYNAME ' coltext = '客户名称' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'COMPANYCODE' coltext = '客户代码' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'CUNAME' coltext = '客户经理' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'ZONENAME' coltext = '网格' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'PROVINCENAME' coltext = '省' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'CITYNAME' coltext = '市' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'COUNTYGEONAME' coltext = '区' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'CUSNAME' coltext = '下单人' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'PRODUCTSTOREID' coltext = '店铺代码' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'PRODUCTSTORENAME' coltext = '店铺名称' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'FULFILLSTOREID' coltext = '服务商代码' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'FULFILLSTORENAME' coltext = '服务商名称' datatype ='STRG' colddictxt = 'L' )"ADD 服务商（履约店铺）
        ( fieldname = 'VUNAME' coltext = '拓展经理' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'CASSDISCOUNTAMOUNT' coltext = '优惠(￥)' datatype ='FLTP' colddictxt = 'R' )
        ( fieldname = 'ACTUALCURRENCYAMOUNT' coltext = '订单金额(￥)' datatype ='FLTP' colddictxt = 'R' )
        ( fieldname = 'ORDERDATE' coltext = '下单时间' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'STATUSIDDESC' coltext = '状态' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'CANCELLEDDATE' coltext = '取消时间' datatype ='STRG' colddictxt = 'L' )
*        ( fieldname = 'CHANGDESC' coltext = '取消原因' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'LASTLEVELREASON' coltext = '一级取消原因' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'CANCELREASON' coltext = '二级取消原因' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'FOLLOWSOURCEDESC' coltext = '跟进来源' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'FOLLOWTYPEDESC' coltext = '跟进类型' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'FOLLOWREMARK' coltext = '跟进备注' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'FOLLOWNAME' coltext = '最近跟进人' datatype ='STRG' colddictxt = 'L' )
        ( fieldname = 'NOTEINFO' coltext = '订单备注' datatype ='STRG' colddictxt = 'L' )  ).

    lo_excel->generate_excel_to_alioss(
      EXPORTING
        data = lt_exceldata
        fieldcat = lt_fieldcat
        is_excellist =  is_excellist
        iv_noticeid = 'ORDERDOWN' ).

  ENDMETHOD.


  METHOD currency_formatter.
    DATA:lv_amount TYPE zde_intamount.
    lv_amount = iv_input.
    ev_output = |￥{ lv_amount NUMBER = USER }|."订单金额
    CLEAR lv_amount.
  ENDMETHOD.


  METHOD filter_order_status.
***今天的单据状态需要从status表中获取，今天以前的状态由后台JOB ZTINT_0037跑了更新到ORDER_H表中    ***
    SELECT
         a~orderid,
         a~guid,
         a~statusid,
         a~statusiddesc,
         a~lastupdatedstamp,
         a~statusdate,
         a~statustime ,
         a~changdesc,
         b~zno
      FROM zticec_status_i AS a
      INNER JOIN zticec_status_cf AS b ON b~statusid = a~statusid
      INTO CORRESPONDING FIELDS OF TABLE @et_order_status
      WHERE statusdate = @sy-datum
       AND orderid IN @so_orderid.

***取消的单据需要取消原因
    IF it_order IS NOT INITIAL.
      SELECT
           a~orderid,
           a~guid,
           a~statusid,
           a~statusiddesc,
           a~lastupdatedstamp,
           a~statusdate,
           a~statustime ,
           a~changdesc,
           b~zno
      FROM zticec_status_i AS a
     INNER JOIN zticec_status_cf AS b ON b~statusid = a~statusid
      APPENDING CORRESPONDING FIELDS OF TABLE  @et_order_status
       FOR ALL ENTRIES IN @it_order
     WHERE a~orderid = @it_order-orderid
       AND a~statusid = 'ORDER_CANCELLED'.
    ENDIF.

    "按订单，时间，序号，结果是同一个时间点的小序号状态是最新的
    SORT et_order_status BY orderid statusdate DESCENDING statustime DESCENDING zno.
    DELETE ADJACENT DUPLICATES FROM et_order_status COMPARING orderid.

    SORT et_order_status BY orderid.

  ENDMETHOD.


  METHOD get_aslabel_product_detail.
    DATA ls_data TYPE ts_product_info.
    DATA lv_orderitemid TYPE string.
    DATA lv_attr TYPE string.
    DATA lv_guaranteedate TYPE sy-datum.
    DATA lv_guaranteetime TYPE sy-uzeit.
    DATA lv_datediff TYPE p.
    DATA lv_timediff TYPE p.
    DATA lv_earliest TYPE c.
    DATA lv_policysdesc TYPE string.
    DATA lv_productspecification TYPE string.
    DATA(lo_merchant) = NEW zcl_icec_merchant_api( ).
    DATA ls_asp TYPE zord_s_od_orderitems_asp.
    DATA(lo_order_api) = NEW zcl_icec_order_api( ).
    "获取订单id、商品id、运单id
    lo_order_api->get_aslabel_linkproduct_info( EXPORTING iv_code = iv_code
                                              IMPORTING es_labelbind = DATA(ls_labelbind)
                                                ev_msg = DATA(ls_msg1) ).
    CHECK ls_msg1-type EQ 'S'.
    CLEAR ls_msg1.
    "订单
    IF ls_labelbind-orderid IS NOT INITIAL.
      lo_order_api->get_order_detail_data( EXPORTING iv_orderid = ls_labelbind-orderid
                                                  iv_showsource = 'PLATFORM'
                                       IMPORTING es_out = DATA(is_detail)
                                                  ev_msg = DATA(ls_msg2)
                                       ).
      CHECK ls_msg2-type EQ 'S'.
      CLEAR ls_msg2.

      ls_data-orderid = is_detail-orderheader-orderid."订单
      timestamp_formatter( EXPORTING iv_timestamp = is_detail-orderheader-orderdate
                              IMPORTING ev_string = ls_data-ordertime  )."下单时间
      IF is_detail-orderheader-buyer-companyid IS NOT INITIAL.
        SELECT SINGLE cusname INTO ls_data-buyerdiaplayname FROM ztint_cus_inf WHERE companyid = is_detail-orderheader-buyer-companyid."客户名称
      ENDIF.
      IF is_detail-orderheader-seller-companystoreid IS NOT INITIAL.

        SELECT SINGLE displayname,companyid,productstoreid INTO @DATA(ls_veninf)
          FROM ztint_ven_inf WHERE productstoreid = @is_detail-orderheader-seller-companystoreid.
        ls_data-saledisplayname = ls_veninf-displayname."商家名称简称
        ls_data-storeid = ls_veninf-productstoreid.
        IF ls_veninf-companyid IS NOT INITIAL.
          lo_merchant->get_ven_detail( EXPORTING iv_companyid = EXACT string( ls_veninf-companyid )
                                           IMPORTING es_veninfo = DATA(ls_veninfo) ).
          ls_data-salercontactnumber = ls_veninfo-contactnumber."联系电话
        ENDIF.
      ENDIF.
      ls_data-buyerreceiver = is_detail-orderpostaladdress-toname."收货人姓名
      ls_data-buyerreceiverphonenumber = is_detail-orderpostaladdress-contactnumber."手机号码

      "商品
      DATA(lt_orderitem) = is_detail-orderitems.
      LOOP AT lt_orderitem INTO DATA(ls_orderitem) WHERE orderitemseqid = ls_labelbind-itemid.
        IF sy-subrc EQ 0.
          ls_data-productname = ls_orderitem-productname."名称
          ls_data-productcount = ls_orderitem-quantity."数量
          ls_data-productcount =  zcl_cassint_formatter=>remove_nodecimal( ls_data-productcount ).
          ls_data-brandname = ls_orderitem-brandname."品牌
*          ls_data-buyeractualamount = nosign_currency_formatter( s_orderitem-orderitempayment-buyeractualprice ).."单价实付金额
          ls_data-buyeractualamount = '***'.
          "规格-商品交易快照-"只取源产地、尺寸、是否带启停
          lv_orderitemid = ls_orderitem-orderitemseqid.
          IF lv_orderitemid IS NOT INITIAL.
            lo_order_api->get_order_snapshot_product( EXPORTING iv_orderid = ls_labelbind-orderid
                                                                iv_orderitemid = lv_orderitemid
                                                      IMPORTING es_productsnapshot = DATA(ls_productsnapshot)
                                                                ev_msg = DATA(ls_msg3) ).
            IF ls_msg3-type EQ 'S' AND ls_productsnapshot-productattributesnapshotdtos IS NOT INITIAL.
              LOOP AT ls_productsnapshot-productattributesnapshotdtos ASSIGNING FIELD-SYMBOL(<fs_attribute>)
                WHERE ( attrname EQ '源产地' OR attrname EQ '尺寸' OR attrname EQ '是否带启停').
                lv_attr = |{ <fs_attribute>-attrname }：{ <fs_attribute>-attrvalue }|.
                lv_productspecification = COND #( WHEN lv_productspecification IS INITIAL THEN |{ lv_attr }|
                                                 ELSE |{ lv_productspecification } { lv_attr }| ).
                CLEAR lv_attr.
              ENDLOOP.
            ENDIF.
          ENDIF.
          ls_data-productspecification = lv_productspecification.
        ENDIF.

        REPLACE  ALL OCCURRENCES OF '\'  IN ls_orderitem-aftersalepolicy  WITH ''.
        CONDENSE ls_orderitem-aftersalepolicy NO-GAPS.
        REPLACE ALL OCCURRENCES OF '"['  IN ls_orderitem-aftersalepolicy  WITH '['.
        REPLACE ALL OCCURRENCES OF ']"'  IN ls_orderitem-aftersalepolicy  WITH ']'.
        /ui2/cl_json=>deserialize(
                EXPORTING
                json = ls_orderitem-aftersalepolicy
                CHANGING
                data = ls_asp  ).
        "政策key值;LongAssurePolicy：超长质保；QualityAssurePolicy：商家质保；CassQualityAssurePolicy：开思质保
        DELETE ls_asp-policys WHERE key NE 'CassQualityAssurePolicy' AND key NE 'QualityAssurePolicy'
        AND key NE 'EchelonQualityAssurePolicy' AND  key NE  'LongAssurePolicy'.
        SELECT * FROM ztint_policys INTO TABLE @DATA(lt_ztint_policys).
        SORT lt_ztint_policys BY policys.
        LOOP AT ls_asp-policys INTO DATA(ls_policys) .
          READ TABLE lt_ztint_policys INTO DATA(ls_ztint_policys) WITH KEY policys = ls_policys-key BINARY SEARCH .
          IF sy-subrc = 0 AND ls_policys-value <> 'false'.
            lv_policysdesc = |{ ls_ztint_policys-policysdesc }{ ls_policys-value }|.
            REPLACE ALL OCCURRENCES OF  'D' IN lv_policysdesc  WITH   '天' .
            REPLACE ALL OCCURRENCES OF  'M' IN lv_policysdesc  WITH   '个月' .
            REPLACE ALL OCCURRENCES OF  'Y' IN lv_policysdesc  WITH   '年' .
            IF ls_policys-key = 'CassQualityAssurePolicy' OR ls_policys-key = 'EchelonQualityAssurePolicy'."开思质保
              ls_data-cassqualityassurepolicy = lv_policysdesc.
            ELSEIF ls_policys-key = 'QualityAssurePolicy'."商家质保
              ls_data-qualityassurepolicy = lv_policysdesc.
            ELSEIF ls_policys-key = 'LongAssurePolicy'."超长质保.
              ls_data-longassurepolicy = lv_policysdesc.
            ENDIF.
            "到期时间
            IF is_detail-orderheader-statusid EQ 'ORDER_COMPLETED'."订单收货前，不用计算质保剩余时长,订单收货后，计算质保剩余时长xx天
              CALL FUNCTION 'Z_FMICCRM_TIMESTAMP_TO_ABAP'
                EXPORTING
                  iv_timestamp = ls_orderitem-guaranteeperiod
                IMPORTING
                  ev_date      = lv_guaranteedate
                  ev_time      = lv_guaranteetime.

              "获取剩余时间
              CALL FUNCTION 'SD_DATETIME_DIFFERENCE'
                EXPORTING
                  date1            = lv_guaranteedate
                  time1            = lv_guaranteetime
                  date2            = sy-datum
                  time2            = sy-uzeit
                IMPORTING
                  datediff         = lv_datediff
                  timediff         = lv_timediff
                  earliest         = lv_earliest
                EXCEPTIONS
                  invalid_datetime = 1
                  OTHERS           = 2.
              ls_data-remainingtime = COND #( WHEN lv_earliest EQ '1' THEN '已过质保期'
                                              WHEN lv_earliest EQ '0' OR ( lv_earliest EQ '2' AND  lv_datediff LT 1  ) THEN '质保时长剩余时长< 1天'
                                              WHEN lv_earliest EQ '2' AND lv_datediff GE 1 THEN |质保时长剩余时长{ lv_datediff }天| ELSE '').
            ELSE.
              ls_data-remainingtime = '质保剩余时长在确认收货后显示'.
            ENDIF.
          ENDIF.
          CLEAR:ls_policys,ls_ztint_policys,lv_policysdesc.
        ENDLOOP.
        "开思质保和超长质保同时存在则显示超长质保
        IF ls_data-cassqualityassurepolicy IS NOT INITIAL AND ls_data-longassurepolicy IS NOT INITIAL.
          CLEAR ls_data-cassqualityassurepolicy.
        ENDIF.
        CLEAR:ls_orderitem,ls_productsnapshot,lv_productspecification.
      ENDLOOP.

      "物流
      lo_order_api->get_order_shipments_data( EXPORTING iv_orderid = ls_labelbind-orderid
                                                        iv_showsource = 'PLATFORM'
                                              IMPORTING et_out = DATA(lt_shipment)
                                                          ev_msg = DATA(ls_msg4) ).
      LOOP AT lt_shipment INTO DATA(ls_shipment) WHERE shipmentid EQ ls_labelbind-waybillid .
        IF sy-subrc EQ 0.
          ls_data-waybillid = ls_shipment-shipmentnum."运单号
          ls_data-logisticscompanyname = ls_shipment-logisticscompany."物流公司
          CLEAR ls_shipment.
        ENDIF.
      ENDLOOP.
      MOVE-CORRESPONDING ls_data TO es_product_detail.
      CLEAR:is_detail,ls_data.
    ENDIF.

  ENDMETHOD.


  METHOD get_as_data_new_v4.
    DATA :lv_username TYPE text100.
    DATA: lv_type_cus TYPE zde_intrepdatatype.
    DATA: lv_type_ven TYPE zde_intrepdatatype.
    DATA: lt_userlist TYPE STANDARD TABLE OF ztint_user_inf.
    TYPES:BEGIN OF ty_infuser,
            asid                  TYPE zticec_af_inf-asid,
            woid                  TYPE zticec_af_inf-woid,
            createdstampstr       TYPE zticec_af_inf-createdstampstr,
            lastupdatedtxstampstr TYPE zticec_af_inf-lastupdatedtxstampstr,
            newtype               TYPE zticec_af_inf-newtype,
            righttype             TYPE zticec_af_inf-righttype,
            type                  TYPE zticec_af_inf-type,
            childtype             TYPE zticec_af_inf-childtype,
            reasondesc            TYPE zticec_af_inf-reasondesc,
            returnamount          TYPE zticec_af_inf-returnamount,
            actualreturnamount    TYPE zticec_af_inf-actualreturnamount,
            statusid              TYPE zticec_af_inf-statusid,
            createdate            TYPE zticec_af_inf-createdate,
            createtime            TYPE zticec_af_inf-createtime,
            asrepaircompanyid     TYPE zticec_af_user-asrepaircompanyid,
            asrepaircompanyname   TYPE zticec_af_user-asrepaircompanyname,
            assupplierstoreid     TYPE zticec_af_user-assupplierstoreid,
            assupplierstorename   TYPE zticec_af_user-assupplierstorename,
            sellerstoreid         TYPE zticec_af_user-sellerstoreid, "服务商
            sellerstorename       TYPE zticec_af_user-sellerstorename,
            asrepairusername      TYPE zticec_af_user-asrepairusername,
            mangstatus            TYPE string,
            orderid               TYPE zticec_af_order-orderid,
            carbrandname          TYPE zticec_af_order-productbrandname,
            productname           TYPE zticec_af_order-productname,
            productnum            TYPE zticec_af_order-productnum,
            quantity              TYPE zticec_af_order-quantity,
            ksbsorder             TYPE zticec_order_h-ksbsorder,
            venid                 TYPE ztint_ven_inf-venid,
            cusid                 TYPE ztint_cus_inf-cusid,
            zoneid                TYPE ztint_cus_inf-zoneid,
            provincegeoname       TYPE ztint_cus_inf-provincegeoname,
            citygeoname           TYPE ztint_cus_inf-citygeoname,
            companycode           TYPE ztint_cus_inf-companycode,
          END OF ty_infuser.
    DATA:lt_zticec_af_infuser TYPE STANDARD TABLE OF ty_infuser.
    DATA:so_carbrandid_all TYPE /iwbep/t_cod_select_options.
    "A59整理查询条件
    IF so_isappeal[] IS NOT INITIAL.
      READ TABLE so_isappeal INTO DATA(ls_isappeal) INDEX 1.
      IF sy-subrc = 0.
        IF ls_isappeal-low = 'N'.
          DATA(lv_where) = |inf~ISAPPEAL = ''|.
        ELSEIF ls_isappeal-low = 'Y' OR  ls_isappeal-low = 'X'.
          lv_where = |inf~ISAPPEAL = 'X'|.
        ENDIF.
      ENDIF.
    ENDIF.

    IF so_cargrade IS NOT INITIAL.
      SELECT 'I' AS sign,'EQ' AS option,carbrandid AS low
      INTO CORRESPONDING FIELDS OF TABLE @so_carbrandid_all
      FROM ztint_car_class
      WHERE cargrade IN @so_cargrade.

      CHECK so_carbrandid_all IS NOT INITIAL.
    ENDIF.

    "PC端使用权益
    IF so_useright IS NOT INITIAL.
      READ TABLE so_useright INTO DATA(ls_useright) INDEX 1.
      IF sy-subrc = 0.
        IF ls_useright-low = 'N'."筛选没有使用权益的工单
          DATA(lv_where1) = |inf~RIGHTTYPE = ''|.

        ELSEIF ls_useright-low <> 'All'.
          lv_where1 = |inf~RIGHTTYPE = '{ ls_useright-low }'|.
        ENDIF.
      ENDIF.
    ENDIF.

    "APP端仅看权益
    IF iv_onlyright = 'X'.
      lv_where1 = |inf~RIGHTTYPE <> ''|.
    ENDIF.

    "查询状态处理
    IF so_status[] IS NOT INITIAL.
      SORT so_status BY low.
      READ TABLE so_status INTO DATA(ls_status) WITH KEY low = 'All' BINARY SEARCH.
      IF sy-subrc <> 0.

        DATA(so_status_temp) = so_status.
        CLEAR:so_status[].

        "查询全部已关闭的单据
        IF iv_type = 'All' OR iv_type = ''.
          SELECT 'I' AS sign, 'EQ' AS option, status AS low FROM ztint_rtn_status
          INTO TABLE @so_status
          WHERE afstatus IN @so_status_temp.
          "查询售后申请中已关闭的单据
        ELSE.
          SELECT 'I' AS sign, 'EQ' AS option, status AS low FROM ztint_rtn_status
          INTO TABLE @so_status
          WHERE type IN @so_type
          AND afstatus IN @so_status_temp.
        ENDIF.

      ELSE.
        CLEAR:so_status[].
      ENDIF.
    ENDIF.

    iv_dinguserid = iv_dinguserid.
    CHECK iv_dinguserid IS NOT INITIAL.

    SELECT SINGLE userid,username INTO @DATA(ls_ztint_user_inf)
          FROM ztint_user_inf
          WHERE dinguserid = @iv_dinguserid
          AND isstill = 'X'.
    DATA(lv_userid) =  ls_ztint_user_inf-userid.
    lv_username = ls_ztint_user_inf-username.

    CHECK lv_userid IS NOT INITIAL.
* 市场拓展
    CALL FUNCTION 'Z_FMINT_GET_AUTH_DATA'
      EXPORTING
        im_id       = 'X10101' "
        im_userid   = lv_userid
      IMPORTING
        om_type     = lv_type_cus
      TABLES
        ot_userlist = lt_userlist.

    IF  lv_type_cus = 3.
      SELECT * FROM ztint_user_inf INTO TABLE  lt_userlist
      WHERE userid = lv_userid.
    ENDIF.

    IF so_manager IS NOT INITIAL.
      SELECT 'I' AS sign,'EQ' AS option,cusid AS low
      APPENDING CORRESPONDING FIELDS OF TABLE @so_cusid
      FROM ztint_cus_user AS u INNER JOIN ztint_user_inf AS i
      ON u~userid = i~userid
      WHERE u~isdelete = '' AND u~ispre = '' AND u~usertype = '1'
      AND i~dinguserid IN @so_manager AND i~isstill = 'X'.
    ENDIF.

    IF lv_type_cus = 2 OR lv_type_cus = 3.
      IF lt_userlist IS NOT INITIAL.
* 筛选我及我下属所负责的客户
        SELECT cusid FROM ztint_cus_user INTO TABLE @DATA(lt_ztint_cus_user)
              FOR ALL ENTRIES IN @lt_userlist
              WHERE userid = @lt_userlist-userid
              AND ( usertype = '1' OR usertype = '2' )
              AND isdelete = ''
              AND cusid IN @so_cusid.

        SORT lt_ztint_cus_user BY cusid.
        DELETE ADJACENT DUPLICATES FROM lt_ztint_cus_user COMPARING cusid.
        IF lt_ztint_cus_user IS NOT INITIAL.

          SELECT * FROM ztint_cus_inf INTO TABLE @DATA(lt_ztint_cus_inf)
                FOR ALL ENTRIES IN  @lt_ztint_cus_user
                WHERE cusid =  @lt_ztint_cus_user-cusid
                AND status = '3'
                AND isvirtual = ''
                AND zoneid IN @so_zoneid
                AND ( cusname IN @so_cusname OR companycode IN @so_cusname ).

        ENDIF.
      ENDIF.
    ELSE.

      SELECT * FROM ztint_cus_inf INTO TABLE @lt_ztint_cus_inf
      WHERE cusid IN  @so_cusid
      AND zoneid IN @so_zoneid
      AND ( cusname IN @so_cusname OR companycode IN @so_cusname ).

    ENDIF.


*供应商管理
    CLEAR:lv_type_ven,lt_userlist.
    CALL FUNCTION 'Z_FMINT_GET_AUTH_DATA'
      EXPORTING
        im_id       = 'X11101' "
        im_userid   = lv_userid
      IMPORTING
        om_type     = lv_type_ven
      TABLES
        ot_userlist = lt_userlist.

    IF  lv_type_ven = 3.
      SELECT * FROM ztint_user_inf INTO TABLE  lt_userlist
      WHERE userid = lv_userid.
    ENDIF.

    IF lv_type_ven = 2 OR lv_type_ven = 3.
      IF lt_userlist IS NOT INITIAL.
* 筛选我及我下属所负责的供应商
        SELECT venid FROM ztint_ven_user INTO TABLE @DATA(lt_ztint_ven_user)
              FOR ALL ENTRIES IN @lt_userlist
              WHERE userid = @lt_userlist-userid
*\            AND usertype = '1'
              AND usertype IN ('1','2') "店铺负责人协同人都可以看
              AND isdelete = ''.

        SORT lt_ztint_ven_user BY venid.
        DELETE ADJACENT DUPLICATES FROM lt_ztint_ven_user COMPARING  venid.
        IF lt_ztint_ven_user IS NOT INITIAL.
          SELECT * FROM ztint_ven_inf INTO TABLE @DATA(lt_ztint_ven_inf)
                FOR ALL ENTRIES IN @lt_ztint_ven_user
                WHERE venid = @lt_ztint_ven_user-venid
                AND ( productstoreid IN @so_venid
                OR venname IN @so_venid
                OR displayname IN @so_venid ).
        ENDIF.
      ENDIF.
    ELSE.
      SELECT * FROM ztint_ven_inf INTO TABLE @lt_ztint_ven_inf
      WHERE productstoreid IN @so_venid
      OR venname IN @so_venid
      OR displayname IN @so_venid .
    ENDIF.
*****
    DATA:lr_asid TYPE RANGE OF zticec_af_user-asid.
    IF so_orderid IS NOT INITIAL OR so_productnum IS NOT INITIAL.
      SELECT 'I' AS sign,'EQ' AS option, asid AS low
      FROM zticec_af_order
      INTO CORRESPONDING FIELDS OF TABLE @lr_asid
      WHERE orderid IN @so_orderid
      AND ( productnum IN @so_productnum
      OR productname IN @so_productnum ).
    ENDIF.
    "ADD 是否客服主动跟进
    IF iv_isactivefollow = 'X'.
      SELECT DISTINCT  'I' AS sign,'EQ' AS option, billno AS low
      FROM ztint_follow_inf
      INTO CORRESPONDING FIELDS OF TABLE @so_followasid
      WHERE followsource EQ '1'
      AND ( billtype EQ 'AS' AND dinguserid IN @so_followuser ).
      CHECK so_followasid IS NOT INITIAL.
    ELSE.
      IF so_followuser IS NOT INITIAL.
        SELECT DISTINCT  'I' AS sign,'EQ' AS option, billno AS low
        FROM ztint_follow_inf
        INTO CORRESPONDING FIELDS OF TABLE @so_followasid
        WHERE billtype EQ 'AS' AND dinguserid IN @so_followuser.
        CHECK so_followasid IS NOT INITIAL.
      ENDIF.
    ENDIF.
****暂时排除批量退货订单
    IF so_type IS INITIAL.
      so_type = VALUE #( BASE so_type ( sign = 'I' option = 'NE' low = 'batchAftersale' ) ).
    ENDIF.
* 获取客户售后申诉单
    TRY.
        IF lv_type_cus = 2 OR lv_type_cus = 3 OR ( ( lv_type_cus = 1 OR lv_type_cus = 4 ) AND ( so_cusname IS NOT INITIAL
        OR so_cusid IS NOT INITIAL OR so_zoneid IS NOT INITIAL ) ).
          IF lt_ztint_cus_inf IS NOT INITIAL.

            SELECT inf~asid,inf~woid,inf~createdstampstr,inf~lastupdatedtxstampstr,inf~newtype,inf~righttype,inf~type,
            inf~childtype,inf~reasondesc,inf~returnamount,inf~actualreturnamount,inf~statusid,inf~createdate,inf~createtime,
            u~asrepaircompanyid,u~asrepaircompanyname,u~assupplierstoreid,u~assupplierstorename,u~sellerstorename,u~asrepairusername
            FROM zticec_af_inf AS inf INNER JOIN zticec_af_user AS u
            ON inf~asid = u~asid
            INTO CORRESPONDING FIELDS OF TABLE @lt_zticec_af_infuser
            FOR ALL ENTRIES IN @lt_ztint_cus_inf
            WHERE u~asrepaircompanyid = @lt_ztint_cus_inf-companyid
            AND inf~asid IN @so_asid
            AND inf~asid IN @so_followasid
            AND inf~asid IN @lr_asid
            AND inf~reasonid IN @so_rtnreason"退货原因筛选
            AND inf~statusid IN @so_status"状态筛选
            AND inf~newtype IN @so_type "服务类型筛选
            AND inf~childtype IN @so_childtype "服务类型筛选
            AND (lv_where)
            AND (lv_where1)
            AND inf~createdate IN @so_createdate"申请时间筛选
            AND inf~lastupdatedtxstampstr IN @so_zupdate"更新时间筛选
            AND ( u~assupplierstoreid IN @so_venid "店铺筛选
            OR u~assupplierstorename IN @so_venid
            OR u~sellerstoreid IN @so_venid
            OR u~sellerstorename IN @so_venid
            )."店铺筛选
          ENDIF.
        ELSEIF lv_type_cus = 1 OR lv_type_cus EQ 4.
          "查询所有售后申诉单
          SELECT inf~asid,inf~woid,inf~createdstampstr,inf~lastupdatedtxstampstr,inf~newtype,inf~righttype,inf~type,
          inf~childtype,inf~reasondesc,inf~returnamount,inf~actualreturnamount,inf~statusid,inf~createdate,inf~createtime,
          u~asrepaircompanyid,u~asrepaircompanyname,u~assupplierstoreid,u~assupplierstorename,u~sellerstorename,u~asrepairusername
          FROM zticec_af_inf AS inf INNER JOIN zticec_af_user AS u
          ON inf~asid = u~asid
          INTO CORRESPONDING FIELDS OF TABLE @lt_zticec_af_infuser
          WHERE inf~asid IN @so_asid
          AND inf~asid IN @so_followasid
          AND inf~asid IN @lr_asid
          AND inf~reasonid IN @so_rtnreason"退货原因筛选
          AND inf~statusid IN @so_status"状态筛选
          AND inf~newtype IN @so_type "服务类型筛选
          AND inf~childtype IN @so_childtype "服务类型筛选
          AND (lv_where)
          AND (lv_where1)
          AND inf~createdate IN @so_createdate"申请时间筛选
          AND inf~lastupdatedtxstampstr IN @so_zupdate"更新时间筛选
          AND ( u~assupplierstoreid IN @so_venid"店铺筛选
          OR u~assupplierstorename IN @so_venid
          OR u~sellerstoreid IN @so_venid
          OR u~sellerstorename IN @so_venid )."店铺筛选
        ENDIF.

*获取供应商售后申诉单
        IF  so_cusid IS INITIAL.
          IF lv_type_ven = 2 OR lv_type_ven = 3 OR ( lv_type_ven = 1 AND so_venid IS NOT INITIAL ).
            IF lt_ztint_ven_inf IS NOT INITIAL.
              SELECT inf~asid,inf~woid,inf~createdstampstr,inf~lastupdatedtxstampstr,inf~newtype,inf~righttype,inf~type,
              inf~childtype,inf~reasondesc,inf~returnamount,inf~actualreturnamount,inf~statusid,inf~createdate,inf~createtime,
              u~asrepaircompanyid,u~asrepaircompanyname,u~assupplierstoreid,u~assupplierstorename,u~sellerstorename,u~asrepairusername
              FROM zticec_af_inf AS inf INNER JOIN zticec_af_user AS u
              ON inf~asid = u~asid
              APPENDING CORRESPONDING FIELDS OF TABLE @lt_zticec_af_infuser
              FOR ALL ENTRIES IN @lt_ztint_ven_inf
              WHERE u~assupplierstoreid = @lt_ztint_ven_inf-productstoreid
              AND inf~asid IN @so_asid
              AND inf~asid IN @so_followasid
              AND inf~asid IN @lr_asid
              AND inf~reasonid IN @so_rtnreason"退货原因筛选
              AND inf~statusid IN @so_status"状态筛选
              AND inf~newtype IN @so_type "服务类型筛选
              AND inf~childtype IN @so_childtype "服务类型筛选
              AND (lv_where)
              AND (lv_where1)
              AND inf~lastupdatedtxstampstr IN @so_zupdate"更新时间筛选
              AND inf~createdate IN @so_createdate."申请时间筛选
            ENDIF.
          ELSEIF lv_type_ven = 1.
            IF lv_type_cus NE 1 AND lv_type_cus NE 4. "如果客户权限为1、4的就不用再取一遍
              SELECT inf~asid,inf~woid,inf~createdstampstr,inf~lastupdatedtxstampstr,inf~newtype,inf~righttype,inf~type,
              inf~childtype,inf~reasondesc,inf~returnamount,inf~actualreturnamount,inf~statusid,inf~createdate,inf~createtime,
              u~asrepaircompanyid,u~asrepaircompanyname,u~assupplierstoreid,u~assupplierstorename,u~sellerstorename,u~asrepairusername
              FROM zticec_af_inf AS inf INNER JOIN zticec_af_user AS u
              ON inf~asid = u~asid
              APPENDING CORRESPONDING FIELDS OF TABLE @lt_zticec_af_infuser
              WHERE inf~asid IN @so_asid
              AND inf~asid IN @so_followasid
              AND inf~asid IN @lr_asid
              AND inf~reasonid IN @so_rtnreason"退货原因筛选
              AND inf~statusid IN @so_status"状态筛选
              AND inf~newtype IN @so_type "服务类型筛选
              AND inf~childtype IN @so_childtype "服务类型筛选
              AND (lv_where)
              AND (lv_where1)
              AND inf~lastupdatedtxstampstr IN @so_zupdate"更新时间筛选
              AND inf~createdate IN @so_createdate."申请时间筛选
            ENDIF.
          ENDIF.
        ENDIF.
      CATCH cx_sy_open_sql_db.
    ENDTRY.
    SORT lt_zticec_af_infuser BY asid.
    DELETE ADJACENT DUPLICATES FROM lt_zticec_af_infuser COMPARING asid.

    IF lt_zticec_af_infuser IS NOT INITIAL.

      SELECT a~asid,a~orderid,a~orderitemseqid,a~productid,a~productname,a~quantity,a~meins,a~productbrandid,
      a~productbrandname,a~productnum,a~goldcount,a~waers,a~goldprice,a~unitprice,a~actualprice,a~quality,
      a~qualityname,h~ksbsorder FROM zticec_af_order AS a
      INNER JOIN zticec_order_h AS h ON a~orderid = h~orderid
      INTO TABLE @DATA(lt_zticec_af_order)
            FOR ALL ENTRIES IN @lt_zticec_af_infuser
            WHERE asid = @lt_zticec_af_infuser-asid"配件表
            AND a~orderid IN @so_orderid
            AND ksbsorder IN @so_ksyx
            AND h~carbrandid IN @so_carbrandid_all
            AND ( productnum IN @so_productnum
            OR productname IN @so_productnum ).


    ENDIF.

    DATA:ls_ztint_cus_inf TYPE ztint_cus_inf,
         ls_ztint_ven_inf TYPE ztint_ven_inf.
    TYPES:BEGIN OF ty_venoff_status,
            productstoreid TYPE ztint_ven_offhea-productstoreid,
            offstatus      TYPE ztint_ven_offhea-offstatus,
          END OF ty_venoff_status.
    DATA:lt_venoff_status TYPE STANDARD TABLE OF ty_venoff_status,
         ls_venoff_status TYPE ty_venoff_status.
    DATA: lv_from TYPE int4,
          lv_to   TYPE int4.
    DATA: lv_mod TYPE   int4.

    IF  lt_zticec_af_infuser[] IS NOT INITIAL.

      CLEAR:lt_ztint_cus_inf,lt_ztint_ven_inf.
      SELECT * FROM ztint_cus_inf INTO TABLE lt_ztint_cus_inf
      FOR ALL ENTRIES IN  lt_zticec_af_infuser
      WHERE companyid = lt_zticec_af_infuser-asrepaircompanyid.

      SELECT * FROM ztint_ven_inf INTO TABLE lt_ztint_ven_inf
      FOR ALL ENTRIES IN  lt_zticec_af_infuser
      WHERE productstoreid = lt_zticec_af_infuser-assupplierstoreid.

      SORT lt_zticec_af_infuser BY createdate DESCENDING createtime DESCENDING.
      SORT lt_ztint_cus_inf BY companyid.
      SORT lt_ztint_ven_inf BY productstoreid.
      DELETE ADJACENT DUPLICATES FROM lt_ztint_cus_inf COMPARING companyid.
      DELETE ADJACENT DUPLICATES FROM lt_ztint_ven_inf COMPARING productstoreid.
      SORT lt_zticec_af_order BY asid orderid orderitemseqid.
      DELETE ADJACENT DUPLICATES FROM lt_zticec_af_order COMPARING asid orderid orderitemseqid.

      IF iv_sortby EQ 'Createtimetx'.
        IF iv_sortorder EQ 'ASC'.
          SORT  lt_zticec_af_infuser  BY createdstampstr  ASCENDING.
        ELSE.
          SORT  lt_zticec_af_infuser  BY createdstampstr DESCENDING .
        ENDIF.
      ELSE.
        IF iv_sortorder EQ 'ASC'.
          SORT  lt_zticec_af_infuser BY lastupdatedtxstampstr ASCENDING .
        ELSE.
          SORT  lt_zticec_af_infuser BY lastupdatedtxstampstr DESCENDING .
        ENDIF.
      ENDIF.
*  店铺经营状态
      SELECT productstoreid offstatus INTO CORRESPONDING FIELDS OF TABLE lt_venoff_status FROM ztint_ven_offhea
      FOR ALL ENTRIES IN lt_zticec_af_infuser
      WHERE productstoreid = lt_zticec_af_infuser-assupplierstoreid.
      SORT lt_venoff_status BY productstoreid.
      DELETE ADJACENT DUPLICATES FROM lt_venoff_status COMPARING productstoreid.

      LOOP AT lt_zticec_af_infuser ASSIGNING FIELD-SYMBOL(<fs_infuser>).
        DATA(l_tabix) = sy-tabix.
*****涉及到客户的相关查询条件的，删除不符合条件记录
        CLEAR:ls_ztint_cus_inf.
        READ TABLE lt_ztint_cus_inf INTO ls_ztint_cus_inf WITH KEY companyid  = <fs_infuser>-asrepaircompanyid BINARY SEARCH.
        IF sy-subrc NE 0 AND ( so_cusname IS NOT INITIAL OR so_zoneid IS NOT INITIAL ).
          DELETE lt_zticec_af_infuser INDEX l_tabix.
          CONTINUE.
        ELSEIF sy-subrc EQ 0 AND
          ( ( so_cusname IS NOT INITIAL AND ls_ztint_cus_inf-companycode NOT IN so_cusname AND ls_ztint_cus_inf-cusname NOT IN so_cusname ) OR
          ( so_zoneid IS NOT INITIAL AND ls_ztint_cus_inf-zoneid NOT IN so_zoneid ) ).
          DELETE lt_zticec_af_infuser INDEX l_tabix.
          CONTINUE.
         ELSE.
           <fs_infuser>-cusid = ls_ztint_cus_inf-cusid.
           <fs_infuser>-zoneid = ls_ztint_cus_inf-zoneid.
           <fs_infuser>-provincegeoname = ls_ztint_cus_inf-provincegeoname.
           <fs_infuser>-citygeoname = ls_ztint_cus_inf-citygeoname.
           <fs_infuser>-companycode = ls_ztint_cus_inf-companycode.
        ENDIF.
*****涉及到供应商的相关查询条件的，删除不符合条件记录
        CLEAR ls_ztint_ven_inf.
        READ TABLE lt_ztint_ven_inf INTO ls_ztint_ven_inf WITH KEY productstoreid = <fs_infuser>-assupplierstoreid BINARY SEARCH.
        IF sy-subrc NE 0 AND so_venid IS NOT INITIAL.
          DELETE lt_zticec_af_infuser INDEX l_tabix.
          CONTINUE.
        ELSE.
          <fs_infuser>-venid = ls_ztint_ven_inf-venid.
        ENDIF.

*****如果查询配件条件不为空，删除不符合条件记录
        READ TABLE lt_zticec_af_order INTO DATA(ls_zticec_af_order) WITH KEY asid  = <fs_infuser>-asid BINARY SEARCH.
        IF sy-subrc NE 0."so_productnum IS NOT INITIAL AND
          DELETE lt_zticec_af_infuser INDEX l_tabix.
          CONTINUE.
        ELSE.
          <fs_infuser>-orderid = ls_zticec_af_order-orderid.
          <fs_infuser>-carbrandname = ls_zticec_af_order-productbrandname.
          <fs_infuser>-productname = ls_zticec_af_order-productname.
          <fs_infuser>-productnum = ls_zticec_af_order-productnum.
          <fs_infuser>-quantity = ls_zticec_af_order-quantity.
          <fs_infuser>-ksbsorder = ls_zticec_af_order-ksbsorder.
        ENDIF.

****** 店铺经营状态
        CLEAR:ls_venoff_status.
        READ TABLE lt_venoff_status INTO ls_venoff_status WITH KEY productstoreid = <fs_infuser>-assupplierstoreid BINARY SEARCH.
        <fs_infuser>-mangstatus = COND #( WHEN ls_venoff_status-offstatus EQ '7' THEN '1'
        WHEN ls_venoff_status-offstatus  EQ '8' THEN '2'
        ELSE '3').
        IF <fs_infuser>-mangstatus NOT IN so_mangstatus AND so_mangstatus IS NOT INITIAL.
          DELETE lt_zticec_af_infuser INDEX l_tabix.
          CONTINUE.
        ENDIF.

        IF so_complex IS NOT INITIAL AND <fs_infuser>-asrepaircompanyname NOT IN so_complex
        AND ls_ztint_cus_inf-companycode NOT IN so_complex
        AND ls_zticec_af_order-orderid NOT IN so_complex
        AND <fs_infuser>-asid NOT IN so_complex."符合条件筛选
          DELETE lt_zticec_af_infuser INDEX l_tabix.
          CONTINUE .
        ENDIF.

        ev_totalamount =  ev_totalamount +  <fs_infuser>-returnamount .
        CLEAR:ls_ztint_cus_inf,ls_ztint_ven_inf,ls_zticec_af_order,ls_venoff_status.
      ENDLOOP.

    IF iv_export = 'X'.
      APPEND LINES OF lt_zticec_af_infuser TO et_aftersale.
    ELSE.
      "分页
      IF iv_page IS INITIAL . "没有这显示第一页
        iv_page = 1.
      ENDIF.

      IF iv_size IS INITIAL. "没有则默认50条
        iv_size = 20.
      ENDIF.

      ev_totalsize = lines( lt_zticec_af_infuser ). "总条数
      lv_mod = ev_totalsize MOD iv_size.
      ev_totalpage = ev_totalsize DIV iv_size. "总页数
      IF lv_mod NE 0.
        ev_totalpage = ev_totalpage + 1.
      ENDIF.

      IF iv_page > ev_totalpage. "当前页数不能大于总页数
        RETURN.
      ENDIF.

      lv_from = ( iv_page - 1 ) * iv_size + 1."条数开始
      lv_to = iv_page * iv_size."条数结束

      APPEND LINES OF lt_zticec_af_infuser FROM lv_from TO lv_to TO et_aftersale.
    ENDIF.
    ENDIF.

*    et_aftersale  = CORRESPONDING #( lt_zticec_af_infuser ).
    et_asorder        = CORRESPONDING #( lt_zticec_af_order ).
    et_cusinf         = CORRESPONDING #( lt_ztint_cus_inf ).
    et_veninf         = CORRESPONDING #( lt_ztint_ven_inf ).

  ENDMETHOD.


  METHOD get_as_overview_new_v2.

    get_as_data_new_v4(
    EXPORTING
      so_orderid    = so_orderid
      so_zoneid     = so_zoneid
      so_cusname    = so_cusname
      so_rtnreason  = so_rtnreason
      so_venid      = so_venid
      so_followuser = so_followuser
      so_useright   = so_useright
      so_ksyx       = so_ksyx
      so_isappeal   = so_isappeal
      so_cusid      = so_cusid
      so_status     = so_status
      so_asid       = so_asid
      so_followasid = so_followasid
      so_type       = so_type
      so_childtype  = so_childtype
      so_newtype    = so_newtype
      so_createdate = so_createdate
      so_zupdate    = so_zupdate
      so_mangstatus = so_mangstatus
      so_manager    = so_manager
      so_complex    = so_complex
      so_productnum = so_productnum
      so_cargrade   = so_cargrade
      iv_dinguserid = iv_dinguserid
      iv_type       = iv_type
      iv_sortby     = iv_sortby
      iv_sortorder  = iv_sortorder
      iv_isactivefollow = iv_isactivefollow
      iv_onlyright  = iv_onlyright
      iv_export     = iv_export
      iv_page       = iv_page
      iv_size       = iv_size
    IMPORTING
    ev_totalsize = DATA(lv_totalsize)
    ev_totalpage = DATA(lv_totalpage)
    ev_totalamount = DATA(lv_totalamount)
    et_aftersale  = DATA(lt_aftersale)
    et_asorder        = DATA(lt_asorder)
    et_cusinf         = DATA(lt_cusinf)
    et_veninf         = DATA(lt_veninf)
          ).

    CHECK lt_aftersale IS NOT INITIAL.

*****数据填充
    er_deep_entity = set_as_overview_new_v2(
    EXPORTING
      so_complex        = so_complex
      so_mangstatus     =  so_mangstatus
      so_venid          = so_venid
      so_zoneid         = so_zoneid
      so_cusname        = so_cusname
      it_aftersale = lt_aftersale
      iv_sortorder = iv_sortorder
      iv_sortby = iv_sortby
      iv_isactivefollow =  iv_isactivefollow
      iv_page = iv_page
      iv_size = iv_size
      iv_total = lv_totalsize
      iv_pagetotal = lv_totalpage
      iv_totalamount = lv_totalamount
      iv_export = iv_export
      it_cusinf         = lt_cusinf
      it_veninf         = lt_veninf
      it_asorder        = lt_asorder
      ) .


  ENDMETHOD.


  METHOD get_cancel_order.

    IF so_companycode IS NOT INITIAL OR so_companyid IS NOT INITIAL OR so_companyname IS NOT INITIAL
      OR so_cusid IS NOT INITIAL.
      DATA:lr_cancel_order TYPE /iwbep/t_cod_select_options.
      SELECT DISTINCT 'I' AS sign,'EQ' AS option,v~orderid AS low
          INTO CORRESPONDING FIELDS OF TABLE @so_cancel_order
        FROM zvicec_order AS v INNER JOIN zticec_status_i AS i
        ON i~orderid = v~orderid
       WHERE v~cusid IN @so_cusid
         AND v~companycode IN @so_companycode
         AND v~companyid IN @so_companyid
         AND ( v~companycode IN @so_companyname OR v~cusname IN @so_companyname )
         AND ( i~statusid = 'ORDER_CANCELLED'
         AND i~statusdate IN @so_date )
         AND v~orderid IN @so_orderid..
    ELSE.
      SELECT 'I' AS sign,'EQ' AS option,orderid AS low
       FROM  zticec_status_i
       INTO CORRESPONDING FIELDS OF TABLE @so_cancel_order
      WHERE ( statusid = 'ORDER_CANCELLED'
        AND statusdate IN @so_date )
       AND orderid IN @so_orderid.
    ENDIF.
  ENDMETHOD.


  METHOD get_inquiry_data.
*    DATA:lr_isdelete   TYPE RANGE OF ztint_cus_inf-isdelete,
*         lr_userdelete TYPE RANGE OF ztint_ven_user-isdelete,
*         lr_userpre    TYPE RANGE OF ztint_ven_user-ispre.
*    IF iv_isdelete EQ 'X'.
*      lr_isdelete = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
*      lr_userdelete  = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
*      lr_userpre  = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
*    ELSE.
*      lr_userdelete  = VALUE #( ( sign = 'I' option = 'EQ' low = '' ) ).
*      lr_userpre  = VALUE #( ( sign = 'I' option = 'EQ' low = '' ) ).
*    ENDIF.
*
*    TRY.
*        "IV_TERMINAL是终端来源-PC/PHONE
*        "PC上，客户名称和商家名称是否分开的两个字段，而PHONE上是合在一个字段的，所以查数时需要区分
*        IF mv_type EQ 1 AND so_userid IS INITIAL.
*          IF ( iv_terminal EQ 'PC' AND so_venname IS INITIAL )
*            OR ( iv_terminal EQ 'PHONE' AND so_cusname IS INITIAL ) ."PC+无商家或者PHONE+模糊无值，不需要单独再去查商家的信息了
*
****            SQL_A
*            SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,
*                    a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,
*                    a~quotasku,a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
*                    a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
*               INTO CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inquirycus AS a
*              WHERE ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
*                 AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid AND a~zoneid IN @so_zoneid
*                 AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
*                 AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid
*                 AND a~carbrandid IN @so_carbrandid AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype
*                 AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered AND a~foundstate IN @so_foundstate.
*
*          ELSEIF iv_terminal EQ 'PC' AND so_venname IS NOT INITIAL."PC+有商家，查找符合商家条件的数据
*
****            SQL_B
*            SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,
*                    a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
*                    a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
*                    a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
*              INTO CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inquirycus_c AS a
*             WHERE ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
*               AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid
*               AND ( a~venname IN @so_venname OR a~productstoreid IN @so_venname OR a~vendisplayname IN @so_venname )
*               AND a~zoneid IN @so_zoneid AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
*               AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
*               AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
*               AND a~foundstate IN @so_foundstate.
*            IF sy-subrc NE 0.
*              SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,
*                      a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
*                      a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
*                      a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
*           APPENDING CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inquirycus_q AS a
*               WHERE ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
*                 AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid
*                 AND ( a~venname IN @so_venname OR a~productstoreid IN @so_venname OR a~vendisplayname IN @so_venname )
*                 AND a~zoneid IN @so_zoneid AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
*                 AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
*                 AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
*                 AND a~foundstate IN @so_foundstate.
*            ENDIF.
*
*          ELSE."PHONE+模糊有值， 取两者的和
***            SQL_A+SQL_B
*            SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,
*                   a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
*                   a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
*                   a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
*              INTO CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inquirycus AS a
*             WHERE ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
*                AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid AND a~zoneid IN @so_zoneid
*                AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
*                AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid
*                AND a~carbrandid IN @so_carbrandid AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype
*                AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered AND a~foundstate IN @so_foundstate.
*
*            SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,
*                   a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
*                   a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
*                   a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
*         APPENDING CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inquirycus_c AS a
*            WHERE a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid
*              AND ( a~venname IN @so_cusname OR a~productstoreid IN @so_cusname OR a~vendisplayname IN @so_cusname )
*              AND a~zoneid IN @so_zoneid AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
*              AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
*              AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
*              AND a~foundstate IN @so_foundstate.
*            IF sy-subrc NE 0.
*              SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,
*                      a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
*                      a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
*                      a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
*           APPENDING CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inquirycus_q AS a
*               WHERE  a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid
*                 AND ( a~venname IN @so_cusname OR a~productstoreid IN @so_cusname OR a~vendisplayname IN @so_cusname )
*                 AND a~zoneid IN @so_zoneid AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
*                 AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
*                 AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
*                 AND a~foundstate IN @so_foundstate.
*            ENDIF.
*          ENDIF.
*        ELSE.
*          IF mv_type EQ '2' OR mv_type EQ '3'."2 3权限时获取权限内的 客户经理
*****获取当前钉钉下面的所有人
*            get_person( EXPORTING so_userid = so_userid
*                IMPORTING et_userlist = DATA(lt_userlist) ).
*          ELSE."获取1权限下指定的客户经理
*            IF iv_isdelete NE 'X'.
*              SELECT a~userid,a~username INTO CORRESPONDING FIELDS OF TABLE @lt_userlist
*                FROM ztint_user_inf AS a INNER JOIN ztint_cus_user AS b ON a~userid = b~userid
*                WHERE a~userid IN @so_userid AND b~usertype = '1' AND b~isdelete = ''.
*              CHECK sy-subrc EQ 0.
*            ELSE.
*              SELECT a~userid,a~username INTO CORRESPONDING FIELDS OF TABLE @lt_userlist
*                FROM ztint_user_inf AS a INNER JOIN ztint_cus_user AS b ON a~userid = b~userid
*                WHERE a~userid IN @so_userid AND b~usertype = '1' AND b~ispre = 'X'.
*              CHECK sy-subrc EQ 0.
*            ENDIF.
*          ENDIF.
*
*          IF so_userid IS NOT INITIAL."指定了客户经理，先看PC有无指定商家，然后都需先根据客户经理去查询询价单，
*            IF so_venname IS NOT INITIAL."如果指定的商家，还需要删除不在此商家范围的单--只有PC才会有SO_VENNAME不为空
*              SELECT 'I' AS sign,'EQ' AS option,c~inquiryid AS low INTO CORRESPONDING FIELDS OF TABLE @so_inquiryid
*                FROM zticec_inquiry_c AS c INNER JOIN ztint_ven_inf AS i ON c~productstoreid = i~productstoreid AND c~companyid = i~companyid
*               WHERE i~productstoreid IN @so_venname OR i~venname IN @so_venname OR i~displayname IN @so_venname.
*              SELECT 'I' AS sign,'EQ' AS option,q~inquiryid AS low APPENDING CORRESPONDING FIELDS OF TABLE @so_inquiryid
*                FROM zticec_inquiry_q AS q INNER JOIN ztint_ven_inf AS i ON q~productstoreid = i~productstoreid
*               WHERE i~productstoreid IN @so_venname OR i~venname IN @so_venname OR i~displayname IN @so_venname.
*              SORT so_inquiryid BY low.
*              DELETE ADJACENT DUPLICATES FROM so_inquiryid COMPARING low.
*            ENDIF.
*
****            SQL_C
*            SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,
*                    a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
*                    a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
*                    a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
*               INTO CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inquirycus AS a INNER JOIN ztint_cus_user AS u ON a~cusid = u~cusid
*                FOR ALL ENTRIES IN @lt_userlist
*              WHERE u~userid = @lt_userlist-userid AND u~usertype = '1' AND u~isdelete IN @lr_userdelete AND u~ispre IN @lr_userpre
*                AND a~status = '3' AND a~isvirtual = '' AND ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
*                AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid AND a~zoneid IN @so_zoneid
*                AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
*                AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
*                AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
*                AND a~foundstate IN @so_foundstate.
*
*          ELSE."无指定客户经理
*            IF  ( iv_terminal EQ 'PC' AND so_venname IS INITIAL ) OR  iv_terminal EQ 'PHONE'.
****            SQL_C
*              SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,
*                      a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
*                      a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
*                      a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
*                 INTO CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inquirycus AS a INNER JOIN ztint_cus_user AS u ON a~cusid = u~cusid
*                  FOR ALL ENTRIES IN @lt_userlist
*                WHERE u~userid = @lt_userlist-userid AND u~usertype = '1' AND u~isdelete IN @lr_userdelete AND u~ispre IN @lr_userpre
*                  AND a~status = '3' AND a~isvirtual = '' AND ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
*                  AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid AND a~zoneid IN @so_zoneid
*                  AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
*                  AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
*                  AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
*                  AND a~foundstate IN @so_foundstate.
*
*              IF iv_terminal EQ 'PC' AND so_cusname IS NOT INITIAL.
*                SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,
*                        a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
*                        a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
*                        a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
*              APPENDING CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inquirycus_c AS a INNER JOIN ztint_ven_user AS u ON a~venid = u~venid
*                    FOR ALL ENTRIES IN @lt_userlist
*                  WHERE u~userid = @lt_userlist-userid AND u~usertype = '1' AND u~isdelete IN @lr_userdelete AND u~ispre IN @lr_userpre
*                    AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid
*                    AND ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
*                    AND a~zoneid IN @so_zoneid AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
*                    AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
*                    AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
*                    AND a~foundstate IN @so_foundstate..
*                IF sy-subrc NE 0.
*                  SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,
*                          a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
*                          a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
*                          a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
*               APPENDING CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inquirycus_q AS a INNER JOIN ztint_ven_user AS u ON a~venid = u~venid
*                     FOR ALL ENTRIES IN @lt_userlist
*                   WHERE u~userid = @lt_userlist-userid AND u~usertype = '1' AND u~isdelete IN @lr_userdelete AND u~ispre IN @lr_userpre
*                     AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid
*                     AND ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
*                     AND a~zoneid IN @so_zoneid AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
*                     AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
*                     AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
*                     AND a~foundstate IN @so_foundstate.
*                ENDIF.
*              ELSE.
****            SQL_D
*                SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,
*                        a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
*                        a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
*                        a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
*              APPENDING CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inquirycus_c AS a INNER JOIN ztint_ven_user AS u ON a~venid = u~venid
*                    FOR ALL ENTRIES IN @lt_userlist
*                  WHERE u~userid = @lt_userlist-userid AND u~usertype = '1' AND u~isdelete IN @lr_userdelete AND u~ispre IN @lr_userpre
*                    AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid
*                    AND ( a~venname IN @so_cusname OR a~productstoreid IN @so_cusname OR a~vendisplayname IN @so_cusname )
*                    AND a~zoneid IN @so_zoneid AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
*                    AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
*                    AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
*                    AND a~foundstate IN @so_foundstate..
*                IF sy-subrc NE 0.
*                  SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,
*                          a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
*                          a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
*                          a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
*               APPENDING CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inquirycus_q AS a INNER JOIN ztint_ven_user AS u ON a~venid = u~venid
*                     FOR ALL ENTRIES IN @lt_userlist
*                   WHERE u~userid = @lt_userlist-userid AND u~usertype = '1' AND u~isdelete IN @lr_userdelete AND u~ispre IN @lr_userpre
*                     AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid
*                     AND ( a~venname IN @so_cusname OR a~productstoreid IN @so_cusname OR a~vendisplayname IN @so_cusname )
*                     AND a~zoneid IN @so_zoneid AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
*                     AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
*                     AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
*                     AND a~foundstate IN @so_foundstate.
*                ENDIF.
*              ENDIF.
*            ELSE.
****            SQL_D
*              SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,
*                      a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
*                      a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
*                      a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
*                 INTO CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inquirycus_c AS a INNER JOIN ztint_ven_user AS u ON a~venid = u~venid
*                  FOR ALL ENTRIES IN @lt_userlist
*                WHERE u~userid = @lt_userlist-userid AND u~usertype = '1' AND u~isdelete IN @lr_userdelete AND u~ispre IN @lr_userpre
*                  AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid
*                  AND ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
*                  AND ( a~venname IN @so_venname OR a~productstoreid IN @so_venname OR a~vendisplayname IN @so_venname )
*                  AND a~zoneid IN @so_zoneid AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
*                  AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
*                  AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
*                  AND a~foundstate IN @so_foundstate..
*              IF sy-subrc NE 0.
*                SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,
*                        a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
*                        a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
*                        a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
*             APPENDING CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inquirycus_q AS a INNER JOIN ztint_ven_user AS u ON a~venid = u~venid
*                   FOR ALL ENTRIES IN @lt_userlist
*                 WHERE u~userid = @lt_userlist-userid AND u~usertype = '1' AND u~isdelete IN @lr_userdelete AND u~ispre IN @lr_userpre
*                   AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid
*                   AND ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
*                   AND ( a~venname IN @so_venname OR a~productstoreid IN @so_venname OR a~vendisplayname IN @so_venname )
*                   AND a~zoneid IN @so_zoneid AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
*                   AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
*                   AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
*                   AND a~foundstate IN @so_foundstate.
*              ENDIF.
*            ENDIF.
*          ENDIF.
*
*        ENDIF.
*      CATCH cx_sy_dynamic_osql_semantics  INTO DATA(lo_osql).
*      CATCH cx_sy_open_sql_db INTO DATA(lo_opensql).
** """       SO_ORDERID太大，拆开1W的查
*        mv_redo = COND #( WHEN mv_redo EQ 'X' THEN 'Y' ELSE mv_redo ).
*        CHECK mv_redo IS INITIAL.
*        mv_redo = 'X'.
*
*        DATA:lv_lines    TYPE int4,
*             lv_div      TYPE int4,
*             lv_mod      TYPE int4,
*             lv_times    TYPE int4,
*             lv_from     TYPE int4,
*             lv_to       TYPE int4,
*             so_ordertmp TYPE /iwbep/t_cod_select_options.
*        lv_lines = lines( so_ordered ).
*        CHECK lv_lines > 0.
*        lv_div = lv_lines / 20000.
*        DO lv_div TIMES.
*          IF mv_redo EQ 'Y'.
*            EXIT.
*          ENDIF.
*          lv_from = ( sy-index - 1 ) * 20000 + 1.
*          lv_to = sy-index * 20000.
*          IF lv_to > lv_lines.
*            lv_to = lv_lines.
*          ENDIF.
*          APPEND LINES OF so_ordered FROM lv_from TO lv_to TO so_ordertmp.
*          get_inquiry_data(
*           EXPORTING
*             so_inquiryid = so_inquiryid
*             so_cusname = so_cusname
*             so_venname = so_venname
*             so_createdate = so_createdate
*             so_statusid = so_statusid
*             so_carbrandid = so_carbrandid
*             so_sourceid = so_sourceid
*             so_inquirytype = so_inquirytype
*             so_zoneid = so_zoneid
*             so_companycode = so_companycode
*             so_userid = so_userid
*             so_citygeoid = so_citygeoid
*             so_custcompanyid = so_custcompanyid
*             so_inquiryway = so_inquiryway
*             so_ordered  = so_ordertmp
*             so_foundstate = so_foundstate
*             iv_isdelete = iv_isdelete
*             iv_terminal = iv_terminal
*             IMPORTING
*               et_inquiry = DATA(lt_inquiry) ).
*          APPEND LINES OF lt_inquiry TO et_inquiry.
*          CLEAR:lt_inquiry,lv_from,lv_to,so_ordertmp.
*        ENDDO.
*    ENDTRY.
*
*
  ENDMETHOD.


  METHOD get_inquiry_data_by_customer.
    CASE mv_type.
      WHEN 1.
        IF iv_isdelete NE 'X'.
          IF ( so_cusname IS NOT INITIAL OR so_companycode IS NOT INITIAL
            OR so_citygeoid IS NOT INITIAL OR so_zoneid IS NOT INITIAL
            OR so_custcompanyid IS NOT INITIAL ) AND so_userid IS INITIAL.
            SELECT cusid
              INTO TABLE @DATA(lt_cusid)
             FROM ztint_cus_inf
            WHERE  companyid IN @so_custcompanyid
              AND ( cusname IN @so_cusname
               OR companycode IN @so_cusname )
              AND companycode IN @so_companycode
              AND zoneid IN @so_zoneid
              AND ( provincegeoid IN @so_citygeoid
               OR citygeoid IN @so_citygeoid ).
            CHECK sy-subrc EQ 0.
          ELSEIF so_userid IS NOT INITIAL.
            SELECT cusid
              INTO CORRESPONDING FIELDS OF TABLE @lt_cusid
              FROM ztint_cus_user
             WHERE userid IN @so_userid
               AND usertype = '1'
               AND isdelete = ''.
            CHECK sy-subrc EQ 0.
          ENDIF.
        ELSE.

          IF ( so_cusname IS NOT INITIAL OR so_companycode IS NOT INITIAL
            OR so_citygeoid IS NOT INITIAL OR so_zoneid IS NOT INITIAL
            OR so_custcompanyid IS NOT INITIAL ) AND so_userid IS INITIAL.
            SELECT cusid INTO TABLE @lt_cusid
             FROM ztint_cus_inf
             WHERE  companyid IN @so_custcompanyid
              AND isdelete = 'X'
              AND ( cusname IN @so_cusname
              OR companycode IN @so_cusname )
              AND companycode IN @so_companycode
              AND zoneid IN @so_zoneid
              AND ( provincegeoid IN @so_citygeoid
               OR citygeoid IN @so_citygeoid ).
            CHECK sy-subrc EQ 0.
          ELSEIF so_userid IS NOT INITIAL.
            SELECT cusid
              INTO CORRESPONDING FIELDS OF TABLE @lt_cusid
              FROM ztint_cus_user
             WHERE userid IN @so_userid
               AND usertype = '1'
               AND ispre = 'X'.
            CHECK sy-subrc EQ 0.
          ENDIF.
        ENDIF.

        IF lt_cusid IS NOT INITIAL.
***连接查询两者
          IF iv_isdelete NE 'X'.
            SELECT h~*,cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
                   cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid,
                   h~inquiryid AS billno
              FROM zticec_inquiry_h AS h
             INNER JOIN ztint_cus_inf AS cus
                ON h~custcompanyid = cus~companyid
              INTO CORRESPONDING FIELDS OF TABLE @et_inquiry
               FOR ALL ENTRIES IN @lt_cusid
             WHERE cus~cusid = @lt_cusid-cusid
               AND ( cus~cusname IN @so_cusname
                OR cus~companycode IN @so_cusname )
               AND cus~companycode IN @so_companycode
               AND cus~companyid IN @so_custcompanyid
               AND cus~zoneid IN @so_zoneid
               AND ( cus~provincegeoid IN @so_citygeoid
                OR cus~citygeoid IN @so_citygeoid )
               AND h~inquiryid IN @so_inquiryid
               AND h~createdate IN @so_createdate
               AND h~statusid IN @so_statusid
               AND h~carbrandid IN @so_carbrandid
               AND h~sourceid IN @so_sourceid
               AND h~inquirytype IN @so_inquirytype
               AND h~inquiryway IN @so_inquiryway
               AND h~inquiryid IN @so_ordered.
          ELSE.
            SELECT h~*,cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
                   cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid,
                   h~inquiryid AS billno
              FROM zticec_inquiry_h AS h
             INNER JOIN ztint_cus_inf AS cus
                ON h~custcompanyid = cus~companyid
              INTO CORRESPONDING FIELDS OF TABLE @et_inquiry
               FOR ALL ENTRIES IN @lt_cusid
             WHERE cus~cusid = @lt_cusid-cusid
                AND cus~isdelete = 'X'
               AND ( cus~cusname IN @so_cusname
                OR cus~companycode IN @so_cusname )
               AND cus~companycode IN @so_companycode
               AND cus~companyid IN @so_custcompanyid
               AND cus~zoneid IN @so_zoneid
               AND ( cus~provincegeoid IN @so_citygeoid
                OR cus~citygeoid IN @so_citygeoid )
               AND h~inquiryid IN @so_inquiryid
               AND h~createdate IN @so_createdate
               AND h~statusid IN @so_statusid
               AND h~carbrandid IN @so_carbrandid
               AND h~sourceid IN @so_sourceid
               AND h~inquirytype IN @so_inquirytype
               AND h~inquiryway IN @so_inquiryway
               AND h~inquiryid IN @so_ordered.
          ENDIF.
        ELSE.
***先查询价单，再查对应的客户信息
          SELECT h~*,h~inquiryid AS billno
            FROM zticec_inquiry_h AS h
            INTO CORRESPONDING FIELDS OF TABLE @et_inquiry
           WHERE inquiryid IN @so_inquiryid
             AND createdate IN @so_createdate
             AND statusid IN @so_statusid
             AND carbrandid IN @so_carbrandid
             AND sourceid IN @so_sourceid
             AND inquirytype IN @so_inquirytype
             AND inquiryway IN @so_inquiryway
               AND inquiryid IN @so_ordered.
          IF sy-subrc EQ 0.
            DATA(lt_inquiry) = et_inquiry.
            SORT lt_inquiry BY custcompanyid.
            DELETE ADJACENT DUPLICATES FROM lt_inquiry COMPARING custcompanyid.
**查询客户
            IF  lt_inquiry IS NOT INITIAL.
              IF iv_isdelete NE 'X'.
                SELECT cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
                 cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid
                  INTO CORRESPONDING FIELDS OF TABLE @et_inquiry_cus
                  FROM ztint_cus_inf AS cus
                   FOR ALL ENTRIES IN @lt_inquiry
                 WHERE cus~companyid = @lt_inquiry-custcompanyid
                   AND ( cus~cusname IN @so_cusname
                    OR cus~companycode IN @so_cusname )
                   AND cus~companycode IN @so_companycode
                   AND cus~companyid IN @so_custcompanyid
                   AND cus~zoneid IN @so_zoneid
                   AND ( cus~provincegeoid IN @so_citygeoid
                    OR cus~citygeoid IN @so_citygeoid ).
              ELSE.
                SELECT cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
                 cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid
                  INTO CORRESPONDING FIELDS OF TABLE @et_inquiry_cus
                  FROM ztint_cus_inf AS cus
                   FOR ALL ENTRIES IN @lt_inquiry
                 WHERE cus~companyid = @lt_inquiry-custcompanyid
                   AND cus~isdelete = 'X'
                   AND ( cus~cusname IN @so_cusname
                    OR cus~companycode IN @so_cusname )
                   AND cus~companycode IN @so_companycode
                   AND cus~companyid IN @so_custcompanyid
                   AND cus~zoneid IN @so_zoneid
                   AND ( cus~provincegeoid IN @so_citygeoid
                    OR cus~citygeoid IN @so_citygeoid ).
              ENDIF.

              SORT et_inquiry_cus BY companyid.
            ENDIF.
          ENDIF.
        ENDIF.
      WHEN 2 OR 3.
****获取当前钉钉下面的所有人
        get_person(
          EXPORTING so_userid = so_userid
          IMPORTING et_userlist = DATA(lt_userlist) ).
***获取客户经理对于的客户
        IF lt_userlist IS NOT INITIAL.
          IF iv_isdelete NE 'X'.
            SELECT h~*,cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
              cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid,
              h~inquiryid AS billno
              INTO CORRESPONDING FIELDS OF TABLE @et_inquiry
              FROM zticec_inquiry_h AS h
             INNER JOIN ztint_cus_inf AS cus
               ON h~custcompanyid = cus~companyid
             INNER JOIN ztint_cus_user AS u
                ON cus~cusid = u~cusid
               FOR ALL ENTRIES IN @lt_userlist
             WHERE  u~userid = @lt_userlist-userid"iv_id
               AND u~usertype = '1'
               AND u~isdelete = ''
               AND cus~status = '3'
               AND cus~isvirtual = ''
               AND ( cus~cusname IN @so_cusname
                OR cus~companycode IN @so_cusname )
               AND cus~companycode IN @so_companycode
               AND cus~companyid IN @so_custcompanyid
               AND cus~zoneid IN @so_zoneid
               AND ( cus~provincegeoid IN @so_citygeoid
                OR cus~citygeoid IN @so_citygeoid )
               AND h~inquiryid IN @so_inquiryid
               AND h~createdate IN @so_createdate
               AND h~statusid IN @so_statusid
               AND h~carbrandid IN @so_carbrandid
               AND h~sourceid IN @so_sourceid
               AND h~inquirytype IN @so_inquirytype
               AND h~inquiryway IN @so_inquiryway
               AND h~inquiryid IN @so_ordered.
          ELSE.
            SELECT h~*,cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
               cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid,
               h~inquiryid AS billno
               INTO CORRESPONDING FIELDS OF TABLE @et_inquiry
               FROM zticec_inquiry_h AS h
              INNER JOIN ztint_cus_inf AS cus
                ON h~custcompanyid = cus~companyid
              INNER JOIN ztint_cus_user AS u
                 ON cus~cusid = u~cusid
                FOR ALL ENTRIES IN @lt_userlist
              WHERE  u~userid = @lt_userlist-userid"iv_id
                AND u~usertype = '1'
                AND u~ispre = 'X'
                 AND cus~isdelete = 'X'
                AND cus~status = '3'
                AND cus~isvirtual = ''
                AND ( cus~cusname IN @so_cusname
                 OR cus~companycode IN @so_cusname )
                AND cus~companycode IN @so_companycode
                AND cus~companyid IN @so_custcompanyid
                AND cus~zoneid IN @so_zoneid
                AND ( cus~provincegeoid IN @so_citygeoid
                 OR cus~citygeoid IN @so_citygeoid )
                AND h~inquiryid IN @so_inquiryid
                AND h~createdate IN @so_createdate
                AND h~statusid IN @so_statusid
                AND h~carbrandid IN @so_carbrandid
                AND h~sourceid IN @so_sourceid
                AND h~inquirytype IN @so_inquirytype
                AND h~inquiryway IN @so_inquiryway
                AND h~inquiryid IN @so_ordered.
          ENDIF.
        ENDIF.
      WHEN OTHERS.
    ENDCASE.

  ENDMETHOD.


  METHOD get_inquiry_data_by_vendor.
    CASE mv_type.
      WHEN 1.
      WHEN 2 OR 3.
****获取当前钉钉下面的所有人
        get_person(
        EXPORTING so_userid = so_userid
          IMPORTING et_userlist = DATA(lt_userlist) ).
***获取拓展经理对应的供应商的单及单中客户对应的客户经理
        IF lt_userlist IS NOT INITIAL.
          IF iv_isdelete NE 'X'.
            SELECT h~*,cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
              cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid,
              h~inquiryid AS billno
              INTO CORRESPONDING FIELDS OF TABLE @et_inquiry
              FROM zticec_inquiry_h AS h
             INNER JOIN zticec_inquiry_c AS q
                ON q~inquiryid = h~inquiryid
             INNER JOIN ztint_cus_inf AS cus
              ON h~custcompanyid = cus~companyid
             INNER JOIN ztint_ven_inf AS ven
               ON q~productstoreid = ven~productstoreid
             INNER JOIN ztint_ven_user AS u
                ON ven~venid = u~venid
               FOR ALL ENTRIES IN @lt_userlist
             WHERE u~userid = @lt_userlist-userid"iv_id
               AND u~usertype = '1'
               AND u~isdelete = ''
               AND cus~companyid IN @so_custcompanyid
               AND cus~companycode IN @so_companycode
               AND ( cus~companycode IN @so_cusname
                OR cus~cusname IN @so_cusname )
               AND ( cus~provincegeoid IN @so_citygeoid
                OR cus~citygeoid IN @so_citygeoid )
               AND cus~zoneid IN @so_zoneid
               AND h~inquiryid IN @so_inquiryid
               AND h~createdate IN @so_createdate
               AND h~statusid IN @so_statusid
               AND h~carbrandid IN @so_carbrandid
               AND h~sourceid IN @so_sourceid
               AND h~inquirytype IN @so_inquirytype
               AND h~inquiryway IN @so_inquiryway
               AND h~inquiryid IN @so_ordered.
          ELSE.
            SELECT h~*,cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
                 cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid,
                 h~inquiryid AS billno
                 INTO CORRESPONDING FIELDS OF TABLE @et_inquiry
                 FROM zticec_inquiry_h AS h
                INNER JOIN zticec_inquiry_c AS q
                   ON q~inquiryid = h~inquiryid
                INNER JOIN ztint_cus_inf AS cus
                 ON h~custcompanyid = cus~companyid
                INNER JOIN ztint_ven_inf AS ven
                  ON q~productstoreid = ven~productstoreid
                INNER JOIN ztint_ven_user AS u
                   ON ven~venid = u~venid
                  FOR ALL ENTRIES IN @lt_userlist
                WHERE u~userid = @lt_userlist-userid"iv_id
                  AND u~usertype = '1'
                  AND u~ispre = 'X'
                  AND cus~isdelete = 'X'
                  AND cus~companyid IN @so_custcompanyid
                  AND cus~companycode IN @so_companycode
                  AND ( cus~companycode IN @so_cusname
                   OR cus~cusname IN @so_cusname )
                  AND ( cus~provincegeoid IN @so_citygeoid
                   OR cus~citygeoid IN @so_citygeoid )
                  AND cus~zoneid IN @so_zoneid
                  AND h~inquiryid IN @so_inquiryid
                  AND h~createdate IN @so_createdate
                  AND h~statusid IN @so_statusid
                  AND h~carbrandid IN @so_carbrandid
                  AND h~sourceid IN @so_sourceid
                  AND h~inquirytype IN @so_inquirytype
                  AND h~inquiryway IN @so_inquiryway
                  AND h~inquiryid IN @so_ordered.
          ENDIF.
          IF sy-subrc NE 0.
            IF iv_isdelete NE 'X'.
              SELECT h~*,cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
                     cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid,
                     h~inquiryid AS billno INTO CORRESPONDING FIELDS OF TABLE @et_inquiry
                        FROM zticec_inquiry_h AS h
                        INNER JOIN zticec_inquiry_q AS q
                        ON q~inquiryid = h~inquiryid
                        INNER JOIN ztint_cus_inf AS cus
                        ON h~custcompanyid = cus~companyid
                        INNER JOIN ztint_ven_inf AS ven
                        ON q~productstoreid = ven~productstoreid
                        INNER JOIN ztint_ven_user AS u
                        ON ven~venid = u~venid
                        FOR ALL ENTRIES IN @lt_userlist
                        WHERE u~userid = @lt_userlist-userid"iv_id
                        AND u~usertype = '1'
                        AND u~isdelete = ''
                        AND cus~companyid IN @so_custcompanyid
                        AND cus~companycode IN @so_companycode
                        AND ( cus~companycode IN @so_cusname
                        OR cus~cusname IN @so_cusname )
                        AND ( cus~provincegeoid IN @so_citygeoid
                        OR cus~citygeoid IN @so_citygeoid )
                        AND cus~zoneid IN @so_zoneid
                        AND h~inquiryid IN @so_inquiryid
                        AND h~createdate IN @so_createdate
                        AND h~statusid IN @so_statusid
                        AND h~carbrandid IN @so_carbrandid
                        AND h~sourceid IN @so_sourceid
                        AND h~inquirytype IN @so_inquirytype
                        AND h~inquiryway IN @so_inquiryway
                        AND h~inquiryid IN @so_ordered.
            ELSE.

              SELECT h~*,cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
                     cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid,
                     h~inquiryid AS billno
                      INTO CORRESPONDING FIELDS OF TABLE @et_inquiry
                      FROM zticec_inquiry_h AS h
                      INNER JOIN zticec_inquiry_q AS q
                      ON q~inquiryid = h~inquiryid
                      INNER JOIN ztint_cus_inf AS cus
                      ON h~custcompanyid = cus~companyid
                      INNER JOIN ztint_ven_inf AS ven
                      ON q~productstoreid = ven~productstoreid
                      INNER JOIN ztint_ven_user AS u
                      ON ven~venid = u~venid
                      FOR ALL ENTRIES IN @lt_userlist
                      WHERE u~userid = @lt_userlist-userid"iv_id
                      AND u~usertype = '1'
                      AND u~ispre = 'X'
                      AND cus~isdelete = 'X'
                      AND cus~companyid IN @so_custcompanyid
                      AND cus~companycode IN @so_companycode
                      AND ( cus~companycode IN @so_cusname
                      OR cus~cusname IN @so_cusname )
                      AND ( cus~provincegeoid IN @so_citygeoid
                      OR cus~citygeoid IN @so_citygeoid )
                      AND cus~zoneid IN @so_zoneid
                      AND h~inquiryid IN @so_inquiryid
                      AND h~createdate IN @so_createdate
                      AND h~statusid IN @so_statusid
                      AND h~carbrandid IN @so_carbrandid
                      AND h~sourceid IN @so_sourceid
                      AND h~inquirytype IN @so_inquirytype
                      AND h~inquiryway IN @so_inquiryway
                      AND h~inquiryid IN @so_ordered.
            ENDIF.
          ENDIF.
        ENDIF.
      WHEN OTHERS.
    ENDCASE.

  ENDMETHOD.


  METHOD get_inquiry_data_new.
    DATA:lr_isdelete   TYPE RANGE OF ztint_cus_inf-isdelete,
         lr_userdelete TYPE RANGE OF ztint_ven_user-isdelete,
         lr_userpre    TYPE RANGE OF ztint_ven_user-ispre.
    IF iv_isdelete EQ 'X'.
      lr_isdelete = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
      lr_userdelete  = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
      lr_userpre  = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
    ELSE.
      lr_userdelete  = VALUE #( ( sign = 'I' option = 'EQ' low = '' ) ).
      lr_userpre  = VALUE #( ( sign = 'I' option = 'EQ' low = '' ) ).
    ENDIF.

    TRY.
        "IV_TERMINAL是终端来源-PC/PHONE
        "PC上，客户名称和商家名称是否分开的两个字段，而PHONE上是合在一个字段的，所以查数时需要区分
        IF ( mv_type EQ 1 OR mv_type EQ 4 ) AND so_userid IS INITIAL.
          IF ( iv_terminal EQ 'PC' AND so_venname IS INITIAL ) OR
            ( iv_terminal EQ 'PHONE'  AND so_cusname IS INITIAL ).
***            SQL_A
            SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,a~amount,a~tiresize,
                    a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,
                    a~quotasku,a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
                    a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
               INTO CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inquirycus AS a
              WHERE ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
                 AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid AND a~zoneid IN @so_zoneid
                 AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
                 AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid
                 AND a~carbrandid IN @so_carbrandid AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype
                 AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered AND a~foundstate IN @so_foundstate.
          ELSEIF iv_terminal EQ 'PC' AND so_venname IS NOT INITIAL.
            SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,a~amount,a~tiresize,
                    a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,
                    a~quotasku,a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
                    a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
               INTO CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inquirycus AS a
              INNER JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
              WHERE ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
                 AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid AND a~zoneid IN @so_zoneid
                 AND ( v~productstoreid IN @so_venname OR v~venname IN @so_venname OR v~displayname IN @so_venname )
                 AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
                 AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid
                 AND a~carbrandid IN @so_carbrandid AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype
                 AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered AND a~foundstate IN @so_foundstate.
          ELSEIF iv_terminal EQ 'PHONE'  AND so_cusname IS NOT INITIAL.
            SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,a~amount,a~tiresize,
                    a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~tiresize,
                    a~quotasku,a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
                    a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
               INTO CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inquirycus AS a
              WHERE  ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
                 AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid AND a~zoneid IN @so_zoneid
                 AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
                 AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid
                 AND a~carbrandid IN @so_carbrandid AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype
                 AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered AND a~foundstate IN @so_foundstate.

            SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,a~amount,a~tiresize,
                 a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,
                 a~quotasku,a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
                 a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
            APPENDING CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inquirycus AS a
            INNER JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
            WHERE ( v~productstoreid IN @so_cusname OR v~venname IN @so_cusname OR v~displayname IN @so_cusname )
              AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid AND a~zoneid IN @so_zoneid
              AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
              AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid
              AND a~carbrandid IN @so_carbrandid AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype
              AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered AND a~foundstate IN @so_foundstate.
          ENDIF.

        ELSE.
          IF mv_type EQ '2' OR mv_type EQ '3'."2 3权限时获取权限内的 客户经理
****获取当前钉钉下面的所有人
            get_person( EXPORTING so_userid = so_userid
                IMPORTING et_userlist = DATA(lt_userlist) ).
****开放客户协同人查看询价单20201223 保持现状：客户详情过来的增加了参数Classtype = "X10101"，直接给了1权限，可以查看客户所有询价单，但列表该是啥还是啥！

          ELSE."获取1权限下指定的客户经理
            IF iv_isdelete NE 'X'.
              SELECT a~userid,a~username INTO CORRESPONDING FIELDS OF TABLE @lt_userlist
                FROM ztint_user_inf AS a INNER JOIN ztint_cus_user AS b ON a~userid = b~userid
                WHERE a~userid IN @so_userid AND  b~usertype = '1' AND b~isdelete = ''.
              CHECK sy-subrc EQ 0.
            ELSE.
              SELECT a~userid,a~username INTO CORRESPONDING FIELDS OF TABLE @lt_userlist
                FROM ztint_user_inf AS a INNER JOIN ztint_cus_user AS b ON a~userid = b~userid
                WHERE a~userid IN @so_userid AND  b~usertype = '1' AND b~ispre = 'X'.
              CHECK sy-subrc EQ 0.
            ENDIF.
          ENDIF.

          SORT lt_userlist BY userid.
          DELETE ADJACENT DUPLICATES FROM lt_userlist COMPARING userid.
          CHECK lt_userlist IS NOT INITIAL.
          "假设作为拓展，看能否查找对应的商家。 商家协同的询价单暂不开放
          SELECT venid
            INTO TABLE @DATA(lt_venid) UP TO 1 ROWS
            FROM ztint_ven_user AS u
            FOR ALL ENTRIES IN @lt_userlist
*           WHERE u~userid = @lt_userlist-userid AND u~usertype = '1' AND u~isdelete = '' AND u~ispre = ''.
           WHERE u~userid = @lt_userlist-userid AND ( u~usertype = '1' OR u~usertype = '2' ) AND u~isdelete = '' AND u~ispre = ''."modify at 2021.05.06-支持商家协同人查看

          IF ( iv_terminal EQ 'PC' AND so_venname IS INITIAL ) OR
            ( iv_terminal EQ 'PHONE' AND so_cusname IS INITIAL ).
            "作为客户经理查
            SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,a~amount,a~tiresize,
                            a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
                            a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
                            a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
              INTO CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inq_cususer( p_ispre = @iv_isdelete,p_isdelete = @iv_isdelete ) AS a
               FOR ALL ENTRIES IN @lt_userlist
             WHERE a~userid = @lt_userlist-userid AND a~userid IN @so_userid
               AND a~isvirtual = ''
               AND ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
               AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid AND a~zoneid IN @so_zoneid
               AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
               AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
               AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
               AND a~foundstate IN @so_foundstate.
            "作为拓展再查一次
            IF lt_venid IS NOT INITIAL.
              SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,a~amount,a~tiresize,
                              a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
                              a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
                              a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
                APPENDING CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inq_cususer( p_ispre = @iv_isdelete,p_isdelete = @iv_isdelete ) AS a
                INNER JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
*                INNER JOIN ztint_ven_user AS u ON v~venid = u~venid AND u~usertype = '1' AND u~isdelete = '' AND u~ispre = ''
                INNER JOIN ztint_ven_user AS u ON v~venid = u~venid AND ( u~usertype = '1' OR u~usertype = '2' ) AND u~isdelete = '' AND u~ispre = ''"modify at 2021.05.06-支持商家协同人查看
                 FOR ALL ENTRIES IN @lt_userlist
               WHERE u~userid = @lt_userlist-userid
                 AND a~userid IN @so_userid AND a~isvirtual = ''
                 AND ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
                 AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid AND a~zoneid IN @so_zoneid
                 AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
                 AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
                 AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
                 AND a~foundstate IN @so_foundstate.
            ENDIF.
          ELSEIF iv_terminal EQ 'PC' AND so_venname IS NOT INITIAL.
            "作为客户经理查
            SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,a~amount,a~tiresize,
                           a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
                           a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
                           a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
             INTO CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inq_cususer( p_ispre = @iv_isdelete,p_isdelete = @iv_isdelete ) AS a
             INNER JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
              FOR ALL ENTRIES IN @lt_userlist
            WHERE a~userid = @lt_userlist-userid AND a~userid IN @so_userid
              AND a~isvirtual = ''
              AND ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
              AND ( v~productstoreid IN @so_venname OR v~venname IN @so_venname OR v~displayname IN @so_venname )
              AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid AND a~zoneid IN @so_zoneid
              AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
              AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
              AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
              AND a~foundstate IN @so_foundstate.

            "作为拓展再查一次
            IF lt_venid IS NOT INITIAL.
              SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,a~amount,a~tiresize,
                              a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
                              a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
                              a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
                APPENDING CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inq_cususer( p_ispre = @iv_isdelete,p_isdelete = @iv_isdelete ) AS a
                INNER JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
*                INNER JOIN ztint_ven_user AS u ON v~venid = u~venid AND u~usertype = '1' AND u~isdelete = '' AND u~ispre = ''
                INNER JOIN ztint_ven_user AS u ON v~venid = u~venid AND ( u~usertype = '1' OR u~usertype = '2' ) AND u~isdelete = '' AND u~ispre = ''"modify at 2021.05.06-支持商家协同人查看
                 FOR ALL ENTRIES IN @lt_userlist
               WHERE u~userid = @lt_userlist-userid
                 AND a~userid IN @so_userid AND a~isvirtual = ''
                AND ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
                AND ( v~productstoreid IN @so_venname OR v~venname IN @so_venname OR v~displayname IN @so_venname )
                AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid AND a~zoneid IN @so_zoneid
                AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
                AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
                AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
                AND a~foundstate IN @so_foundstate.
            ENDIF.
          ELSEIF iv_terminal EQ 'PHONE' AND so_cusname IS NOT INITIAL.
            "先作为客户经理,so_cusname作为客户内容
            SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,a~amount,a~tiresize,
                           a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
                           a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
                           a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
             INTO CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inq_cususer( p_ispre = @iv_isdelete,p_isdelete = @iv_isdelete ) AS a
              FOR ALL ENTRIES IN @lt_userlist
            WHERE a~userid = @lt_userlist-userid AND a~userid IN @so_userid
              AND a~isvirtual = ''
              AND ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
              AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid AND a~zoneid IN @so_zoneid
              AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
              AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
              AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
              AND a~foundstate IN @so_foundstate.
            "先作为客户经理,so_cusname作为商家内容
            SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,a~amount,a~tiresize,
                        a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
                        a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
                        a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
              APPENDING CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inq_cususer( p_ispre = @iv_isdelete,p_isdelete = @iv_isdelete ) AS a
            INNER JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
             FOR ALL ENTRIES IN @lt_userlist
           WHERE a~userid = @lt_userlist-userid AND a~userid IN @so_userid
             AND a~isvirtual = ''
             AND ( v~productstoreid IN @so_cusname OR v~venname IN @so_cusname OR v~displayname IN @so_cusname )
             AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid AND a~zoneid IN @so_zoneid
             AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
             AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
             AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
             AND a~foundstate IN @so_foundstate.
            "在作为拓展经理，so_cusname作为客户/商家内容
            SELECT DISTINCT a~inquiryid,a~cusid,a~companyid,a~companycode,a~provincegeoid, a~provincegeoname,a~amount,a~tiresize,
                        a~citygeoid, a~citygeoname,a~countygeoid,a~countygeoname,a~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~quotasku,
                        a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
                        a~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid
              APPENDING CORRESPONDING FIELDS OF TABLE @et_inquiry FROM zv_inq_cususer( p_ispre = @iv_isdelete,p_isdelete = @iv_isdelete ) AS a
            INNER JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
            INNER JOIN ztint_ven_user AS u ON v~venid = u~venid
             FOR ALL ENTRIES IN @lt_userlist
*           WHERE u~userid = @lt_userlist-userid AND u~usertype = '1' AND u~isdelete = '' AND u~ispre = ''
           WHERE u~userid = @lt_userlist-userid AND ( u~usertype = '1' OR u~usertype = '2' ) AND u~isdelete = '' AND u~ispre = ''"modify at 2021.05.06-支持商家协同人查看
             AND a~userid IN @so_userid AND a~isvirtual = ''
             AND ( ( a~cusname IN @so_cusname OR a~companycode IN @so_cusname OR a~cusdisplayname IN @so_cusname )
             OR ( v~productstoreid IN @so_cusname OR v~venname IN @so_cusname OR v~displayname IN @so_cusname ) )
             AND a~companycode IN @so_companycode AND a~companyid IN @so_custcompanyid AND a~zoneid IN @so_zoneid
             AND ( a~provincegeoid IN @so_citygeoid OR a~citygeoid IN @so_citygeoid OR a~countygeoid IN @so_citygeoid )
             AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
             AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
             AND a~foundstate IN @so_foundstate. "在作为拓展经理，so_cusname作为客户/商家内容
          ENDIF.
        ENDIF.
      CATCH cx_sy_dynamic_osql_semantics  INTO DATA(lo_osql).
      CATCH cx_sy_open_sql_db INTO DATA(lo_opensql).
* """       SO_ORDERID太大，拆开1W的查
        mv_redo = COND #( WHEN mv_redo EQ 'X' THEN 'Y' ELSE mv_redo ).
        CHECK mv_redo IS INITIAL.
        mv_redo = 'X'.

        DATA:lv_lines    TYPE int4,
             lv_div      TYPE int4,
             lv_mod      TYPE int4,
             lv_times    TYPE int4,
             lv_from     TYPE int4,
             lv_to       TYPE int4,
             so_ordertmp TYPE /iwbep/t_cod_select_options.
        lv_lines = lines( so_ordered ).
        CHECK lv_lines > 0.
        lv_div = lv_lines / 20000.
        DO lv_div TIMES.
          IF mv_redo EQ 'Y'.
            EXIT.
          ENDIF.
          lv_from = ( sy-index - 1 ) * 20000 + 1.
          lv_to = sy-index * 20000.
          IF lv_to > lv_lines.
            lv_to = lv_lines.
          ENDIF.
          APPEND LINES OF so_ordered FROM lv_from TO lv_to TO so_ordertmp.
          get_inquiry_data(
           EXPORTING
             so_inquiryid = so_inquiryid
             so_cusname = so_cusname
             so_venname = so_venname
             so_createdate = so_createdate
             so_statusid = so_statusid
             so_carbrandid = so_carbrandid
             so_sourceid = so_sourceid
             so_inquirytype = so_inquirytype
             so_zoneid = so_zoneid
             so_companycode = so_companycode
             so_userid = so_userid
             so_citygeoid = so_citygeoid
             so_custcompanyid = so_custcompanyid
             so_inquiryway = so_inquiryway
             so_ordered  = so_ordertmp
             so_foundstate = so_foundstate
             iv_isdelete = iv_isdelete
             iv_terminal = iv_terminal
             IMPORTING
               et_inquiry = DATA(lt_inquiry) ).
          APPEND LINES OF lt_inquiry TO et_inquiry.
          CLEAR:lt_inquiry,lv_from,lv_to,so_ordertmp.
        ENDDO.
    ENDTRY.


  ENDMETHOD.


  METHOD get_inquiry_data_new_v2.
    DATA:lr_isdelete   TYPE RANGE OF ztint_cus_inf-isdelete,
         lr_userdelete TYPE RANGE OF ztint_ven_user-isdelete,
         lr_userpre    TYPE RANGE OF ztint_ven_user-ispre.

    DATA:lr_storeid       TYPE RANGE OF ztint_ven_inf-productstoreid,
         lr_storeid_tmp   TYPE RANGE OF ztint_ven_inf-productstoreid,
         lr_companyid_tmp TYPE RANGE OF ztint_cus_inf-companyid,
         lr_companyid     TYPE RANGE OF ztint_cus_inf-companyid,
         lv_ordered       TYPE string.
    TYPES:BEGIN OF ty_cus,
            companyid TYPE ztint_cus_inf-companyid,
          END OF ty_cus.
    DATA:lt_usercompanyid TYPE SORTED TABLE OF ty_cus WITH NON-UNIQUE KEY companyid .
    TYPES:BEGIN OF ty_ven,
            productstoreid TYPE ztint_ven_inf-productstoreid,
          END OF ty_ven.
    DATA:lt_userstore TYPE SORTED TABLE OF ty_ven WITH NON-UNIQUE KEY productstoreid.
    TYPES:BEGIN OF ty_inq,
            inquiryid TYPE zticec_inquiry_h-inquiryid,
          END OF ty_inq.
    DATA:lt_orderedinq TYPE SORTED TABLE OF ty_inq WITH NON-UNIQUE KEY inquiryid.

    IF iv_isdelete EQ 'X'.
      lr_isdelete = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
      lr_userdelete  = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
      lr_userpre  = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
    ELSE.
      lr_userdelete  = VALUE #( ( sign = 'I' option = 'EQ' low = '' ) ).
      lr_userpre  = VALUE #( ( sign = 'I' option = 'EQ' low = '' ) ).
    ENDIF.

    IF ( mv_type EQ '1' OR mv_type EQ '4' ) AND so_userid IS NOT INITIAL.."1权限查指定客户经理的，先将指定客户经理的客户捞出来
      SELECT companyid
         INTO TABLE @lt_usercompanyid FROM ztint_cus_inf AS i
        INNER JOIN ztint_cus_user AS u ON i~cusid = u~cusid
       WHERE userid IN @so_userid AND usertype = '1' AND u~ispre IN @lr_userpre AND u~isdelete IN @lr_userdelete.
      IF lt_usercompanyid IS INITIAL.
        EXIT.
      ENDIF.
    ELSEIF mv_type EQ '2' OR mv_type EQ '3'.
      "2,3权限的，先看负责区域的人员清单
      get_person( EXPORTING so_userid = so_userid
              IMPORTING et_userlist = DATA(lt_userlist) ).
      "查人员列表下负责的客户经理负责的客户和拓展负责的店铺
      IF lt_userlist IS NOT INITIAL.
        "作为客户经理或协同人
        SELECT companyid
          INTO  TABLE @lt_usercompanyid FROM ztint_cus_inf AS i
          INNER JOIN ztint_cus_user AS u ON i~cusid = u~cusid
          FOR ALL ENTRIES IN @lt_userlist
         WHERE userid = @lt_userlist-userid AND u~ispre IN @lr_userpre AND u~isdelete IN @lr_userdelete.
        "作为拓展
        SELECT productstoreid
          INTO  TABLE @lt_userstore FROM ztint_ven_inf AS i
          INNER JOIN ztint_ven_user AS u ON i~venid = u~venid
          FOR ALL ENTRIES IN @lt_userlist
          WHERE userid = @lt_userlist-userid AND u~isdelete = '' .
        IF lt_usercompanyid IS INITIAL AND lt_userstore IS INITIAL.
          EXIT.
        ENDIF.
      ENDIF.
    ENDIF.

    "特殊处理：APP上的客户和店铺用的同一个字段
    "特别注意，so_venname有值的时候表示取交集，其他都是并集
    IF ( iv_terminal = 'PHONE' AND so_cusname IS NOT INITIAL ) OR so_venname IS NOT INITIAL.
      IF so_venname IS NOT INITIAL.
        DATA(lv_where) = |displayname in @so_venname or productstoreid in @so_venname |.
      ELSE.
        lv_where = |displayname in @so_cusname or productstoreid in @so_cusname |.
      ENDIF.

      SELECT 'I' AS sign,'EQ' AS option,productstoreid AS low
        APPENDING CORRESPONDING FIELDS OF TABLE @lr_storeid
        FROM ztint_ven_inf
       WHERE (lv_where).
      IF sy-subrc NE 0 AND so_venname IS NOT INITIAL.
        EXIT.
      ELSEIF sy-subrc EQ 0 AND so_venname IS NOT INITIAL AND lt_userstore IS NOT INITIAL.
        lr_storeid_tmp = FILTER #( lr_storeid IN lt_userstore WHERE low = productstoreid ).
        IF lr_storeid_tmp IS INITIAL.
          EXIT.
        ELSE.
          CLEAR:lt_userstore,lr_storeid.
          lr_storeid = lr_storeid_tmp.
        ENDIF.
      ENDIF.
    ENDIF.

    IF so_cusname IS NOT INITIAL OR so_companycode IS NOT INITIAL OR so_custcompanyid IS NOT INITIAL OR
       so_citygeoid IS NOT INITIAL OR  so_zoneid IS NOT INITIAL.
      SELECT 'I' AS sign,'EQ' AS option,companyid AS low
        INTO CORRESPONDING FIELDS OF TABLE @lr_companyid
        FROM ztint_cus_inf
       WHERE ( cusname IN @so_cusname OR
         displayname IN @so_cusname OR companycode IN @so_cusname )
        AND companycode IN @so_companycode
        AND companyid IN @so_custcompanyid
        AND ( provincegeoid IN @so_citygeoid OR citygeoid IN @so_citygeoid OR countygeoid IN @so_citygeoid )
        AND zoneid IN @so_zoneid.
      IF lt_usercompanyid IS NOT INITIAL.
        lr_companyid_tmp = FILTER #( lr_companyid IN lt_usercompanyid WHERE low = companyid ).
        CLEAR lr_companyid.
        lr_companyid = lr_companyid_tmp.
        CLEAR lt_usercompanyid.
      ENDIF.
      IF iv_terminal = 'PHONE' AND so_cusname IS NOT INITIAL .
      ELSE.
        IF lr_companyid IS INITIAL.
          EXIT.
        ENDIF.
      ENDIF.
    ENDIF.

    IF lines( lt_usercompanyid ) + lines( lr_companyid ) < 30000  AND lt_usercompanyid IS NOT INITIAL.
      lr_companyid = VALUE #( BASE lr_companyid FOR wacus IN lt_usercompanyid ( sign = 'I' option = 'EQ' low = wacus-companyid ) ).
      DATA(lv_cus_collect) = 'X'.
      CLEAR lt_usercompanyid.
    ELSEIF lines( lr_companyid ) > 30000.
      "将lr_companyid超过3W的数据写入lt_usercompanyid中
      LOOP AT lr_companyid ASSIGNING FIELD-SYMBOL(<lfs_comp>) FROM 30001.
        lt_usercompanyid = VALUE #( BASE lt_usercompanyid ( companyid = <lfs_comp>-low ) ).
        <lfs_comp>-high = 'X'.
      ENDLOOP.
      DELETE lr_companyid WHERE high = 'X'.
    ENDIF.

    IF so_statusid IS NOT INITIAL.
      lv_ordered = VALUE #( so_statusid[ 1 ]-low OPTIONAL ) .
      IF lv_ordered EQ 'ORDERED'.
        DELETE so_statusid WHERE low EQ 'ORDERED'.
      ENDIF.
    ENDIF.

    "限制90天
    DATA lv_date TYPE sy-datum.
    IF so_inquiryid IS INITIAL AND so_createdate IS INITIAL.
      DATA(lv_eq) = VALUE #( so_custcompanyid[ 1 ]-option OPTIONAL )."指定了客户的，不限制时间
      IF lv_eq NE 'EQ'.
        lv_date = sy-datum - 90.
        so_createdate = VALUE #( ( sign = 'I' option = 'BT' low = lv_date high = sy-datum ) ).
      ENDIF.
    ELSE.
      "询价单输入全了，拿掉时间限制
      DATA(lv_inquiry) = VALUE #( so_inquiryid[ 1 ]-low OPTIONAL ).
      CONDENSE lv_inquiry.
      "*B21100770891*
      IF strlen( lv_inquiry ) = 14.
        CLEAR so_createdate.
      ENDIF.
    ENDIF.


    IF lv_ordered NE 'ORDERED'.
      IF lr_companyid IS INITIAL AND iv_terminal = 'PHONE' AND so_cusname IS NOT INITIAL.
      ELSE.
        SELECT h~inquiryid,h~custcompanyid,t~amount,t~preamount,h~createdate,h~createtime FROM zticec_inquiry_h AS h
          LEFT JOIN zticec_inquiry_t AS t ON h~inquiryid = t~inquiryid
          INTO TABLE @DATA(lt_inqid)
          WHERE h~inquiryid IN @so_inquiryid
            AND h~createdate IN @so_createdate
            AND h~statusid IN @so_statusid
            AND h~carbrandid IN @so_carbrandid
            AND h~sourceid IN @so_sourceid
            AND h~inquirytype IN @so_inquirytype
            AND h~custcompanyid IN @lr_companyid
            AND h~inquiryway IN @so_inquiryway
            AND h~foundstate IN @so_foundstate.
      ENDIF.
      IF lt_usercompanyid IS NOT INITIAL.
        SELECT h~inquiryid,h~custcompanyid,t~amount,t~preamount,h~createdate,h~createtime FROM zticec_inquiry_h AS h
         LEFT JOIN zticec_inquiry_t AS t ON h~inquiryid = t~inquiryid
         APPENDING CORRESPONDING FIELDS OF TABLE @lt_inqid
         FOR ALL ENTRIES IN @lt_usercompanyid
         WHERE h~inquiryid IN @so_inquiryid
           AND h~createdate IN @so_createdate
           AND h~statusid IN @so_statusid
           AND h~carbrandid IN @so_carbrandid
           AND h~sourceid IN @so_sourceid
           AND h~inquirytype IN @so_inquirytype
           AND h~custcompanyid = @lt_usercompanyid-companyid
           AND h~inquiryway IN @so_inquiryway
           AND h~foundstate IN @so_foundstate.
      ENDIF.
      "有筛选其他状态的排除已下单的
      IF lt_inqid IS NOT INITIAL AND lv_ordered IS NOT INITIAL.
        SELECT DISTINCT inquiryid FROM zticec_inquiry_q
          INTO TABLE @lt_orderedinq
          FOR ALL ENTRIES IN @lt_inqid
          WHERE inquiryid = @lt_inqid-inquiryid
            AND sellstatus = 'ORDERED'.
        IF sy-subrc EQ 0.
          DATA(lt_inq_tmp) = FILTER #( lt_inqid EXCEPT IN lt_orderedinq WHERE inquiryid = inquiryid ).
          CLEAR: lt_inqid.
          APPEND LINES OF lt_inq_tmp TO lt_inqid.
        ENDIF.
      ENDIF.
    ELSE.
      IF lr_companyid IS INITIAL AND iv_terminal = 'PHONE' AND so_cusname IS NOT INITIAL.
      ELSE.
        SELECT DISTINCT h~inquiryid,h~custcompanyid,t~amount,t~preamount,h~createdate,h~createtime FROM zticec_inquiry_h AS h
          INNER JOIN zticec_inquiry_q AS q ON h~inquiryid = q~inquiryid
          LEFT JOIN zticec_inquiry_t AS t ON h~inquiryid = t~inquiryid
          INTO CORRESPONDING FIELDS OF TABLE @lt_inqid
          WHERE h~inquiryid IN @so_inquiryid
            AND h~createdate IN @so_createdate
            AND h~statusid IN @so_statusid
            AND h~carbrandid IN @so_carbrandid
            AND h~sourceid IN @so_sourceid
            AND h~inquirytype IN @so_inquirytype
            AND h~custcompanyid IN @lr_companyid
            AND h~inquiryway IN @so_inquiryway
            AND h~foundstate IN @so_foundstate
            AND q~sellstatus = 'ORDERED'.
      ENDIF.

      IF lt_usercompanyid IS NOT INITIAL.
        SELECT DISTINCT h~inquiryid,h~custcompanyid,t~amount,t~preamount,createdate,createtime FROM zticec_inquiry_h AS h
          INNER JOIN zticec_inquiry_q AS q ON h~inquiryid = q~inquiryid
          LEFT JOIN zticec_inquiry_t AS t ON h~inquiryid = t~inquiryid
          APPENDING CORRESPONDING FIELDS OF TABLE @lt_inqid
          FOR ALL ENTRIES IN @lt_usercompanyid
          WHERE h~inquiryid IN @so_inquiryid
            AND h~createdate IN @so_createdate
            AND h~statusid IN @so_statusid
            AND h~carbrandid IN @so_carbrandid
            AND h~sourceid IN @so_sourceid
            AND h~inquirytype IN @so_inquirytype
            AND h~custcompanyid = @lt_usercompanyid-companyid
            AND h~inquiryway IN @so_inquiryway
            AND h~foundstate IN @so_foundstate
            AND q~sellstatus = 'ORDERED'.
      ENDIF.
    ENDIF.

    SORT lt_inqid BY inquiryid custcompanyid.
    DELETE ADJACENT DUPLICATES FROM lt_inqid COMPARING inquiryid custcompanyid.

    DATA:lv_from      TYPE int4,
         lv_to        TYPE int4,
         lv_mod       TYPE int4,
         lr_storetemp TYPE RANGE OF ztint_ven_inf-productstoreid.

    IF ( lr_storeid IS NOT INITIAL OR lt_userstore IS NOT INITIAL ) AND lt_inqid IS NOT INITIAL AND so_venname IS NOT INITIAL.
      "so_venname有值，表示取BD,拓展两个角色的交集
      LOOP AT lt_userstore INTO DATA(ls_store).
        lr_storeid = VALUE #( BASE lr_storeid ( sign = 'I' option = 'EQ' low = ls_store-productstoreid ) ).
      ENDLOOP.
      DATA(lv_cnt) = lines( lr_storeid ).
      DATA(lv_div) = lv_cnt DIV 30000.
      lv_mod = lv_cnt MOD 30000.
      IF lv_mod NE 0.
        lv_div = lv_div + 1.
      ENDIF.

      DO lv_div TIMES.
        lv_from = ( sy-index - 1 ) * 30000 + 1.
        lv_to = sy-index * 30000.
        IF lv_to > lv_cnt.
          lv_to = lv_cnt.
        ENDIF.

        APPEND LINES OF lr_storeid FROM lv_from TO lv_to  TO lr_storetemp .

        SELECT DISTINCT h~inquiryid,h~custcompanyid,t~amount,t~preamount,h~createdate,h~createtime FROM zticec_inquiry_h AS h
          INNER JOIN zticec_inquiry_v AS v ON h~inquiryid = v~inquiryid
          LEFT JOIN zticec_inquiry_t AS t ON h~inquiryid = t~inquiryid
          APPENDING TABLE @DATA(lt_inqid_1) FOR ALL ENTRIES IN @lt_inqid
          WHERE h~inquiryid = @lt_inqid-inquiryid AND v~productstoreid IN @lr_storetemp.
        CLEAR:lr_storetemp.
      ENDDO.
      IF so_venname IS NOT INITIAL."取交集，取当前询价单里面的符合条件的
        CLEAR: lt_inqid.
      ENDIF.
      APPEND LINES OF lt_inqid_1 TO lt_inqid.
    ELSEIF ( lr_storeid IS NOT INITIAL OR lt_userstore IS NOT INITIAL ) AND so_venname IS INITIAL.
      "取BD,拓展两个角色的并集
      LOOP AT lt_userstore INTO ls_store.
        lr_storeid = VALUE #( BASE lr_storeid ( sign = 'I' option = 'EQ' low = ls_store-productstoreid ) ).
      ENDLOOP.
      lv_cnt = lines( lr_storeid ).
      lv_div = lv_cnt DIV 30000.
      lv_mod = lv_cnt MOD 30000.
      IF lv_mod NE 0.
        lv_div = lv_div + 1.
      ENDIF.

      DO lv_div TIMES.
        lv_from = ( sy-index - 1 ) * 30000 + 1.
        lv_to = sy-index * 30000.
        IF lv_to > lv_cnt.
          lv_to = lv_cnt.
        ENDIF.

        APPEND LINES OF lr_storeid FROM lv_from TO lv_to  TO lr_storetemp .

        SELECT DISTINCT h~inquiryid,h~custcompanyid,t~amount,t~preamount,h~createdate,h~createtime FROM zticec_inquiry_h AS h
          INNER JOIN zticec_inquiry_v AS v ON h~inquiryid = v~inquiryid
          LEFT JOIN zticec_inquiry_t AS t ON h~inquiryid = t~inquiryid
          APPENDING CORRESPONDING FIELDS OF TABLE @lt_inqid
          WHERE h~inquiryid IN @so_inquiryid
            AND h~createdate IN @so_createdate
            AND h~statusid IN @so_statusid
            AND h~carbrandid IN @so_carbrandid
            AND h~sourceid IN @so_sourceid
            AND h~inquirytype IN @so_inquirytype
            AND h~inquiryway IN @so_inquiryway
            AND h~foundstate IN @so_foundstate
            AND v~productstoreid IN @lr_storetemp.
        CLEAR:lr_storetemp.
      ENDDO.
      SORT lt_inqid BY inquiryid.
      DELETE ADJACENT DUPLICATES FROM lt_inqid COMPARING inquiryid.
      IF lv_ordered IS NOT INITIAL.
        CLEAR lt_orderedinq.
        SELECT DISTINCT inquiryid FROM zticec_inquiry_q
         INTO TABLE @lt_orderedinq
         FOR ALL ENTRIES IN @lt_inqid
         WHERE inquiryid = @lt_inqid-inquiryid
           AND sellstatus = 'ORDERED'.
        IF sy-subrc EQ 0.
          IF lv_ordered EQ 'ORDERED'.
            DATA(lt_inq_2) = FILTER #( lt_inqid IN lt_orderedinq WHERE inquiryid = inquiryid ).
          ELSE.
            lt_inq_2 = FILTER #( lt_inqid EXCEPT IN lt_orderedinq WHERE inquiryid = inquiryid ).
          ENDIF.
          CLEAR: lt_inqid.
          APPEND LINES OF lt_inq_2 TO lt_inqid.
        ENDIF.
      ENDIF.
    ENDIF.

*****将分页提前，后面的不需要查所有询价单的
    IF iv_orderby IS INITIAL OR  iv_orderby = 'Lastcreate'.
      SORT lt_inqid BY createdate DESCENDING createtime DESCENDING.
    ELSEIF iv_orderby = 'Amountasc'.
      SORT lt_inqid BY amount ASCENDING.
    ELSEIF iv_orderby =  'Amountdes'.
      SORT lt_inqid BY amount DESCENDING .
    ENDIF.

    DATA: lv_total TYPE int4.
    DATA: lv_pagetotal TYPE int4.
    DATA: lv_page TYPE int4,
          lv_size TYPE int4.
    CLEAR:lv_from,lv_to,lv_mod,lv_total,lv_pagetotal,lv_mod,lv_page,lv_size.
    "分页
    IF iv_export IS INITIAL.

      IF iv_page IS INITIAL . "没有这显示第一页
        lv_page = 1.
      ELSE.
        lv_page = iv_page.
      ENDIF.

      IF iv_size IS INITIAL. "没有则默认50条
        lv_size = 20.
      ELSE.
        lv_size = iv_size.
      ENDIF.

      ev_totalsize = lines( lt_inqid )."总条目数
      lv_mod = ev_totalsize MOD lv_size.
      ev_totalpage = ev_totalsize DIV lv_size. "总页数
      IF lv_mod NE 0.
        ev_totalpage = ev_totalpage + 1.
      ENDIF.
      IF lv_page > ev_totalpage. "当前页数不能大于总页数
        RETURN.
      ENDIF.

      lv_from = ( lv_page - 1 ) * lv_size + 1."条数开始
      lv_to = lv_page * lv_size."条数结束
      APPEND LINES OF lt_inqid FROM lv_from TO lv_to TO et_inquiry.
    ELSE.
      APPEND LINES OF lt_inqid TO et_inquiry.
    ENDIF.

  ENDMETHOD.


  METHOD get_inquiry_data_new_v3.
    DATA:lr_isdelete   TYPE RANGE OF ztint_cus_inf-isdelete,
         lr_userdelete TYPE RANGE OF ztint_ven_user-isdelete,
         lr_userttype  TYPE RANGE OF ztint_cus_user-usertype,
         lr_userpre    TYPE RANGE OF ztint_ven_user-ispre.

    DATA:lr_storeid          TYPE RANGE OF ztint_ven_inf-productstoreid,
         lr_spstoreid        TYPE RANGE OF ztint_ven_inf-productstoreid,
         lr_storeid_filter   TYPE RANGE OF ztint_ven_inf-productstoreid,
         lr_companyid_tmp    TYPE RANGE OF ztint_cus_inf-companyid,
         lr_companyid_filter TYPE RANGE OF ztint_cus_inf-companyid,
         lr_companyid        TYPE RANGE OF ztint_cus_inf-companyid,
         lr_spcompanyid      TYPE RANGE OF ztint_cus_inf-companyid,
         lv_ordered          TYPE string.
    TYPES:BEGIN OF ty_cus,
            companyid TYPE ztint_cus_inf-companyid,
          END OF ty_cus.
    DATA:lt_usercompanyid TYPE SORTED TABLE OF ty_cus WITH NON-UNIQUE KEY companyid .
    TYPES:BEGIN OF ty_ven,
            productstoreid TYPE ztint_ven_inf-productstoreid,
          END OF ty_ven.
    DATA:lt_userstore TYPE SORTED TABLE OF ty_ven WITH NON-UNIQUE KEY productstoreid.
    TYPES:BEGIN OF ty_inq,
            inquiryid TYPE zticec_inquiry_h-inquiryid,
          END OF ty_inq.
    DATA:lt_inqid_order TYPE SORTED TABLE OF ty_inq WITH NON-UNIQUE KEY inquiryid.
    DATA:lv_cnt  TYPE int4,
         lv_div  TYPE int4,
         lv_mod  TYPE int4,
         lv_from TYPE int4,
         lv_to   TYPE int4.

    IF iv_isdelete EQ 'X'.
      lr_isdelete = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
      lr_userdelete  = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
      lr_userpre  = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
    ELSE.
      lr_userdelete  = VALUE #( ( sign = 'I' option = 'EQ' low = '' ) ).
      lr_userpre  = VALUE #( ( sign = 'I' option = 'EQ' low = '' ) ).
    ENDIF.

    IF so_userid IS NOT INITIAL."如果指定查客户经理，就只能查客户经理的，不能查协同人
      lr_userttype = VALUE #( ( sign = 'I' option = 'EQ' low = '1' ) ).
    ENDIF.

    IF ( mv_type EQ '1' OR mv_type EQ '4' ) AND so_userid IS NOT INITIAL.."1权限查指定客户经理的，先将指定客户经理的客户捞出来
      SELECT companyid
         INTO TABLE @lt_usercompanyid FROM ztint_cus_inf AS i
        INNER JOIN ztint_cus_user AS u ON i~cusid = u~cusid
       WHERE userid IN @so_userid AND usertype IN @lr_userttype AND u~ispre IN @lr_userpre
         AND u~isdelete IN @lr_userdelete AND companyid NE ''.
      IF lt_usercompanyid IS INITIAL.
        EXIT.
      ENDIF.
    ELSEIF mv_type EQ '2' OR mv_type EQ '3'.
      "2,3权限的，先看负责区域的人员清单
      get_person( EXPORTING so_userid = so_userid
              IMPORTING et_userlist = DATA(lt_userlist) ).
      "查人员列表下负责的客户经理负责的客户和拓展负责的店铺
      IF lt_userlist IS NOT INITIAL.
        "作为客户经理或协同人
        SELECT companyid INTO TABLE @lt_usercompanyid FROM ztint_cus_inf AS i
          INNER JOIN ztint_cus_user AS u ON i~cusid = u~cusid
          FOR ALL ENTRIES IN @lt_userlist
         WHERE userid = @lt_userlist-userid AND usertype IN @lr_userttype AND u~ispre IN @lr_userpre
           AND u~isdelete IN @lr_userdelete AND companyid NE ''.
        "作为拓展
        SELECT productstoreid INTO  TABLE @lt_userstore FROM ztint_ven_inf AS i
          INNER JOIN ztint_ven_user AS u ON i~venid = u~venid
          FOR ALL ENTRIES IN @lt_userlist
          WHERE userid = @lt_userlist-userid AND u~isdelete = '' AND productstoreid NE ''.
        IF lt_usercompanyid IS INITIAL AND lt_userstore IS INITIAL.
          EXIT.
        ENDIF.
      ELSE."
        IF so_userid IS NOT INITIAL.
          "一种情况，如果没有查看供应商的权限，就不能看指定的客户经理的权限
          "另外一种，拓展要看这个客户经理负责的客户在自己所能看到的店铺的单
          DATA(lv_spical) = 'X'.
          "作为客户经理或协同人
          SELECT  'I' AS sign,'EQ' AS option,companyid AS low FROM ztint_cus_inf AS i
            INNER JOIN ztint_cus_user AS u ON i~cusid = u~cusid
            INTO CORRESPONDING FIELDS OF TABLE @lr_spcompanyid
           WHERE userid IN @so_userid AND usertype = '1' AND u~ispre = '' AND u~isdelete = '' AND companyid NE ''.
          "作为拓展
          SELECT'I' AS sign,'EQ' AS option,productstoreid AS low
            FROM ztint_ven_inf AS i INNER JOIN ztint_ven_user AS u ON i~venid = u~venid
            INTO CORRESPONDING FIELDS OF TABLE @lr_spstoreid
            WHERE userid = @mv_userid AND u~isdelete = '' AND productstoreid NE '' .
        ELSE.
          EXIT.
        ENDIF.
      ENDIF.
    ENDIF.

    "根据筛选条件处理客户和店铺的范围
    IF iv_terminal = 'PHONE'."特殊处理：APP上的客户和店铺用的同一个字段
      IF so_cusname IS NOT INITIAL.
        SELECT 'I' AS sign,'EQ' AS option,productstoreid AS low
          INTO CORRESPONDING FIELDS OF TABLE @lr_storeid
          FROM ztint_ven_inf
         WHERE ( venname IN @so_cusname OR displayname IN @so_cusname OR productstoreid IN @so_cusname )
           AND productstoreid NE ''.

        SELECT 'I' AS sign,'EQ' AS option,companyid AS low
          INTO CORRESPONDING FIELDS OF TABLE @lr_companyid
          FROM ztint_cus_inf
         WHERE ( cusname IN @so_cusname OR displayname IN @so_cusname OR companycode IN @so_cusname )
           AND companyid NE ''.
      ENDIF.

      "如果手机上的还有其他客户的限制条件，当cusname有值的话查询就是查询一个客户等于cusname的且包含其他客户查询条件的
      "一个是客户符合其他查询条件且店铺等于cusname的
      IF so_companycode IS NOT INITIAL OR so_custcompanyid IS NOT INITIAL OR so_citygeoid IS NOT INITIAL OR  so_zoneid IS NOT INITIAL.
        SELECT 'I' AS sign,'EQ' AS option,companyid AS low
          INTO CORRESPONDING FIELDS OF TABLE @lr_companyid_tmp
          FROM ztint_cus_inf
         WHERE companycode IN @so_companycode AND companyid IN @so_custcompanyid AND companyid IN @lr_companyid
           AND ( provincegeoid IN @so_citygeoid OR citygeoid IN @so_citygeoid OR countygeoid IN @so_citygeoid )
           AND companyid NE ''
           AND zoneid IN @so_zoneid.
        CLEAR lr_companyid.
        lr_companyid = lr_companyid_tmp.
        CLEAR lr_companyid_tmp.
      ENDIF.
    ELSE.
      IF so_cusname IS NOT INITIAL OR so_companycode IS NOT INITIAL OR so_custcompanyid IS NOT INITIAL OR
       so_citygeoid IS NOT INITIAL OR so_zoneid IS NOT INITIAL.
        SELECT 'I' AS sign,'EQ' AS option,companyid AS low
          INTO CORRESPONDING FIELDS OF TABLE @lr_companyid
          FROM ztint_cus_inf
         WHERE ( cusname IN @so_cusname OR displayname IN @so_cusname OR companycode IN @so_cusname )
          AND companycode IN @so_companycode
          AND companyid IN @so_custcompanyid
          AND companyid NE ''
          AND ( provincegeoid IN @so_citygeoid OR citygeoid IN @so_citygeoid OR countygeoid IN @so_citygeoid )
          AND zoneid IN @so_zoneid.
      ENDIF.

      IF so_venname IS NOT INITIAL.
        SELECT 'I' AS sign,'EQ' AS option,productstoreid AS low
          INTO CORRESPONDING FIELDS OF TABLE @lr_storeid
          FROM ztint_ven_inf
         WHERE ( venname IN @so_venname OR displayname IN @so_venname OR productstoreid IN @so_venname )
           AND productstoreid NE ''.
      ENDIF.
    ENDIF.


    IF so_statusid IS NOT INITIAL.
      lv_ordered = VALUE #( so_statusid[ 1 ]-low OPTIONAL ) .
      IF lv_ordered EQ 'ORDERED'.
        DELETE so_statusid WHERE low EQ 'ORDERED'.
      ENDIF.
    ENDIF.

    "限制90天
    DATA lv_date TYPE sy-datum.
    IF so_inquiryid IS INITIAL AND so_createdate IS INITIAL.
      DATA(lv_eq) = VALUE #( so_custcompanyid[ 1 ]-option OPTIONAL )."指定了客户的，不限制时间
      IF lv_eq NE 'EQ'.
        lv_date = sy-datum - 90.
        so_createdate = VALUE #( ( sign = 'I' option = 'BT' low = lv_date high = sy-datum ) ).
      ENDIF.
    ELSE.
      "询价单输入全了，拿掉时间限制
      DATA(lv_inquiry) = VALUE #( so_inquiryid[ 1 ]-low OPTIONAL ).
      CONDENSE lv_inquiry.
      "*B21100770891*
      IF strlen( lv_inquiry ) = 14.
        CLEAR so_createdate.
      ENDIF.
    ENDIF.


    "CF-查询条件能查询到的客户
    "CA-权限能查询到的客户
    "SF-查询条件能查询到的店铺
    "SA-权限能查询到的店铺
    IF iv_terminal EQ 'PHONE' AND so_cusname IS NOT INITIAL.
      IF lr_companyid IS NOT INITIAL AND lt_usercompanyid IS NOT INITIAL.
        lr_companyid_filter = FILTER #( lr_companyid IN lt_usercompanyid WHERE low = companyid ).
      ELSEIF lr_companyid IS INITIAL AND lt_usercompanyid IS NOT INITIAL.
        lr_companyid_filter = VALUE #(  FOR wa IN lt_usercompanyid ( sign = 'I' option = 'EQ' low = wa-companyid ) ).
      ELSEIF lr_companyid IS NOT INITIAL AND lt_usercompanyid IS INITIAL.
        lr_companyid_filter = lr_companyid.
      ENDIF.

      IF lr_storeid IS NOT INITIAL AND lt_userstore IS NOT INITIAL.
        lr_storeid_filter = FILTER #( lr_storeid IN lt_userstore WHERE low = productstoreid ).
      ELSEIF lr_storeid IS INITIAL AND lt_userstore IS NOT INITIAL.
        lr_storeid_filter = VALUE #(  FOR wav IN lt_userstore ( sign = 'I' option = 'EQ' low = wav-productstoreid ) ).
      ELSEIF lr_storeid IS NOT INITIAL AND lt_userstore IS INITIAL.
        lr_storeid_filter = lr_storeid.
      ENDIF.

      "2种状况
      lv_cnt = lines( lr_companyid_filter ).
      lv_div = lv_cnt DIV 30000.
      lv_mod = lv_cnt MOD 30000.
      IF lv_mod NE 0 OR lv_cnt EQ 0.
        lv_div = lv_div + 1.
      ENDIF.
      DO lv_div TIMES.
        lv_from = ( sy-index - 1 ) * 30000 + 1.
        lv_to = sy-index * 30000.
        IF lv_to > lv_cnt.
          lv_to = lv_cnt.
        ENDIF.
        IF lv_cnt NE 0.
          APPEND LINES OF lr_companyid_filter FROM lv_from TO lv_to TO lr_companyid_tmp.
        ENDIF.

        IF lr_companyid_tmp IS NOT INITIAL OR lr_spcompanyid IS NOT INITIAL.
          SELECT h~inquiryid FROM zticec_inquiry_h AS h
             INTO TABLE @DATA(lt_inqid)
             WHERE h~inquiryid IN @so_inquiryid
               AND h~createdate IN @so_createdate
               AND h~statusid IN @so_statusid
               AND h~carbrandid IN @so_carbrandid
               AND h~sourceid IN @so_sourceid
               AND h~inquirytype IN @so_inquirytype
               AND h~custcompanyid IN @lr_companyid_tmp
               AND h~custcompanyid IN @lr_spcompanyid
               AND h~inquiryway IN @so_inquiryway
               AND h~foundstate IN @so_foundstate.
        ENDIF.
        IF ( lr_companyid IS NOT INITIAL OR lr_spcompanyid IS NOT INITIAL ) AND
          ( lr_storeid_filter IS NOT INITIAL OR lr_spstoreid IS NOT INITIAL ).
          SELECT h~inquiryid FROM zticec_inquiry_h AS h INNER JOIN zticec_inquiry_v AS v ON h~inquiryid = v~inquiryid
             APPENDING CORRESPONDING FIELDS OF TABLE @lt_inqid
             WHERE h~inquiryid IN @so_inquiryid
               AND h~createdate IN @so_createdate
               AND h~statusid IN @so_statusid
               AND h~carbrandid IN @so_carbrandid
               AND h~sourceid IN @so_sourceid
               AND h~inquirytype IN @so_inquirytype
               AND h~custcompanyid IN @lr_companyid
               AND h~custcompanyid IN @lr_spcompanyid
               AND v~productstoreid IN @lr_storeid_filter
               AND v~productstoreid IN @lr_spstoreid
               AND h~inquiryway IN @so_inquiryway
               AND h~foundstate IN @so_foundstate.
        ENDIF.
        CLEAR:lv_from,lv_to,lr_companyid_tmp.
      ENDDO.
    ELSE.
      IF lv_spical IS INITIAL.
        IF lr_companyid IS INITIAL AND lt_usercompanyid IS INITIAL AND lr_storeid IS INITIAL
          AND lt_userstore IS INITIAL.
          SELECT h~inquiryid FROM zticec_inquiry_h AS h
              APPENDING CORRESPONDING FIELDS OF TABLE @lt_inqid
             WHERE h~inquiryid IN @so_inquiryid
               AND h~createdate IN @so_createdate
               AND h~statusid IN @so_statusid
               AND h~carbrandid IN @so_carbrandid
               AND h~sourceid IN @so_sourceid
               AND h~inquirytype IN @so_inquirytype
               AND h~custcompanyid IN @lr_companyid_tmp
               AND h~inquiryway IN @so_inquiryway
               AND h~foundstate IN @so_foundstate.
        ELSE.
          "作为BD:CF与CA取交集 再限制SF
          IF lr_companyid IS NOT INITIAL AND lt_usercompanyid IS NOT INITIAL.
            lr_companyid_filter = FILTER #( lr_companyid IN lt_usercompanyid WHERE low = companyid ).
          ELSEIF lr_companyid IS INITIAL AND lt_usercompanyid IS NOT INITIAL.
            lr_companyid_filter = VALUE #( FOR wa IN lt_usercompanyid ( sign = 'I' option = 'EQ' low = wa-companyid ) ).
          ELSEIF lr_companyid IS NOT INITIAL AND lt_usercompanyid IS INITIAL.
            lr_companyid_filter = lr_companyid.
          ENDIF.

          IF lr_companyid_filter IS NOT INITIAL.
            lv_cnt = lines( lr_companyid_filter ).
            lv_div = lv_cnt DIV 30000.
            lv_mod = lv_cnt MOD 30000.
            IF lv_mod NE 0.
              lv_div = lv_div + 1.
            ENDIF.
            DO lv_div TIMES.
              lv_from = ( sy-index - 1 ) * 30000 + 1.
              lv_to = sy-index * 30000.
              IF lv_to > lv_cnt.
                lv_to = lv_cnt.
              ENDIF.
              APPEND LINES OF lr_companyid_filter FROM lv_from TO lv_to TO lr_companyid_tmp.
              IF lr_storeid IS INITIAL.
                SELECT h~inquiryid FROM zticec_inquiry_h AS h
                    APPENDING CORRESPONDING FIELDS OF TABLE @lt_inqid
                   WHERE h~inquiryid IN @so_inquiryid
                     AND h~createdate IN @so_createdate
                     AND h~statusid IN @so_statusid
                     AND h~carbrandid IN @so_carbrandid
                     AND h~sourceid IN @so_sourceid
                     AND h~inquirytype IN @so_inquirytype
                     AND h~custcompanyid IN @lr_companyid_tmp
                     AND h~inquiryway IN @so_inquiryway
                     AND h~foundstate IN @so_foundstate.
              ELSE.
                SELECT h~inquiryid FROM zticec_inquiry_h AS h INNER JOIN zticec_inquiry_v AS v ON h~inquiryid = v~inquiryid
                   APPENDING CORRESPONDING FIELDS OF TABLE @lt_inqid
                   WHERE h~inquiryid IN @so_inquiryid
                     AND h~createdate IN @so_createdate
                     AND h~statusid IN @so_statusid
                     AND h~carbrandid IN @so_carbrandid
                     AND h~sourceid IN @so_sourceid
                     AND h~inquirytype IN @so_inquirytype
                     AND h~custcompanyid IN @lr_companyid_tmp
                     AND v~productstoreid IN @lr_storeid
                     AND h~inquiryway IN @so_inquiryway
                     AND h~foundstate IN @so_foundstate.
              ENDIF.
              CLEAR:lv_from,lv_to,lr_companyid_tmp..
            ENDDO.
          ENDIF.

          "作为拓展:SF与SA取交集 再限制CF
          IF lr_storeid IS NOT INITIAL AND lt_userstore IS NOT INITIAL.
            lr_storeid_filter = FILTER #( lr_storeid IN lt_userstore WHERE low = productstoreid ).
          ELSEIF  lr_storeid IS INITIAL AND lt_userstore IS NOT INITIAL.
            lr_storeid_filter = VALUE #( FOR was IN lt_userstore ( sign = 'I' option = 'EQ' low = was-productstoreid ) ).
          ELSEIF  lr_storeid IS NOT INITIAL AND lt_userstore IS INITIAL.
            lr_storeid_filter = lr_storeid.
          ENDIF.

          IF so_userid IS NOT INITIAL.
            IF lr_companyid IS NOT INITIAL AND lt_usercompanyid IS NOT INITIAL.
              lr_companyid = FILTER #( lr_companyid IN lt_usercompanyid WHERE low = companyid ).
            ELSEIF lr_companyid IS INITIAL AND lt_usercompanyid IS NOT INITIAL.
              lr_companyid = VALUE #( FOR wa IN lt_usercompanyid ( sign = 'I' option = 'EQ' low = wa-companyid ) ).
            ENDIF.
          ENDIF.

          IF lr_storeid_filter IS NOT INITIAL.
            lv_cnt = lines( lr_companyid ).
            lv_div = lv_cnt DIV 30000.
            lv_mod = lv_cnt MOD 30000.
            IF lv_mod NE 0 OR lv_cnt EQ 0.
              lv_div = lv_div + 1.
            ENDIF.

            DO lv_div TIMES.
              lv_from = ( sy-index - 1 ) * 30000 + 1.
              lv_to = sy-index * 30000.
              IF lv_to > lv_cnt.
                lv_to = lv_cnt.
              ENDIF.
              IF lv_cnt NE 0.
                APPEND LINES OF lr_companyid FROM lv_from TO lv_to TO lr_companyid_tmp.
              ENDIF.

              SELECT h~inquiryid FROM zticec_inquiry_h AS h INNER JOIN zticec_inquiry_v AS v ON h~inquiryid = v~inquiryid
                 APPENDING CORRESPONDING FIELDS OF TABLE @lt_inqid
                 WHERE h~inquiryid IN @so_inquiryid
                   AND h~createdate IN @so_createdate
                   AND h~statusid IN @so_statusid
                   AND h~carbrandid IN @so_carbrandid
                   AND h~sourceid IN @so_sourceid
                   AND h~inquirytype IN @so_inquirytype
                   AND h~custcompanyid IN @lr_companyid_tmp
                   AND v~productstoreid IN @lr_storeid_filter
                   AND h~inquiryway IN @so_inquiryway
                   AND h~foundstate IN @so_foundstate.
              CLEAR:lv_from,lv_to,lr_companyid_tmp.
            ENDDO.
          ENDIF.
        ENDIF.
      ELSEIF lv_spical IS NOT INITIAL."拓展3权限且筛选
        IF lr_companyid IS NOT INITIAL OR lr_spcompanyid IS NOT INITIAL OR
          lr_storeid IS NOT INITIAL OR lr_spstoreid IS NOT INITIAL.

          lv_cnt = lines( lr_companyid ).
          lv_div = lv_cnt DIV 30000.
          lv_mod = lv_cnt MOD 30000.
          IF lv_mod NE 0 OR lv_cnt EQ 0.
            lv_div = lv_div + 1.
          ENDIF.
          "2种状况
          DO lv_div TIMES.
            lv_from = ( sy-index - 1 ) * 30000 + 1.
            lv_to = sy-index * 30000.
            IF lv_to > lv_cnt.
              lv_to = lv_cnt.
            ENDIF.
            IF lv_cnt NE 0.
              APPEND LINES OF lr_companyid FROM lv_from TO lv_to TO lr_companyid_tmp.
            ENDIF.

            SELECT h~inquiryid FROM zticec_inquiry_h AS h INNER JOIN zticec_inquiry_v AS v ON h~inquiryid = v~inquiryid
               APPENDING CORRESPONDING FIELDS OF TABLE @lt_inqid
               WHERE h~inquiryid IN @so_inquiryid
                 AND h~createdate IN @so_createdate
                 AND h~statusid IN @so_statusid
                 AND h~carbrandid IN @so_carbrandid
                 AND h~sourceid IN @so_sourceid
                 AND h~inquirytype IN @so_inquirytype
                 AND h~custcompanyid IN @lr_companyid_tmp
                 AND h~custcompanyid IN @lr_spcompanyid
                 AND v~productstoreid IN @lr_storeid
                 AND v~productstoreid IN @lr_spstoreid
                 AND h~inquiryway IN @so_inquiryway
                 AND h~foundstate IN @so_foundstate.
            CLEAR:lv_from,lv_to,lr_companyid_tmp..
          ENDDO.
        ENDIF.
      ENDIF.
    ENDIF.
    CHECK lt_inqid IS NOT INITIAL.

    IF lt_inqid IS NOT INITIAL.
      IF lv_ordered IS NOT INITIAL.
        "查询下单的询价单
        SELECT DISTINCT q~inquiryid FROM zticec_inquiry_q AS q
          INTO CORRESPONDING FIELDS OF TABLE @lt_inqid_order
          FOR ALL ENTRIES IN @lt_inqid
          WHERE q~inquiryid = @lt_inqid-inquiryid
            AND q~sellstatus = 'ORDERED'.

        IF lv_ordered EQ 'ORDERED'.
          DATA(lt_inqid_1) = FILTER #( lt_inqid IN lt_inqid_order WHERE inquiryid = inquiryid ).
        ELSE."筛选其他状态
          lt_inqid_1 = FILTER #( lt_inqid EXCEPT IN lt_inqid_order WHERE inquiryid = inquiryid ).
        ENDIF.
        CLEAR lt_inqid.
        APPEND LINES OF lt_inqid_1 TO lt_inqid.
        CLEAR lt_inqid_1.

        CHECK lt_inqid IS NOT INITIAL.
      ENDIF.

      SELECT DISTINCT h~inquiryid,h~custcompanyid,t~amount,t~preamount,h~createdate,h~createtime FROM zticec_inquiry_h AS h
        LEFT JOIN zticec_inquiry_t AS t ON h~inquiryid = t~inquiryid
        INTO TABLE @DATA(lt_inquirydata)
        FOR ALL ENTRIES IN @lt_inqid
        WHERE h~inquiryid = @lt_inqid-inquiryid.
    ENDIF.

*****将分页提前，后面的不需要查所有询价单的
    IF iv_orderby IS INITIAL OR  iv_orderby = 'Lastcreate'.
      SORT lt_inquirydata BY createdate DESCENDING createtime DESCENDING.
    ELSEIF iv_orderby = 'Amountasc'.
      SORT lt_inquirydata BY amount ASCENDING.
    ELSEIF iv_orderby =  'Amountdes'.
      SORT lt_inquirydata BY amount DESCENDING .
    ENDIF.

    DATA: lv_total TYPE int4.
    DATA: lv_pagetotal TYPE int4.
    DATA: lv_page TYPE int4,
          lv_size TYPE int4.
    CLEAR:lv_from,lv_to,lv_mod,lv_total,lv_pagetotal,lv_mod,lv_page,lv_size.
    "分页
    IF iv_export IS INITIAL.

      IF iv_page IS INITIAL . "没有这显示第一页
        lv_page = 1.
      ELSE.
        lv_page = iv_page.
      ENDIF.

      IF iv_size IS INITIAL. "没有则默认50条
        lv_size = 20.
      ELSE.
        lv_size = iv_size.
      ENDIF.

      ev_totalsize = lines( lt_inquirydata )."总条目数
      lv_mod = ev_totalsize MOD lv_size.
      ev_totalpage = ev_totalsize DIV lv_size. "总页数
      IF lv_mod NE 0.
        ev_totalpage = ev_totalpage + 1.
      ENDIF.
      IF lv_page > ev_totalpage. "当前页数不能大于总页数
        RETURN.
      ENDIF.

      lv_from = ( lv_page - 1 ) * lv_size + 1."条数开始
      lv_to = lv_page * lv_size."条数结束
      APPEND LINES OF lt_inquirydata FROM lv_from TO lv_to TO et_inquiry.
    ELSE.
      APPEND LINES OF lt_inquirydata TO et_inquiry.
    ENDIF.

  ENDMETHOD.


  METHOD get_inquiry_data_new_v4.
    DATA:lr_venid TYPE RANGE OF ztint_ven_inf-venid.
    DATA:ls_option TYPE /iwbep/s_cod_select_option.
    DATA:so_ksyx TYPE /iwbep/t_cod_select_options.
    DATA:so_ev TYPE /iwbep/t_cod_select_options.
    DATA:so_trfg TYPE /iwbep/t_cod_select_options.
    DATA:so_aipur TYPE /iwbep/t_cod_select_options.
    DATA:so_erpcus TYPE /iwbep/t_cod_select_options.
    DATA:so_yunorder TYPE /iwbep/t_cod_select_options.
    DATA:so_marketcus TYPE /iwbep/t_cod_select_options.
    DATA:so_shipstore TYPE /iwbep/t_cod_select_options.
    DATA:lr_isdelete   TYPE RANGE OF ztint_cus_inf-isdelete,
         lr_userdelete TYPE RANGE OF ztint_ven_user-isdelete,
         lr_userpre    TYPE RANGE OF ztint_ven_user-ispre,
         lv_ordered    TYPE string.
    DATA lv_date TYPE sy-datum.
    TYPES:BEGIN OF ty_inq,
            inquiryid TYPE zticec_inquiry_h-inquiryid,
          END OF ty_inq.
    DATA:lt_inqid_order TYPE SORTED TABLE OF ty_inq WITH NON-UNIQUE KEY inquiryid.
    TYPES:BEGIN OF ty_billno,
            billno TYPE ztint_followlist-billno,
          END OF ty_billno.
    DATA:lt_inqid_follow TYPE SORTED TABLE OF ty_billno WITH NON-UNIQUE KEY billno.

    DATA:lv_cnt  TYPE int4,
         lv_div  TYPE int4,
         lv_mod  TYPE int4,
         lv_from TYPE int4,
         lv_to   TYPE int4.
    READ TABLE so_label INTO DATA(ls_label) INDEX 1.
    IF sy-subrc EQ 0.
      LOOP AT ls_label-select_options INTO ls_option.
        CASE ls_option-low.
          WHEN 'KSYX'.
            so_ksyx = VALUE #( ( sign = 'I' option = 'EQ' low = 'X' ) ).
          WHEN 'EV'.
            so_ev = VALUE #( ( sign = 'I' option = 'EQ' low = '1' ) ).
          WHEN 'TRFG'.
            so_trfg = VALUE #( ( sign = 'I' option = 'EQ' low = 'X' ) ).
          WHEN 'YUN'. "共享仓订单
            so_yunorder = VALUE #( ( sign = 'I' option = 'EQ' low = 'X' ) ).
          WHEN 'ERP'.
            so_erpcus = VALUE #( ( sign = 'I' option = 'EQ' low = 'X' )
            ( sign = 'I' option = 'EQ' low = 'S' )
            ( sign = 'I' option = 'EQ' low = 'V' ) ).
          WHEN 'ERPVIP'.
            so_erpcus = VALUE #( ( sign = 'I' option = 'EQ' low = 'V' ) ).
          WHEN 'ERPSVIP'.
            so_erpcus = VALUE #( ( sign = 'I' option = 'EQ' low = 'S' ) ).
          WHEN 'MARKET'.
            so_marketcus = VALUE #( ( sign = 'I' option = 'EQ' low = 'X' )
            ( sign = 'I' option = 'EQ' low = 'V' )
            ( sign = 'I' option = 'EQ' low = 'S' ) ).
          WHEN 'MARKETV500'.
            so_marketcus = VALUE #( ( sign = 'I' option = 'EQ' low = 'V' )
            ( sign = 'I' option = 'EQ' low = 'S' ) ).
          WHEN 'MARKETV50'.
            so_marketcus = VALUE #( ( sign = 'I' option = 'EQ' low = 'V' ) ).
          WHEN 'SHIP'.
            SELECT 'I' AS sign,'EQ' AS option,val_low AS low
              INTO CORRESPONDING FIELDS OF TABLE @so_shipstore
              FROM ztbc_f4_config
             WHERE fnam = 'FLGSHIPSTORE'.
          WHEN 'AIPUR'.
            so_aipur = VALUE #( ( sign = 'I' option = 'EQ' low = 'Y' ) ).
          WHEN OTHERS.
        ENDCASE.
      ENDLOOP.
    ENDIF.

    IF iv_isdelete EQ 'X'.
      lr_isdelete = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
      lr_userdelete  = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
      lr_userpre  = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
    ELSE.
      lr_userdelete  = VALUE #( ( sign = 'I' option = 'EQ' low = '' ) ).
      lr_userpre  = VALUE #( ( sign = 'I' option = 'EQ' low = '' ) ).
    ENDIF.

    IF so_statusid IS NOT INITIAL.
      lv_ordered = VALUE #( so_statusid[ 1 ]-low OPTIONAL ) .
      IF lv_ordered EQ 'ORDERED'.
        DELETE so_statusid WHERE low EQ 'ORDERED'.
      ENDIF.
    ENDIF.

    "限制90天
    IF so_inquiryid IS INITIAL AND so_createdate IS INITIAL.
      DATA(lv_eq) = VALUE #( so_custcompanyid[ 1 ]-option OPTIONAL )."指定了客户的，不限制时间
      IF lv_eq NE 'EQ' AND lv_eq NE 'CP'.
        lv_date = sy-datum - 90.
        so_createdate = VALUE #( ( sign = 'I' option = 'BT' low = lv_date high = sy-datum ) ).
      ENDIF.
    ELSE.
      "询价单输入全了，拿掉时间限制
      DATA(lv_inquiry) = VALUE #( so_inquiryid[ 1 ]-low OPTIONAL ).
      CONDENSE lv_inquiry NO-GAPS.
      "*B21100770891*
      IF strlen( lv_inquiry ) >= 13.
        DATA:lr_inquiry TYPE RANGE OF zticec_inquiry_h-inquiryid.
        SELECT 'I' AS sign,'EQ' AS option,inquiryid AS low
        INTO CORRESPONDING FIELDS OF TABLE @lr_inquiry
        FROM zticec_inquiry_h
        WHERE inquiryid IN @so_inquiryid.
        IF sy-dbcnt <= 10 AND sy-subrc EQ 0.
          CLEAR:so_inquiryid,so_createdate.
          so_inquiryid = CORRESPONDING #( lr_inquiry ).
        ENDIF.
      ENDIF.
    ENDIF.

    "如果客户经理有入参，根据类型获取客户数据
    IF so_userid IS NOT INITIAL.
      DATA(lv_where) = COND string( WHEN iv_usertype EQ 'Userid' THEN |usertype = '1'|
                               WHEN iv_usertype EQ 'Airuserid' THEN |usertype = '2' and userchildtype = 'A'|
                               WHEN iv_usertype EQ 'Erpuserid' THEN |usertype = '2' and userchildtype = 'E'|
                               WHEN iv_usertype EQ 'Kfuserid' THEN |usertype = '2' and userchildtype = 'K'|
                               WHEN iv_usertype EQ 'Accuserid' THEN |usertype = '2' and userchildtype = ''|
                               ELSE |usertype = '1'| ).
      SELECT cusid INTO TABLE @DATA(lt_usercus) FROM ztint_cus_user
        WHERE userid IN @so_userid AND (lv_where) AND ispre = '' AND isdelete = ''.
      CHECK sy-subrc EQ 0.
    ENDIF.

    TRY.
        "IV_TERMINAL是终端来源-PC/PHONE
        "PC上，客户名称和商家名称是否分开的两个字段，而PHONE上是合在一个字段的，所以查数时需要区分
        IF ( mv_type EQ 1 OR mv_type EQ 4 ) AND so_userid IS INITIAL.
          IF ( iv_terminal EQ 'PC' AND so_venname IS INITIAL ) OR ( iv_terminal EQ 'PHONE'  AND so_cusname IS INITIAL ).
***            SQL_A
            SELECT DISTINCT a~inquiryid INTO TABLE @DATA(lt_inquiry) FROM zticec_inquiry_h AS a
                  INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
                  LEFT JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
                  LEFT JOIN ztint_area_city AS r ON c~provincegeoid = r~provincegeoid AND c~citygeoid = r~citygeoid
                        AND c~countygeoid = r~countygeoid AND c~villagegeoid = r~villageoid
                  WHERE ( c~cusname IN @so_cusname OR c~companycode IN @so_cusname OR c~displayname IN @so_cusname )
                  AND c~companycode IN @so_companycode AND c~companyid IN @so_custcompanyid AND r~regionid IN @so_zoneid
                  AND ( c~provincegeoid IN @so_citygeoid OR c~citygeoid IN @so_citygeoid OR c~countygeoid IN @so_citygeoid )
                  AND c~isdelete IN @lr_isdelete AND c~isvirtual = '' AND c~distribute = '' AND c~iserpcus IN @so_erpcus
                  AND c~marketvip IN @so_marketcus AND a~isproxy IN @so_isproxy AND a~personname IN @so_personname
                  AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid
                  AND a~carbrandid IN @so_carbrandid AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype
                  AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered AND a~foundstate IN @so_foundstate
                  AND a~ksbsinq IN @so_ksyx AND a~tyrefg IN @so_trfg AND a~carenergytype IN @so_ev AND a~yunflg IN @so_yunorder
                  AND a~assistantflg IN @so_aipur AND a~vin IN @so_vin AND v~productstoreid IN @so_shipstore.
          ELSEIF iv_terminal EQ 'PC' AND so_venname IS NOT INITIAL.
            SELECT DISTINCT a~inquiryid INTO TABLE @lt_inquiry FROM zticec_inquiry_h AS a
            INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
            INNER JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
                  LEFT JOIN ztint_area_city AS r ON c~provincegeoid = r~provincegeoid AND c~citygeoid = r~citygeoid
                        AND c~countygeoid = r~countygeoid AND c~villagegeoid = r~villageoid
            WHERE ( c~cusname IN @so_cusname OR c~companycode IN @so_cusname OR c~displayname IN @so_cusname )
            AND c~companycode IN @so_companycode AND c~companyid IN @so_custcompanyid AND r~regionid IN @so_zoneid
            AND ( v~productstoreid IN @so_venname OR v~venname IN @so_venname OR v~displayname IN @so_venname )
            AND ( c~provincegeoid IN @so_citygeoid OR c~citygeoid IN @so_citygeoid OR c~countygeoid IN @so_citygeoid )
            AND c~isdelete IN @lr_isdelete AND c~isvirtual = '' AND c~distribute = '' AND c~iserpcus IN @so_erpcus
            AND c~marketvip IN @so_marketcus  AND a~isproxy IN @so_isproxy AND a~personname IN @so_personname
            AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid
            AND a~carbrandid IN @so_carbrandid AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype
            AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered AND a~foundstate IN @so_foundstate
            AND a~ksbsinq IN @so_ksyx AND a~tyrefg IN @so_trfg AND a~carenergytype IN @so_ev AND a~yunflg IN @so_yunorder
            AND a~assistantflg IN @so_aipur AND a~vin IN @so_vin AND v~productstoreid IN @so_shipstore.
          ELSEIF iv_terminal EQ 'PHONE'  AND so_cusname IS NOT INITIAL.
            SELECT DISTINCT a~inquiryid INTO TABLE @lt_inquiry FROM zticec_inquiry_h AS a
            INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
            LEFT JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
                  LEFT JOIN ztint_area_city AS r ON c~provincegeoid = r~provincegeoid AND c~citygeoid = r~citygeoid
                        AND c~countygeoid = r~countygeoid AND c~villagegeoid = r~villageoid
            WHERE ( c~cusname IN @so_cusname OR c~companycode IN @so_cusname OR c~displayname IN @so_cusname  OR a~inquiryid IN @so_cusname )
            AND c~companycode IN @so_companycode AND c~companyid IN @so_custcompanyid AND r~regionid IN @so_zoneid
            AND ( c~provincegeoid IN @so_citygeoid OR c~citygeoid IN @so_citygeoid OR c~countygeoid IN @so_citygeoid )
            AND c~iserpcus IN @so_erpcus AND c~marketvip IN @so_marketcus AND a~isproxy IN @so_isproxy AND a~personname IN @so_personname
            AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid
            AND a~carbrandid IN @so_carbrandid AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype
            AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered AND a~foundstate IN @so_foundstate
            AND a~ksbsinq IN @so_ksyx AND a~tyrefg IN @so_trfg AND a~carenergytype IN @so_ev AND a~yunflg IN @so_yunorder
            AND a~assistantflg IN @so_aipur AND a~vin IN @so_vin AND v~productstoreid IN @so_shipstore.

            SELECT DISTINCT a~inquiryid APPENDING TABLE @lt_inquiry FROM zticec_inquiry_h AS a
            INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
            INNER JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
                  LEFT JOIN ztint_area_city AS r ON c~provincegeoid = r~provincegeoid AND c~citygeoid = r~citygeoid
                        AND c~countygeoid = r~countygeoid AND c~villagegeoid = r~villageoid
            WHERE c~companycode IN @so_companycode AND c~companyid IN @so_custcompanyid AND r~regionid IN @so_zoneid
            AND ( v~productstoreid IN @so_cusname OR v~venname IN @so_cusname OR v~displayname IN @so_cusname )
            AND ( c~provincegeoid IN @so_citygeoid OR c~citygeoid IN @so_citygeoid OR c~countygeoid IN @so_citygeoid )
            AND c~iserpcus IN @so_erpcus AND c~marketvip IN @so_marketcus AND a~isproxy IN @so_isproxy AND a~personname IN @so_personname
            AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid
            AND a~carbrandid IN @so_carbrandid AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype
            AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered AND a~foundstate IN @so_foundstate
            AND a~ksbsinq IN @so_ksyx AND a~tyrefg IN @so_trfg AND a~carenergytype IN @so_ev AND a~yunflg IN @so_yunorder
            AND a~assistantflg IN @so_aipur AND a~vin IN @so_vin AND v~productstoreid IN @so_shipstore.
          ENDIF.

        ELSE.
          """重要，重要，重要""""
          IF iv_usertype IS INITIAL OR iv_usertype EQ 'Userid'.
          ELSE.
            CLEAR so_userid."筛选条件传入的客户经理ID在前面已经用于获取客户ID了，此处往后，该变量值清除，重新塞入权限下的人员清单
          ENDIF.
          """"
          IF mv_type EQ '2' OR mv_type EQ '3'."2 3权限时获取权限内的 客户经理/拓展经理
****获取当前钉钉下面的所有人
            get_person( EXPORTING so_userid = so_userid
                        IMPORTING et_userlist = DATA(lt_userlist) ).

            CHECK lt_userlist IS NOT INITIAL.
            "拓展
            SELECT venid
              INTO TABLE @DATA(lt_store)
              FROM ztint_ven_user
              FOR ALL ENTRIES IN @lt_userlist
             WHERE userid = @lt_userlist-userid AND ispre = '' AND isdelete = ''.
            lr_venid = VALUE #( FOR st IN lt_store ( sign = 'I' option = 'EQ' low = st-venid ) ).
            IF lt_usercus IS NOT INITIAL.
              DATA(lt_tzusercus) = lt_usercus.
            ENDIF.

            "客户经理
            SELECT cusid INTO TABLE @DATA(lt_custemp)
              FROM ztint_cus_user
              FOR ALL ENTRIES IN @lt_userlist
              WHERE userid = @lt_userlist-userid AND ispre = '' AND isdelete = ''.
            SORT lt_custemp BY cusid.
            IF lt_usercus IS NOT INITIAL.
              LOOP AT lt_usercus INTO DATA(ls_usercus).
                DATA(lv_index) = sy-tabix.
                READ TABLE lt_custemp TRANSPORTING NO FIELDS WITH KEY cusid = ls_usercus-cusid BINARY SEARCH.
                IF sy-subrc NE 0.
                  DELETE lt_usercus INDEX lv_index.
                ENDIF.
              ENDLOOP.
            ELSE.
              APPEND LINES OF lt_custemp TO lt_usercus.
            ENDIF.
            SORT lt_usercus BY cusid.

          ENDIF.
          IF lt_usercus IS INITIAL AND lr_venid IS INITIAL.
            EXIT.
          ENDIF.

          IF ( iv_terminal EQ 'PC' AND so_venname IS INITIAL ) OR ( iv_terminal EQ 'PHONE' AND so_cusname IS INITIAL ).
            "作为客户经理查
            IF lt_usercus IS NOT INITIAL.
              SELECT DISTINCT a~inquiryid INTO TABLE @lt_inquiry FROM zticec_inquiry_h AS a
              INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
              INNER JOIN ztint_cus_user AS cu ON c~cusid = cu~cusid
              LEFT JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
                  LEFT JOIN ztint_area_city AS r ON c~provincegeoid = r~provincegeoid AND c~citygeoid = r~citygeoid
                        AND c~countygeoid = r~countygeoid AND c~villagegeoid = r~villageoid
*          FOR ALL ENTRIES IN @lt_userlist
               FOR ALL ENTRIES IN @lt_usercus
              WHERE "cu~userid = @lt_userlist-userid AND cu~ispre IN @lr_userpre AND cu~isdelete IN @lr_userdelete
                 c~cusid = @lt_usercus-cusid
              AND ( c~cusname IN @so_cusname OR c~companycode IN @so_cusname OR c~displayname IN @so_cusname )
              AND c~companycode IN @so_companycode AND c~companyid IN @so_custcompanyid AND r~regionid IN @so_zoneid
              AND ( c~provincegeoid IN @so_citygeoid OR c~citygeoid IN @so_citygeoid OR c~countygeoid IN @so_citygeoid )
              AND c~isdelete IN @lr_isdelete AND c~isvirtual = '' AND c~distribute = '' AND c~iserpcus IN @so_erpcus
              AND c~marketvip IN @so_marketcus AND a~isproxy IN @so_isproxy AND a~personname IN @so_personname
              AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
              AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
              AND a~foundstate IN @so_foundstate AND a~ksbsinq IN @so_ksyx AND a~tyrefg IN @so_trfg AND a~carenergytype IN @so_ev AND a~yunflg IN @so_yunorder
              AND a~assistantflg IN @so_aipur AND a~vin IN @so_vin AND v~productstoreid IN @so_shipstore.
            ENDIF.
            "作为拓展再查一次
            IF lt_tzusercus IS NOT INITIAL AND lr_venid IS NOT INITIAL.
              SELECT DISTINCT a~inquiryid APPENDING TABLE @lt_inquiry FROM zticec_inquiry_h AS a
              INNER JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
              INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
                  LEFT JOIN ztint_area_city AS r ON c~provincegeoid = r~provincegeoid AND c~citygeoid = r~citygeoid
                        AND c~countygeoid = r~countygeoid AND c~villagegeoid = r~villageoid
                FOR ALL ENTRIES IN @lt_tzusercus
              WHERE v~venid IN @lr_venid
              AND c~cusid = @lt_tzusercus-cusid
              AND ( c~cusname IN @so_cusname OR c~companycode IN @so_cusname OR c~displayname IN @so_cusname )
              AND c~companycode IN @so_companycode AND c~companyid IN @so_custcompanyid AND r~regionid IN @so_zoneid
              AND ( c~provincegeoid IN @so_citygeoid OR c~citygeoid IN @so_citygeoid OR c~countygeoid IN @so_citygeoid )
              AND c~isdelete IN @lr_isdelete AND c~isvirtual = '' AND c~distribute = '' AND c~iserpcus IN @so_erpcus
              AND c~marketvip IN @so_marketcus AND a~isproxy IN @so_isproxy AND a~personname IN @so_personname
              AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
              AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
              AND a~foundstate IN @so_foundstate AND a~ksbsinq IN @so_ksyx AND a~tyrefg IN @so_trfg AND a~carenergytype IN @so_ev AND a~yunflg IN @so_yunorder
              AND a~assistantflg IN @so_aipur AND a~vin IN @so_vin AND v~productstoreid IN @so_shipstore.
            ELSEIF lt_tzusercus IS INITIAL AND lr_venid IS NOT INITIAL. .
              SELECT DISTINCT a~inquiryid APPENDING TABLE @lt_inquiry FROM zticec_inquiry_h AS a
              INNER JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
              INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
                  LEFT JOIN ztint_area_city AS r ON c~provincegeoid = r~provincegeoid AND c~citygeoid = r~citygeoid
                        AND c~countygeoid = r~countygeoid AND c~villagegeoid = r~villageoid
              WHERE v~venid IN @lr_venid
              AND ( c~cusname IN @so_cusname OR c~companycode IN @so_cusname OR c~displayname IN @so_cusname )
              AND c~companycode IN @so_companycode AND c~companyid IN @so_custcompanyid AND r~regionid IN @so_zoneid
              AND ( c~provincegeoid IN @so_citygeoid OR c~citygeoid IN @so_citygeoid OR c~countygeoid IN @so_citygeoid )
              AND c~isdelete IN @lr_isdelete AND c~isvirtual = '' AND c~distribute = '' AND c~iserpcus IN @so_erpcus
              AND c~marketvip IN @so_marketcus AND a~isproxy IN @so_isproxy AND a~personname IN @so_personname
              AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
              AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
              AND a~foundstate IN @so_foundstate AND a~ksbsinq IN @so_ksyx AND a~tyrefg IN @so_trfg AND a~carenergytype IN @so_ev AND a~yunflg IN @so_yunorder
              AND a~assistantflg IN @so_aipur AND a~vin IN @so_vin AND v~productstoreid IN @so_shipstore.
            ENDIF.

          ELSEIF iv_terminal EQ 'PC' AND so_venname IS NOT INITIAL.
            "作为客户经理查
            IF lt_usercus IS NOT INITIAL.
              SELECT DISTINCT a~inquiryid INTO TABLE @lt_inquiry FROM zticec_inquiry_h AS a
              INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
              INNER JOIN ztint_cus_user AS cu ON c~cusid = cu~cusid
              INNER JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
                  LEFT JOIN ztint_area_city AS r ON c~provincegeoid = r~provincegeoid AND c~citygeoid = r~citygeoid
                        AND c~countygeoid = r~countygeoid AND c~villagegeoid = r~villageoid
                FOR ALL ENTRIES IN @lt_usercus
              WHERE c~cusid = @lt_usercus-cusid
              AND ( c~cusname IN @so_cusname OR c~companycode IN @so_cusname OR c~displayname IN @so_cusname )
              AND ( v~productstoreid IN @so_venname OR v~venname IN @so_venname OR v~displayname IN @so_venname )
              AND c~companycode IN @so_companycode AND c~companyid IN @so_custcompanyid AND r~regionid IN @so_zoneid
              AND ( c~provincegeoid IN @so_citygeoid OR c~citygeoid IN @so_citygeoid OR c~countygeoid IN @so_citygeoid )
              AND c~isdelete IN @lr_isdelete AND c~isvirtual = '' AND c~distribute = '' AND c~iserpcus IN @so_erpcus
              AND c~marketvip IN @so_marketcus AND a~isproxy IN @so_isproxy AND a~personname IN @so_personname
              AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
              AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
              AND a~foundstate IN @so_foundstate AND a~ksbsinq IN @so_ksyx AND a~tyrefg IN @so_trfg AND a~carenergytype IN @so_ev AND a~yunflg IN @so_yunorder
              AND a~assistantflg IN @so_aipur AND a~vin IN @so_vin AND v~productstoreid IN @so_shipstore.
            ENDIF.
            "作为拓展再查一次
            IF lt_tzusercus IS NOT INITIAL AND lr_venid IS NOT INITIAL.
              SELECT DISTINCT a~inquiryid APPENDING TABLE @lt_inquiry FROM zticec_inquiry_h AS a
              INNER JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
              INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
                  LEFT JOIN ztint_area_city AS r ON c~provincegeoid = r~provincegeoid AND c~citygeoid = r~citygeoid
                        AND c~countygeoid = r~countygeoid AND c~villagegeoid = r~villageoid
                FOR ALL ENTRIES IN @lt_tzusercus
             WHERE v~venid IN @lr_venid
              AND c~cusid = @lt_tzusercus-cusid
              AND ( c~cusname IN @so_cusname OR c~companycode IN @so_cusname OR c~displayname IN @so_cusname )
              AND c~companycode IN @so_companycode AND c~companyid IN @so_custcompanyid AND r~regionid IN @so_zoneid
              AND ( c~provincegeoid IN @so_citygeoid OR c~citygeoid IN @so_citygeoid OR c~countygeoid IN @so_citygeoid )
              AND c~isdelete IN @lr_isdelete AND c~isvirtual = '' AND c~distribute = '' AND c~iserpcus IN @so_erpcus
              AND c~marketvip IN @so_marketcus AND a~isproxy IN @so_isproxy AND a~personname IN @so_personname
              AND ( v~productstoreid IN @so_venname OR v~venname IN @so_venname OR v~displayname IN @so_venname )
              AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
              AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
              AND a~foundstate IN @so_foundstate AND a~ksbsinq IN @so_ksyx AND a~tyrefg IN @so_trfg AND a~carenergytype IN @so_ev AND a~yunflg IN @so_yunorder
              AND a~assistantflg IN @so_aipur AND a~vin IN @so_vin AND v~productstoreid IN @so_shipstore.
            ELSEIF lt_tzusercus IS INITIAL AND lr_venid IS NOT INITIAL.
              SELECT DISTINCT a~inquiryid APPENDING TABLE @lt_inquiry FROM zticec_inquiry_h AS a
              INNER JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
              LEFT JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
                  LEFT JOIN ztint_area_city AS r ON c~provincegeoid = r~provincegeoid AND c~citygeoid = r~citygeoid
                        AND c~countygeoid = r~countygeoid AND c~villagegeoid = r~villageoid
              WHERE v~venid IN @lr_venid
              AND ( c~cusname IN @so_cusname OR c~companycode IN @so_cusname OR c~displayname IN @so_cusname )
              AND c~companycode IN @so_companycode AND c~companyid IN @so_custcompanyid AND r~regionid IN @so_zoneid
              AND ( c~provincegeoid IN @so_citygeoid OR c~citygeoid IN @so_citygeoid OR c~countygeoid IN @so_citygeoid )
              AND c~isdelete IN @lr_isdelete AND c~isvirtual = '' AND c~distribute = '' AND c~iserpcus IN @so_erpcus
              AND c~marketvip IN @so_marketcus AND a~isproxy IN @so_isproxy AND a~personname IN @so_personname
              AND ( v~productstoreid IN @so_venname OR v~venname IN @so_venname OR v~displayname IN @so_venname )
              AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
              AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
              AND a~foundstate IN @so_foundstate AND a~ksbsinq IN @so_ksyx AND a~tyrefg IN @so_trfg AND a~carenergytype IN @so_ev AND a~yunflg IN @so_yunorder
              AND a~assistantflg IN @so_aipur AND a~vin IN @so_vin AND v~productstoreid IN @so_shipstore.
            ENDIF.
          ELSEIF iv_terminal EQ 'PHONE' AND so_cusname IS NOT INITIAL.
            "先作为客户经理,so_cusname作为客户内容
            IF lt_usercus IS NOT INITIAL.
              SELECT DISTINCT a~inquiryid INTO TABLE @lt_inquiry FROM zticec_inquiry_h AS a
              INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
              LEFT JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
                  LEFT JOIN ztint_area_city AS r ON c~provincegeoid = r~provincegeoid AND c~citygeoid = r~citygeoid
                        AND c~countygeoid = r~countygeoid AND c~villagegeoid = r~villageoid
                FOR ALL ENTRIES IN @lt_usercus
                WHERE c~cusid = @lt_usercus-cusid
              AND ( c~cusname IN @so_cusname OR c~companycode IN @so_cusname OR c~displayname IN @so_cusname   OR a~inquiryid IN @so_cusname )
              AND c~companycode IN @so_companycode AND c~companyid IN @so_custcompanyid AND r~regionid IN @so_zoneid
              AND ( c~provincegeoid IN @so_citygeoid OR c~citygeoid IN @so_citygeoid OR c~countygeoid IN @so_citygeoid )
              AND c~isdelete IN @lr_isdelete AND c~isvirtual = '' AND c~distribute = '' AND c~iserpcus IN @so_erpcus
              AND c~marketvip IN @so_marketcus AND a~isproxy IN @so_isproxy AND a~personname IN @so_personname
              AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
              AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
              AND a~foundstate IN @so_foundstate AND a~ksbsinq IN @so_ksyx AND a~tyrefg IN @so_trfg AND a~carenergytype IN @so_ev AND a~yunflg IN @so_yunorder
              AND a~assistantflg IN @so_aipur AND a~vin IN @so_vin AND v~productstoreid IN @so_shipstore..

              "先作为客户经理,so_cusname作为商家内容
              SELECT DISTINCT a~inquiryid APPENDING TABLE @lt_inquiry FROM zticec_inquiry_h AS a
              INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
              INNER JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
                  LEFT JOIN ztint_area_city AS r ON c~provincegeoid = r~provincegeoid AND c~citygeoid = r~citygeoid
                        AND c~countygeoid = r~countygeoid AND c~villagegeoid = r~villageoid
                FOR ALL ENTRIES IN @lt_usercus
                WHERE c~cusid = @lt_usercus-cusid
              AND ( v~productstoreid IN @so_cusname OR v~venname IN @so_cusname OR v~displayname IN @so_cusname )
              AND c~companycode IN @so_companycode AND c~companyid IN @so_custcompanyid AND r~regionid IN @so_zoneid
              AND ( c~provincegeoid IN @so_citygeoid OR c~citygeoid IN @so_citygeoid OR c~countygeoid IN @so_citygeoid )
              AND c~isdelete IN @lr_isdelete AND c~isvirtual = '' AND c~distribute = '' AND c~iserpcus IN @so_erpcus
              AND c~marketvip IN @so_marketcus AND a~isproxy IN @so_isproxy AND a~personname IN @so_personname
              AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
              AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
              AND a~foundstate IN @so_foundstate AND a~ksbsinq IN @so_ksyx AND a~tyrefg IN @so_trfg AND a~carenergytype IN @so_ev AND a~yunflg IN @so_yunorder
              AND a~assistantflg IN @so_aipur AND a~vin IN @so_vin AND v~productstoreid IN @so_shipstore..
            ENDIF.
            "在作为拓展经理，so_cusname作为客户/商家内容
            IF lt_tzusercus IS NOT INITIAL AND lr_venid IS NOT INITIAL.
              SELECT DISTINCT a~inquiryid APPENDING TABLE @lt_inquiry FROM zticec_inquiry_h AS a
              INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
              INNER JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
                  LEFT JOIN ztint_area_city AS r ON c~provincegeoid = r~provincegeoid AND c~citygeoid = r~citygeoid
                        AND c~countygeoid = r~countygeoid AND c~villagegeoid = r~villageoid
              FOR ALL ENTRIES IN @lt_tzusercus
               WHERE v~venid IN @lr_venid
                AND c~cusid = @lt_tzusercus-cusid
              AND c~companycode IN @so_companycode AND c~companyid IN @so_custcompanyid AND r~regionid IN @so_zoneid
              AND ( c~provincegeoid IN @so_citygeoid OR c~citygeoid IN @so_citygeoid OR c~countygeoid IN @so_citygeoid )
              AND c~isdelete IN @lr_isdelete AND c~isvirtual = '' AND c~distribute = '' AND c~iserpcus IN @so_erpcus
              AND c~marketvip IN @so_marketcus AND a~isproxy IN @so_isproxy AND a~personname IN @so_personname
              AND ( v~productstoreid IN @so_cusname OR v~venname IN @so_cusname OR v~displayname IN @so_cusname )
              AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
              AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
              AND a~foundstate IN @so_foundstate AND a~ksbsinq IN @so_ksyx AND a~tyrefg IN @so_trfg AND a~carenergytype IN @so_ev AND a~yunflg IN @so_yunorder
              AND a~assistantflg IN @so_aipur AND a~vin IN @so_vin AND v~productstoreid IN @so_shipstore..
            ELSEIF lt_tzusercus IS INITIAL AND lr_venid IS NOT INITIAL.
              SELECT DISTINCT a~inquiryid APPENDING TABLE @lt_inquiry FROM zticec_inquiry_h AS a
              INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
              INNER JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
                  LEFT JOIN ztint_area_city AS r ON c~provincegeoid = r~provincegeoid AND c~citygeoid = r~citygeoid
                        AND c~countygeoid = r~countygeoid AND c~villagegeoid = r~villageoid
               WHERE v~venid IN @lr_venid
              AND c~companycode IN @so_companycode AND c~companyid IN @so_custcompanyid AND r~regionid IN @so_zoneid
              AND ( c~provincegeoid IN @so_citygeoid OR c~citygeoid IN @so_citygeoid OR c~countygeoid IN @so_citygeoid )
              AND c~isdelete IN @lr_isdelete AND c~isvirtual = '' AND c~distribute = '' AND c~iserpcus IN @so_erpcus
              AND c~marketvip IN @so_marketcus AND a~isproxy IN @so_isproxy AND a~personname IN @so_personname
              AND ( v~productstoreid IN @so_cusname OR v~venname IN @so_cusname OR v~displayname IN @so_cusname )
              AND a~inquiryid IN @so_inquiryid AND a~createdate IN @so_createdate AND a~statusid IN @so_statusid AND a~carbrandid IN @so_carbrandid
              AND a~sourceid IN @so_sourceid AND a~inquirytype IN @so_inquirytype AND a~inquiryway IN @so_inquiryway AND a~inquiryid IN @so_ordered
              AND a~foundstate IN @so_foundstate AND a~ksbsinq IN @so_ksyx AND a~tyrefg IN @so_trfg AND a~carenergytype IN @so_ev AND a~yunflg IN @so_yunorder
              AND a~assistantflg IN @so_aipur AND a~vin IN @so_vin AND v~productstoreid IN @so_shipstore..

            ENDIF.
          ENDIF.
        ENDIF.
      CATCH cx_sy_dynamic_osql_semantics  INTO DATA(lo_osql).
      CATCH cx_sy_open_sql_db INTO DATA(lo_opensql).
    ENDTRY.


*****  IF lt_inquiry IS NOT INITIAL.
*****    "加了客户经理做筛选条件的只取对应客户经理的
*****    IF so_userid IS NOT INITIAL.
*****      SELECT DISTINCT a~inquiryid INTO TABLE @DATA(lt_inquiry1)
*****            FROM zticec_inquiry_h AS a
*****            INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
*****            INNER JOIN ztint_cus_user AS cu ON c~cusid = cu~cusid
*****            FOR ALL ENTRIES IN @lt_inquiry
*****            WHERE a~inquiryid = @lt_inquiry-inquiryid
*****            AND cu~userid IN @so_userid
*****            AND cu~usertype = '1'
*****            AND cu~ispre IN @lr_userpre AND cu~isdelete IN @lr_userdelete.
*****      lt_inquiry[] = lt_inquiry1[].
***********    SELECT u~cusid,u~userid,i~username INTO TABLE @DATA(lt_cususer)
***********          FROM ztint_cus_user AS u
***********          INNER JOIN ztint_cus_inf AS c ON c~cusid = u~cusid
***********          INNER JOIN ztint_user_inf AS i ON u~userid = i~userid
***********          FOR ALL ENTRIES IN @lt_inqcus
***********          WHERE companyid = @lt_inqcus-custcompanyid AND usertype = '1' AND ispre = '' AND u~isdelete = ''.
*****    ENDIF.
*****  ENDIF.

    IF lt_inquiry IS NOT INITIAL.
      IF lv_ordered IS NOT INITIAL.
        "查询下单的询价单
        SELECT DISTINCT q~inquiryid FROM zticec_inquiry_q AS q
        INTO CORRESPONDING FIELDS OF TABLE @lt_inqid_order
        FOR ALL ENTRIES IN @lt_inquiry
        WHERE q~inquiryid = @lt_inquiry-inquiryid
        AND q~sellstatus = 'ORDERED'.

        IF lv_ordered EQ 'ORDERED'.
          DATA(lt_inqid_1) = FILTER #( lt_inquiry IN lt_inqid_order WHERE inquiryid = inquiryid ).
        ELSE."筛选其他状态
          lt_inqid_1 = FILTER #( lt_inquiry EXCEPT IN lt_inqid_order WHERE inquiryid = inquiryid ).
        ENDIF.
        CLEAR lt_inquiry.
        APPEND LINES OF lt_inqid_1 TO lt_inquiry.
        CLEAR lt_inqid_1.

        CHECK lt_inquiry IS NOT INITIAL.
      ENDIF.
      IF iv_isfollowed IS NOT INITIAL.
        "获取已跟单的订单
        SELECT DISTINCT q~billno FROM ztint_followlist AS q
        INTO CORRESPONDING FIELDS OF TABLE @lt_inqid_follow
        FOR ALL ENTRIES IN @lt_inquiry
        WHERE q~billno = @lt_inquiry-inquiryid
        AND q~billtype  = 'INQ0001'
        AND q~isdelete = ''.
        IF iv_isfollowed EQ '1'.
          DATA(lt_inqid_2) = FILTER #( lt_inquiry IN lt_inqid_follow WHERE inquiryid = billno ).
        ELSE."筛选其他状态
          lt_inqid_2 = FILTER #( lt_inquiry EXCEPT IN lt_inqid_follow WHERE inquiryid = billno ).
        ENDIF.
        CLEAR lt_inquiry.
        APPEND LINES OF lt_inqid_2 TO lt_inquiry.
        CLEAR lt_inqid_2.

        CHECK lt_inquiry IS NOT INITIAL.
      ENDIF.

      IF so_custagid IS NOT INITIAL.
        SELECT DISTINCT inquiryid INTO TABLE @DATA(lt_inqid_3)
          FROM zticec_inquiry_h AS h
          INNER JOIN ztint_cus_tag AS t ON t~ymonth = @sy-datum(6) AND t~companyid = h~custcompanyid AND t~isdelete = ''
          FOR ALL ENTRIES IN @lt_inquiry
          WHERE h~inquiryid = @lt_inquiry-inquiryid AND t~tagid IN @so_custagid.
        CLEAR lt_inquiry.
        APPEND LINES OF lt_inqid_3 TO lt_inquiry.
        CLEAR lt_inqid_3.

        CHECK lt_inquiry IS NOT INITIAL.
      ENDIF.
      SELECT DISTINCT h~inquiryid,h~custcompanyid,t~amount,t~preamount,
                  h~createdate,h~createtime,h~needcount,h~codingsku,h~quotasku
        FROM zticec_inquiry_h AS h
      LEFT JOIN zticec_inquiry_t AS t ON h~inquiryid = t~inquiryid
      INTO TABLE @DATA(lt_inquirydata)
            FOR ALL ENTRIES IN @lt_inquiry
            WHERE h~inquiryid = @lt_inquiry-inquiryid.

    ENDIF.

    "没查到并且询价单输入全了就去平台查
    IF lt_inquiry IS INITIAL AND strlen( lv_inquiry ) = 14.
      ev_inq = lv_inquiry+1(12).
      DATA(lo_inquiry) = NEW zcl_icec_inquiry_api( ).
*      DATA(ls_head) = lo_inquiry->new_get_inquiry_head( ev_inq ).
      lo_inquiry->get_coldinquiry_header( EXPORTING iv_inquiryid = ev_inq
      IMPORTING es_inquiryhead = DATA(ls_head) ev_msg = DATA(ev_msg) ).
      IF ls_head IS NOT INITIAL.
        READ TABLE lt_inquiry INTO DATA(ls_inquiry) INDEX 1.
        ls_inquiry-inquiryid = ls_head-inquirybaseinfos-inquiryid.
        APPEND ls_inquiry TO lt_inquiry.

        IF lv_ordered IS NOT INITIAL.
          "下单的询价单

        ENDIF.
        READ TABLE lt_inquirydata INTO DATA(ls_inqdata) INDEX 1.
*         h~inquiryid,h~custcompanyid,t~amount,h~createdate,h~createtime,h~needcount,h~codingsku,h~quotasku
        ls_inqdata-inquiryid = ls_head-inquirybaseinfos-inquiryid.
        ls_inqdata-custcompanyid = ls_head-inquiryuserinfos-garagecompanyid.
        ls_inqdata-amount = ls_head-inquirybaseinfos-inquiryamount.
        ls_inqdata-preamount = ls_head-inquirybaseinfos-inquiryamount.
        zcl_cassint_formatter=>convert_java_timestamp_to_abap(
        EXPORTING iv_timestamp = ls_head-inquirybaseinfos-resolvebegindate
        IMPORTING ev_date = ls_inqdata-createdate ev_time = ls_inqdata-createtime ).
        ls_inqdata-needcount = ls_head-inquirybaseinfos-needcount.
        "权限校验相关
        IF mv_type EQ 1 OR mv_type EQ 4."全公司数据 不用校验
          APPEND ls_inqdata TO lt_inquirydata.
        ELSE. "用上面的权限下的客户经理做校验
          IF so_userid[] IS NOT INITIAL.
            "作为客户经理查
            SELECT c~companyid INTO TABLE @DATA(lt_companyid)
              FROM ztint_cus_inf AS c INNER JOIN ztint_cus_user AS cu ON c~cusid = cu~cusid
                  WHERE cu~userid IN @so_userid
                  AND c~companyid = @ls_inqdata-custcompanyid.
            ""作为拓展查
***          SELECT C~companyid APPENDING TABLE @lt_companyid
***            FROM ztint_cus_inf AS C INNER JOIN ztint_cus_user AS cu ON C~CUSID = cu~CUSID
***          WHERE cu~userid = @lt_userlist-userid
***          AND C~companyid = @ls_inqdata-custcompanyid.
            IF lt_companyid[] IS NOT INITIAL.
              APPEND ls_inqdata TO lt_inquirydata.
            ENDIF.
          ENDIF.
        ENDIF.
        CLEAR ls_inqdata.
      ENDIF.
    ENDIF.

    TYPES:BEGIN OF ty_inquirydata,
            inquiryid     TYPE zticec_inquiry_h-inquiryid,
            custcompanyid TYPE zticec_inquiry_h-custcompanyid,
            amount        TYPE zticec_inquiry_t-amount,
            preamount     TYPE zticec_inquiry_t-preamount,
            createdate    TYPE zticec_inquiry_h-createdate,
            createtime    TYPE zticec_inquiry_h-createtime,
            needcount     TYPE zticec_inquiry_h-needcount,
            codingsku     TYPE zticec_inquiry_h-codingsku,
            quotasku      TYPE zticec_inquiry_h-quotasku,
          END OF ty_inquirydata.
    DATA ls_inquirydata TYPE ty_inquirydata.
    TYPES:BEGIN OF ty_inquirydatanum,
            inquiryid     TYPE zticec_inquiry_h-inquiryid,
            custcompanyid TYPE zticec_inquiry_h-custcompanyid,
            amount        TYPE zticec_inquiry_t-amount,
            preamount     TYPE zticec_inquiry_t-preamount,
            createdate    TYPE zticec_inquiry_h-createdate,
            createtime    TYPE zticec_inquiry_h-createtime,
            needcount     TYPE num,
            codingsku     TYPE num,
            quotasku      TYPE num,
          END OF ty_inquirydatanum.
    DATA: lt_inquirydatanum TYPE TABLE OF ty_inquirydatanum,
          ls_inquirydatanum TYPE ty_inquirydatanum.
    DATA:lv_num TYPE i.
    MOVE-CORRESPONDING lt_inquirydata TO lt_inquirydatanum.
*****将分页提前，后面的不需要查所有询价单的
    IF iv_orderby IS INITIAL OR  iv_orderby = 'Lastcreate'.
      SORT lt_inquirydatanum BY createdate DESCENDING createtime DESCENDING.
    ELSEIF iv_orderby = 'Amountasc'.
      SORT lt_inquirydatanum BY preamount ASCENDING.
    ELSEIF iv_orderby =  'Amountdes'.
      SORT lt_inquirydatanum BY preamount DESCENDING .
    ELSEIF iv_orderby =  'Needcountasc'.  "sku
      SORT lt_inquirydatanum BY needcount ASCENDING.
    ELSEIF iv_orderby =  'Needcountdes'.
      SORT lt_inquirydatanum BY needcount DESCENDING .
    ELSEIF iv_orderby =  'Codingskuasc'.  "译码sku
      SORT lt_inquirydatanum BY codingsku ASCENDING.
    ELSEIF iv_orderby =  'Codingskudes'.
      SORT lt_inquirydatanum BY codingsku DESCENDING .
    ELSEIF iv_orderby =  'Quotaskuasc'. "报价sku
      SORT lt_inquirydatanum BY quotasku ASCENDING.
    ELSEIF iv_orderby =  'Quotaskudes'.
      SORT lt_inquirydatanum BY quotasku DESCENDING .
    ENDIF.
    REFRESH: lt_inquirydata.
    LOOP AT lt_inquirydatanum INTO ls_inquirydatanum.
      MOVE-CORRESPONDING ls_inquirydatanum TO ls_inquirydata.
      lv_num = ls_inquirydatanum-needcount.
      ls_inquirydata-needcount = lv_num.
      lv_num = ls_inquirydatanum-codingsku.
      ls_inquirydata-codingsku = lv_num.
      lv_num = ls_inquirydatanum-quotasku.
      ls_inquirydata-quotasku = lv_num.
      APPEND ls_inquirydata TO lt_inquirydata.
    ENDLOOP.

    DATA: lv_total TYPE int4.
    DATA: lv_pagetotal TYPE int4.
    DATA: lv_page TYPE int4,
          lv_size TYPE int4.
    CLEAR:lv_from,lv_to,lv_mod,lv_total,lv_pagetotal,lv_mod,lv_page,lv_size.
    "分页
    IF iv_export IS INITIAL.

      IF iv_page IS INITIAL . "没有这显示第一页
        lv_page = 1.
      ELSE.
        lv_page = iv_page.
      ENDIF.

      IF iv_size IS INITIAL. "没有则默认50条
        lv_size = 20.
      ELSE.
        lv_size = iv_size.
      ENDIF.

      ev_totalsize = lines( lt_inquirydata )."总条目数
      lv_mod = ev_totalsize MOD lv_size.
      ev_totalpage = ev_totalsize DIV lv_size. "总页数
      IF lv_mod NE 0.
        ev_totalpage = ev_totalpage + 1.
      ENDIF.
      IF lv_page > ev_totalpage. "当前页数不能大于总页数
        RETURN.
      ENDIF.

      lv_from = ( lv_page - 1 ) * lv_size + 1."条数开始
      lv_to = lv_page * lv_size."条数结束
      APPEND LINES OF lt_inquirydata FROM lv_from TO lv_to TO et_inquiry.
    ELSE.
      APPEND LINES OF lt_inquirydata TO et_inquiry.
    ENDIF.

  ENDMETHOD.


  METHOD get_inquiry_overview.
    IF iv_classtype EQ 'X10101'.
      mv_type = 1.
    ELSE.
      get_user_mvtype( 'X13104' ) .                         "X13104
    ENDIF.
    CHECK mv_type IS NOT INITIAL.
    IF mv_type = 1 AND ( so_userid IS INITIAL
      AND so_cusname IS INITIAL AND so_companycode IS INITIAL
       AND so_citygeoid IS INITIAL AND so_zoneid IS INITIAL
        AND so_custcompanyid IS INITIAL ).
      mv_cus_condition = 'X'."当这些条件有值得时候，get_order_data_by_customer传出来得et_order_cus是空的，
******      在set_inquiry_overview里面来读取et_order_cus时读不到是正常的
    ENDIF.

    "状态 为已下单需要单独处理
    DATA(so_status) = so_statusid.
    IF so_status IS NOT INITIAL .

      IF so_status[ 1 ]-low = 'ORDERED'.

        DATA(so_ordered) = get_ordered_inquiry( EXPORTING
         so_inquiryid = so_inquiryid
        so_cusname = so_cusname
        so_createdate = so_createdate
        so_carbrandid = so_carbrandid
        so_sourceid = so_sourceid
        so_inquirytype = so_inquirytype
        so_zoneid = so_zoneid
        so_companycode = so_companycode
        so_citygeoid = so_citygeoid
        so_custcompanyid = so_custcompanyid
        so_inquiryway = so_inquiryway
        iv_isdelete = iv_isdelete ).

        CLEAR so_status.
        CHECK so_ordered IS NOT INITIAL .
      ENDIF.

    ENDIF.


****************从客户上查
*****当输入了工单相关的条件时优先从工单来找
    get_inquiry_data_by_customer(
    EXPORTING
      so_inquiryid = so_inquiryid
      so_cusname = so_cusname
      so_createdate = so_createdate
      so_statusid = so_status
      so_carbrandid = so_carbrandid
      so_sourceid = so_sourceid
      so_inquirytype = so_inquirytype
      so_zoneid = so_zoneid
      so_companycode = so_companycode
      so_userid = so_userid
      so_citygeoid = so_citygeoid
      so_custcompanyid = so_custcompanyid
      so_inquiryway = so_inquiryway
      so_ordered  = so_ordered
      iv_isdelete = iv_isdelete
      IMPORTING
        et_inquiry = DATA(lt_cus_inquiry)
        et_inquiry_cus = DATA(lt_inquiry_cus) ).

********************从供应商上查
    get_inquiry_data_by_vendor(
     EXPORTING
       so_inquiryid = so_inquiryid
       so_cusname = so_cusname
       so_createdate = so_createdate
       so_statusid = so_status
       so_carbrandid = so_carbrandid
       so_sourceid = so_sourceid
       so_inquirytype = so_inquirytype
       so_zoneid = so_zoneid
       so_companycode = so_companycode
       so_userid = so_userid
       so_citygeoid = so_citygeoid
       so_custcompanyid = so_custcompanyid
       so_inquiryway = so_inquiryway
       so_ordered  = so_ordered
       iv_isdelete = iv_isdelete
       IMPORTING
         et_inquiry = DATA(lt_ven_inquiry) ).
***************
**    合并取出的工单
    DATA:lt_inquiry TYPE zord_t_inquiry_info.
    IF lt_cus_inquiry IS NOT INITIAL.
      APPEND LINES OF lt_cus_inquiry TO lt_inquiry.
    ENDIF.
    IF lt_ven_inquiry IS NOT INITIAL.
      APPEND LINES OF lt_ven_inquiry TO lt_inquiry.
    ENDIF.
    SORT lt_inquiry BY inquiryid.
    DELETE ADJACENT DUPLICATES FROM lt_inquiry COMPARING inquiryid.
    CHECK lt_inquiry IS NOT INITIAL.

*****数据填充
    er_deep_entity = set_inquiry_overview(
    EXPORTING
      it_inquiry = lt_inquiry
      it_inquiry_cus = lt_inquiry_cus
      iv_orderby = iv_orderby
      iv_page = iv_page
      iv_size = iv_size
      iv_export = iv_export
      iv_isdelete = iv_isdelete
      is_excellist = is_excellist
      ) .
  ENDMETHOD.


  METHOD get_inq_overview_new.
    IF iv_classtype EQ 'X10101'.
      mv_type = 1.
    ELSE.
      get_user_mvtype( 'X13104' ) .                         "X13104
    ENDIF.
    CHECK mv_type IS NOT INITIAL.
    "状态 为已下单需要单独处理
    DATA(so_status) = so_statusid.
    IF so_status IS NOT INITIAL .
      DATA(lv_status) = so_status[ 1 ]-low .
      IF lv_status = 'ORDERED'.

        DATA(so_ordered) = get_ordered_inquiry( EXPORTING
         so_inquiryid = so_inquiryid
        so_cusname = so_cusname
        so_createdate = so_createdate
        so_carbrandid = so_carbrandid
        so_sourceid = so_sourceid
        so_inquirytype = so_inquirytype
        so_zoneid = so_zoneid
        so_companycode = so_companycode
        so_citygeoid = so_citygeoid
        so_custcompanyid = so_custcompanyid
        so_inquiryway = so_inquiryway
        iv_isdelete = iv_isdelete ).

        CLEAR so_status.
        CHECK so_ordered IS NOT INITIAL .
      ENDIF.

    ENDIF.


    get_inquiry_data_new(
*    get_inquiry_data(
     EXPORTING
       so_inquiryid = so_inquiryid
       so_cusname = so_cusname
       so_venname = so_venname
       so_createdate = so_createdate
       so_statusid = so_status
       so_carbrandid = so_carbrandid
       so_sourceid = so_sourceid
       so_inquirytype = so_inquirytype
       so_zoneid = so_zoneid
       so_companycode = so_companycode
       so_userid = so_userid
       so_citygeoid = so_citygeoid
       so_custcompanyid = so_custcompanyid
       so_inquiryway = so_inquiryway
       so_ordered  = so_ordered
       so_foundstate = so_foundstate
       iv_isdelete = iv_isdelete
       iv_terminal = iv_terminal
       IMPORTING
         et_inquiry = DATA(lt_inquiry) ).

    IF mv_type NE '4'.
      zcl_cassint_auth_check=>get_special_customer( IMPORTING r_cusid = DATA(lr_spcusid) ).
      IF lr_spcusid IS NOT INITIAL.
        DELETE lt_inquiry WHERE cusid IN lr_spcusid.
      ENDIF.
    ENDIF.
    SORT lt_inquiry BY inquiryid.
    DELETE ADJACENT DUPLICATES FROM lt_inquiry COMPARING inquiryid.
    CHECK lt_inquiry IS NOT INITIAL.

*****数据填充
    er_deep_entity = set_inq_overview_new_v1(
*    er_deep_entity = set_inq_overview_new(
    EXPORTING
      it_inquiry_tmp = lt_inquiry
*      it_inquiry = lt_inquiry
      iv_orderby = iv_orderby
      iv_status = lv_status
      iv_page = iv_page
      iv_size = iv_size
      iv_export = iv_export
      iv_isdelete = iv_isdelete
      iv_terminal = iv_terminal
      is_excellist = is_excellist ) .
  ENDMETHOD.


  METHOD get_inq_overview_new_v2.
    IF iv_classtype EQ 'X10101'.
      mv_type = 1.
    ELSE.
      get_user_mvtype( 'X13104' ) .                         "X13104
    ENDIF.
    CHECK mv_type IS NOT INITIAL.

    get_inquiry_data_new_v4(
     EXPORTING
       so_inquiryid = so_inquiryid
       so_isproxy   = so_isproxy
       so_personname = so_personname
       so_label = so_label
       so_vin = so_vin
       so_cusname = so_cusname
       so_venname = so_venname
       so_createdate = so_createdate
       so_statusid = so_statusid
       so_carbrandid = so_carbrandid
       so_sourceid = so_sourceid
       so_inquirytype = so_inquirytype
       so_zoneid = so_zoneid
       so_companycode = so_companycode
       so_userid = so_userid
       so_citygeoid = so_citygeoid
       so_custcompanyid = so_custcompanyid
       so_inquiryway = so_inquiryway
       so_custagid = so_custagid
       so_foundstate = so_foundstate
       iv_isdelete = iv_isdelete
       iv_usertype = iv_usertype
       iv_terminal = iv_terminal
       iv_isfollowed = iv_isfollowed
       iv_orderby = iv_orderby
       iv_page = iv_page
       iv_size = iv_size
       iv_export = iv_export
     IMPORTING
       et_inquiry = DATA(lt_inquiry)
       ev_inq = DATA(lv_inq)
       ev_totalsize = DATA(lv_totalsize)
       ev_totalpage = DATA(lv_totalpage)
       ).

**    IF mv_type NE '4'.
**      zcl_cassint_auth_check=>get_special_customer( IMPORTING r_companyid  = DATA(lr_spcusid) ).
**      IF lr_spcusid IS NOT INITIAL.
**        DELETE lt_inquiry WHERE custcompanyid IN lr_spcusid.
**      ENDIF.
**    ENDIF.
    CHECK lt_inquiry IS NOT INITIAL.

*****数据填充
    er_deep_entity = set_inq_overview_new_v2(
    EXPORTING
      it_inquiry = lt_inquiry
      iv_inq  = lv_inq
      iv_page = iv_page
      iv_size = iv_size
      iv_export = iv_export
      iv_orderby = iv_orderby
      iv_isdelete = iv_isdelete
      iv_terminal = iv_terminal
      is_excellist = is_excellist ) .

    er_deep_entity-totalnum = lv_totalsize.
    er_deep_entity-pagetotal = lv_totalpage.
    CONDENSE:er_deep_entity-totalnum,er_deep_entity-pagetotal.
  ENDMETHOD.


  METHOD get_order.
    CASE iv_action.
      WHEN 'Detail'.
****订单抬头详情信息
        get_order_detail(
          IMPORTING
            ev_msg = ev_msg
          CHANGING
            er_deep_entity = er_deep_entity
        ).
      WHEN 'Logistics'.
****订单物流详情信息
        get_order_shipments(
          IMPORTING
            ev_msg = ev_msg
          CHANGING
            er_deep_entity = er_deep_entity
        ).
      WHEN 'ProcessInfo'.
****订单处理详情信息
        get_order_processinfo(
          IMPORTING
            ev_msg = ev_msg
          CHANGING
            er_deep_entity = er_deep_entity
        ).
      WHEN 'ServiceNote'.
*****更新订单客服留言
        update_customerservice_note(
        IMPORTING  msg = ev_msg
        CHANGING  data = er_deep_entity ).
      WHEN OTHERS.
    ENDCASE.

  ENDMETHOD.


  METHOD get_ordered_inquiry.
    DATA:lr_isdelete TYPE RANGE OF ztint_cus_inf-isdelete.
    IF iv_isdelete EQ 'X'.
      lr_isdelete = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
    ENDIF.
    TRY.
        SELECT DISTINCT  'I' AS sign,'EQ' AS option,h~inquiryid AS low
               FROM zticec_inquiry_h AS h
              INNER JOIN ztint_cus_inf AS cus
                 ON h~custcompanyid = cus~companyid
              INNER JOIN zticec_inquiry_q AS q ON q~inquiryid = h~inquiryid
               INTO CORRESPONDING FIELDS OF TABLE @so_ordered
              WHERE  ( cus~cusname IN @so_cusname
                 OR cus~companycode IN @so_cusname  )
                AND cus~companycode IN @so_companycode
                AND cus~companyid IN @so_custcompanyid
                AND cus~zoneid IN @so_zoneid
                AND ( cus~provincegeoid IN @so_citygeoid
                 OR cus~citygeoid IN @so_citygeoid
                 OR cus~countygeoid IN @so_citygeoid )
                AND cus~isdelete IN @lr_isdelete
                AND h~inquiryid IN @so_inquiryid
                AND h~createdate IN @so_createdate
                AND h~carbrandid IN @so_carbrandid
                AND h~sourceid IN @so_sourceid
                AND h~inquirytype IN @so_inquirytype
                AND h~inquiryway IN @so_inquiryway
                AND q~sellstatus = 'ORDERED'.
      CATCH cx_sy_dynamic_osql_semantics INTO DATA(lo_osql).
    ENDTRY.

  ENDMETHOD.


  METHOD get_order_data.

    DATA:lr_cusid TYPE RANGE OF ztint_cus_inf-cusid.
    DATA: lr_orderid TYPE RANGE OF zticec_order_h-orderid.
    DATA:ls_et_order TYPE zord_s_order_info.
    DATA:lv_lines TYPE int4.
    TRY.
*****查询所有客户订单
        IF ( mv_type EQ 1 OR mv_type EQ 4 ) AND so_userid IS INITIAL.

          IF iv_isdelete NE 'X'.
            SELECT DISTINCT a~orderid,a~ordertypeid,a~ordertypeid,a~originalorderid,a~originalsource,a~originalsourcedesc,a~ordername,
               a~shoppinglistid,a~inquirytype,a~carbrandid,a~carbrandname,a~skunum,a~custcompanyid,c~companycode,c~zoneid,c~provincegeoid,
               c~provincegeoname,c~citygeoid,c~citygeoname,c~countygeoid,c~countygeoname,a~countryname,c~address,a~createdby,a~customerid,
               a~productstoreid,a~productstorename, a~productstorecompany,a~orderdate,a~createdate,a~createtime,a~contactnumber,a~contacttel,
               a~cusname,a~licpl,a~internalcode,a~toname,a~vhvin,a~vkorg,a~waydetail,a~statusid,a~statusiddesc,a~invoicetype,a~createdname,a~customername,
               a~actualcurrencyamount,a~canceldate,a~canceltime,a~cancelreason,a~lastlevelreason,c~cusid,c~displayname,a~orderid AS billno,
               a~fulfillstoreid,a~fulfillstorename,a~noteinfo
             INTO CORRESPONDING FIELDS OF TABLE @et_order FROM zticec_order_h AS a"zvicec_ord_ven AS a
             INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
             INNER JOIN ztint_ven_inf AS v ON a~productstoreid = v~productstoreid
              WHERE c~companyid IN @so_custcompanyid
               AND ( c~displayname IN @so_custcompanyname
                OR c~companycode IN @so_custcompanyname
                OR c~cusname IN @so_custcompanyname )
                "OR a~cusdisplayname IN @so_custcompanyname
               AND c~companycode IN @so_companycode
               AND c~zoneid IN @so_zoneid
               AND ( c~provincegeoid IN @so_citygeoid
                OR c~citygeoid IN @so_citygeoid
                OR c~countygeoid IN @so_citygeoid )
               AND a~originalsource IN @so_originalsource
               AND a~createdate IN  @so_createdate
               AND a~canceldate IN  @so_canceldate
               AND ( a~inquirytype IN @so_inquirytype OR a~saleschannelenumid IN @so_inquirytype )
               AND a~shoppinglistid IN @so_shoppinglistid
               AND a~orderid IN @so_orderid
               AND a~carbrandid IN @so_carbrandid
               AND a~createdname IN @so_createdname
               AND a~ordername IN @so_ordername "配件名称 零件号
               AND ( a~productstoreid IN @so_productstoreid
                OR a~productstorename IN @so_productstoreid
              OR a~fulfillstoreid IN @so_productstoreid
              OR a~fulfillstorename IN @so_productstoreid )"履约店铺
               AND a~orderid IN @so_cancel_order
              AND ( a~cancelreason IN @so_cancelreason
               OR a~lastlevelreason IN @so_cancelreason )."取消原因

          ELSE.

            SELECT DISTINCT a~orderid,a~ordertypeid,a~ordertypeid,a~originalorderid,a~originalsource,a~originalsourcedesc,a~ordername,
               a~shoppinglistid,a~inquirytype,a~carbrandid,a~carbrandname,a~skunum,a~custcompanyid,c~companycode,c~zoneid,c~provincegeoid,
               c~provincegeoname,c~citygeoid,c~citygeoname,a~countryname,c~address,a~createdby,a~customerid,a~createdname,a~customername,
               a~productstoreid,a~productstorename, a~productstorecompany,a~orderdate,a~createdate,a~createtime,a~contactnumber,a~contacttel,
               a~cusname,a~licpl,a~internalcode,a~toname,a~vhvin,a~vkorg,a~waydetail,a~statusid,a~statusiddesc,a~invoicetype,c~countygeoid,c~countygeoname,
               a~actualcurrencyamount,a~canceldate,a~canceltime,a~cancelreason,a~lastlevelreason,c~cusid,c~displayname,a~orderid AS billno,
                a~fulfillstoreid,a~fulfillstorename,a~noteinfo
                INTO CORRESPONDING FIELDS OF TABLE @et_order FROM zticec_order_h AS a"zvicec_ord_ven AS a
                INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
                INNER JOIN ztint_ven_inf AS v ON a~productstoreid = v~productstoreid
                WHERE c~companyid IN @so_custcompanyid
                 AND ( c~displayname IN @so_custcompanyname
                  OR c~companycode IN @so_custcompanyname
                  OR c~cusname IN @so_custcompanyname )
                  "OR a~cusdisplayname IN @so_custcompanyname
                 AND c~companycode IN @so_companycode
                 AND c~companyid IN @so_custcompanyid
                 AND c~zoneid IN @so_zoneid
                 AND ( c~provincegeoid IN @so_citygeoid
                  OR c~citygeoid IN @so_citygeoid
                  OR c~countygeoid IN @so_citygeoid  )
                 AND a~originalsource IN @so_originalsource
                 AND a~createdate IN  @so_createdate
                 AND a~canceldate IN  @so_canceldate
                  AND ( a~inquirytype IN @so_inquirytype OR a~saleschannelenumid IN @so_inquirytype )
                 AND a~shoppinglistid IN @so_shoppinglistid
                 AND a~orderid IN @so_orderid
                 AND a~carbrandid IN @so_carbrandid
                 AND a~createdname IN @so_createdname
                 AND a~ordername IN @so_ordername "配件名称 零件号
                 AND ( a~productstoreid IN @so_productstoreid
                  OR a~productstorename IN @so_productstoreid
                  OR a~fulfillstoreid IN @so_productstoreid
                  OR a~fulfillstorename IN @so_productstoreid )"履约店铺)
                 AND a~orderid IN @so_cancel_order
              AND ( a~cancelreason IN @so_cancelreason
               OR a~lastlevelreason IN @so_cancelreason )"取消原因
                 AND c~isdelete = 'X'.

          ENDIF.

        ELSE.
****获取当前钉钉下面的所有人 协同人可以查看客户订单信息20201223
          IF mv_type EQ '2' OR mv_type EQ '3'.
            get_person(
            EXPORTING so_userid = so_userid
            IMPORTING et_userlist = DATA(lt_userlist) ).
          ELSE.

            IF iv_isdelete NE 'X'.
              SELECT DISTINCT a~userid,a~username APPENDING CORRESPONDING FIELDS OF TABLE @lt_userlist
                  FROM ztint_user_inf AS a INNER JOIN ztint_cus_user AS b ON a~userid = b~userid
                  WHERE a~userid IN @so_userid AND a~isstill = 'X'  AND ( b~usertype = '1' OR b~usertype = '2' ) AND b~isdelete = ''.

            ELSE.
              SELECT DISTINCT a~userid,a~username APPENDING CORRESPONDING FIELDS OF TABLE @lt_userlist
               FROM ztint_user_inf AS a INNER JOIN ztint_cus_user AS b ON a~userid = b~userid
               WHERE a~userid IN @so_userid AND a~isstill = 'X'  AND ( b~usertype = '1' OR b~usertype = '2' ) AND b~ispre = 'X'.
            ENDIF.

          ENDIF.

          CHECK lt_userlist IS NOT INITIAL.

          IF iv_isdelete NE 'X'.
***获取客户经理对应的订单
            SELECT DISTINCT a~orderid,a~ordertypeid,a~ordertypeid,a~originalorderid,a~originalsource,a~originalsourcedesc,a~ordername,
               a~shoppinglistid,a~inquirytype,a~carbrandid,a~carbrandname,a~skunum,a~custcompanyid,c~companycode,c~zoneid,c~provincegeoid,
               c~provincegeoname,c~citygeoid,c~citygeoname,a~countryname,c~address,a~createdby,a~customerid,a~createdname,a~customername,
               a~productstoreid,a~productstorename, a~productstorecompany,a~orderdate,a~createdate,a~createtime,a~contactnumber,a~contacttel,
               a~cusname,a~licpl,a~internalcode,a~toname,a~vhvin,a~vkorg,a~waydetail,a~statusid,a~statusiddesc,a~invoicetype,c~countygeoid,c~countygeoname,
               a~actualcurrencyamount,a~canceldate,a~canceltime,a~cancelreason,a~lastlevelreason,c~cusid,c~displayname,a~orderid AS billno,
              a~fulfillstoreid,a~fulfillstorename,a~noteinfo
             INTO CORRESPONDING FIELDS OF TABLE @et_order
             FROM zticec_order_h AS a "zvicec_ord_ven AS a
             INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
             INNER JOIN ztint_ven_inf AS v ON a~productstoreid = v~productstoreid
             INNER JOIN ztint_cus_user AS b ON  c~cusid = b~cusid
              FOR ALL ENTRIES IN @lt_userlist
              WHERE  b~userid = @lt_userlist-userid
              AND ( b~usertype = '1' OR b~usertype = '2' )
              AND b~isdelete = ''
              AND ( c~displayname IN @so_custcompanyname
               OR c~companycode IN @so_custcompanyname
                OR c~cusname IN @so_custcompanyname )
               "OR a~cusdisplayname IN @so_custcompanyname )
              AND c~companycode IN @so_companycode
              AND c~companyid IN @so_custcompanyid
              AND c~zoneid IN @so_zoneid
              AND ( c~provincegeoid IN @so_citygeoid
               OR c~citygeoid IN @so_citygeoid
               OR c~countygeoid IN @so_citygeoid )
              AND a~originalsource IN @so_originalsource
              AND a~createdate IN  @so_createdate
              AND a~canceldate IN  @so_canceldate
              AND ( a~inquirytype IN @so_inquirytype OR a~saleschannelenumid IN @so_inquirytype )
              AND a~shoppinglistid IN @so_shoppinglistid
              AND a~orderid IN @so_orderid
              AND a~carbrandid IN @so_carbrandid
              AND a~createdname IN @so_createdname
              AND a~ordername IN @so_ordername "配件名称 零件号
              AND ( a~productstoreid IN @so_productstoreid
               OR a~productstorename IN @so_productstoreid
               OR a~fulfillstoreid IN @so_productstoreid
              OR a~fulfillstorename IN @so_productstoreid )"履约店铺)
              AND a~orderid IN @so_cancel_order
              AND ( a~cancelreason IN @so_cancelreason
               OR a~lastlevelreason IN @so_cancelreason )."取消原因.

******** 获取拓展经理对应订单
            IF so_userid IS INITIAL.
              SELECT DISTINCT a~orderid,a~ordertypeid,a~ordertypeid,a~originalorderid,a~originalsource,a~originalsourcedesc,a~ordername,
                 a~shoppinglistid,a~inquirytype,a~carbrandid,a~carbrandname,a~skunum,a~custcompanyid,c~companycode,c~zoneid,c~provincegeoid,
                 c~provincegeoname,c~citygeoid,c~citygeoname,a~countryname,c~address,a~createdby,a~customerid,a~createdname,a~customername,
                 a~productstoreid,a~productstorename, a~productstorecompany,a~orderdate,a~createdate,a~createtime,a~contactnumber,a~contacttel,
                 a~cusname,a~licpl,a~internalcode,a~toname,a~vhvin,a~vkorg,a~waydetail,a~statusid,a~statusiddesc,a~invoicetype,c~countygeoid,c~countygeoname,
                 a~actualcurrencyamount,a~canceldate,a~canceltime,a~cancelreason,a~lastlevelreason,c~cusid,c~displayname,a~orderid AS billno,
                 a~fulfillstoreid,a~fulfillstorename,a~noteinfo
                APPENDING CORRESPONDING FIELDS OF TABLE @et_order  FROM zticec_order_h AS a "zvicec_ord_ven AS a
                INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
                INNER JOIN ztint_ven_inf AS v ON a~productstoreid = v~productstoreid
                INNER JOIN ztint_ven_user AS u ON v~venid = u~venid
                FOR ALL ENTRIES IN @lt_userlist
                    WHERE  u~userid = @lt_userlist-userid"iv_id
                      AND ( u~usertype = '1' OR u~usertype = '2' )
                      AND u~isdelete = ''
                      AND c~companyid IN @so_custcompanyid
                      AND c~companycode IN @so_companycode
                      AND ( c~companycode IN @so_custcompanyname
                       OR c~displayname IN @so_custcompanyname
                       OR c~cusname IN @so_custcompanyname )
**                       ""OR a~cusdisplayname IN @so_custcompanyname )
                      AND ( c~provincegeoid IN @so_citygeoid
                       OR c~citygeoid IN @so_citygeoid
                       OR c~countygeoid IN @so_citygeoid )
                      AND c~zoneid IN @so_zoneid
                      AND a~originalsource IN @so_originalsource
                      AND a~createdate IN  @so_createdate
                      AND a~canceldate IN  @so_canceldate
                      AND ( a~inquirytype IN @so_inquirytype OR a~saleschannelenumid IN @so_inquirytype )
                      AND a~shoppinglistid IN @so_shoppinglistid
                      AND a~orderid IN @so_orderid
                      AND a~carbrandid IN @so_carbrandid
                      AND a~createdname IN @so_createdname
                      AND a~ordername IN @so_ordername
                      AND ( a~productstoreid IN @so_productstoreid
                       OR a~productstorename IN @so_productstoreid
                       OR a~fulfillstoreid IN @so_productstoreid
                       OR a~fulfillstorename IN @so_productstoreid )"履约店铺)
                      AND a~orderid IN @so_cancel_order
                AND ( a~cancelreason IN @so_cancelreason
               OR a~lastlevelreason IN @so_cancelreason )."取消原因.
            ENDIF.

          ELSE.

            SELECT DISTINCT a~orderid,a~ordertypeid,a~ordertypeid,a~originalorderid,a~originalsource,a~originalsourcedesc,a~ordername,
               a~shoppinglistid,a~inquirytype,a~carbrandid,a~carbrandname,a~skunum,a~custcompanyid,c~companycode,c~zoneid,c~provincegeoid,
               c~provincegeoname,c~citygeoid,c~citygeoname,a~countryname,c~address,a~createdby,a~customerid,a~createdname,a~customername,
               a~productstoreid,a~productstorename, a~productstorecompany,a~orderdate,a~createdate,a~createtime,a~contactnumber,a~contacttel,
               a~cusname,a~licpl,a~internalcode,a~toname,a~vhvin,a~vkorg,a~waydetail,a~statusid,a~statusiddesc,a~invoicetype,c~countygeoid,c~countygeoname,
               a~actualcurrencyamount,a~canceldate,a~canceltime,a~cancelreason,a~lastlevelreason,c~cusid,c~displayname,a~orderid AS billno,
              a~fulfillstoreid,a~fulfillstorename,a~noteinfo
             INTO CORRESPONDING FIELDS OF TABLE @et_order
             FROM zticec_order_h AS a "zvicec_ord_ven AS a
             INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
             INNER JOIN ztint_ven_inf AS v ON a~productstoreid = v~productstoreid
             INNER JOIN ztint_cus_user AS b ON c~cusid = b~cusid
              FOR ALL ENTRIES IN @lt_userlist
              WHERE  b~userid = @lt_userlist-userid
              AND ( b~usertype = '1' OR b~usertype = '2' )
              AND b~ispre = 'X'
              AND c~isdelete = 'X'
              AND ( c~displayname IN @so_custcompanyname
               OR c~companycode IN @so_custcompanyname
                OR c~cusname IN @so_custcompanyname )
**               "OR a~cusdisplayname IN @so_custcompanyname )
              AND c~companycode IN @so_companycode
              AND c~companyid IN @so_custcompanyid
              AND c~zoneid IN @so_zoneid
              AND ( c~provincegeoid IN @so_citygeoid
               OR c~citygeoid IN @so_citygeoid
               OR c~countygeoid IN @so_citygeoid  )
              AND a~originalsource IN @so_originalsource
              AND a~createdate IN  @so_createdate
              AND a~canceldate IN  @so_canceldate
              AND ( a~inquirytype IN @so_inquirytype OR a~saleschannelenumid IN @so_inquirytype )
              AND a~shoppinglistid IN @so_shoppinglistid
              AND a~orderid IN @so_orderid
              AND a~carbrandid IN @so_carbrandid
              AND a~createdname IN @so_createdname
              AND a~ordername IN @so_ordername "配件名称 零件号
              AND ( a~productstoreid IN @so_productstoreid
               OR a~productstorename IN @so_productstoreid
              OR a~fulfillstoreid IN @so_productstoreid
              OR a~fulfillstorename IN @so_productstoreid )"履约店铺)
              AND a~orderid IN @so_cancel_order
              AND ( a~cancelreason IN @so_cancelreason
               OR a~lastlevelreason IN @so_cancelreason )."取消原因.

******** 获取拓展经理订单
            IF so_userid IS INITIAL.
              SELECT DISTINCT a~orderid,a~ordertypeid,a~ordertypeid,a~originalorderid,a~originalsource,a~originalsourcedesc,a~ordername,
                 a~shoppinglistid,a~inquirytype,a~carbrandid,a~carbrandname,a~skunum,a~custcompanyid,c~companycode,c~zoneid,c~provincegeoid,
                 c~provincegeoname,c~citygeoid,c~citygeoname,a~countryname,c~address,a~createdby,a~customerid,a~createdname,a~customername,
                 a~productstoreid,a~productstorename, a~productstorecompany,a~orderdate,a~createdate,a~createtime,a~contactnumber,a~contacttel,
                 a~cusname,a~licpl,a~internalcode,a~toname,a~vhvin,a~vkorg,a~waydetail,a~statusid,a~statusiddesc,a~invoicetype,c~countygeoid,c~countygeoname,
                 a~actualcurrencyamount,a~canceldate,a~canceltime,a~cancelreason,a~lastlevelreason,c~cusid,c~displayname,a~orderid AS billno,
                a~fulfillstoreid,a~fulfillstorename,a~noteinfo
                APPENDING CORRESPONDING FIELDS OF TABLE @et_order
                 FROM zticec_order_h AS a "zvicec_ord_ven AS a
                INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
                INNER JOIN ztint_ven_inf AS v ON a~productstoreid = v~productstoreid
                INNER JOIN ztint_ven_user AS u ON v~venid = u~venid
                  FOR ALL ENTRIES IN @lt_userlist
                WHERE  u~userid = @lt_userlist-userid"iv_id
                  AND ( u~usertype = '1' OR u~usertype = '2' )
                  AND u~isdelete = ''
                  AND c~companyid IN @so_custcompanyid
                  AND c~companycode IN @so_companycode
                  AND ( c~companycode IN @so_custcompanyname
                   OR c~displayname IN @so_custcompanyname
                   OR c~cusname IN @so_custcompanyname )
**                  " OR a~cusdisplayname IN @so_custcompanyname
                  AND ( c~provincegeoid IN @so_citygeoid
                   OR c~citygeoid IN @so_citygeoid
                   OR c~countygeoid IN @so_citygeoid )
                  AND c~zoneid IN @so_zoneid
                  AND a~originalsource IN @so_originalsource
                  AND a~createdate IN  @so_createdate
                  AND a~canceldate IN  @so_canceldate
                  AND ( a~inquirytype IN @so_inquirytype OR a~saleschannelenumid IN @so_inquirytype )
                  AND a~shoppinglistid IN @so_shoppinglistid
                  AND a~orderid IN @so_orderid
                  AND a~carbrandid IN @so_carbrandid
                  AND a~createdname IN @so_createdname
                  AND a~ordername IN @so_ordername
                  AND ( a~productstoreid IN @so_productstoreid
                   OR a~productstorename IN @so_productstoreid
                   OR a~fulfillstoreid IN @so_productstoreid
                   OR a~fulfillstorename IN @so_productstoreid )"履约店铺)
                  AND a~orderid IN @so_cancel_order
                  AND ( a~cancelreason IN @so_cancelreason
                   OR a~lastlevelreason IN @so_cancelreason )."取消原因.
            ENDIF.
          ENDIF.

        ENDIF.
        "ADD 取消时间
        IF so_canceldate IS NOT INITIAL AND so_canceltime IS NOT INITIAL.
          LOOP AT so_canceldate INTO DATA(ls_opdate).
            IF ls_opdate-low = ls_opdate-high.
              DELETE et_order WHERE canceltime NOT IN so_canceltime.
            ELSE.
              LOOP AT so_canceltime INTO DATA(ls_optime).
                DELETE et_order WHERE ( canceldate EQ ls_opdate-low AND canceltime LT ls_optime-low ).
                DELETE et_order WHERE ( canceldate EQ ls_opdate-high AND canceltime GT ls_optime-high ).
                CLEAR ls_optime.
              ENDLOOP.
            ENDIF.
            CLEAR ls_opdate.
          ENDLOOP.

        ENDIF.

      CATCH  cx_sy_dynamic_osql_semantics INTO DATA(lo_cx).
    ENDTRY.
  ENDMETHOD.


  METHOD get_order_data_by_customer.
    DATA:lr_cusid TYPE RANGE OF ztint_cus_inf-cusid.
    CASE mv_type .
      WHEN 1.
*****根据选择的客户经理获取对应的客户ID
        IF so_userid IS NOT INITIAL.
          SELECT cusid
*          SELECT 'I' AS sign,'EQ' AS option,cusid AS low
            INTO TABLE @DATA(lt_cusid)
*            INTO CORRESPONDING FIELDS OF TABLE @lr_cusid
            FROM ztint_cus_user
           WHERE userid IN @so_userid
             AND usertype = '1'
             AND isdelete = ''.

          CHECK sy-subrc EQ 0.

          IF iv_isdelete NE 'X'.

            SELECT h~*,cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
                   cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid,
                   h~orderid AS billno
              INTO CORRESPONDING FIELDS OF TABLE @et_order
              FROM zticec_order_h AS h
             INNER JOIN ztint_cus_inf AS cus
                ON h~custcompanyid = cus~companyid
               FOR ALL ENTRIES IN @lt_cusid
             WHERE cus~cusid = @lt_cusid-cusid
*             WHERE cus~cusid IN @lr_cusid
               AND cus~companyid IN @so_custcompanyid
               AND ( cus~cusname IN @so_custcompanyname
                OR cus~companycode IN @so_custcompanyname
                OR cus~displayname IN @so_custcompanyname )
               AND cus~companycode IN @so_companycode
               AND cus~companyid IN @so_custcompanyid
               AND cus~zoneid IN @so_zoneid
               AND ( cus~provincegeoid IN @so_citygeoid
                OR cus~citygeoid IN @so_citygeoid )
               AND h~originalsource IN @so_originalsource
               AND h~createdate IN  @so_createdate
               AND h~inquirytype IN @so_inquirytype
               AND h~shoppinglistid IN @so_shoppinglistid
               AND h~orderid IN @so_orderid
               AND h~carbrandid IN @so_carbrandid
               AND h~createdname IN @so_createdname
               AND h~ordername IN @so_ordername "配件名称 零件号
               AND ( h~productstoreid IN @so_productstoreid
                OR h~productstorename IN @so_productstoreid )
               AND h~orderid IN @so_cancel_order.
          ELSE.

            SELECT h~*,cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
                   cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid,
                   h~orderid AS billno
              INTO CORRESPONDING FIELDS OF TABLE @et_order
              FROM zticec_order_h AS h
             INNER JOIN ztint_cus_inf AS cus
                ON h~custcompanyid = cus~companyid
               FOR ALL ENTRIES IN @lt_cusid
             WHERE cus~cusid = @lt_cusid-cusid
*             WHERE cus~cusid IN @lr_cusid
               AND cus~isdelete = 'X'
               AND cus~companyid IN @so_custcompanyid
               AND ( cus~cusname IN @so_custcompanyname
                OR cus~companycode IN @so_custcompanyname
                OR cus~displayname IN @so_custcompanyname )
               AND cus~companycode IN @so_companycode
               AND cus~companyid IN @so_custcompanyid
               AND cus~zoneid IN @so_zoneid
               AND ( cus~provincegeoid IN @so_citygeoid
                OR cus~citygeoid IN @so_citygeoid )
               AND h~originalsource IN @so_originalsource
               AND h~createdate IN  @so_createdate
               AND h~inquirytype IN @so_inquirytype
               AND h~shoppinglistid IN @so_shoppinglistid
               AND h~orderid IN @so_orderid
               AND h~carbrandid IN @so_carbrandid
               AND h~createdname IN @so_createdname
               AND h~ordername IN @so_ordername "配件名称 零件号
               AND ( h~productstoreid IN @so_productstoreid
                OR h~productstorename IN @so_productstoreid )
               AND h~orderid IN @so_cancel_order.
*            IF so_cancel_order IS NOT INITIAL.
*              DELETE et_order WHERE orderid NOT IN so_cancel_order.
*            ENDIF.
          ENDIF.
        ELSEIF so_custcompanyid IS NOT INITIAL OR so_companycode IS NOT INITIAL
          OR so_custcompanyname IS NOT INITIAL OR so_custcompanyid IS NOT INITIAL OR
          so_citygeoid IS NOT INITIAL OR so_zoneid IS NOT INITIAL.

          IF iv_isdelete NE 'X'.
            SELECT cusid
*            SELECT  'I' AS sign,'EQ' AS option,cusid AS low
              INTO CORRESPONDING FIELDS OF TABLE @lt_cusid
*              INTO CORRESPONDING FIELDS OF TABLE @lr_cusid
              FROM ztint_cus_inf
             WHERE companyid IN @so_custcompanyid
               AND ( cusname IN @so_custcompanyname
                OR companycode IN @so_custcompanyname
                OR displayname IN @so_custcompanyname )
               AND companycode IN @so_companycode
               AND companyid IN @so_custcompanyid
               AND zoneid IN @so_zoneid
               AND ( provincegeoid IN @so_citygeoid
                OR citygeoid IN @so_citygeoid ).
            CHECK sy-subrc EQ 0.
          ELSE.
            SELECT cusid INTO CORRESPONDING FIELDS OF TABLE @lt_cusid
*            SELECT  'I' AS sign,'EQ' AS option,cusid AS low INTO CORRESPONDING FIELDS OF TABLE @lr_cusid
             FROM ztint_cus_inf
             WHERE companyid IN @so_custcompanyid
             AND ( cusname IN @so_custcompanyname
             OR companycode IN @so_custcompanyname
             OR displayname IN @so_custcompanyname )
             AND companycode IN @so_companycode
             AND companyid IN @so_custcompanyid
             AND zoneid IN @so_zoneid
             AND isdelete = 'X'
             AND ( provincegeoid IN @so_citygeoid
             OR citygeoid IN @so_citygeoid ).
            CHECK sy-subrc EQ 0.
          ENDIF.

          IF iv_isdelete NE 'X'.

            SELECT h~*,cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
                   cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid,
                   h~orderid AS billno
              INTO CORRESPONDING FIELDS OF TABLE @et_order
              FROM zticec_order_h AS h
             INNER JOIN ztint_cus_inf AS cus
                ON h~custcompanyid = cus~companyid
               FOR ALL ENTRIES IN @lt_cusid
             WHERE cus~cusid = @lt_cusid-cusid
*             WHERE cus~cusid IN @lr_cusid
               AND cus~companyid IN @so_custcompanyid
               AND ( cus~cusname IN @so_custcompanyname
                OR cus~companycode IN @so_custcompanyname
                OR cus~displayname IN @so_custcompanyname )
               AND cus~companycode IN @so_companycode
               AND cus~companyid IN @so_custcompanyid
               AND cus~zoneid IN @so_zoneid
               AND ( cus~provincegeoid IN @so_citygeoid
                OR cus~citygeoid IN @so_citygeoid )
               AND h~originalsource IN @so_originalsource
               AND h~createdate IN  @so_createdate
               AND h~inquirytype IN @so_inquirytype
               AND h~shoppinglistid IN @so_shoppinglistid
               AND h~orderid IN @so_orderid
               AND h~carbrandid IN @so_carbrandid
               AND h~createdname IN @so_createdname
               AND h~ordername IN @so_ordername "配件名称 零件号
               AND ( h~productstoreid IN @so_productstoreid
                OR h~productstorename IN @so_productstoreid )
               AND h~orderid IN @so_cancel_order.
          ELSE.

            SELECT h~*,cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
                   cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid,
                   h~orderid AS billno
              INTO CORRESPONDING FIELDS OF TABLE @et_order
              FROM zticec_order_h AS h
             INNER JOIN ztint_cus_inf AS cus
                ON h~custcompanyid = cus~companyid
               FOR ALL ENTRIES IN @lt_cusid
             WHERE cus~cusid = @lt_cusid-cusid
*             WHERE cus~cusid IN @lr_cusid
               AND cus~isdelete = 'X'
               AND cus~companyid IN @so_custcompanyid
               AND ( cus~cusname IN @so_custcompanyname
                OR cus~companycode IN @so_custcompanyname
                OR cus~displayname IN @so_custcompanyname )
               AND cus~companycode IN @so_companycode
               AND cus~companyid IN @so_custcompanyid
               AND cus~zoneid IN @so_zoneid
               AND ( cus~provincegeoid IN @so_citygeoid
                OR cus~citygeoid IN @so_citygeoid )
               AND h~originalsource IN @so_originalsource
               AND h~createdate IN  @so_createdate
               AND h~inquirytype IN @so_inquirytype
               AND h~shoppinglistid IN @so_shoppinglistid
               AND h~orderid IN @so_orderid
               AND h~carbrandid IN @so_carbrandid
               AND h~createdname IN @so_createdname
               AND h~ordername IN @so_ordername "配件名称 零件号
               AND ( h~productstoreid IN @so_productstoreid
                OR h~productstorename IN @so_productstoreid )
               AND h~orderid IN @so_cancel_order.
          ENDIF.

*          IF so_cancel_order IS NOT INITIAL.
*            DELETE et_order WHERE orderid NOT IN so_cancel_order.
*          ENDIF.

        ELSE.

****因为有变态的订单的客户编码不在客户表中，所以不能使用INNER JOIN
*****         先查订单
          SELECT h~*,h~orderid AS billno
            INTO CORRESPONDING FIELDS OF TABLE @et_order
            FROM zticec_order_h AS h
          WHERE h~originalsource IN @so_originalsource
            AND h~createdate IN  @so_createdate
            AND h~inquirytype IN @so_inquirytype
            AND h~shoppinglistid IN @so_shoppinglistid
            AND h~orderid IN @so_orderid
            AND h~carbrandid IN @so_carbrandid
            AND h~createdname IN @so_createdname
             AND h~ordername IN @so_ordername "配件名称 零件号
            AND ( h~productstoreid IN @so_productstoreid
             OR h~productstorename IN @so_productstoreid )
            AND h~orderid IN @so_cancel_order.
          IF sy-subrc EQ 0.
            DATA(lt_order) = et_order.
            SORT lt_order BY custcompanyid.
            DELETE ADJACENT DUPLICATES FROM lt_order COMPARING custcompanyid.
***** 再查客户
            IF iv_isdelete NE 'X'.
              SELECT cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
                  cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid
                INTO CORRESPONDING FIELDS OF TABLE @et_order_cus
                FROM ztint_cus_inf AS cus
                FOR ALL ENTRIES IN @lt_order
              WHERE cus~companyid = @lt_order-custcompanyid
                AND ( cus~cusname IN @so_custcompanyname
                 OR cus~companycode IN @so_custcompanyname
                 OR cus~displayname IN @so_custcompanyname )
                AND cus~companycode IN @so_companycode
                AND cus~companyid IN @so_custcompanyid
                AND cus~zoneid IN @so_zoneid
                AND ( cus~provincegeoid IN @so_citygeoid
                 OR cus~citygeoid IN @so_citygeoid ).
            ELSE.
              SELECT cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
                  cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid
                INTO CORRESPONDING FIELDS OF TABLE @et_order_cus
                FROM ztint_cus_inf AS cus
                FOR ALL ENTRIES IN @lt_order
               WHERE cus~companyid = @lt_order-custcompanyid
                AND ( cus~cusname IN @so_custcompanyname
                 OR cus~companycode IN @so_custcompanyname
                 OR cus~displayname IN @so_custcompanyname )
                AND cus~companycode IN @so_companycode
                AND cus~companyid IN @so_custcompanyid
                AND cus~zoneid IN @so_zoneid
                AND ( cus~provincegeoid IN @so_citygeoid
                OR cus~citygeoid IN @so_citygeoid )
                AND cus~isdelete = 'X'.

            ENDIF.
            SORT et_order_cus BY companyid.
          ENDIF.
        ENDIF.
      WHEN 2 OR 3.
****获取当前钉钉下面的所有人
        get_person(
          EXPORTING so_userid = so_userid
          IMPORTING et_userlist = DATA(lt_userlist) ).
***获取客户经理对于的客户
        IF lt_userlist IS NOT INITIAL.
          IF iv_isdelete NE 'X'.

            SELECT h~*,cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
              cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid,
              h~orderid AS billno
              INTO CORRESPONDING FIELDS OF TABLE @et_order
              FROM zticec_order_h AS h
             INNER JOIN ztint_cus_inf AS cus
               ON h~custcompanyid = cus~companyid
             INNER JOIN ztint_cus_user AS u
                ON cus~cusid = u~cusid
               FOR ALL ENTRIES IN @lt_userlist
             WHERE  u~userid = @lt_userlist-userid"iv_id
               AND u~usertype = '1'
               AND u~isdelete = ''
               AND cus~status = '3'
               AND cus~isvirtual = ''
               AND ( cus~cusname IN @so_custcompanyname
                OR cus~companycode IN @so_custcompanyname
                OR cus~displayname IN @so_custcompanyname )
               AND cus~companycode IN @so_companycode
               AND cus~companyid IN @so_custcompanyid
               AND cus~zoneid IN @so_zoneid
               AND ( cus~provincegeoid IN @so_citygeoid
                OR cus~citygeoid IN @so_citygeoid )
               AND h~originalsource IN @so_originalsource
               AND h~createdate IN  @so_createdate
               AND h~inquirytype IN @so_inquirytype
               AND h~shoppinglistid IN @so_shoppinglistid
               AND h~orderid IN @so_orderid
               AND h~carbrandid IN @so_carbrandid
               AND h~createdname IN @so_createdname
               AND h~ordername IN @so_ordername "配件名称 零件号
               AND ( h~productstoreid IN @so_productstoreid
                OR h~productstorename IN @so_productstoreid )
               AND h~orderid IN @so_cancel_order..
          ELSE.

            SELECT h~*,cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
              cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid,
              h~orderid AS billno
              INTO CORRESPONDING FIELDS OF TABLE @et_order
              FROM zticec_order_h AS h
             INNER JOIN ztint_cus_inf AS cus
               ON h~custcompanyid = cus~companyid
             INNER JOIN ztint_cus_user AS u
                ON cus~cusid = u~cusid
               FOR ALL ENTRIES IN @lt_userlist
             WHERE  u~userid = @lt_userlist-userid"iv_id
               AND u~usertype = '1'
               AND u~ispre = 'X'
               AND cus~status = '3'
               AND cus~isdelete = 'X'
               AND cus~isvirtual = ''
               AND ( cus~cusname IN @so_custcompanyname
                OR cus~companycode IN @so_custcompanyname
                OR cus~displayname IN @so_custcompanyname )
               AND cus~companycode IN @so_companycode
               AND cus~companyid IN @so_custcompanyid
               AND cus~zoneid IN @so_zoneid
               AND ( cus~provincegeoid IN @so_citygeoid
                OR cus~citygeoid IN @so_citygeoid )
               AND h~originalsource IN @so_originalsource
               AND h~createdate IN  @so_createdate
               AND h~inquirytype IN @so_inquirytype
               AND h~shoppinglistid IN @so_shoppinglistid
               AND h~orderid IN @so_orderid
               AND h~carbrandid IN @so_carbrandid
               AND h~createdname IN @so_createdname
               AND h~ordername IN @so_ordername "配件名称 零件号
               AND ( h~productstoreid IN @so_productstoreid
                OR h~productstorename IN @so_productstoreid )
               AND h~orderid IN @so_cancel_order..
          ENDIF.
        ENDIF.
      WHEN OTHERS.
    ENDCASE.
  ENDMETHOD.


  METHOD get_order_data_by_vendor.
    DATA:lr_venid TYPE RANGE OF ztint_ven_inf-venid.
****获取钉钉用户在供应商上的数据权限
    CASE mv_type .
      WHEN 1.
************数据权限为1时不用再查找
****        IF so_userid IS NOT INITIAL.
****          SELECT 'I' AS sign,'EQ' AS option,venid AS low
****            INTO CORRESPONDING FIELDS OF TABLE @lr_venid
****            FROM ztint_ven_user
****           WHERE userid IN @so_userid
****             AND isdelete = ''.
****          CHECK sy-subrc EQ 0.
****        ENDIF.
****
****        SELECT h~*,cus~*
****          INTO CORRESPONDING FIELDS OF TABLE @et_ven_order
****          FROM zticec_order_h AS h
****         INNER JOIN ztint_cus_inf AS cus
****            ON h~custcompanyid = cus~companyid
****         INNER JOIN ztint_ven_inf AS ven
****           ON h~productstoreid = ven~productstoreid
****        WHERE ven~venid IN @lr_venid
****          AND ven~venid IN @so_custcompanyid
****          AND ven~venname IN @so_custcompanyname
****          AND ( ven~provincegeoid IN @so_citygeoid
****           OR ven~citygeoid IN @so_citygeoid )
****          AND h~originalsource IN @so_originalsource
****          AND h~createdate IN  @so_createdate
****          AND h~inquirytype IN @so_inquirytype
****          AND h~shoppinglistid IN @so_shoppinglistid
****          AND h~orderid IN @so_orderid
****          AND h~carbrandid IN @so_carbrandid
****          AND h~createdname IN @so_createdname
****          AND h~productstoreid IN @so_productstoreid
****          AND h~orderid IN @so_cancel_order..

      WHEN 2 OR 3.
****获取当前钉钉下面的所有人
        get_person(
        EXPORTING so_userid = so_userid
          IMPORTING et_userlist = DATA(lt_userlist) ).
**获取拓展经理对应的供应商的单及单中客户对应的客户经理
        IF lt_userlist IS NOT INITIAL.
          IF iv_isdelete NE 'X'.

            SELECT h~*,cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
              cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid,
              h~orderid AS billno
              INTO CORRESPONDING FIELDS OF TABLE @et_ven_order
              FROM zticec_order_h AS h
             INNER JOIN ztint_cus_inf AS cus
              ON h~custcompanyid = cus~companyid
             INNER JOIN ztint_ven_inf AS ven
               ON h~productstoreid = ven~productstoreid
             INNER JOIN ztint_ven_user AS u
                ON ven~venid = u~venid
               FOR ALL ENTRIES IN @lt_userlist
             WHERE  u~userid = @lt_userlist-userid"iv_id
               AND u~usertype = '1'
               AND u~isdelete = ''
               AND cus~companyid IN @so_custcompanyid
               AND cus~companycode IN @so_companycode
               AND ( cus~companycode IN @so_custcompanyname
                OR cus~cusname IN @so_custcompanyname
                OR cus~displayname IN @so_custcompanyname )
               AND ( cus~provincegeoid IN @so_citygeoid
                OR cus~citygeoid IN @so_citygeoid )
               AND cus~zoneid IN @so_zoneid
               AND h~originalsource IN @so_originalsource
               AND h~createdate IN  @so_createdate
               AND h~inquirytype IN @so_inquirytype
               AND h~shoppinglistid IN @so_shoppinglistid
               AND h~orderid IN @so_orderid
               AND h~carbrandid IN @so_carbrandid
               AND h~createdname IN @so_createdname
               AND h~ordername IN @so_ordername
               AND ( h~productstoreid IN @so_productstoreid
                OR h~productstorename IN @so_productstoreid )
               AND h~orderid IN @so_cancel_order.
          ELSE.

            SELECT h~*,cus~cusid,cus~cusname AS displayname,cus~companyid,cus~companycode,cus~provincegeoid,
                 cus~provincegeoname,cus~citygeoid,cus~citygeoname,cus~countygeoid,cus~countygeoname,cus~zoneid,
                 h~orderid AS billno
                 INTO CORRESPONDING FIELDS OF TABLE @et_ven_order
                 FROM zticec_order_h AS h
                INNER JOIN ztint_cus_inf AS cus
                 ON h~custcompanyid = cus~companyid
                INNER JOIN ztint_ven_inf AS ven
                  ON h~productstoreid = ven~productstoreid
                INNER JOIN ztint_ven_user AS u
                   ON ven~venid = u~venid
                  FOR ALL ENTRIES IN @lt_userlist
                WHERE  u~userid = @lt_userlist-userid"iv_id
                  AND u~usertype = '1'
                  AND u~ispre = 'X'
                  AND cus~isdelete = 'X'
                  AND cus~companyid IN @so_custcompanyid
                  AND cus~companycode IN @so_companycode
                  AND ( cus~companycode IN @so_custcompanyname
                   OR cus~cusname IN @so_custcompanyname
                   OR cus~displayname IN @so_custcompanyname )
                  AND ( cus~provincegeoid IN @so_citygeoid
                   OR cus~citygeoid IN @so_citygeoid )
                  AND cus~zoneid IN @so_zoneid
                  AND h~originalsource IN @so_originalsource
                  AND h~createdate IN  @so_createdate
                  AND h~inquirytype IN @so_inquirytype
                  AND h~shoppinglistid IN @so_shoppinglistid
                  AND h~orderid IN @so_orderid
                  AND h~carbrandid IN @so_carbrandid
                  AND h~createdname IN @so_createdname
                  AND h~ordername IN @so_ordername
                  AND ( h~productstoreid IN @so_productstoreid
                   OR h~productstorename IN @so_productstoreid )
                  AND h~orderid IN @so_cancel_order.

          ENDIF.
        ENDIF.
      WHEN OTHERS.
    ENDCASE.
  ENDMETHOD.


  METHOD get_order_data_new_v2.
    DATA:lr_isdelete   TYPE RANGE OF ztint_cus_inf-isdelete,
         lr_userdelete TYPE RANGE OF ztint_ven_user-isdelete,
         lr_userttype  TYPE RANGE OF ztint_cus_user-usertype,
         lr_userpre    TYPE RANGE OF ztint_ven_user-ispre.

    DATA:lr_storeid          TYPE RANGE OF ztint_ven_inf-productstoreid,
         lr_spstoreid        TYPE RANGE OF ztint_ven_inf-productstoreid,
         lr_storeid_filter   TYPE RANGE OF ztint_ven_inf-productstoreid,
         lr_companyid        TYPE RANGE OF ztint_cus_inf-companyid,
         lr_companyid_filter TYPE RANGE OF ztint_cus_inf-companyid,
         lr_spcompanyid      TYPE RANGE OF ztint_cus_inf-companyid,
         lr_companyid_tmp    TYPE RANGE OF ztint_cus_inf-companyid,
         lv_ordered          TYPE string.

    DATA:lv_from TYPE int4,
         lv_to   TYPE int4,
         lv_mod  TYPE int4,
         lv_cnt  TYPE int4,
         lv_div  TYPE int4.
    TYPES:BEGIN OF ty_cus,
            companyid TYPE ztint_cus_inf-companyid,
          END OF ty_cus.
    DATA:lt_usercompanyid TYPE SORTED TABLE OF ty_cus WITH NON-UNIQUE KEY companyid,
         lt_companyid_ext TYPE SORTED TABLE OF ty_cus WITH NON-UNIQUE KEY companyid.
    TYPES:BEGIN OF ty_ven,
            productstoreid TYPE ztint_ven_inf-productstoreid,
          END OF ty_ven.
    DATA:lt_userstore   TYPE SORTED TABLE OF ty_ven WITH NON-UNIQUE KEY productstoreid.

    DATA:lv_condition TYPE string.

    IF iv_isdelete EQ 'X'.
      lr_isdelete = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
      lr_userdelete  = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
      lr_userpre  = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
    ELSE.
      lr_userdelete  = VALUE #( ( sign = 'I' option = 'EQ' low = '' ) ).
      lr_userpre  = VALUE #( ( sign = 'I' option = 'EQ' low = '' ) ).
    ENDIF.

    IF so_userid IS NOT INITIAL."如果指定查客户经理，就只能查客户经理的，不能查协同人
      lr_userttype = VALUE #( ( sign = 'I' option = 'EQ' low = '1' ) ).
    ENDIF.

    IF ( mv_type EQ '1' OR mv_type EQ '4' ) AND so_userid IS NOT INITIAL.."1权限查指定客户经理的，先将指定客户经理的客户捞出来
      SELECT companyid
         INTO TABLE @lt_usercompanyid FROM ztint_cus_inf AS i
        INNER JOIN ztint_cus_user AS u ON i~cusid = u~cusid
       WHERE userid IN @so_userid AND u~ispre IN @lr_userpre AND u~isdelete IN @lr_userdelete AND companyid NE ''.
      IF lt_usercompanyid IS INITIAL.
        EXIT.
      ENDIF.
    ELSEIF mv_type EQ '2' OR mv_type EQ '3'.
      "2,3权限的，先看负责区域的人员清单
      get_person( EXPORTING so_userid = so_userid
              IMPORTING et_userlist = DATA(lt_userlist) ).
      IF lt_userlist IS NOT INITIAL.
        "作为客户经理或协同人
        SELECT companyid
          INTO  TABLE @lt_usercompanyid FROM ztint_cus_inf AS i
          INNER JOIN ztint_cus_user AS u ON i~cusid = u~cusid
          FOR ALL ENTRIES IN @lt_userlist
         WHERE userid = @lt_userlist-userid
           AND u~ispre IN @lr_userpre AND u~isdelete IN @lr_userdelete AND companyid NE ''.
        "作为拓展
        SELECT productstoreid
          INTO TABLE @lt_userstore FROM ztint_ven_inf AS i
          INNER JOIN ztint_ven_user AS u ON i~venid = u~venid
          FOR ALL ENTRIES IN @lt_userlist
          WHERE userid = @lt_userlist-userid AND u~isdelete = '' AND u~usertype = '1' AND productstoreid NE ''.
        IF lt_usercompanyid IS INITIAL AND lt_userstore IS INITIAL .
          EXIT.
        ENDIF.
      ELSE.
        IF so_userid IS NOT INITIAL.
          "一种情况，如果没有查看供应商的权限，就不能看指定的客户经理的权限
          "另外一种，拓展要看这个客户经理负责的客户在自己所能看到的店铺的单
          DATA(lv_spical) = 'X'.
          "作为客户经理或协同人
          SELECT  'I' AS sign,'EQ' AS option,companyid AS low FROM ztint_cus_inf AS i
            INNER JOIN ztint_cus_user AS u ON i~cusid = u~cusid
            INTO CORRESPONDING FIELDS OF TABLE @lr_spcompanyid
           WHERE userid IN @so_userid AND usertype = '1' AND u~ispre = '' AND u~isdelete = '' AND companyid NE '' .
          "作为拓展
          SELECT'I' AS sign,'EQ' AS option,productstoreid AS low
            FROM ztint_ven_inf AS i INNER JOIN ztint_ven_user AS u ON i~venid = u~venid
            INTO CORRESPONDING FIELDS OF TABLE @lr_spstoreid
            WHERE userid = @mv_userid AND u~isdelete = '' AND productstoreid NE ''.
        ELSE.
          EXIT.
        ENDIF.
      ENDIF.
    ENDIF.

    "根据筛选条件获取客户清单,"
    IF so_custcompanyname IS NOT INITIAL OR so_companycode IS NOT INITIAL OR so_custcompanyid IS NOT INITIAL OR
      so_citygeoid IS NOT INITIAL OR  so_zoneid IS NOT INITIAL.
      SELECT 'I' AS sign,'EQ' AS option,companyid AS low
        APPENDING CORRESPONDING FIELDS OF TABLE @lr_companyid
        FROM ztint_cus_inf
       WHERE ( cusname IN @so_custcompanyname OR displayname IN @so_custcompanyname OR companycode IN @so_custcompanyname )
         AND companycode IN @so_companycode
         AND companyid IN @so_custcompanyid
         AND companyid NE ''
         AND ( provincegeoid IN @so_citygeoid OR citygeoid IN @so_citygeoid OR countygeoid IN @so_citygeoid )
         AND zoneid IN @so_zoneid.
    ENDIF.

    IF so_productstoreid IS NOT INITIAL.
      SELECT 'I' AS sign,'EQ' AS option,productstoreid AS low FROM ztint_ven_inf
      INTO CORRESPONDING FIELDS OF TABLE @lr_storeid
     WHERE ( venname IN @so_productstoreid OR displayname IN @so_productstoreid
        OR productstoreid IN @so_productstoreid )
       AND productstoreid NE ''.
    ENDIF.

    DATA:lv_date TYPE sy-datum.
    IF so_createdate IS INITIAL AND so_canceldate IS INITIAL AND so_orderid IS INITIAL.
      "3默认3个月
      lv_date = sy-datum - 90.
      so_createdate = VALUE #( ( sign = 'I' option = 'BT' low = lv_date high = sy-datum ) ).
    ENDIF.

    IF so_orderid IS NOT INITIAL."查询完整的订单，删除时间限制
      DATA(lv_orderid) = VALUE #( so_orderid[ 1 ]-low OPTIONAL ).
      IF strlen( lv_orderid ) EQ  14."*S2211070002143*"
        CLEAR so_createdate.
      ENDIF.
    ELSE.
      DATA(lv_eq) = VALUE #( so_custcompanyid[ 1 ]-option OPTIONAL )."指定了客户的，不限制时间
      IF lv_eq EQ 'EQ'.
        CLEAR so_createdate.
      ENDIF.
    ENDIF.


    "作为客户经理查找

    IF lv_spical IS INITIAL.
      IF lr_companyid IS INITIAL AND lt_usercompanyid IS INITIAL AND lr_storeid IS INITIAL AND lt_userstore IS INITIAL.
        SELECT h~orderid,h~custcompanyid,h~statusid,h~createdate,h~createtime,h~productstoreid,
           h~canceldate,h~canceltime,h~originalsource,h~actualcurrencyamount,h~orderid AS billno
          APPENDING CORRESPONDING FIELDS OF TABLE @et_order
         FROM zticec_order_h AS h INNER JOIN ztint_cus_inf AS i ON h~custcompanyid = i~companyid LEFT JOIN zticec_payments AS p
           ON h~orderid = p~orderid
        WHERE custcompanyid IN @lr_companyid
          AND originalsource IN @so_originalsource
          AND createdate IN  @so_createdate
          AND canceldate IN  @so_canceldate
          AND ( inquirytype IN @so_inquirytype OR saleschannelenumid IN @so_inquirytype )
          AND shoppinglistid IN @so_shoppinglistid
          AND h~orderid IN @so_orderid
          AND carbrandid IN @so_carbrandid
          AND createdname IN @so_createdname
          AND ordername IN @so_ordername "配件名称 零件号
          AND paymentmethodtypeid IN @so_paymentmethodtypeid
          AND ( productstoreid IN @lr_storeid
           OR fulfillstoreid IN @lr_storeid )"履约店铺
          AND ( cancelreason IN @so_cancelreason
           OR lastlevelreason IN @so_cancelreason )."取消原因
      ELSE.

        "CF-查询条件能查询到的客户
        "CA-权限能查询到的客户
        "SF-查询条件能查询到的店铺
        "SA-权限能查询到的店铺

        "作为BD:CF与CA取交集 再限制SF
        IF lr_companyid IS NOT INITIAL AND lt_usercompanyid IS NOT INITIAL.
          lr_companyid_filter = FILTER #( lr_companyid IN lt_usercompanyid WHERE low = companyid ).
        ELSEIF lr_companyid IS INITIAL AND lt_usercompanyid IS NOT INITIAL.
          lr_companyid_filter = VALUE #( FOR wa IN lt_usercompanyid ( sign = 'I' option = 'EQ' low = wa-companyid ) ).
        ELSEIF lr_companyid IS NOT INITIAL AND lt_usercompanyid IS INITIAL.
          lr_companyid_filter = lr_companyid.
        ENDIF.
        IF lr_companyid_filter IS NOT INITIAL.
          lv_cnt = lines( lr_companyid_filter ).
          lv_div = lv_cnt DIV 30000.
          lv_mod = lv_cnt MOD 30000.
          IF lv_mod NE 0 OR lv_cnt EQ 0..
            lv_div = lv_div + 1.
          ENDIF.
          DO lv_div TIMES.
            lv_from = ( sy-index - 1 ) * 30000 + 1.
            lv_to = sy-index * 30000.
            IF lv_to > lv_cnt.
              lv_to = lv_cnt.
            ENDIF.
            IF lv_cnt NE 0.
              APPEND LINES OF lr_companyid_filter FROM lv_from TO lv_to TO lr_companyid_tmp.
            ENDIF.

            SELECT h~orderid,h~custcompanyid,h~statusid,h~createdate,h~createtime,h~productstoreid,
            h~canceldate,h~canceltime,h~originalsource,h~actualcurrencyamount,h~orderid AS billno
              APPENDING CORRESPONDING FIELDS OF TABLE @et_order
              FROM zticec_order_h AS h INNER JOIN ztint_cus_inf AS i ON h~custcompanyid = i~companyid LEFT JOIN zticec_payments AS p
                ON h~orderid = p~orderid
             WHERE custcompanyid IN @lr_companyid_tmp
               AND originalsource IN @so_originalsource
               AND createdate IN  @so_createdate
               AND canceldate IN  @so_canceldate
               AND ( inquirytype IN @so_inquirytype OR saleschannelenumid IN @so_inquirytype )
               AND shoppinglistid IN @so_shoppinglistid
               AND h~orderid IN @so_orderid
               AND carbrandid IN @so_carbrandid
               AND createdname IN @so_createdname
               AND ordername IN @so_ordername "配件名称 零件号
               AND paymentmethodtypeid IN @so_paymentmethodtypeid
               AND ( productstoreid IN @lr_storeid
                OR fulfillstoreid IN @lr_storeid )"履约店铺
               AND ( cancelreason IN @so_cancelreason
                OR lastlevelreason IN @so_cancelreason )."取消原因
            CLEAR:lv_from,lv_to,lr_companyid_tmp..
          ENDDO.
        ENDIF.

        "作为拓展:SF与SA取交集 再限制CF
        IF lt_userstore IS NOT INITIAL."必须要有店铺
          IF lr_storeid IS NOT INITIAL AND lt_userstore IS NOT INITIAL.
            lr_storeid_filter = FILTER #( lr_storeid IN lt_userstore WHERE low = productstoreid ).
          ELSEIF  lr_storeid IS INITIAL AND lt_userstore IS NOT INITIAL.
            lr_storeid_filter = VALUE #( FOR was IN lt_userstore ( sign = 'I' option = 'EQ' low = was-productstoreid ) ).
          ENDIF.
        ENDIF.

        IF so_userid IS NOT INITIAL.
          IF lr_companyid IS NOT INITIAL AND lt_usercompanyid IS NOT INITIAL.
            lr_companyid = FILTER #( lr_companyid IN lt_usercompanyid WHERE low = companyid ).
          ELSEIF lr_companyid IS INITIAL AND lt_usercompanyid IS NOT INITIAL.
            lr_companyid = VALUE #( FOR wa IN lt_usercompanyid ( sign = 'I' option = 'EQ' low = wa-companyid ) ).
          ELSEIF lr_companyid IS NOT INITIAL AND lt_usercompanyid IS INITIAL.
            lr_companyid_filter = lr_companyid.
          ENDIF.
        ENDIF.

        IF lr_storeid_filter IS NOT INITIAL.
          lv_cnt = lines( lr_companyid ).
          lv_div = lv_cnt DIV 30000.
          lv_mod = lv_cnt MOD 30000.
          IF lv_mod NE 0 OR lv_cnt EQ 0.
            lv_div = lv_div + 1.
          ENDIF.

          DO lv_div TIMES.
            lv_from = ( sy-index - 1 ) * 30000 + 1.
            lv_to = sy-index * 30000.
            IF lv_to > lv_cnt.
              lv_to = lv_cnt.
            ENDIF.
            IF lv_cnt NE 0.
              APPEND LINES OF lr_companyid FROM lv_from TO lv_to TO lr_companyid_tmp.
            ENDIF.

            SELECT h~orderid,h~custcompanyid,h~statusid,h~createdate,h~createtime,h~productstoreid,
                h~canceldate,h~canceltime,h~originalsource,h~actualcurrencyamount,h~orderid AS billno
             APPENDING CORRESPONDING FIELDS OF TABLE @et_order
             FROM zticec_order_h AS h INNER JOIN ztint_cus_inf AS i ON h~custcompanyid = i~companyid LEFT JOIN zticec_payments AS p
               ON h~orderid = p~orderid
            WHERE custcompanyid IN @lr_companyid_tmp
              AND originalsource IN @so_originalsource
              AND createdate IN  @so_createdate
              AND canceldate IN  @so_canceldate
              AND ( inquirytype IN @so_inquirytype OR saleschannelenumid IN @so_inquirytype )
              AND shoppinglistid IN @so_shoppinglistid
              AND h~orderid IN @so_orderid
              AND carbrandid IN @so_carbrandid
              AND createdname IN @so_createdname
              AND ordername IN @so_ordername "配件名称 零件号
              AND paymentmethodtypeid IN @so_paymentmethodtypeid
              AND ( productstoreid IN @lr_storeid_filter
               OR fulfillstoreid IN @lr_storeid_filter )"履约店铺
              AND ( cancelreason IN @so_cancelreason
               OR lastlevelreason IN @so_cancelreason )."取消原因
            CLEAR:lv_from,lv_to,lr_companyid_tmp.
          ENDDO.
        ENDIF.
      ENDIF.
    ELSEIF lv_spical IS NOT INITIAL.

      IF lr_companyid IS NOT INITIAL OR lr_spcompanyid IS NOT INITIAL OR
          lr_storeid IS NOT INITIAL OR lr_spstoreid IS NOT INITIAL.
        lv_cnt = lines( lr_companyid ).
        lv_div = lv_cnt DIV 30000.
        lv_mod = lv_cnt MOD 30000.
        IF lv_mod NE 0 OR lv_cnt EQ 0..
          lv_div = lv_div + 1.
        ENDIF.
        "2种状况
        DO lv_div TIMES.
          lv_from = ( sy-index - 1 ) * 30000 + 1.
          lv_to = sy-index * 30000.
          IF lv_to > lv_cnt.
            lv_to = lv_cnt.
          ENDIF.
          IF lv_cnt NE 0.
            APPEND LINES OF lr_companyid FROM lv_from TO lv_to TO lr_companyid_tmp.
          ENDIF.

          SELECT h~orderid,h~custcompanyid,h~statusid,h~createdate,h~createtime,h~productstoreid,
             h~canceldate,h~canceltime,h~originalsource,h~actualcurrencyamount,h~orderid AS billno
           APPENDING CORRESPONDING FIELDS OF TABLE @et_order
           FROM zticec_order_h AS h INNER JOIN ztint_cus_inf AS i ON h~custcompanyid = i~companyid LEFT JOIN zticec_payments AS p
             ON h~orderid = p~orderid
          WHERE custcompanyid IN @lr_companyid_tmp
            AND custcompanyid IN @lr_spcompanyid
            AND originalsource IN @so_originalsource
            AND createdate IN  @so_createdate
            AND canceldate IN  @so_canceldate
            AND ( inquirytype IN @so_inquirytype OR saleschannelenumid IN @so_inquirytype )
            AND shoppinglistid IN @so_shoppinglistid
            AND h~orderid IN @so_orderid
            AND carbrandid IN @so_carbrandid
            AND createdname IN @so_createdname
            AND ordername IN @so_ordername "配件名称 零件号
            AND paymentmethodtypeid IN @so_paymentmethodtypeid
            AND ( productstoreid IN @lr_storeid
             OR fulfillstoreid IN @lr_storeid )"履约店铺
            AND ( productstoreid IN @lr_spstoreid
             OR fulfillstoreid IN @lr_spstoreid )"履约店铺
            AND ( cancelreason IN @so_cancelreason
             OR lastlevelreason IN @so_cancelreason )."取消原因
          CLEAR:lv_from,lv_to,lr_companyid_tmp..
        ENDDO..
      ENDIF.
    ENDIF.

    IF so_canceldate IS NOT INITIAL AND so_canceltime IS NOT INITIAL.
      LOOP AT so_canceldate INTO DATA(ls_opdate).
        IF ls_opdate-low = ls_opdate-high.
          DELETE et_order WHERE canceltime NOT IN so_canceltime.
        ELSE.
          LOOP AT so_canceltime INTO DATA(ls_optime).
            DELETE et_order WHERE ( canceldate EQ ls_opdate-low AND canceltime LT ls_optime-low ).
            DELETE et_order WHERE ( canceldate EQ ls_opdate-high AND canceltime GT ls_optime-high ).
            CLEAR ls_optime.
          ENDLOOP.
        ENDIF.
        CLEAR ls_opdate.
      ENDLOOP.
    ENDIF.

    SORT et_order BY orderid.
  ENDMETHOD.


  METHOD get_order_data_new_v3.

    DATA:lr_store TYPE RANGE OF ztint_ven_inf-productstoreid.
    DATA:ls_option TYPE /iwbep/s_cod_select_option.
    DATA:so_ksyx TYPE /iwbep/t_cod_select_options.
    DATA:so_yunorder TYPE /iwbep/t_cod_select_options.
    DATA:so_hdsorder TYPE /iwbep/t_cod_select_options.
    DATA:so_servicefee TYPE /iwbep/t_cod_select_options.
    DATA:so_ev TYPE /iwbep/t_cod_select_options.
    DATA:so_bizcat TYPE /iwbep/t_cod_select_options.
    DATA:so_erpcus TYPE /iwbep/t_cod_select_options.
    DATA:so_marketcus TYPE /iwbep/t_cod_select_options.
    DATA:so_shipstore TYPE /iwbep/t_cod_select_options.
    DATA:lr_isdelete   TYPE RANGE OF ztint_cus_inf-isdelete,
         lr_userdelete TYPE RANGE OF ztint_ven_user-isdelete,
         lr_userttype  TYPE RANGE OF ztint_cus_user-usertype,
         lr_userpre    TYPE RANGE OF ztint_ven_user-ispre.
    DATA:lv_date TYPE sy-datum.
    READ TABLE so_label INTO DATA(ls_label) INDEX 1.
    IF sy-subrc EQ 0.
      LOOP AT ls_label-select_options INTO ls_option.
        CASE ls_option-low.
          WHEN 'KSYX'.
            so_ksyx = VALUE #( ( sign = 'I' option = 'EQ' low = 'X' ) ).
          WHEN 'YUN'. "共享仓订单
            so_yunorder = VALUE #( ( sign = 'I' option = 'EQ' low = 'X' ) ).
          WHEN 'TYRE'.
            so_bizcat = VALUE #( ( sign = 'I' option = 'EQ' low = 'A004' ) ).
          WHEN 'OIL'.
            so_bizcat = VALUE #( ( sign = 'I' option = 'EQ' low = 'A009' ) ).
          WHEN 'EV'.
            so_ev = VALUE #( ( sign = 'I' option = 'EQ' low = '1' ) ).
          WHEN 'ERP'.
            so_erpcus = VALUE #( ( sign = 'I' option = 'EQ' low = 'X' )
            ( sign = 'I' option = 'EQ' low = 'S' )
            ( sign = 'I' option = 'EQ' low = 'V' ) ).
          WHEN 'ERPVIP'.
            so_erpcus = VALUE #( ( sign = 'I' option = 'EQ' low = 'V' ) ).
          WHEN 'ERPSVIP'.
            so_erpcus = VALUE #( ( sign = 'I' option = 'EQ' low = 'S' ) ).
          WHEN 'MARKET'.
            so_marketcus = VALUE #( ( sign = 'I' option = 'EQ' low = 'X' )
            ( sign = 'I' option = 'EQ' low = 'S' )
            ( sign = 'I' option = 'EQ' low = 'V' ) ).
          WHEN 'MARKETV500'.
            so_marketcus = VALUE #( ( sign = 'I' option = 'EQ' low = 'V' )
            ( sign = 'I' option = 'EQ' low = 'S' ) ).
          WHEN 'MARKETV50'.
            so_marketcus = VALUE #( ( sign = 'I' option = 'EQ' low = 'V' ) ).
          WHEN 'SHIP'."旗舰店
            SELECT 'I' AS sign,'EQ' AS option,val_low AS low
              INTO CORRESPONDING FIELDS OF TABLE @so_shipstore
              FROM ztbc_f4_config
             WHERE fnam = 'FLGSHIPSTORE'.
          WHEN 'HDS'."海德森
            so_hdsorder = VALUE #( ( sign = 'I' option = 'EQ' low = 'X' ) ).
          WHEN 'SERVICEFEE'.
            so_servicefee = VALUE #( ( sign = 'I' option = 'EQ' low = 'X' ) ).
          WHEN OTHERS.
        ENDCASE.
      ENDLOOP.
    ENDIF.

    IF iv_isdelete EQ 'X'.
      lr_isdelete = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
      lr_userdelete  = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
      lr_userpre  = VALUE #( ( sign = 'I' option = 'EQ' low = iv_isdelete ) ).
    ELSE.
      lr_userdelete  = VALUE #( ( sign = 'I' option = 'EQ' low = '' ) ).
      lr_userpre  = VALUE #( ( sign = 'I' option = 'EQ' low = '' ) ).
    ENDIF.

    IF so_createdate IS INITIAL AND so_canceldate IS INITIAL AND so_orderid IS INITIAL.
      "3默认3个月
      lv_date = sy-datum - 90.
      so_createdate = VALUE #( ( sign = 'I' option = 'BT' low = lv_date high = sy-datum ) ).
    ENDIF.

    IF so_orderid IS NOT INITIAL."查询完整的订单，删除时间限制
      DATA(lv_orderid) = VALUE #( so_orderid[ 1 ]-low OPTIONAL ).
      IF strlen( lv_orderid ) EQ  14."*S2211070002143*"
        CLEAR so_createdate.
      ENDIF.
    ELSE.
      DATA(lv_eq) = VALUE #( so_custcompanyid[ 1 ]-option OPTIONAL )."APP上指定了客户的，用的是EQ，不限制时间,PC上用的是CP,限制了时间
      IF lv_eq EQ 'EQ'.
        CLEAR so_createdate.
      ENDIF.
    ENDIF.

    "如果客户经理有入参，根据类型获取客户数据
    IF so_userid IS NOT INITIAL.
      DATA(lv_where) = COND string( WHEN iv_usertype EQ 'Userid' THEN |usertype = '1'|
                               WHEN iv_usertype EQ 'Airuserid' THEN |usertype = '2' and userchildtype = 'A'|
                               WHEN iv_usertype EQ 'Erpuserid' THEN |usertype = '2' and userchildtype = 'E'|
                               WHEN iv_usertype EQ 'Accuserid' THEN |usertype = '2' and userchildtype = ''|
                               WHEN iv_usertype EQ 'Kfuserid' THEN |usertype = '2' and userchildtype = 'K'|
                               ELSE |usertype = '1'| ).
      SELECT cusid INTO TABLE @DATA(lt_usercus) FROM ztint_cus_user
        WHERE userid IN @so_userid AND (lv_where) AND ispre = '' AND isdelete = ''.
      CHECK sy-subrc EQ 0.
    ENDIF.

    TRY.
*****查询所有客户订单
        IF ( mv_type EQ 1 OR mv_type EQ 4 ) AND so_userid IS INITIAL.
          SELECT DISTINCT a~orderid INTO TABLE @DATA(lt_order)
                FROM zticec_order_h AS a
                INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
                LEFT JOIN ztint_ven_inf AS v ON a~productstoreid = v~productstoreid
                LEFT JOIN ztint_area_city AS r ON c~provincegeoid = r~provincegeoid AND c~citygeoid = r~citygeoid
                      AND c~countygeoid = r~countygeoid AND c~villagegeoid = r~villageoid
                LEFT JOIN ztint_cus_tag AS t ON t~ymonth = @sy-datum(6) AND c~cusid = t~cusid AND t~isdelete = ''
                WHERE c~companyid IN @so_custcompanyid
                AND ( c~displayname IN @so_custcompanyname
                OR c~companycode IN @so_custcompanyname
                OR c~cusname IN @so_custcompanyname
                OR a~orderid IN @so_custcompanyname )
                AND c~companycode IN @so_companycode
*              AND c~zoneid IN @so_zoneid
                AND r~regionid IN @so_zoneid
                AND c~iserpcus IN @so_erpcus
                AND c~marketvip IN @so_marketcus
                AND ( c~provincegeoid IN @so_citygeoid
                OR c~citygeoid IN @so_citygeoid
                OR c~countygeoid IN @so_citygeoid )
                AND a~originalsource IN @so_originalsource
                AND a~isproxy IN @so_isproxy
                AND a~operator IN @so_operator
                AND a~createdate IN  @so_createdate
                AND a~canceldate IN  @so_canceldate
                AND ( a~inquirytype IN @so_inquirytype OR a~saleschannelenumid IN @so_inquirytype )
                AND a~shoppinglistid IN @so_shoppinglistid
                AND a~orderid IN @so_orderid
                AND a~carbrandid IN @so_carbrandid
                AND a~createdname IN @so_createdname
                AND a~ordername IN @so_ordername "配件名称 零件号
                AND ( a~productstoreid IN @so_productstoreid
                OR a~productstorename IN @so_productstoreid
                OR a~fulfillstoreid IN @so_productstoreid
                OR a~fulfillstorename IN @so_productstoreid )"履约店铺
                AND a~orderid IN @so_cancel_order
                AND ( a~cancelreason IN @so_cancelreason
                OR a~lastlevelreason IN @so_cancelreason ) "取消原因
                AND c~isdelete IN @lr_isdelete
                AND a~ksbsorder IN @so_ksyx
                AND a~yunorder IN @so_yunorder
                AND a~hdsorder IN @so_hdsorder
                AND a~hasservicefee IN @so_servicefee
                AND a~carenergytype IN @so_ev
                AND a~productstoreid IN @so_shipstore
                AND a~vhvin IN @so_vin
                AND t~tagid IN @so_custagid.
        ELSE.
          """重要，重要，重要""""
          IF iv_usertype IS INITIAL OR iv_usertype EQ 'Userid'.
          ELSE.
            CLEAR so_userid."筛选条件传入的客户经理ID在前面已经用于获取客户ID了，此处往后，该变量值清除，重新塞入权限下的人员清单
          ENDIF.
          """"
****获取当前钉钉下面的所有人 协同人可以查看客户订单信息20201223
          IF mv_type EQ '2' OR mv_type EQ '3'.
            get_person( EXPORTING so_userid = so_userid
                        IMPORTING et_userlist = DATA(lt_userlist) ).

            CHECK lt_userlist IS NOT INITIAL.
            "拓展经理或者店铺的协同人来看的时候-如果SO_USERID有值，需要下客户数据
            SELECT  i~productstoreid INTO TABLE @DATA(lt_store)
              FROM ztint_ven_user AS u
              INNER JOIN ztint_ven_inf AS i ON u~venid = i~venid
              FOR ALL ENTRIES IN @lt_userlist
             WHERE userid = @lt_userlist-userid AND ispre = '' AND isdelete = ''.
            lr_store = VALUE #( FOR st IN lt_store ( sign = 'I' option = 'EQ' low = st-productstoreid ) ).
            IF lt_usercus IS NOT INITIAL.
              DATA(lt_tzusercus) = lt_usercus.
            ENDIF.

            "客户经理来看的客户集合
            SELECT cusid INTO TABLE @DATA(lt_custemp)
              FROM ztint_cus_user
              FOR ALL ENTRIES IN @lt_userlist
              WHERE userid = @lt_userlist-userid AND ispre = '' AND isdelete = ''.
            SORT lt_custemp BY cusid.
            IF lt_usercus IS NOT INITIAL.
              LOOP AT lt_usercus INTO DATA(ls_usercus).
                DATA(lv_index) = sy-tabix.
                READ TABLE lt_custemp TRANSPORTING NO FIELDS WITH KEY cusid = ls_usercus-cusid BINARY SEARCH.
                IF sy-subrc NE 0.
                  DELETE lt_usercus INDEX lv_index.
                ENDIF.
              ENDLOOP.
            ELSE.
              APPEND LINES OF lt_custemp TO lt_usercus.
            ENDIF.
            SORT lt_usercus BY cusid.

          ENDIF.

          IF lt_usercus IS INITIAL AND lr_store IS INITIAL.
            EXIT.
          ENDIF.

          "客户经理来看
          IF lt_usercus IS NOT INITIAL.
            SELECT DISTINCT a~orderid INTO TABLE @lt_order
            FROM zticec_order_h AS a
            INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
            LEFT JOIN ztint_ven_inf AS v ON a~productstoreid = v~productstoreid
            LEFT JOIN ztint_area_city AS r ON c~provincegeoid = r~provincegeoid AND c~citygeoid = r~citygeoid
                  AND c~countygeoid = r~countygeoid AND c~villagegeoid = r~villageoid
                LEFT JOIN ztint_cus_tag AS t ON t~ymonth = @sy-datum(6) AND c~cusid = t~cusid AND t~isdelete = ''
              FOR ALL ENTRIES IN @lt_usercus
             WHERE c~cusid = @lt_usercus-cusid
            AND c~isdelete IN @lr_isdelete
            AND ( c~displayname IN @so_custcompanyname
            OR c~companycode IN @so_custcompanyname
            OR c~cusname IN @so_custcompanyname
            OR a~orderid IN @so_custcompanyname )
            AND c~companycode IN @so_companycode
            AND c~companyid IN @so_custcompanyid
*          AND c~zoneid IN @so_zoneid
            AND r~regionid IN @so_zoneid
            AND c~iserpcus IN @so_erpcus
            AND c~marketvip IN @so_marketcus
            AND ( c~provincegeoid IN @so_citygeoid
            OR c~citygeoid IN @so_citygeoid
            OR c~countygeoid IN @so_citygeoid  )
            AND a~originalsource IN @so_originalsource
            AND a~isproxy IN @so_isproxy
            AND a~operator IN @so_operator
            AND a~createdate IN  @so_createdate
            AND a~canceldate IN  @so_canceldate
            AND ( a~inquirytype IN @so_inquirytype OR a~saleschannelenumid IN @so_inquirytype )
            AND a~shoppinglistid IN @so_shoppinglistid
            AND a~orderid IN @so_orderid
            AND a~carbrandid IN @so_carbrandid
            AND a~createdname IN @so_createdname
            AND a~ordername IN @so_ordername "配件名称 零件号
            AND ( a~productstoreid IN @so_productstoreid
            OR a~productstorename IN @so_productstoreid
            OR a~fulfillstoreid IN @so_productstoreid
            OR a~fulfillstorename IN @so_productstoreid )"履约店铺)
            AND a~orderid IN @so_cancel_order
            AND ( a~cancelreason IN @so_cancelreason
            OR a~lastlevelreason IN @so_cancelreason )"取消原因.
            AND a~ksbsorder IN @so_ksyx
            AND a~yunorder IN @so_yunorder
            AND a~hdsorder IN @so_hdsorder
            AND a~hasservicefee IN @so_servicefee
            AND a~carenergytype IN @so_ev
            AND a~productstoreid IN @so_shipstore
            AND a~vhvin IN @so_vin
                AND t~tagid IN @so_custagid.
          ENDIF.
******** 获取拓展经理订单
          IF lt_tzusercus IS NOT INITIAL AND lr_store IS NOT INITIAL.
            SELECT DISTINCT a~orderid APPENDING TABLE @lt_order
            FROM zticec_order_h AS a
            INNER JOIN ztint_ven_inf AS v ON a~productstoreid = v~productstoreid
            INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
            LEFT JOIN ztint_area_city AS r ON c~provincegeoid = r~provincegeoid AND c~citygeoid = r~citygeoid
                 AND c~countygeoid = r~countygeoid AND c~villagegeoid = r~villageoid
                LEFT JOIN ztint_cus_tag AS t ON t~ymonth = @sy-datum(6) AND c~cusid = t~cusid AND t~isdelete = ''
            FOR ALL ENTRIES IN @lt_tzusercus
           WHERE a~productstoreid IN @lr_store
            AND c~cusid = @lt_tzusercus-cusid
            AND c~isdelete IN @lr_isdelete
            AND c~isdelete IN @lr_isdelete
            AND c~companyid IN @so_custcompanyid
            AND c~companycode IN @so_companycode
            AND ( c~companycode IN @so_custcompanyname
            OR c~displayname IN @so_custcompanyname
            OR c~cusname IN @so_custcompanyname
            OR a~orderid IN @so_custcompanyname )
            AND ( c~provincegeoid IN @so_citygeoid
            OR c~citygeoid IN @so_citygeoid
            OR c~countygeoid IN @so_citygeoid )
*          AND c~zoneid IN @so_zoneid
            AND r~regionid IN @so_zoneid
            AND c~iserpcus IN @so_erpcus
            AND c~marketvip IN @so_marketcus
            AND a~originalsource IN @so_originalsource
            AND a~isproxy IN @so_isproxy
            AND a~operator IN @so_operator
            AND a~createdate IN  @so_createdate
            AND a~canceldate IN  @so_canceldate
            AND ( a~inquirytype IN @so_inquirytype OR a~saleschannelenumid IN @so_inquirytype )
            AND a~shoppinglistid IN @so_shoppinglistid
            AND a~orderid IN @so_orderid
            AND a~carbrandid IN @so_carbrandid
            AND a~createdname IN @so_createdname
            AND a~ordername IN @so_ordername
            AND ( a~productstoreid IN @so_productstoreid
            OR a~productstorename IN @so_productstoreid
            OR a~fulfillstoreid IN @so_productstoreid
            OR a~fulfillstorename IN @so_productstoreid )"履约店铺)
            AND a~orderid IN @so_cancel_order
            AND ( a~cancelreason IN @so_cancelreason
            OR a~lastlevelreason IN @so_cancelreason )"取消原因.
            AND a~ksbsorder IN @so_ksyx
            AND a~yunorder IN @so_yunorder
            AND a~hdsorder IN @so_hdsorder
            AND a~hasservicefee IN @so_servicefee
            AND a~carenergytype IN @so_ev
            AND a~productstoreid IN @so_shipstore
            AND a~vhvin IN @so_vin
                AND t~tagid IN @so_custagid.
          ELSEIF lt_tzusercus IS INITIAL AND lr_store IS NOT INITIAL.
            SELECT DISTINCT a~orderid APPENDING TABLE @lt_order
            FROM zticec_order_h AS a
            INNER JOIN ztint_ven_inf AS v ON a~productstoreid = v~productstoreid
            INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
             LEFT JOIN ztint_area_city AS r ON c~provincegeoid = r~provincegeoid AND c~citygeoid = r~citygeoid
                   AND c~countygeoid = r~countygeoid AND c~villagegeoid = r~villageoid
                LEFT JOIN ztint_cus_tag AS t ON t~ymonth = @sy-datum(6) AND c~cusid = t~cusid AND t~isdelete = ''
           WHERE a~productstoreid IN @lr_store
            AND c~isdelete IN @lr_isdelete
            AND c~isdelete IN @lr_isdelete
            AND c~companyid IN @so_custcompanyid
            AND c~companycode IN @so_companycode
            AND ( c~companycode IN @so_custcompanyname
            OR c~displayname IN @so_custcompanyname
            OR c~cusname IN @so_custcompanyname
            OR a~orderid IN @so_custcompanyname )
            AND ( c~provincegeoid IN @so_citygeoid
            OR c~citygeoid IN @so_citygeoid
            OR c~countygeoid IN @so_citygeoid )
            AND r~regionid IN @so_zoneid
*          AND c~zoneid IN @so_zoneid
            AND c~iserpcus IN @so_erpcus
            AND c~marketvip IN @so_marketcus
            AND a~originalsource IN @so_originalsource
            AND a~isproxy IN @so_isproxy
            AND a~operator IN @so_operator
            AND a~createdate IN  @so_createdate
            AND a~canceldate IN  @so_canceldate
            AND ( a~inquirytype IN @so_inquirytype OR a~saleschannelenumid IN @so_inquirytype )
            AND a~shoppinglistid IN @so_shoppinglistid
            AND a~orderid IN @so_orderid
            AND a~carbrandid IN @so_carbrandid
            AND a~createdname IN @so_createdname
            AND a~ordername IN @so_ordername
            AND ( a~productstoreid IN @so_productstoreid
            OR a~productstorename IN @so_productstoreid
            OR a~fulfillstoreid IN @so_productstoreid
            OR a~fulfillstorename IN @so_productstoreid )"履约店铺)
            AND a~orderid IN @so_cancel_order
            AND ( a~cancelreason IN @so_cancelreason
            OR a~lastlevelreason IN @so_cancelreason )"取消原因.
            AND a~ksbsorder IN @so_ksyx
            AND a~yunorder IN @so_yunorder
            AND a~hdsorder IN @so_hdsorder
            AND a~hasservicefee IN @so_servicefee
            AND a~carenergytype IN @so_ev
            AND a~productstoreid IN @so_shipstore
            AND a~vhvin IN @so_vin
                AND t~tagid IN @so_custagid.
          ENDIF.
        ENDIF.

        IF lt_order IS NOT INITIAL.
          SELECT h~orderid,h~custcompanyid,h~statusid,h~createdate,h~createtime,h~productstoreid,
          h~canceldate,h~canceltime,h~originalsource,h~actualcurrencyamount,h~orderid AS billno,h~carenergytype,oi~bizcatid
          INTO CORRESPONDING FIELDS OF TABLE @et_order
          FROM zticec_order_h AS h
          LEFT JOIN zticec_order_cat AS oi ON h~orderid = oi~orderid
          INNER JOIN ztint_cus_inf AS i ON h~custcompanyid = i~companyid
          LEFT JOIN zticec_payments AS p ON h~orderid = p~orderid
          FOR ALL ENTRIES IN @lt_order
          WHERE h~orderid = @lt_order-orderid AND p~paymentmethodtypeid IN @so_paymentmethodtypeid
          AND oi~bizcatid IN @so_bizcat AND i~iserpcus IN @so_erpcus
          AND i~marketvip IN @so_marketcus.

          "ADD 取消时间
          IF so_canceldate IS NOT INITIAL AND so_canceltime IS NOT INITIAL.
            LOOP AT so_canceldate INTO DATA(ls_opdate).
              IF ls_opdate-low = ls_opdate-high.
                DELETE et_order WHERE canceltime NOT IN so_canceltime.
              ELSE.
                LOOP AT so_canceltime INTO DATA(ls_optime).
                  DELETE et_order WHERE ( canceldate EQ ls_opdate-low AND canceltime LT ls_optime-low ).
                  DELETE et_order WHERE ( canceldate EQ ls_opdate-high AND canceltime GT ls_optime-high ).
                  CLEAR ls_optime.
                ENDLOOP.
              ENDIF.
              CLEAR ls_opdate.
            ENDLOOP.

          ENDIF.
        ENDIF.

      CATCH  cx_sy_dynamic_osql_semantics INTO DATA(lo_cx).
    ENDTRY.
  ENDMETHOD.


  METHOD get_order_detail.
    DATA(lo_order_api)  = NEW zcl_icec_order_api( ).

****订单抬头详情信息
    lo_order_api->get_order_detail_data(
      EXPORTING
        iv_orderid = EXACT string( er_deep_entity-orderid )
        iv_showsource = 'PLATFORM'
      IMPORTING
        es_out = DATA(es_detail)
        ev_msg = ev_msg
    ).
    CHECK ev_msg-type EQ 'S'.
    CLEAR ev_msg.
****订单抬头信息赋值
    set_order_detail(
      EXPORTING
        is_detail = es_detail
      IMPORTING
        ev_msg = ev_msg
      CHANGING
        cs_entity = er_deep_entity
      ).

  ENDMETHOD.


  METHOD get_order_follow_info.
    DATA:ls_data TYPE ts_order_followinfo.

    SELECT partsid,followid,billno,billtype,CASE billtype
                                  WHEN 'S' THEN '订单'
                                  WHEN 'B' THEN '询价单'
                                  WHEN 'AS' THEN '售后申请单'
                                END AS billtypedesc,
           partsname,partsnum,dinguserid,followname,followtype,followsource,
           followdate,followtime,followremark,amount,cusid,provincegeoid,provincegeoname,citygeoid,citygeoidname,
           countygeoid,countygeoidname,zoneid,zonename,positionname
      FROM ztint_follow_inf INTO TABLE @DATA(lt_follow)
     WHERE billno IN @so_billno AND followdate IN @so_crtdate AND billtype IN @so_billtype.
    IF sy-subrc EQ 0.
      SELECT cusid,companycode,cusname,displayname FROM ztint_cus_inf INTO TABLE @DATA(lt_cusinf)
        FOR ALL ENTRIES IN @lt_follow WHERE cusid = @lt_follow-cusid.
      SELECT u~cusid,u~userid,i~username INTO TABLE @DATA(lt_cususer)
         FROM ztint_cus_user AS u INNER JOIN ztint_user_inf AS i ON u~userid = i~userid AND i~isstill = 'X'
        FOR ALL ENTRIES IN @lt_follow
        WHERE u~cusid = @lt_follow-cusid AND u~usertype = '1' AND u~ispre = '' AND u~isdelete = ''.
      SELECT h~orderid,h~productstoreid,h~productstorename,h~shoppinglistid,p~actualcurrencyamount INTO TABLE @DATA(lt_ven) FROM zticec_order_h AS h
        INNER JOIN zticec_payments AS p ON h~orderid = p~orderid
        FOR ALL ENTRIES IN @lt_follow WHERE h~orderid = @lt_follow-billno(35) OR shoppinglistid = @lt_follow-billno(35).

      SORT lt_cusinf BY cusid.
      SORT lt_cususer BY cusid.
      SORT lt_ven BY orderid shoppinglistid.
    ENDIF.

    SELECT * INTO TABLE @DATA(lt_f4config) FROM ztbc_f4_config
          WHERE fnam IN ('ZICERP_CASSINT_FOLLOWTYPE',
                         'ZICERP_CASSINT_FOLLOWSOURCE',
                         'ZICERP_CASSINT_ASFOLLOWSOURCE') ."订单询价单售后申请单跟进类型F4/订单询价单跟进来源F4
    SORT lt_f4config BY fnam val_low.
    DATA:lv_amount TYPE zde_intamount.
    LOOP AT lt_follow INTO DATA(ls_follow).
      REPLACE ALL OCCURRENCES OF ',' IN ls_follow-amount WITH ''.
      CONDENSE ls_follow-amount NO-GAPS.
      TRY.
          lv_amount = ls_follow-amount.
          CLEAR lv_amount.
        CATCH cx_sy_conversion_no_number INTO DATA(lo_num).
          ls_follow-amount = 0.
      ENDTRY.

      MOVE-CORRESPONDING ls_follow TO ls_data.
      ls_data-amount  = ls_follow-amount.
      ls_data-followdate = |{ ls_follow-followdate DATE = ISO }|.
      ls_data-followtime = |{ ls_follow-followtime TIME = ISO }|.
      READ TABLE lt_cusinf INTO DATA(ls_cusinf) WITH KEY cusid = ls_data-cusid BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data-companycode = ls_cusinf-companycode.
        ls_data-cusname = ls_cusinf-cusname.
        ls_data-displayname  = ls_cusinf-displayname.
      ENDIF.
      READ TABLE lt_cususer INTO DATA(ls_cususer) WITH KEY cusid = ls_data-cusid BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data-username = ls_cususer-username.
      ENDIF.
      READ TABLE lt_ven INTO DATA(ls_ven) WITH KEY orderid = ls_data-billno BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data-productstoreid = ls_ven-productstoreid.
        ls_data-vendisplay = ls_ven-productstorename.
        ls_data-orderamt = ls_ven-actualcurrencyamount.
      ELSE.
        READ TABLE lt_ven INTO ls_ven WITH KEY shoppinglistid = ls_data-billno.
        ls_data-productstoreid = ls_ven-productstoreid.
        ls_data-vendisplay = ls_ven-productstorename.
        ls_data-orderamt = ls_ven-actualcurrencyamount.
      ENDIF.
      READ TABLE lt_f4config INTO DATA(ls_f4con) WITH KEY fnam = 'ZICERP_CASSINT_FOLLOWTYPE' val_low = ls_follow-followtype BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data-followtypedesc = ls_f4con-text.
        CLEAR ls_f4con.
      ENDIF.
      IF ls_follow-billtype EQ 'AS'.
        READ TABLE lt_f4config INTO ls_f4con WITH KEY fnam = 'ZICERP_CASSINT_ASFOLLOWSOURCE' val_low = ls_follow-followsource BINARY SEARCH.
      ELSE.
        READ TABLE lt_f4config INTO ls_f4con WITH KEY fnam = 'ZICERP_CASSINT_FOLLOWSOURCE' val_low = ls_follow-followsource BINARY SEARCH.
      ENDIF.
      IF sy-subrc EQ 0.
        ls_data-followsourcedesc = ls_f4con-text.
        CLEAR ls_f4con.
      ENDIF.
      APPEND ls_data TO et_followinfo.
      CLEAR:ls_data,ls_follow,ls_cusinf,ls_cususer,ls_ven.
    ENDLOOP.
  ENDMETHOD.


  METHOD get_order_header_info.

    DATA(lo_order_api)  = NEW zcl_icec_order_api( ).
    lo_order_api->get_order_header_data(
      EXPORTING
        iv_orderid = orderid
      IMPORTING
        es_header  = DATA(ls_header)
        ev_msg     = DATA(ls_msg)
    ).

    CHECK ls_header-buyer-companyid IS NOT INITIAL.

    SELECT SINGLE cusid,companyid,companycode,cusname FROM ztint_cus_inf
     INTO CORRESPONDING FIELDS OF @es_head
     WHERE companyid = @ls_header-buyer-companyid.
    IF sy-subrc EQ 0.
      SELECT SINGLE u~userid,i~username FROM ztint_cus_user AS u
      INNER JOIN ztint_user_inf AS i ON u~userid = i~userid AND i~isstill = 'X'
      INTO ( @es_head-cuserid,@es_head-cusername )
      WHERE u~cusid = @es_head-cusid.
    ENDIF.
    es_head-amount = ls_header-amount.
    IF ls_header-orderdate IS NOT INITIAL.
      zcl_cassint_formatter=>convert_java_timestamp_to_abap(
        EXPORTING
          iv_timestamp =  ls_header-orderdate
        IMPORTING
          ev_date      = es_head-createdate
          ev_time      = es_head-createtime
      ).
    ENDIF.
    es_head-orderid = ls_header-orderid.
    es_head-statusid = ls_header-statusid.

  ENDMETHOD.


  METHOD get_order_overview.
****获取钉钉用户在客户上的数据权限
*    get_user_mvtype( 'X13103' ) .
    IF iv_classtype EQ 'X10101'.
      mv_type = 1."从客户过来查询的不用检查全新类型，直接给1
    ELSE.
      get_user_mvtype( 'X13103' ) .
    ENDIF.
    CHECK mv_type IS NOT INITIAL.
***设置客户查询标记
    IF mv_type = 1 AND ( so_userid IS INITIAL
      AND so_custcompanyid IS INITIAL AND so_companycode IS INITIAL
          AND so_custcompanyname IS INITIAL AND so_custcompanyid IS INITIAL AND
          so_citygeoid IS INITIAL AND so_zoneid IS INITIAL ).
      mv_cus_condition = 'X'.
    ENDIF.
****根据传入的取消时间获取指定时间段内取消的订单号
    IF so_canceldate IS NOT INITIAL.
      DATA(so_cancel_order) = get_cancel_order( EXPORTING
        so_date = so_canceldate
        so_companycode = so_companycode
        so_companyid = so_custcompanyid
        so_companyname = so_custcompanyname
        so_orderid = so_orderid ).
      CHECK so_cancel_order IS NOT INITIAL."如果下了此条件返回空值则不必继续
    ENDIF.
*    IF  so_canceldate IS INITIAL AND
*         so_createdate IS INITIAL AND
*         so_orderid IS INITIAL.
*      DATA lv_newdate TYPE sy-datum.
*      CALL FUNCTION 'BKK_ADD_MONTH_TO_DATE'
*        EXPORTING
*          months  = '-3'
*          olddate = sy-datum
*        IMPORTING
*          newdate = lv_newdate.
*      so_createdate = VALUE #( ( sign = 'I' option = 'BT' low = lv_newdate high = sy-datum ) ).
*    ENDIF.
****************从客户上查
*****当输入了工单相关的条件时优先从工单来找
    get_order_data_by_customer(
*    get_order_data_by_cus(
    EXPORTING
      so_custcompanyname = so_custcompanyname
      so_originalsource = so_originalsource
      so_createdate = so_createdate
      so_custcompanyid = so_custcompanyid
      so_inquirytype = so_inquirytype
      so_shoppinglistid = so_shoppinglistid
      so_userid = so_userid
      so_zoneid = so_zoneid
      so_carbrandid = so_carbrandid
      so_citygeoid = so_citygeoid
      so_createdname = so_createdname
      so_ordername = so_ordername "配件名称 零件号
      so_productstoreid = so_productstoreid
      so_companycode = so_companycode
      so_orderid = so_orderid
      so_cancel_order = so_cancel_order
*      so_paymentmethodtypeid = so_paymentmethodtypeid
      iv_isdelete = iv_isdelete
      IMPORTING
        et_order = DATA(et_order)
*        et_order_nocompanyid = data(lt_order_nocompanyid)
        et_order_cus = DATA(et_order_cus)
      ).

********************从供应商上查
    DATA(et_ven_order) = get_order_data_by_vendor(
    EXPORTING
      so_custcompanyname = so_custcompanyname
      so_originalsource = so_originalsource
      so_createdate = so_createdate
      so_custcompanyid = so_custcompanyid
      so_inquirytype = so_inquirytype
      so_shoppinglistid = so_shoppinglistid
      so_zoneid = so_zoneid
      so_userid = so_userid
      so_carbrandid = so_carbrandid
      so_citygeoid = so_citygeoid
      so_createdname = so_createdname
      so_ordername = so_ordername "配件名称 零件号
      so_productstoreid = so_productstoreid
      so_companycode = so_companycode
      so_orderid = so_orderid
      so_cancel_order = so_cancel_order
      so_paymentmethodtypeid = so_paymentmethodtypeid
      iv_isdelete = iv_isdelete
      ).
****************
***    合并取出的工单
    DATA:lt_order TYPE zord_t_order_info.
    IF et_order IS NOT INITIAL.
      APPEND LINES OF et_order TO lt_order.
    ENDIF.
    IF et_ven_order IS NOT INITIAL.
      APPEND LINES OF et_ven_order TO lt_order.
    ENDIF.
    SORT lt_order BY orderid.
    DELETE ADJACENT DUPLICATES FROM lt_order COMPARING orderid.
    CHECK lt_order IS NOT INITIAL.
*****订单状态筛选
    filter_order_status(
      EXPORTING
        so_orderid = so_orderid
        it_order = lt_order
     IMPORTING
      et_order_status = DATA(lt_order_status) ).
*    "历史单据需要取取消原因
*    SELECT guid,
*      orderid ,
*       statusid,
*        statusiddesc,
*       lastupdatedstamp,
*        statusdate,
*        statustime ,
*        changdesc
*     FROM zticec_status_i
*     INTO CORRESPONDING FIELDS OF TABLE  @lt_order_status
*     FOR ALL ENTRIES IN @lt_order
*    WHERE orderid = @lt_order-orderid
*      AND statusid = 'ORDER_CANCELLED'.
*
*    SORT lt_order_status BY orderid.
    "   CHECK lt_order_status IS NOT INITIAL."需有符合状态条件的工单
*****数据填充
    set_order_overview(
    EXPORTING
      it_order = lt_order
      it_order_cus = et_order_cus
      it_order_status = lt_order_status
      so_paymentmethodtypeid = so_paymentmethodtypeid
      so_orderby = so_orderby
      iv_orderby = iv_orderby
      iv_page = iv_page
      iv_size = iv_size
      iv_export = iv_export
      iv_isdelete = iv_isdelete
      so_statusid = so_statusid
      is_excellist = is_excellist "只有下载的时候才会传值
    IMPORTING
      er_deep_entity = es_data
      ) .
  ENDMETHOD.


  METHOD get_order_overview_new.
    DATA:lv_days     TYPE int4.
    DATA:lv_from TYPE dats,
         lv_to   TYPE dats.

****获取钉钉用户在客户上的数据权限
*    get_user_mvtype( 'X13103' ) .
    IF iv_classtype EQ 'X10101'.
      mv_type = 1."从客户过来查询的不用检查全新类型，直接给1
    ELSE.
      get_user_mvtype( 'X13103' ) .
    ENDIF.
    CHECK mv_type IS NOT INITIAL.

*    IF so_canceldate IS NOT INITIAL.
*      READ TABLE so_canceldate INTO DATA(ls_canceldate) INDEX 1.
*      lv_from = ls_canceldate-low.
*      lv_to = ls_canceldate-high.
*      CALL FUNCTION 'FIMA_DAYS_AND_MONTHS_AND_YEARS'
*        EXPORTING
*          i_date_from = lv_from
*          i_date_to   = lv_to
*        IMPORTING
*          e_days      = lv_days.
*    ENDIF.
*
*
*    IF  ( so_orderid IS INITIAL  AND so_custcompanyname IS INITIAL AND so_originalsource IS INITIAL AND
*         so_createdate IS INITIAL AND so_zoneid IS INITIAL AND so_shoppinglistid IS INITIAL AND
*         so_paymentmethodtypeid IS INITIAL AND so_productstoreid IS INITIAL AND
*         so_inquirytype IS INITIAL AND so_ordername IS INITIAL AND so_carbrandid IS INITIAL AND
*         so_canceldate IS INITIAL AND so_citygeoid IS INITIAL AND so_userid IS INITIAL AND so_createdname IS INITIAL ) OR lv_days GT 93 .
*      DATA lv_newdate TYPE sy-datum.
*      lv_to = COND #( WHEN lv_to IS INITIAL THEN sy-datum ELSE lv_to ).
*      CALL FUNCTION 'BKK_ADD_MONTH_TO_DATE'
*        EXPORTING
*          months  = '-3'
*          olddate = sy-datum
*        IMPORTING
*          newdate = lv_newdate.
*      so_createdate = VALUE #( ( sign = 'I' option = 'BT' low = lv_newdate high = sy-datum ) ).
*    ENDIF.

    get_order_data(
    EXPORTING
      so_custcompanyname = so_custcompanyname
      so_originalsource = so_originalsource
      so_createdate = so_createdate
      so_custcompanyid = so_custcompanyid
      so_inquirytype = so_inquirytype
      so_shoppinglistid = so_shoppinglistid
      so_userid = so_userid
      so_zoneid = so_zoneid
      so_carbrandid = so_carbrandid
      so_citygeoid = so_citygeoid
      so_createdname = so_createdname
      so_ordername = so_ordername "配件名称 零件号
      so_productstoreid = so_productstoreid
      so_companycode = so_companycode
      so_orderid = so_orderid
      so_canceldate = so_canceldate
      so_cancelreason = so_cancelreason
      so_canceltime = so_canceltime
      iv_isdelete = iv_isdelete
      IMPORTING
        et_order = DATA(lt_order)
        et_order_cus = DATA(et_order_cus)
      ).

    IF mv_type NE '4'.
      zcl_cassint_auth_check=>get_special_customer( IMPORTING r_cusid = DATA(lr_spcusid) ).
      IF lr_spcusid IS NOT INITIAL.
        DELETE lt_order WHERE cusid IN lr_spcusid.
      ENDIF.
    ENDIF.

    SORT lt_order BY orderid.
    DELETE ADJACENT DUPLICATES FROM lt_order COMPARING orderid.
    CHECK lt_order IS NOT INITIAL.

*****数据填充
    set_order_overview_new(
    EXPORTING
      it_order = lt_order
      it_order_cus = et_order_cus
      so_paymentmethodtypeid = so_paymentmethodtypeid
      so_orderby = so_orderby
      iv_orderby = iv_orderby
      iv_page = iv_page
      iv_size = iv_size
      iv_export = iv_export
      iv_isdelete = iv_isdelete
      so_statusid = so_statusid
      is_excellist = is_excellist "只有下载的时候才会传值
    IMPORTING
      er_deep_entity = es_data
      ) .
  ENDMETHOD.


  METHOD get_order_overview_new_v2.
    DATA:lv_days     TYPE int4.
    DATA:lv_from TYPE dats,
         lv_to   TYPE dats.

****获取钉钉用户在客户上的数据权限
    IF iv_classtype EQ 'X10101'.
      mv_type = 1."从客户过来查询的不用检查全新类型，直接给1
    ELSE.
      get_user_mvtype( 'X13103' ) .
    ENDIF.
    CHECK mv_type IS NOT INITIAL.

    get_order_data_new_v3(
    EXPORTING
      so_custcompanyname = so_custcompanyname
      so_label = so_label
      so_originalsource = so_originalsource
      so_createdate = so_createdate
      so_custcompanyid = so_custcompanyid
      so_inquirytype = so_inquirytype
      so_shoppinglistid = so_shoppinglistid
      so_userid = so_userid
      so_zoneid = so_zoneid
      so_carbrandid = so_carbrandid
      so_citygeoid = so_citygeoid
      so_createdname = so_createdname
      so_ordername = so_ordername "配件名称 零件号
      so_productstoreid = so_productstoreid
      so_paymentmethodtypeid = so_paymentmethodtypeid
      so_companycode = so_companycode
      so_orderid = so_orderid
      so_canceldate = so_canceldate
      so_cancelreason = so_cancelreason
      so_canceltime = so_canceltime
      so_isproxy = so_isproxy
      so_operator = so_operator
      so_custagid = so_custagid
      so_vin = so_vin
      iv_isdelete = iv_isdelete
      iv_usertype = iv_usertype
      iv_classtype = iv_classtype
    IMPORTING
    et_order = DATA(lt_order)
          ).

***  IF mv_type NE '4'.
***    zcl_cassint_auth_check=>get_special_customer( IMPORTING r_companyid = DATA(lr_spcompanyid) ).
***    IF lr_spcompanyid IS NOT INITIAL.
***      DELETE lt_order WHERE custcompanyid IN lr_spcompanyid.
***    ENDIF.
***  ENDIF.

    SORT lt_order BY orderid.
    DELETE ADJACENT DUPLICATES FROM lt_order COMPARING orderid.
    CHECK lt_order IS NOT INITIAL.

*****数据填充
    set_order_overview_new_v2(
    EXPORTING
      it_order = lt_order
      so_orderby = so_orderby
      iv_orderby = iv_orderby
      iv_page = iv_page
      iv_size = iv_size
      iv_export = iv_export
      iv_isdelete = iv_isdelete
      so_statusid = so_statusid
      is_excellist = is_excellist "只有下载的时候才会传值
    IMPORTING
      er_deep_entity = es_data
      ) .
  ENDMETHOD.


  METHOD get_order_processinfo.
    DATA(lo_order_api)  = NEW zcl_icec_order_api( ).

    lo_order_api->get_order_processinfo_data(
        EXPORTING
          iv_orderid = EXACT string( er_deep_entity-orderid )
          iv_showsource = 'PLATFORM'
        IMPORTING
          et_out = DATA(et_processinfo)
          ev_msg = ev_msg
      ).
    CHECK ev_msg-type EQ 'S'.
    CLEAR ev_msg.
***订单处理信息赋值
    set_order_processinfo(
    EXPORTING
      it_processinfo = et_processinfo
    IMPORTING
      ev_msg = ev_msg
    CHANGING
      cs_entity = er_deep_entity
      ).

  ENDMETHOD.


  METHOD get_order_shipments.
    DATA(lo_order_api)  = NEW zcl_icec_order_api( ).

    lo_order_api->get_order_shipments_data(
        EXPORTING
          iv_orderid = EXACT string( er_deep_entity-orderid )
          iv_showsource = 'PLATFORM'
        IMPORTING
          et_out = DATA(et_shipment)
          ev_msg = ev_msg
      ).
    CHECK ev_msg-type EQ 'S'.
    CLEAR ev_msg.
***订单物流信息赋值
    set_order_shipment(
    EXPORTING
      it_shipment = et_shipment
    IMPORTING
      ev_msg = ev_msg
    CHANGING
      cs_entity = er_deep_entity
      ).

  ENDMETHOD.


  METHOD get_person.
    DATA:l_count TYPE zsint_department-treestru.
    DATA(lo_master) = NEW zcl_cassint_master( ).
********给当前用户指定的可看的战区或者部门
    SELECT DISTINCT repdeptid,repuserid,parentid
      INTO TABLE @DATA(lt_authdata)
      FROM ztint_auth_data AS a LEFT JOIN ztint_dept AS d
        ON a~repdeptid = d~deptid AND d~deptid NE ''
      FOR ALL ENTRIES IN @mt_rep_data
     WHERE userid = @mv_userid
       AND cprog = 'ZINT_CASSINT'
       AND zrole = @mt_rep_data-zrole
       AND id = @mt_rep_data-id
       AND d~isstill = 'X'. "部门id如果不存在了，只能查询自己的数据
    IF sy-subrc EQ 0.
****现在所有的组织ID
      lo_master->get_dept_all( ).
      SORT lt_authdata BY repdeptid.
****找传入的这个部门层级下的所有部门
      LOOP AT lt_authdata INTO DATA(ls_authdata) WHERE repdeptid IS NOT INITIAL.
        lo_master->get_follow_department_inself( EXPORTING iv_begin = ls_authdata-repdeptid CHANGING ev_count = l_count ).
      ENDLOOP.

      CHECK lo_master->mt_department IS NOT INITIAL.

****获取当前层级下所有的客户经理
      SELECT DISTINCT d~userid,i~username,d~deptid AS repdeptid
        INTO CORRESPONDING FIELDS OF TABLE @et_userlist
        FROM ztint_user_dept AS d
       INNER JOIN ztint_user_inf AS i ON d~userid = i~userid
         AND d~corp_id = i~corp_id
         FOR ALL ENTRIES IN @lo_master->mt_department
       WHERE ( d~deptid = @lo_master->mt_department-id"组织本身下属的客户经理
          OR ( d~userid = @lo_master->mt_department-id(32)
         AND deptid = @lo_master->mt_department-parentid ) "直接指定到该组织的人员
          OR ( d~userid = @mv_userid ) )
         AND d~userid IN @so_userid"同时也在前台筛选的客户经理范围内
         AND d~isstill = 'X'.

    ENDIF.

****配置的也有可能不是部门，是指定的人
    SELECT DISTINCT repuserid AS userid APPENDING CORRESPONDING FIELDS OF TABLE @et_userlist
      FROM ztint_auth_data AS a INNER JOIN ztint_user_inf AS i
        ON a~repuserid = i~userid
      FOR ALL ENTRIES IN @mt_rep_data
     WHERE a~userid = @mv_userid
       AND a~cprog = 'ZINT_CASSINT'
       AND a~zrole = @mt_rep_data-zrole
       AND a~id = @mt_rep_data-id
       AND i~isstill = 'X'. "部门id如果不存在了，只能查询自己的数据

    "如果没有筛选客户经理  要加上自己
    IF so_userid IS INITIAL .
      et_userlist = VALUE #( BASE et_userlist ( userid = mv_userid ) ).
    ELSE.
      DELETE et_userlist WHERE userid NOT IN so_userid.
      et_userlist = VALUE #( BASE et_userlist ( userid = mv_userid ) ).
    ENDIF.
  ENDMETHOD.


  METHOD get_user_mvtype.

    CHECK mv_userid IS NOT INITIAL.
    "取权限
    SELECT DISTINCT d~cprog,d~id,d~zrole,d~type
      INTO CORRESPONDING FIELDS OF TABLE @mt_rep_data
      FROM ztint_rep_data AS d
     INNER JOIN ztint_rep_role AS r
        ON d~cprog = r~cprog
       AND d~zrole = r~zrole
       AND d~id = r~id
     INNER JOIN ztint_per_auth AS a
        ON r~cprog = a~cprog
       AND r~zrole = a~zrole
     INNER JOIN ztint_reps AS p
        ON a~cprog = p~cprog
     WHERE a~cprog = 'ZINT_CASSINT'
       AND r~id = @iv_role
       AND a~uname = @mv_userid.

    CHECK mt_rep_data IS NOT INITIAL.

    SORT mt_rep_data BY cprog id zrole type.
    DELETE ADJACENT DUPLICATES FROM mt_rep_data COMPARING  cprog id zrole type.

    "全公司
    READ TABLE mt_rep_data TRANSPORTING NO FIELDS WITH KEY type = '4' .
    IF sy-subrc = 0.
      mv_type = '4'."全公司数据
      DELETE mt_rep_data WHERE type NE '1'.
    ELSE.
      READ TABLE mt_rep_data TRANSPORTING NO FIELDS WITH KEY type = '1' .
      IF sy-subrc = 0.
        mv_type = '1'."全公司数据
        DELETE mt_rep_data WHERE type NE '1'.
      ELSE.
        READ TABLE mt_rep_data TRANSPORTING NO FIELDS WITH KEY type = '2'.
        IF sy-subrc = 0.
          mv_type = '2'.
          DELETE mt_rep_data WHERE type NE '2'.
        ELSE.
          "自己的
          READ TABLE mt_rep_data TRANSPORTING NO FIELDS WITH  KEY type = '3'.
          IF sy-subrc = 0.
            mv_type = '3'.
            DELETE mt_rep_data WHERE type NE '3'.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD nosign_currency_formatter.
    DATA:lv_amount TYPE zde_intamount.
    lv_amount = iv_input.
    ev_output = |{ lv_amount NUMBER = USER }|."订单金额
    CLEAR lv_amount.
  ENDMETHOD.


  METHOD prepare_etalabel_improt.
    "prepare the body
    DATA:lv_body       TYPE string,
         lv_importbody TYPE string,
         lv_product    TYPE string.
    lv_body = |\{"garageCompanyId": "{ is_etaimport-garagecompanyid }","postalAddressId": "{ is_etaimport-postaladdressid }",| &&
              |"businessType": "{ is_etaimport-businesstype }","terminal": "{ is_etaimport-terminal }","products":[|.
    LOOP AT is_etaimport-products INTO DATA(ls_product).
      DATA(lv_mod) = sy-tabix MOD 50.
      lv_product = COND #( WHEN lv_product IS INITIAL THEN |\{| ELSE |{ lv_product },\{| ).
      lv_product = |{ lv_product } "productId": "{ ls_product-productid }", "storeId": "{ ls_product-storeid }",| &&
                   |"facilityId": "{ ls_product-facilityid }","inquiryId": "{ ls_product-inquiryid }","quantity": { ls_product-quantity },| &&
                   |"price": { COND #( WHEN ls_product-price IS INITIAL THEN 0 ELSE ls_product-price ) },"invoiceType": "{ ls_product-invoicetype }"\}|.
      IF lv_mod EQ 0.
        lv_importbody = |{ lv_body }{ lv_product }]\}|.
        NEW zcl_icec_inquiry_api( )->get_etalabel_show( EXPORTING iv_body = lv_importbody
        IMPORTING ev_msg = DATA(ls_msg) et_data = DATA(lt_data) ).
        APPEND LINES OF lt_data TO et_data.
        CLEAR:lt_data,lv_product,ls_msg,lv_mod,lv_importbody.
      ENDIF.
    ENDLOOP.

    IF lv_mod NE 0.
      lv_importbody = |{ lv_body }{ lv_product }]\}|.
      NEW zcl_icec_inquiry_api( )->get_etalabel_show( EXPORTING iv_body = lv_importbody
      IMPORTING ev_msg = ls_msg et_data = lt_data ).
      APPEND LINES OF lt_data TO et_data.
      CLEAR:lt_data,lv_product,ls_msg,lv_mod.
    ENDIF.

  ENDMETHOD.


  METHOD prepare_pinkage_import.
    "prepare the body
    DATA:lv_body       TYPE string,
         lv_importbody TYPE string,
         lv_product    TYPE string.
    lv_body = |\{"garageCompanyId": "{ is_pinkageimport-garagecompanyid }","addressId": "{ is_pinkageimport-addressid }",| &&
              |"businessType": "{ is_pinkageimport-businesstype }","terminal": "{ is_pinkageimport-terminal }","productInfoRequests":[|.
    LOOP AT is_pinkageimport-productinforequests INTO DATA(ls_product).
      DATA(lv_mod) = sy-tabix MOD 50.
      lv_product = COND #( WHEN lv_product IS INITIAL THEN |\{| ELSE |{ lv_product },\{| ).
      lv_product = |{ lv_product } "productId": "{ ls_product-productid }", "storeId": "{ ls_product-storeid }",| &&
                   |"facilityId": "{ ls_product-facilityid }","quantity": { ls_product-quantity },| &&
                   |"price": { COND #( WHEN ls_product-price IS INITIAL THEN 0 ELSE ls_product-price ) }\}|.
      IF lv_mod EQ 0.
        lv_importbody = |{ lv_body }{ lv_product }]\}|.
        NEW zcl_icec_inquiry_api( )->get_pinkage_show( EXPORTING iv_body = lv_importbody
        IMPORTING ev_msg = DATA(ls_msg) et_data = DATA(lt_data) ).
        APPEND LINES OF lt_data TO et_data.
        CLEAR:lv_mod,lv_importbody,lv_product,lt_data,ls_msg.
      ENDIF.
    ENDLOOP.

    IF lv_mod NE 0.
      lv_importbody = |{ lv_body }{ lv_product }]\}|.
      NEW zcl_icec_inquiry_api( )->get_pinkage_show( EXPORTING iv_body = lv_importbody
      IMPORTING ev_msg = ls_msg et_data = lt_data ).
      APPEND LINES OF lt_data TO et_data.
      CLEAR:lv_mod,lv_importbody,lv_product,lt_data,ls_msg.
    ENDIF.
  ENDMETHOD.


  METHOD quantity_formatter.
***   小数点后全是0
    DATA:lv_find TYPE string VALUE '\.'.
    CHECK iv_input   IS NOT INITIAL.
    ev_output = iv_input.
    CONDENSE ev_output.
    SHIFT ev_output RIGHT DELETING TRAILING '0'.
    CONDENSE ev_output.
    DATA(l_find) = find( val = ev_output regex = lv_find ).
    IF strlen( ev_output ) = l_find + 1.
      ev_output = ev_output(l_find).
    ENDIF.
  ENDMETHOD.


  METHOD set_as_overview_new_v2.
    DATA: lv_quantity TYPE int4.
    DATA:lv_quantity_c TYPE text20.
    DATA:BEGIN OF ls_asid_product,
           asid        TYPE text50,
           productname TYPE string,
         END OF ls_asid_product.
    DATA lt_asid_product LIKE STANDARD TABLE OF ls_asid_product.
    DATA lt_trail         TYPE STANDARD TABLE OF zord_s_trail.
    DATA lt_trail2         TYPE STANDARD TABLE OF zord_s_trail.
    DATA ls_trail         TYPE zord_s_trail.
    DATA ls_trail2         TYPE zord_s_trail.
    DATA ls_trail_pre         TYPE zord_s_trail.
    DATA:ls_aftersalelistset LIKE LINE OF er_deep_entity-aftersalelistset.
    DATA:lt_aftersalelistset LIKE STANDARD TABLE OF ls_aftersalelistset.
    DATA:l_index TYPE int4.
    DATA lv_fromid TYPE sy-tabix.
    DATA lv_fromid2 TYPE sy-tabix.
    DATA lv_fromid3 TYPE sy-tabix.
    DATA lv_partnm TYPE string.
    DATA lv_partpr TYPE string.
    DATA lv_partcm TYPE string.
    DATA lv_parts TYPE zde_intamount.
    DATA :lv_userid_log TYPE text100.
    DATA lv_input TYPE string.
    SELECT a~type,b~typedesc,a~childtype,a~afstatus,a~status,
    a~statusdesc
    FROM ztint_rtn_status AS a
    INNER JOIN ztint_rtn_type AS b
    ON a~type = b~type
    INTO TABLE @DATA(lt_status_txt).

    SORT lt_status_txt BY status statusdesc.
    DELETE ADJACENT DUPLICATES FROM lt_status_txt COMPARING status statusdesc.

    SELECT fnam,val_low,text INTO TABLE @DATA(lt_f4config) FROM ztbc_f4_config
          WHERE fnam IN ( 'ZICERP_CASSINT_ASFOLLOWSOURCE','ZICERP_CASSINT_FOLLOWTYPE','ZINT_CASSINT_RIGHTTYPE' ).
    SORT lt_f4config BY fnam val_low .

    IF it_aftersale IS NOT INITIAL.

      SORT it_asorder BY asid orderid orderitemseqid.
      DATA(it_asorder_temp) =  it_asorder.
*手机端将配件信息拼接
      LOOP AT  it_asorder_temp INTO DATA(ls_zticec_af_order_temp).
        lv_quantity =  ls_zticec_af_order_temp-quantity.
        WRITE lv_quantity TO lv_quantity_c .
        ls_asid_product-asid = ls_zticec_af_order_temp-asid.
        IF ls_asid_product-productname IS INITIAL.
          ls_asid_product-productname = ls_zticec_af_order_temp-productname && 'x'  && lv_quantity_c.
        ELSE.
          ls_asid_product-productname =  ls_asid_product-productname && '、' && ls_zticec_af_order_temp-productname && 'x'  && lv_quantity_c.
        ENDIF.
        AT END OF asid.
          APPEND ls_asid_product TO lt_asid_product.
          CLEAR ls_asid_product.
        ENDAT.
        CLEAR  :lv_quantity ,lv_quantity_c.
      ENDLOOP.
      SORT  lt_asid_product BY asid.

      IF it_veninf IS NOT INITIAL.
        SELECT a~venid,a~userid,b~username INTO TABLE @DATA(lt_venuser) FROM ztint_ven_user AS a
              INNER JOIN ztint_user_inf AS b ON a~userid = b~userid AND a~usertype EQ '1'
              FOR ALL ENTRIES IN @it_veninf
              WHERE a~isdelete EQ '' AND a~ispre EQ '' AND a~venid = @it_veninf-venid.
        SORT lt_venuser BY venid.
      ENDIF.

      SELECT * INTO  TABLE @DATA(lt_dd07t) FROM dd07t WHERE domname    = 'ZDM_MANAGESTATUS'
            AND ddlanguage = @sy-langu AND as4local   = 'A'.
      SORT lt_dd07t BY domvalue_l.
    ENDIF.

    SORT it_asorder BY asid.

* 战区
    IF it_cusinf IS NOT INITIAL.
      SELECT zoneid,zonename FROM ztcass_custzone INTO TABLE @DATA(lt_ztcass_custzone)
            FOR ALL ENTRIES IN @it_cusinf
            WHERE zoneid = @it_cusinf-zoneid.
      SORT lt_ztcass_custzone BY zoneid.
      DELETE ADJACENT DUPLICATES FROM lt_ztcass_custzone COMPARING  zoneid.

      SELECT i~cusid,i~userid,u~username FROM ztint_cus_user AS i INNER JOIN ztint_user_inf AS u
      ON i~userid = u~userid
      INTO TABLE @DATA(lt_cususer) FOR ALL ENTRIES IN @it_cusinf
            WHERE i~cusid = @it_cusinf-cusid AND i~isdelete = '' AND i~ispre = ''
            AND i~usertype = '1' AND u~isstill = 'X' .
      SORT lt_cususer BY cusid.
    ENDIF.

    "跟进备注信息
    CLEAR:lt_trail2[],ls_trail2.
    IF it_aftersale IS NOT INITIAL.

      SELECT billno,followdate,followtime,partsnum,partsname,followremark,followtype,followsource,followname
      FROM ztint_follow_inf INTO TABLE @DATA(lt_followinf)
            FOR ALL ENTRIES IN @it_aftersale WHERE billno = @it_aftersale-asid.

      SELECT billno,followdate,followtime, remark AS followremark, followname
      FROM ztint_followlist APPENDING CORRESPONDING FIELDS OF TABLE @lt_followinf
      FOR ALL ENTRIES IN @it_aftersale WHERE billno = @it_aftersale-asid.

      DATA(lt_follow_latest) = lt_followinf.
      SORT lt_followinf  BY billno.

      LOOP AT lt_followinf INTO DATA(ls_followinf).
        IF ls_trail_pre IS NOT INITIAL AND ls_followinf-billno NE ls_trail_pre-billno.
          APPEND ls_trail TO lt_trail.
          CLEAR ls_trail.
        ENDIF.
        ls_trail-billno = ls_followinf-billno.
        ls_trail2-billno = ls_followinf-billno."add -导出新增跟进内容
        "跟进备注
        IF ls_followinf-followremark IS NOT INITIAL.
          ls_trail-followremark = COND #( WHEN ls_trail-followremark IS INITIAL THEN |{ ls_followinf-partsname }({ ls_followinf-followremark })|
          ELSE |{ ls_trail-followremark };{ ls_followinf-partsname }({ ls_followinf-followremark })| ).
          ls_trail2-followremark = ls_followinf-followremark."add -导出新增跟进内容
        ENDIF.
        "跟进类型
        IF ls_followinf-followtype IS NOT INITIAL.
          READ TABLE lt_f4config INTO DATA(ls_f4config) WITH KEY
                fnam = 'ZICERP_CASSINT_FOLLOWTYPE' val_low = ls_followinf-followtype BINARY SEARCH .
          IF sy-subrc EQ 0.
            SEARCH ls_trail-followtypedesc FOR ls_f4config-text.
            IF sy-subrc NE 0.
              ls_trail-followtypedesc = COND #( WHEN ls_trail-followtypedesc IS INITIAL THEN ls_f4config-text
              ELSE |{ ls_trail-followtypedesc };{ ls_f4config-text }| ).
            ENDIF.
            ls_trail2-followtypedesc = ls_f4config-text."add -导出新增跟进内容
            CLEAR ls_f4config.
          ENDIF.
        ENDIF.
        "跟进来源
        IF ls_followinf-followsource IS NOT INITIAL.
          READ TABLE lt_f4config INTO ls_f4config WITH KEY
          fnam = 'ZICERP_CASSINT_ASFOLLOWSOURCE' val_low = ls_followinf-followsource BINARY SEARCH .
          IF sy-subrc EQ 0.
            SEARCH ls_trail-followsourcedesc FOR ls_f4config-text.
            IF sy-subrc NE 0.
              ls_trail-followsourcedesc = COND #( WHEN ls_trail-followsourcedesc IS INITIAL THEN ls_f4config-text
              ELSE |{ ls_trail-followsourcedesc };{ ls_f4config-text }| ).
            ENDIF.
            ls_trail2-followsourcedesc = ls_f4config-text."add -导出新增跟进内容
            CLEAR ls_f4config.
          ENDIF.
        ENDIF.
        "跟进人
        IF ls_followinf-followname IS NOT INITIAL.
          SEARCH ls_trail-followname FOR ls_followinf-followname.
          IF sy-subrc NE 0.
            ls_trail-followname = COND #( WHEN ls_trail-followname IS INITIAL THEN ls_followinf-followname
            ELSE |{ ls_trail-followname }、{ ls_followinf-followname }| ).
          ENDIF.
          ls_trail2-followname = ls_followinf-followname."add -导出新增跟进内容
        ENDIF.
        "跟进时间
        ls_trail2-followdate = ls_followinf-followdate."add -导出新增跟进内容

        ls_trail_pre = ls_trail.

        "add --导出新增跟进内容
        IF iv_export = 'X'.
          ls_trail2-partsnum = ls_followinf-partsnum.
          IF iv_isactivefollow = 'X'.
            "只看跟进来源是客服主动跟进的
            IF ls_followinf-followsource = '1'.
              APPEND ls_trail2 TO lt_trail2.
            ENDIF.
          ELSE.
            APPEND ls_trail2 TO lt_trail2.
          ENDIF.
          CLEAR ls_trail2.
        ENDIF.
      ENDLOOP.
      IF ls_trail IS NOT INITIAL.
        APPEND ls_trail TO lt_trail.
        CLEAR ls_trail.
      ENDIF.
    ENDIF.

    SORT lt_trail BY billno.
    SORT lt_trail2 BY billno partsnum followdate DESCENDING.

    SELECT DISTINCT type,childtype,typedesc,childtypedesc FROM ztint_rtn_status
    INTO TABLE @DATA(lt_aftypet) WHERE inact = '' ORDER BY type,childtype.


    LOOP AT  it_aftersale INTO DATA(ls_zticec_af_infuser).
      DATA(l_tabix) = sy-tabix.
      READ TABLE lt_venuser INTO DATA(ls_venuser) WITH KEY venid = ls_zticec_af_infuser-venid BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_aftersalelistset-venmanagername = ls_venuser-username.
      ENDIF.

      ls_aftersalelistset-ksbsorder = ls_zticec_af_infuser-ksbsorder.
****** 店铺经营状态
      ls_aftersalelistset-mangstatus = ls_zticec_af_infuser-mangstatus.

      READ TABLE lt_dd07t INTO DATA(ls_dd07t) WITH KEY domvalue_l = ls_aftersalelistset-mangstatus BINARY SEARCH.
      ls_aftersalelistset-mangstatusdesc = ls_dd07t-ddtext.

      ls_aftersalelistset-asid = ls_zticec_af_infuser-asid."申请单号
      ls_aftersalelistset-asrepairusername = ls_zticec_af_infuser-asrepairusername."申请人

*      ls_aftersalelistset-typedesc = ls_zticec_af_infuser-typedesc."服务类型
*      READ TABLE lt_type_txt INTO DATA(ls_type_txt) WITH KEY childtype = ls_zticec_af_infuser-newtype BINARY SEARCH.
*      IF sy-subrc = 0.
*        ls_aftersalelistset-typedesc = ls_type_txt-typedesc.
*      ELSE.
      ls_aftersalelistset-type = ls_zticec_af_infuser-newtype."服务类型
*      ls_aftersalelistset-typedesc = ls_zticec_af_infuser-newtypedesc."服务类型
      ls_aftersalelistset-typedesc = VALUE #( lt_aftypet[ type = ls_zticec_af_infuser-newtype ]-typedesc OPTIONAL )."服务类型
      ls_aftersalelistset-childtype = ls_zticec_af_infuser-childtype."服务类型
      ls_aftersalelistset-childtypedesc = VALUE #( lt_aftypet[ childtype = ls_zticec_af_infuser-childtype ]-childtypedesc OPTIONAL )."服务类型
*      ENDIF.
      ls_aftersalelistset-typedesc = ls_aftersalelistset-childtypedesc.
      ls_aftersalelistset-reasondesc = ls_zticec_af_infuser-reasondesc."申请原因
      WRITE  ls_zticec_af_infuser-returnamount TO ls_aftersalelistset-returnamount."金额
      CONDENSE ls_aftersalelistset-returnamount NO-GAPS.
      WRITE  ls_zticec_af_infuser-actualreturnamount TO ls_aftersalelistset-actualreturnamount."实际退款金额
      CONDENSE ls_aftersalelistset-actualreturnamount NO-GAPS.
      IF ls_zticec_af_infuser-actualreturnamount EQ 0.
        lv_input = COND #( WHEN lv_input IS INITIAL THEN |"{ ls_aftersalelistset-asid }"| ELSE |{ lv_input },"{ ls_aftersalelistset-asid }"| ).
      ENDIF.
      ls_aftersalelistset-createdate = ls_zticec_af_infuser-createdate+0(4) && '-' && ls_zticec_af_infuser-createdate+4(2) && '-'   &&  ls_zticec_af_infuser-createdate+6(2)."申请时间
      ls_aftersalelistset-createtime = ls_zticec_af_infuser-createtime+0(2) && ':' && ls_zticec_af_infuser-createtime+2(2) && ':'   &&  ls_zticec_af_infuser-createtime+4(2).
      CONDENSE ls_aftersalelistset-createdate NO-GAPS.
      CONDENSE ls_aftersalelistset-createtime NO-GAPS.
      ls_aftersalelistset-zupdate = ls_zticec_af_infuser-lastupdatedtxstampstr.
      ls_aftersalelistset-createtimetx = ls_zticec_af_infuser-createdstampstr.
*      CONCATENATE ls_aftersalelistset-createdate  ls_aftersalelistset-createtime INTO ls_aftersalelistset-createtimetx SEPARATED BY space.

*      IF ls_zticec_af_infuser-statusdesc <> ''.
*        ls_aftersalelistset-statusdesc = ls_zticec_af_infuser-statusdesc."状态
*        "重新获取一次状态描述
*      ELSE.
      READ TABLE lt_status_txt INTO DATA(ls_status_txt) WITH KEY status = ls_zticec_af_infuser-statusid BINARY SEARCH."状态ID
      IF sy-subrc = 0.
        ls_aftersalelistset-statusdesc = ls_status_txt-statusdesc."状态
      ENDIF.
*      ENDIF.
      ls_aftersalelistset-statusid = ls_zticec_af_infuser-statusid."状态ID

      ls_aftersalelistset-asrepaircompanyname = ls_zticec_af_infuser-asrepaircompanyname."客户名称

*** 基石1.0 售后申请列表店铺品牌商模式下取托盘商，导出列表为服务商，另售后申请详情展示服务商
      IF iv_export = 'X' AND ls_zticec_af_infuser-sellerstorename IS NOT INITIAL.
        ls_aftersalelistset-assupplierstorename = ls_zticec_af_infuser-sellerstorename."服务商店铺
      ELSE.
        ls_aftersalelistset-assupplierstorename = ls_zticec_af_infuser-assupplierstorename."托盘商店铺
      ENDIF.

      ls_aftersalelistset-zoneid = ls_zticec_af_infuser-zoneid."战区
      READ TABLE lt_ztcass_custzone INTO DATA(ls_ztcass_custzone) WITH KEY zoneid = ls_zticec_af_infuser-zoneid BINARY SEARCH .
      ls_aftersalelistset-zonename = ls_ztcass_custzone-zonename."战区描述
      ls_aftersalelistset-provincename = ls_zticec_af_infuser-provincegeoname."省描述
      ls_aftersalelistset-cityname = ls_zticec_af_infuser-citygeoname."市描述
      ls_aftersalelistset-companycode = ls_zticec_af_infuser-companycode."客户代码

      READ TABLE lt_cususer INTO DATA(ls_cususer) WITH KEY cusid = ls_zticec_af_infuser-cusid BINARY SEARCH.
      ls_aftersalelistset-userid = ls_cususer-userid.
      ls_aftersalelistset-username = ls_cususer-username.

      ls_aftersalelistset-venid = ls_zticec_af_infuser-venid.

      ls_aftersalelistset-orderid = ls_zticec_af_infuser-orderid."订单编号

      ls_aftersalelistset-carbrandname = ls_zticec_af_infuser-carbrandname."汽车品牌
      ls_aftersalelistset-productname = ls_zticec_af_infuser-productname."零件名称
      ls_aftersalelistset-productnum = ls_zticec_af_infuser-productnum."零件号
      lv_quantity = ls_zticec_af_infuser-quantity.
      IF lv_quantity <> 0.
        ls_aftersalelistset-quantity =    lv_quantity."数量
      ENDIF.

      READ TABLE lt_asid_product INTO ls_asid_product WITH KEY asid = ls_zticec_af_infuser-asid BINARY SEARCH.
      ls_aftersalelistset-productnamecone = ls_asid_product-productname.
      l_index = l_index + 1.
      ls_aftersalelistset-sno = l_index."1

      "A59增加申诉单号、申诉标记、使用权益字段
      IF ls_zticec_af_infuser-type = 'returnAftersale' OR ls_zticec_af_infuser-childtype = 'returnAftersale'.
        ls_aftersalelistset-appealid = ls_zticec_af_infuser-woid.
        ls_aftersalelistset-appealflag  = '转申诉'.
      ENDIF.

      IF ls_zticec_af_infuser-righttype <> ''.
        READ TABLE lt_f4config INTO ls_f4config WITH KEY fnam = 'ZINT_CASSINT_RIGHTTYPE' val_low = ls_zticec_af_infuser-righttype BINARY SEARCH .
        IF sy-subrc = 0.
          ls_aftersalelistset-useright = ls_f4config-text.
        ENDIF.

        "如果righttype字段没有写值，通过类型也能判断出来是否是权益
      ELSEIF ls_aftersalelistset-useright = '' AND ls_zticec_af_infuser-childtype <> ''.
        READ TABLE lt_f4config INTO ls_f4config WITH KEY fnam = 'ZINT_CASSINT_RIGHTTYPE' val_low = ls_zticec_af_infuser-childtype BINARY SEARCH .
        IF sy-subrc = 0.
          ls_aftersalelistset-useright = ls_f4config-text.
        ENDIF.
      ENDIF.



      "A59add end

      IF iv_export = 'X'.
        "如果没有根据记录，按之前的汇总行导出
        READ TABLE lt_trail2 TRANSPORTING NO FIELDS
        WITH KEY billno = ls_zticec_af_infuser-asid BINARY SEARCH.
        IF sy-subrc <> 0.
          READ TABLE lt_trail INTO ls_trail WITH KEY billno = ls_zticec_af_infuser-asid BINARY SEARCH.
          ls_aftersalelistset-followname = ls_trail-followname.
          ls_aftersalelistset-followremark = ls_trail-followremark.
          ls_aftersalelistset-followsourcedesc = ls_trail-followsourcedesc.
          ls_aftersalelistset-followtypedesc = ls_trail-followtypedesc.
          APPEND ls_aftersalelistset TO lt_aftersalelistset.
        ELSE.
          "如果有跟进记录，导出数据以申请单+配件+跟进记录为单位导出
          CLEAR:lv_fromid,lv_partnm,lv_partpr,lv_partcm.
          lv_partnm = ls_aftersalelistset-productname.
          lv_partpr = ls_aftersalelistset-returnamount.
          lv_partcm = ls_aftersalelistset-carbrandname.
          READ TABLE it_asorder TRANSPORTING NO FIELDS WITH KEY asid  = ls_zticec_af_infuser-asid BINARY SEARCH.
          IF sy-subrc = 0.
            lv_fromid = sy-tabix.
            LOOP AT it_asorder INTO DATA(ls_zticec_af_order) FROM lv_fromid.
              IF ls_zticec_af_order-asid <> ls_zticec_af_infuser-asid.
                EXIT.
              ENDIF.

              CLEAR:ls_aftersalelistset-productname,ls_aftersalelistset-returnamount,ls_aftersalelistset-carbrandname,lv_parts.
              ls_aftersalelistset-productname = ls_zticec_af_order-productname.
              lv_parts = ls_zticec_af_order-actualprice * ls_zticec_af_order-quantity.
              WRITE lv_parts TO ls_aftersalelistset-returnamount.
              CONDENSE ls_aftersalelistset-returnamount NO-GAPS.
              ls_aftersalelistset-carbrandname = ls_zticec_af_order-productbrandname.

              CLEAR:lv_fromid2.
              READ TABLE lt_trail2 TRANSPORTING NO FIELDS
              WITH KEY billno = ls_zticec_af_infuser-asid
              partsnum = ls_zticec_af_order-productnum BINARY SEARCH.
              IF sy-subrc = 0.
                lv_fromid2 = sy-tabix.
                LOOP AT lt_trail2 INTO ls_trail2 FROM lv_fromid2.
                  IF ls_trail2-billno <> ls_zticec_af_infuser-asid OR ls_trail2-partsnum <> ls_zticec_af_order-productnum.
                    EXIT.
                  ENDIF.
                  ls_aftersalelistset-followname = ls_trail2-followname.
                  ls_aftersalelistset-followremark = ls_trail2-followremark.
                  ls_aftersalelistset-followsourcedesc = ls_trail2-followsourcedesc.
                  ls_aftersalelistset-followtypedesc = ls_trail2-followtypedesc.
                  ls_aftersalelistset-followdate = |{ ls_trail2-followdate DATE = ISO }|.
                  APPEND ls_aftersalelistset TO lt_aftersalelistset.
                  CLEAR:ls_aftersalelistset-followname,ls_aftersalelistset-followremark,ls_aftersalelistset-followsourcedesc,
                  ls_aftersalelistset-followtypedesc,ls_aftersalelistset-followdate.
                ENDLOOP.
              ELSE.
                CLEAR:lv_fromid3.
                READ TABLE lt_trail2 TRANSPORTING NO FIELDS
                WITH KEY billno = ls_zticec_af_infuser-asid BINARY SEARCH.
                IF sy-subrc = 0.
                  lv_fromid3 = sy-tabix.
                  LOOP AT lt_trail2 INTO ls_trail2 FROM lv_fromid3.
                    IF ls_trail2-billno <> ls_zticec_af_infuser-asid.
                      EXIT.
                    ENDIF.
                    ls_aftersalelistset-followname = ls_trail2-followname.
                    ls_aftersalelistset-followremark = ls_trail2-followremark.
                    ls_aftersalelistset-followsourcedesc = ls_trail2-followsourcedesc.
                    ls_aftersalelistset-followtypedesc = ls_trail2-followtypedesc.
                    ls_aftersalelistset-followdate = |{ ls_trail2-followdate DATE = ISO }|.
                    APPEND ls_aftersalelistset TO lt_aftersalelistset.
                    CLEAR:ls_aftersalelistset-followname,ls_aftersalelistset-followremark,ls_aftersalelistset-followsourcedesc,
                    ls_aftersalelistset-followtypedesc,ls_aftersalelistset-followdate.
                  ENDLOOP.
                ELSE.
                  APPEND ls_aftersalelistset TO lt_aftersalelistset.
                ENDIF.
              ENDIF.
            ENDLOOP.

            CLEAR:ls_aftersalelistset-productname,ls_aftersalelistset-returnamount,ls_aftersalelistset-carbrandname.
            ls_aftersalelistset-productname = lv_partnm.
            ls_aftersalelistset-returnamount = lv_partpr.
            ls_aftersalelistset-carbrandname = lv_partcm.
          ELSE.
            READ TABLE lt_trail INTO ls_trail WITH KEY billno = ls_zticec_af_infuser-asid BINARY SEARCH.
            ls_aftersalelistset-followname = ls_trail-followname.
            ls_aftersalelistset-followremark = ls_trail-followremark.
            ls_aftersalelistset-followsourcedesc = ls_trail-followsourcedesc.
            ls_aftersalelistset-followtypedesc = ls_trail-followtypedesc.
            APPEND ls_aftersalelistset TO lt_aftersalelistset.
          ENDIF.
        ENDIF.
      ELSE.
        READ TABLE lt_trail INTO ls_trail WITH KEY billno = ls_zticec_af_infuser-asid BINARY SEARCH.
        ls_aftersalelistset-followname = ls_trail-followname.
        ls_aftersalelistset-followremark = ls_trail-followremark.
        ls_aftersalelistset-followsourcedesc = ls_trail-followsourcedesc.
        ls_aftersalelistset-followtypedesc = ls_trail-followtypedesc.
        APPEND ls_aftersalelistset TO lt_aftersalelistset.
      ENDIF.

      CLEAR :ls_aftersalelistset,ls_ztcass_custzone,lv_quantity,ls_zticec_af_infuser,ls_asid_product,ls_zticec_af_order,
      ls_ztcass_custzone,ls_cususer,ls_trail,ls_venuser.
    ENDLOOP.
    CLEAR l_index.

    DATA: lt_asinf1         TYPE TABLE OF zticec_af_inf,
          lt_asreturnamount TYPE zas_t_returnamount,
          ls_asreturnamount TYPE zas_returnamount.
    TYPES: BEGIN OF ty_asid,
             asid TYPE zticec_af_inf-asid,
           END OF ty_asid.
    DATA:ls_asid TYPE ty_asid,
         lt_asid TYPE TABLE OF ty_asid.
    DATA(lo_as) = NEW zcl_icec_aftersale_api( ).
    IF lv_input IS  NOT INITIAL.
      lv_input = |[{ lv_input }]|.
      CLEAR lt_asreturnamount.
      CALL METHOD lo_as->get_as_returnamount
        EXPORTING
          iv_body           = lv_input
        IMPORTING
          es_asreturnamount = lt_asreturnamount.
      SORT lt_asreturnamount BY asid.
      IF lt_asreturnamount[] IS NOT INITIAL.
        LOOP AT lt_asreturnamount INTO ls_asreturnamount.
          ls_asid-asid = ls_asreturnamount-asid.
          APPEND ls_asid TO lt_asid.
        ENDLOOP.
        SELECT * INTO TABLE @DATA(lt_asinf)
              FROM zticec_af_inf
              FOR ALL ENTRIES IN @lt_asid
              WHERE asid = @lt_asid-asid.
      ENDIF.

      LOOP AT lt_asreturnamount INTO ls_asreturnamount.
        READ TABLE lt_asinf INTO DATA(ls_asinf1) WITH KEY asid = ls_asreturnamount-asid BINARY SEARCH.
        IF sy-subrc = 0.
          ls_asinf1-actualreturnamount = ls_asreturnamount-returnamount.
          APPEND ls_asinf1 TO lt_asinf1.
        ENDIF.

      ENDLOOP.
      MODIFY zticec_af_inf FROM TABLE lt_asinf1.
      LOOP AT lt_aftersalelistset ASSIGNING FIELD-SYMBOL(<fs_aftersalelistset>).
        READ TABLE lt_asreturnamount INTO ls_asreturnamount WITH KEY asid = <fs_aftersalelistset>-asid.
        IF sy-subrc = 0.
          <fs_aftersalelistset>-actualreturnamount = ls_asreturnamount-returnamount.
        ENDIF.

      ENDLOOP.
    ENDIF.

    WRITE iv_totalamount TO  er_deep_entity-totalamount.
    CONDENSE er_deep_entity-totalamount NO-GAPS.
    IF iv_export = 'X'.

      MOVE-CORRESPONDING lt_aftersalelistset TO er_deep_entity-aftersalelistset.

      CALL FUNCTION 'Z_FMEXCEL_AFTERSALE_DOWNLOAD'
        STARTING NEW TASK 'AFTERSALES'
        EXPORTING
          iv_userid = mv_userid
          it_data   = lt_aftersalelistset.


    ELSE.

      "分页

      IF iv_page IS INITIAL . "没有这显示第一页
        iv_page = 1.
      ENDIF.

      IF iv_size IS INITIAL. "没有则默认50条
        iv_size = 20.
      ENDIF.

      er_deep_entity-pagetotal = iv_pagetotal."总页数
      er_deep_entity-total = iv_total."总条数

      APPEND LINES OF lt_aftersalelistset TO er_deep_entity-aftersalelistset.
    ENDIF.


  ENDMETHOD.


  METHOD set_inquiry_overview.

    DATA:lt_followinf     TYPE STANDARD TABLE OF zord_s_trail,
         lt_follow_latest TYPE STANDARD TABLE OF zord_s_trail,
         lt_trail         TYPE STANDARD TABLE OF zord_s_trail,
         ls_trail         TYPE zord_s_trail.
*  取客户经理名称

    IF mv_type = 1 AND mv_cus_condition IS NOT INITIAL.
      IF iv_isdelete NE 'X'.
        SELECT u~cusid,u~userid,i~username INTO TABLE @DATA(lt_cususer)
          FROM ztint_cus_user AS u
         INNER JOIN ztint_user_inf AS i
            ON u~userid = i~userid
          FOR ALL ENTRIES IN @it_inquiry_cus
          WHERE cusid = @it_inquiry_cus-cusid
          AND isdelete = ''
          AND usertype = '1'.
      ELSE.
        SELECT u~cusid,u~userid,i~username INTO TABLE @lt_cususer
          FROM ztint_cus_user AS u
         INNER JOIN ztint_user_inf AS i
            ON u~userid = i~userid
          FOR ALL ENTRIES IN @it_inquiry_cus
          WHERE cusid = @it_inquiry_cus-cusid
          AND ispre = 'X'
          AND usertype = '1'.
      ENDIF.

    ELSE.
      IF iv_isdelete NE 'X'.
        SELECT u~cusid,u~userid,i~username
          INTO CORRESPONDING FIELDS OF TABLE @lt_cususer
          FROM ztint_cus_user AS u
         INNER JOIN ztint_user_inf AS i
            ON u~userid = i~userid
          FOR ALL ENTRIES IN @it_inquiry
          WHERE cusid = @it_inquiry-cusid
          AND isdelete = ''
          AND usertype = '1'.
      ELSE.
        SELECT u~cusid,u~userid,i~username
          INTO CORRESPONDING FIELDS OF TABLE @lt_cususer
          FROM ztint_cus_user AS u
         INNER JOIN ztint_user_inf AS i
            ON u~userid = i~userid
          FOR ALL ENTRIES IN @it_inquiry
          WHERE cusid = @it_inquiry-cusid
          AND ispre = 'X'
          AND usertype = '1'.
      ENDIF.

    ENDIF.


*  获取战区名称
    SELECT zoneid,zonename FROM ztcass_zone INTO TABLE @DATA(lt_custzone).
    SORT lt_custzone BY zoneid.

* 跟进类型F4 跟进来源F4 "订单来源F4
    SELECT fnam,val_low,text
      INTO TABLE @DATA(lt_f4config)
      FROM ztbc_f4_config
     WHERE fnam = 'ZICERP_CASSINT_FOLLOWSOURCE'
        OR fnam = 'ZICERP_CASSINT_FOLLOWTYPE'
        OR fnam = 'ZICERP_MT_SOURCE'.
    SORT lt_f4config BY fnam val_low .

* 跟进信息
    SELECT * FROM ztint_follow_inf
      INTO CORRESPONDING FIELDS OF TABLE @lt_followinf
       FOR ALL ENTRIES IN @it_inquiry
     WHERE billno = @it_inquiry-billno.
    IF sy-subrc EQ 0.
      lt_follow_latest = lt_followinf.
      SORT lt_follow_latest BY billno followdate  DESCENDING  followtime DESCENDING .
      DELETE ADJACENT DUPLICATES FROM lt_follow_latest COMPARING billno.

      SORT lt_followinf  BY billno.
      LOOP AT lt_followinf INTO DATA(ls_followinf).
        ls_trail-billno = ls_followinf-billno.
        IF ls_followinf-followremark IS NOT INITIAL.
          IF ls_trail-followremark IS INITIAL.
            ls_trail-followremark = |{ ls_followinf-partsname }({ ls_followinf-followremark })|.
          ELSE.
            ls_trail-followremark = |{ ls_trail-followremark };{ ls_followinf-partsname }({ ls_followinf-followremark })|.
          ENDIF.
        ENDIF.

        IF ls_followinf-followtype IS NOT INITIAL.
          READ TABLE lt_f4config INTO DATA(ls_f4config) WITH KEY fnam = 'ZICERP_CASSINT_FOLLOWTYPE'
                                                                 val_low = ls_followinf-followtype
                                                        BINARY SEARCH .
          IF sy-subrc EQ 0.
            IF ls_trail-followtypedesc IS INITIAL.
              ls_trail-followtypedesc = |{ ls_f4config-text }|.
            ELSE.
              ls_trail-followtypedesc = |{ ls_trail-followtypedesc };{ ls_f4config-text }|.
            ENDIF.
            CLEAR ls_f4config.
          ENDIF.
        ENDIF.

        IF ls_followinf-followsource IS NOT INITIAL.
          READ TABLE lt_f4config INTO ls_f4config WITH KEY fnam = 'ZICERP_CASSINT_FOLLOWSOURCE'
                                                             val_low = ls_followinf-followsource
                                                    BINARY SEARCH .
          IF sy-subrc EQ 0.
            IF ls_trail-followsourcedesc IS INITIAL.
              ls_trail-followsourcedesc = |{ ls_f4config-text }|.
            ELSE.
              ls_trail-followsourcedesc = |{ ls_trail-followsourcedesc };{ ls_f4config-text }|.
            ENDIF.
            CLEAR ls_f4config.
          ENDIF.
        ENDIF.

        AT END OF billno.
          APPEND ls_trail TO lt_trail.
          CLEAR ls_trail.
        ENDAT.
      ENDLOOP.
    ENDIF.
    SORT lt_trail BY billno.

*    询价金额
    SELECT * FROM zticec_inquiry_t INTO TABLE @DATA(lt_inquiry_amt)
      FOR ALL ENTRIES IN @it_inquiry
      WHERE inquiryid =  @it_inquiry-inquiryid.
    SORT lt_inquiry_amt BY inquiryid.

    "已下单
    SELECT inquiryid FROM zticec_inquiry_q INTO TABLE @DATA(lt_zticec_inquiry_q)
     FOR ALL ENTRIES IN @it_inquiry
      WHERE inquiryid = @it_inquiry-inquiryid
      AND sellstatus = 'ORDERED'.
    SORT lt_zticec_inquiry_q BY inquiryid.
    DELETE ADJACENT DUPLICATES FROM lt_zticec_inquiry_q COMPARING inquiryid.

    DATA:ls_data_item TYPE zsicec_inquiry_h,
         l_tabix      TYPE i.
    DATA:ls_export TYPE zord_s_inquiry_excel,
         lt_export TYPE zord_t_inquiry_excel.
    SORT lt_cususer BY cusid.
    LOOP AT it_inquiry INTO  DATA(ls_inquiry).
      IF mv_type EQ 1 AND mv_cus_condition IS NOT INITIAL."需要单独读下cus表
        READ TABLE it_inquiry_cus INTO DATA(ls_inquiry_cus) WITH KEY companyid = ls_inquiry-custcompanyid BINARY SEARCH.
        IF sy-subrc EQ 0.
          ls_inquiry-cusid = ls_inquiry_cus-cusid.
          ls_inquiry-displayname = ls_inquiry_cus-displayname.
          ls_inquiry-companyid = ls_inquiry_cus-companyid.
          ls_inquiry-companycode = ls_inquiry_cus-companycode.
          ls_inquiry-provincegeoid = ls_inquiry_cus-provincegeoid.
          ls_inquiry-provincegeoname = ls_inquiry_cus-provincegeoname.
          ls_inquiry-citygeoid = ls_inquiry_cus-citygeoid.
          ls_inquiry-citygeoname = ls_inquiry_cus-citygeoname.
          ls_inquiry-countygeoid = ls_inquiry_cus-countygeoid.
          ls_inquiry-countygeoname = ls_inquiry_cus-countygeoname.
          ls_inquiry-zoneid = ls_inquiry_cus-zoneid.
        ENDIF.
      ENDIF.
      MOVE-CORRESPONDING ls_inquiry  TO ls_data_item.
      ls_data_item-corporateid = ls_inquiry-companyid."公司ID
      ls_data_item-corporatename = ls_inquiry-displayname." 公司名称
      ls_data_item-geocityid = ls_inquiry-citygeoid ." 城市ID
      ls_data_item-geoprovinceid = ls_inquiry-provincegeoid ." 省份ID
      ls_data_item-geoprovincename = ls_inquiry-provincegeoname ." 省份名称
      ls_data_item-geocityname = ls_inquiry-citygeoname ." 城市名称
      ls_data_item-custcompanyid = ls_inquiry-companyid." EC客户ID
      ls_data_item-zoneid = ls_inquiry-zoneid ." 战区ID
      READ TABLE lt_custzone INTO DATA(ls_custzone) WITH KEY zoneid = ls_inquiry-zoneid BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data_item-zonename = ls_custzone-zonename."战区名称
        CLEAR ls_custzone.
      ENDIF.
      ls_data_item-companycode = ls_inquiry-companycode." ICEC公司code
      READ TABLE lt_cususer INTO DATA(ls_cususer) WITH KEY cusid = ls_inquiry-cusid BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data_item-userid = ls_cususer-userid."客户经理ID
        ls_data_item-cuname  = ls_cususer-username."客户经理
        CLEAR ls_cususer.
      ENDIF.
      "新增询价单跟进信息开始
      READ TABLE lt_trail INTO ls_trail WITH KEY billno = ls_inquiry-inquiryid BINARY SEARCH .
      IF sy-subrc EQ 0.
        ls_data_item-followremark  = ls_trail-followremark.
        ls_data_item-followtypedesc =  ls_trail-followtypedesc.
        ls_data_item-followsourcedesc = ls_trail-followsourcedesc.
        CLEAR ls_trail.
      ENDIF.
      READ TABLE lt_follow_latest INTO ls_trail WITH KEY billno = ls_inquiry-inquiryid BINARY SEARCH.
      IF sy-subrc = 0.
        ls_data_item-followname = ls_trail-followname.
        CLEAR:ls_trail.
      ENDIF.

      READ TABLE lt_f4config INTO DATA(ls_f4_config) WITH KEY fnam = 'ZICERP_MT_SOURCE' val_low = ls_inquiry-sourceid BINARY SEARCH .
      ls_data_item-sourcename = ls_f4_config-text.

****事故车疑是事故车标签
      IF ls_inquiry-inquirytype EQ 'CUSTOMIZE_INQUIRY'.
        ls_data_item-tagid = 'ACVHI'.
        ls_data_item-tagdesc = '事故车'.
      ELSEIF ls_inquiry-inquirytype EQ '===='."目前没有判断标准
        ls_data_item-tagid = 'NON-ACVHI'.
        ls_data_item-tagdesc = '疑是事故车'.
      ENDIF.

      READ TABLE lt_inquiry_amt INTO DATA(ls_inquiry_amt) WITH KEY inquiryid = ls_inquiry-inquiryid BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data_item-amount_dec = ls_inquiry_amt-amount.
        WRITE ls_inquiry_amt-amount TO ls_data_item-amount.
        CONDENSE ls_data_item-amount.
      ENDIF.
      ls_data_item-sno = l_tabix + 1.
      CONDENSE ls_data_item-sno.
      l_tabix = l_tabix + 1.

      CONDENSE ls_data_item-inquiryid NO-GAPS .
      CONDENSE ls_data_item-inquirytype NO-GAPS.
      CONDENSE ls_data_item-inquirytypename NO-GAPS.
      CONDENSE ls_data_item-carbrandid NO-GAPS.
      CONDENSE ls_data_item-carbrandname NO-GAPS .
      CONDENSE ls_data_item-licenseplate NO-GAPS .
      CONDENSE ls_data_item-needcount NO-GAPS .
      CONDENSE ls_data_item-corporatename NO-GAPS.
      CONDENSE ls_data_item-companycode NO-GAPS.
      CONDENSE ls_data_item-cuname NO-GAPS.
      CONDENSE ls_data_item-statusid NO-GAPS.
      CONDENSE ls_data_item-statusdesc NO-GAPS.
      CONDENSE ls_data_item-sourcename NO-GAPS.


      "已下单

      READ TABLE lt_zticec_inquiry_q INTO DATA(ls_zticec_inquiry_q) WITH  KEY inquiryid = ls_inquiry-inquiryid BINARY SEARCH.
      IF sy-subrc = 0.
        ls_data_item-statusdesc = '已下单'.
      ENDIF.

      APPEND ls_data_item TO er_deep_entity-cassintinqhomeset.
      DATA(lv_needcount) = ls_data_item-needcount.
      CLEAR ls_data_item-needcount.
      MOVE-CORRESPONDING ls_data_item TO ls_export.
      ls_export-needcount = un_quantity_formatter_dcm( EXACT string( lv_needcount ) ).
      APPEND ls_export TO lt_export.

      CLEAR :ls_data_item,ls_inquiry,ls_f4_config,ls_inquiry_amt,ls_trail,ls_inquiry_cus,
      lv_needcount,ls_export.
      CLEAR ls_zticec_inquiry_q.

    ENDLOOP.

    IF iv_export = 'X'.
* 保存日志
      DATA:l_keyvaule1 TYPE zde_key_value,
           l_keyvaule2 TYPE zde_key_value.
      l_keyvaule1 = mv_userid.
      l_keyvaule2 = mv_username.
      CALL FUNCTION 'Z_FMINT_LOG_SAVE'
        EXPORTING
          iv_event_id   = 'INQUIRYHOMEEXPORT'
          iv_event_desc = '开思助手询价单导出！'
          iv_status     = 'S'
          iv_key_value1 = l_keyvaule1
          iv_key_value2 = l_keyvaule2
          iv_zcrt_bdate = sy-datum
          iv_zcrt_btime = sy-uzeit.
      CHECK is_excellist-filename IS NOT INITIAL.
      create_inquiry_excel( it_inquiry = lt_export is_excellist = is_excellist ).
    ELSE.
      IF iv_orderby IS INITIAL OR  iv_orderby = 'Lastcreate'.
        SORT er_deep_entity-cassintinqhomeset BY createdate DESCENDING createtime DESCENDING.
      ELSEIF iv_orderby = 'Amountasc'.
        SORT er_deep_entity-cassintinqhomeset BY amount_dec ASCENDING.
      ELSEIF iv_orderby =  'Amountdes'.
        SORT er_deep_entity-cassintinqhomeset BY amount_dec DESCENDING .
      ENDIF.

      er_deep_entity-totalnum = lines( er_deep_entity-cassintinqhomeset ).
      CONDENSE er_deep_entity-totalnum.


      DATA: lv_from TYPE int4,
            lv_to   TYPE int4.
      DATA: lv_total TYPE int4.
      DATA: lv_pagetotal TYPE int4.
      DATA: lv_mod TYPE   int4.
      DATA: lv_page TYPE int4,
            lv_size TYPE int4.
      CLEAR:lv_from,lv_to,lv_total,lv_pagetotal,lv_mod,lv_page,lv_size.
      "分页
      IF iv_page IS INITIAL . "没有这显示第一页
        lv_page = 1.
      ELSE.
        lv_page = iv_page.
      ENDIF.

      IF iv_size IS INITIAL. "没有则默认50条
        lv_size = 20.
      ELSE.
        lv_size = iv_size.
      ENDIF.

      lv_total =  er_deep_entity-totalnum. "总条数
      lv_mod = lv_total MOD lv_size.
      lv_pagetotal = lv_total DIV lv_size. "总页数
      IF lv_mod NE 0.
        lv_pagetotal = lv_pagetotal + 1.
      ENDIF.
      IF lv_page > lv_pagetotal. "当前页数不能大于总页数
        RETURN.
      ENDIF.

      lv_from = ( lv_page - 1 ) * lv_size + 1."条数开始
      lv_to = lv_page * lv_size."条数结束

      er_deep_entity-pagetotal = lv_pagetotal."总页数
      CONDENSE er_deep_entity-pagetotal.

      DATA(lt_items) = er_deep_entity-cassintinqhomeset.
      CLEAR er_deep_entity-cassintinqhomeset.
      APPEND LINES OF lt_items FROM lv_from TO lv_to TO er_deep_entity-cassintinqhomeset.
      LOOP AT er_deep_entity-cassintinqhomeset ASSIGNING FIELD-SYMBOL(<lfs>).
        <lfs>-sno = lv_from.
        CONDENSE <lfs>-sno.
        lv_from = lv_from + 1.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.


  METHOD set_inq_overview_new.

    DATA:lt_followinf     TYPE STANDARD TABLE OF zord_s_trail,
         lt_follow_latest TYPE STANDARD TABLE OF zord_s_trail,
         lt_trail         TYPE STANDARD TABLE OF zord_s_trail,
         ls_trail         TYPE zord_s_trail.
    TYPES:BEGIN OF ty_inquiryq,
            inquiryid TYPE zticec_inquiry_q-inquiryid,
            ordersku  TYPE int4,
          END OF ty_inquiryq.
    DATA:ls_zticec_inquiry_q TYPE ty_inquiryq,
         lt_zticec_inquiry_q TYPE STANDARD TABLE OF ty_inquiryq.
*  取客户经理名称

    IF mv_type = 1 AND mv_cus_condition IS NOT INITIAL.
      IF iv_isdelete NE 'X'.
        SELECT u~cusid,u~userid,i~username INTO TABLE @DATA(lt_cususer)
          FROM ztint_cus_user AS u
         INNER JOIN ztint_user_inf AS i
            ON u~userid = i~userid
          FOR ALL ENTRIES IN @it_inquiry_cus
          WHERE cusid = @it_inquiry_cus-cusid
          AND isdelete = ''
          AND usertype = '1'.
      ELSE.
        SELECT u~cusid,u~userid,i~username INTO TABLE @lt_cususer
          FROM ztint_cus_user AS u
         INNER JOIN ztint_user_inf AS i
            ON u~userid = i~userid
          FOR ALL ENTRIES IN @it_inquiry_cus
          WHERE cusid = @it_inquiry_cus-cusid
          AND ispre = 'X'
          AND usertype = '1'.
      ENDIF.

    ELSE.
      DATA(lt_temp) = it_inquiry.
      SORT lt_temp BY cusid.
      DELETE ADJACENT DUPLICATES FROM lt_temp COMPARING cusid.
      IF lt_temp IS NOT INITIAL.
        IF iv_isdelete NE 'X'.
          SELECT u~cusid,u~userid,i~username
            INTO CORRESPONDING FIELDS OF TABLE @lt_cususer
            FROM ztint_cus_user AS u
           INNER JOIN ztint_user_inf AS i
              ON u~userid = i~userid
            FOR ALL ENTRIES IN @lt_temp
            WHERE cusid = @lt_temp-cusid
            AND isdelete = ''
            AND usertype = '1'.
        ELSE.
          SELECT u~cusid,u~userid,i~username
            INTO CORRESPONDING FIELDS OF TABLE @lt_cususer
            FROM ztint_cus_user AS u
           INNER JOIN ztint_user_inf AS i
              ON u~userid = i~userid
            FOR ALL ENTRIES IN @lt_temp
            WHERE cusid = @lt_temp-cusid
            AND ispre = 'X'
            AND usertype = '1'.
        ENDIF.
        REFRESH lt_temp.
      ENDIF.
    ENDIF.
*  获取找货状态描述
    SELECT * INTO  TABLE @DATA(lt_dd07t)
       FROM dd07t WHERE domname = 'ZDM_FOUNDSTATE'
       AND ddlanguage = @sy-langu AND as4local   = 'A'.
    SORT lt_dd07t BY domname domvalue_l.
*  获取战区名称
    SELECT zoneid,zonename FROM ztcass_zone INTO TABLE @DATA(lt_custzone).
    SORT lt_custzone BY zoneid.

* 跟进类型F4 跟进来源F4 "订单来源F4
    SELECT fnam,val_low,text
      INTO TABLE @DATA(lt_f4config)
      FROM ztbc_f4_config
     WHERE fnam = 'ZICERP_CASSINT_FOLLOWSOURCE'
        OR fnam = 'ZICERP_CASSINT_FOLLOWTYPE'
        OR fnam = 'ZICERP_MT_SOURCE'.
    SORT lt_f4config BY fnam val_low .

* 跟进信息
    SELECT * FROM ztint_follow_inf
      INTO CORRESPONDING FIELDS OF TABLE @lt_followinf
       FOR ALL ENTRIES IN @it_inquiry
     WHERE billno = @it_inquiry-billno.
    IF sy-subrc EQ 0.
      lt_follow_latest = lt_followinf.
      SORT lt_follow_latest BY billno followdate  DESCENDING  followtime DESCENDING .
      DELETE ADJACENT DUPLICATES FROM lt_follow_latest COMPARING billno.

      SORT lt_followinf  BY billno.
      LOOP AT lt_followinf INTO DATA(ls_followinf).
        ls_trail-billno = ls_followinf-billno.
        IF ls_followinf-followremark IS NOT INITIAL.
          IF ls_trail-followremark IS INITIAL.
            ls_trail-followremark = |{ ls_followinf-partsname }({ ls_followinf-followremark })|.
          ELSE.
            ls_trail-followremark = |{ ls_trail-followremark };{ ls_followinf-partsname }({ ls_followinf-followremark })|.
          ENDIF.
        ENDIF.

        IF ls_followinf-followtype IS NOT INITIAL.
          READ TABLE lt_f4config INTO DATA(ls_f4config) WITH KEY fnam = 'ZICERP_CASSINT_FOLLOWTYPE'
                                                                 val_low = ls_followinf-followtype
                                                        BINARY SEARCH .
          IF sy-subrc EQ 0.
            IF ls_trail-followtypedesc IS INITIAL.
              ls_trail-followtypedesc = |{ ls_f4config-text }|.
            ELSE.
              ls_trail-followtypedesc = |{ ls_trail-followtypedesc };{ ls_f4config-text }|.
            ENDIF.
            CLEAR ls_f4config.
          ENDIF.
        ENDIF.

        IF ls_followinf-followsource IS NOT INITIAL.
          READ TABLE lt_f4config INTO ls_f4config WITH KEY fnam = 'ZICERP_CASSINT_FOLLOWSOURCE'
                                                             val_low = ls_followinf-followsource
                                                    BINARY SEARCH .
          IF sy-subrc EQ 0.
            IF ls_trail-followsourcedesc IS INITIAL.
              ls_trail-followsourcedesc = |{ ls_f4config-text }|.
            ELSE.
              ls_trail-followsourcedesc = |{ ls_trail-followsourcedesc };{ ls_f4config-text }|.
            ENDIF.
            CLEAR ls_f4config.
          ENDIF.
        ENDIF.

        AT END OF billno.
          APPEND ls_trail TO lt_trail.
          CLEAR ls_trail.
        ENDAT.
      ENDLOOP.
    ENDIF.
    SORT lt_trail BY billno.

*    询价金额
    SELECT * FROM zticec_inquiry_t INTO TABLE @DATA(lt_inquiry_amt)
      FOR ALL ENTRIES IN @it_inquiry
      WHERE inquiryid =  @it_inquiry-inquiryid.
    SORT lt_inquiry_amt BY inquiryid.

    "已下单
    SELECT inquiryid,resolveuserneedsid FROM zticec_inquiry_q INTO TABLE @DATA(lt_inquiryq)
     FOR ALL ENTRIES IN @it_inquiry
      WHERE inquiryid = @it_inquiry-inquiryid
      AND sellstatus = 'ORDERED'.

    LOOP AT lt_inquiryq INTO DATA(ls_inquiryq).
      ls_zticec_inquiry_q-inquiryid = ls_inquiryq-inquiryid.
      ls_zticec_inquiry_q-ordersku = ls_zticec_inquiry_q-ordersku + 1.
      COLLECT ls_zticec_inquiry_q INTO lt_zticec_inquiry_q.
      CLEAR ls_zticec_inquiry_q.
    ENDLOOP.
*    SORT lt_zticec_inquiry_q BY inquiryid.
*    DELETE ADJACENT DUPLICATES FROM lt_zticec_inquiry_q COMPARING inquiryid.

    DATA:ls_data_item TYPE zsicec_inquiry_h,
         l_tabix      TYPE i.
    DATA:ls_export TYPE zord_s_inquiry_excel,
         lt_export TYPE zord_t_inquiry_excel.
    SORT lt_cususer BY cusid.
    LOOP AT it_inquiry INTO  DATA(ls_inquiry).
      MOVE-CORRESPONDING ls_inquiry  TO ls_data_item.
      "已下单
      READ TABLE lt_zticec_inquiry_q INTO ls_zticec_inquiry_q WITH  KEY inquiryid = ls_inquiry-inquiryid BINARY SEARCH.
      IF sy-subrc = 0 .
        IF iv_status NE 'ORDERED' AND iv_status IS NOT INITIAL .
          CONTINUE.
        ENDIF.
        ls_data_item-statusdesc = '已下单'.
        ls_data_item-ordersku = ls_zticec_inquiry_q-ordersku.
      ELSE.
        IF iv_status EQ 'ORDERED'.
          CONTINUE.
        ENDIF.
      ENDIF.

      ls_data_item-corporateid = ls_inquiry-companyid."公司ID
      ls_data_item-corporatename = ls_inquiry-displayname." 公司名称
      ls_data_item-geocityid = ls_inquiry-citygeoid ." 城市ID
      ls_data_item-geoprovinceid = ls_inquiry-provincegeoid ." 省份ID
      ls_data_item-geoprovincename = ls_inquiry-provincegeoname ." 省份名称
      ls_data_item-geocityname = ls_inquiry-citygeoname ." 城市名称
      ls_data_item-custcompanyid = ls_inquiry-companyid." EC客户ID
      ls_data_item-geocountygeoid = ls_inquiry-countygeoid."区县编码
      ls_data_item-geocountygeoname = ls_inquiry-countygeoname."区县名称
      ls_data_item-zoneid = ls_inquiry-zoneid ." 战区ID
      READ TABLE lt_custzone INTO DATA(ls_custzone) WITH KEY zoneid = ls_inquiry-zoneid BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data_item-zonename = ls_custzone-zonename."战区名称
        CLEAR ls_custzone.
      ENDIF.
      ls_data_item-companycode = ls_inquiry-companycode." ICEC公司code
      READ TABLE lt_cususer INTO DATA(ls_cususer) WITH KEY cusid = ls_inquiry-cusid BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data_item-userid = ls_cususer-userid."客户经理ID
        ls_data_item-cuname  = ls_cususer-username."客户经理
        CLEAR ls_cususer.
      ENDIF.
      "新增询价单跟进信息开始
      READ TABLE lt_trail INTO ls_trail WITH KEY billno = ls_inquiry-inquiryid BINARY SEARCH .
      IF sy-subrc EQ 0.
        ls_data_item-followremark  = ls_trail-followremark.
        ls_data_item-followtypedesc =  ls_trail-followtypedesc.
        ls_data_item-followsourcedesc = ls_trail-followsourcedesc.
        CLEAR ls_trail.
      ENDIF.
      READ TABLE lt_follow_latest INTO ls_trail WITH KEY billno = ls_inquiry-inquiryid BINARY SEARCH.
      IF sy-subrc = 0.
        ls_data_item-followname = ls_trail-followname.
        CLEAR:ls_trail.
      ENDIF.

      READ TABLE lt_f4config INTO DATA(ls_f4_config) WITH KEY fnam = 'ZICERP_MT_SOURCE' val_low = ls_inquiry-sourceid BINARY SEARCH .
      ls_data_item-sourcename = ls_f4_config-text.

      "找货状态
      READ TABLE lt_dd07t INTO DATA(ls_dd07t) WITH KEY domname = 'ZDM_FOUNDSTATE' domvalue_l = ls_data_item-foundstate.
      IF sy-subrc EQ 0.
        ls_data_item-foundstatedesc = COND #( WHEN iv_export = 'X' AND ls_data_item-needcount IS NOT INITIAL THEN |{ ls_dd07t-ddtext }(缺货{ ls_data_item-needcount })| ELSE ls_dd07t-ddtext ).
      ENDIF.
      CLEAR ls_dd07t.


****事故车疑是事故车标签
      IF ls_inquiry-inquirytype EQ 'CUSTOMIZE_INQUIRY'.
        ls_data_item-tagid = 'ACVHI'.
        ls_data_item-tagdesc = '事故车'.
      ELSEIF ls_inquiry-inquirytype EQ '===='."目前没有判断标准
        ls_data_item-tagid = 'NON-ACVHI'.
        ls_data_item-tagdesc = '疑是事故车'.
      ENDIF.

      READ TABLE lt_inquiry_amt INTO DATA(ls_inquiry_amt) WITH KEY inquiryid = ls_inquiry-inquiryid BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data_item-amount_dec = ls_inquiry_amt-amount.
        WRITE ls_inquiry_amt-amount TO ls_data_item-amount.
        CONDENSE ls_data_item-amount.
      ENDIF.
      ls_data_item-sno = l_tabix + 1.
      CONDENSE ls_data_item-sno.
      l_tabix = l_tabix + 1.

      CONDENSE ls_data_item-inquiryid NO-GAPS .
      CONDENSE ls_data_item-inquirytype NO-GAPS.
      CONDENSE ls_data_item-inquirytypename NO-GAPS.
      CONDENSE ls_data_item-carbrandid NO-GAPS.
      CONDENSE ls_data_item-carbrandname NO-GAPS .
      CONDENSE ls_data_item-licenseplate NO-GAPS .
      CONDENSE ls_data_item-needcount NO-GAPS .
      CONDENSE ls_data_item-corporatename NO-GAPS.
      CONDENSE ls_data_item-companycode NO-GAPS.
      CONDENSE ls_data_item-cuname NO-GAPS.
      CONDENSE ls_data_item-statusid NO-GAPS.
      CONDENSE ls_data_item-statusdesc NO-GAPS.
      CONDENSE ls_data_item-sourcename NO-GAPS.



      APPEND ls_data_item TO er_deep_entity-cassintinqhomeset.
      DATA(lv_needcount) = ls_data_item-needcount.
      CLEAR ls_data_item-needcount.
      MOVE-CORRESPONDING ls_data_item TO ls_export.
      ls_export-needcount = un_quantity_formatter_dcm( EXACT string( lv_needcount ) ).
      APPEND ls_export TO lt_export.

      CLEAR :ls_data_item,ls_inquiry,ls_f4_config,ls_inquiry_amt,ls_trail,
      lv_needcount,ls_export.
      CLEAR ls_zticec_inquiry_q.

    ENDLOOP.

    IF iv_export = 'X'.
* 保存日志
      "释放程序内存
      FREE:lt_cususer,it_inquiry,lt_temp,lt_dd07t,lt_custzone,lt_f4config,lt_followinf,
      lt_followinf,lt_follow_latest,lt_trail,lt_inquiry_amt,lt_zticec_inquiry_q,er_deep_entity.
      DATA:l_keyvaule1 TYPE zde_key_value,
           l_keyvaule2 TYPE zde_key_value.
      l_keyvaule1 = mv_userid.
      l_keyvaule2 = mv_username.
      CALL FUNCTION 'Z_FMINT_LOG_SAVE'
        EXPORTING
          iv_event_id   = 'INQUIRYHOMEEXPORT'
          iv_event_desc = '开思助手询价单导出！'
          iv_status     = 'S'
          iv_key_value1 = l_keyvaule1
          iv_key_value2 = l_keyvaule2
          iv_zcrt_bdate = sy-datum
          iv_zcrt_btime = sy-uzeit.
      CHECK is_excellist-filename IS NOT INITIAL.
      SORT lt_export BY createdstamp DESCENDING.
      create_inquiry_excel( it_inquiry = lt_export is_excellist = is_excellist ).
    ELSE.
      IF iv_orderby IS INITIAL OR  iv_orderby = 'Lastcreate'.
        SORT er_deep_entity-cassintinqhomeset BY createdate DESCENDING createtime DESCENDING.
      ELSEIF iv_orderby = 'Amountasc'.
        SORT er_deep_entity-cassintinqhomeset BY amount_dec ASCENDING.
      ELSEIF iv_orderby =  'Amountdes'.
        SORT er_deep_entity-cassintinqhomeset BY amount_dec DESCENDING .
      ENDIF.

      er_deep_entity-totalnum = lines( er_deep_entity-cassintinqhomeset ).
      CONDENSE er_deep_entity-totalnum.


      DATA: lv_from TYPE int4,
            lv_to   TYPE int4.
      DATA: lv_total TYPE int4.
      DATA: lv_pagetotal TYPE int4.
      DATA: lv_mod TYPE   int4.
      DATA: lv_page TYPE int4,
            lv_size TYPE int4.
      CLEAR:lv_from,lv_to,lv_total,lv_pagetotal,lv_mod,lv_page,lv_size.
      "分页
      IF iv_page IS INITIAL . "没有这显示第一页
        lv_page = 1.
      ELSE.
        lv_page = iv_page.
      ENDIF.

      IF iv_size IS INITIAL. "没有则默认50条
        lv_size = 20.
      ELSE.
        lv_size = iv_size.
      ENDIF.

      lv_total =  er_deep_entity-totalnum. "总条数
      lv_mod = lv_total MOD lv_size.
      lv_pagetotal = lv_total DIV lv_size. "总页数
      IF lv_mod NE 0.
        lv_pagetotal = lv_pagetotal + 1.
      ENDIF.
      IF lv_page > lv_pagetotal. "当前页数不能大于总页数
        RETURN.
      ENDIF.

      lv_from = ( lv_page - 1 ) * lv_size + 1."条数开始
      lv_to = lv_page * lv_size."条数结束

      er_deep_entity-pagetotal = lv_pagetotal."总页数
      CONDENSE er_deep_entity-pagetotal.

      DATA(lt_items) = er_deep_entity-cassintinqhomeset.
      CLEAR er_deep_entity-cassintinqhomeset.
      APPEND LINES OF lt_items FROM lv_from TO lv_to TO er_deep_entity-cassintinqhomeset.
      LOOP AT er_deep_entity-cassintinqhomeset ASSIGNING FIELD-SYMBOL(<lfs>).
        <lfs>-sno = lv_from.
        CONDENSE <lfs>-sno.
        lv_from = lv_from + 1.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.


  METHOD set_inq_overview_new_v1.

    DATA:lt_followinf     TYPE STANDARD TABLE OF zord_s_trail,
         lt_follow_latest TYPE STANDARD TABLE OF zord_s_trail,
         lt_trail         TYPE STANDARD TABLE OF zord_s_trail,
         ls_trail         TYPE zord_s_trail.
    DATA:it_inquiry TYPE zord_t_inquiry_info.
    TYPES:BEGIN OF ty_inquiryq,
            inquiryid TYPE zticec_inquiry_q-inquiryid,
            ordersku  TYPE int4,
          END OF ty_inquiryq.
    DATA:ls_zticec_inquiry_q TYPE ty_inquiryq,
         lt_zticec_inquiry_q TYPE STANDARD TABLE OF ty_inquiryq.

    "已下单
    SELECT inquiryid,resolveuserneedsid FROM zticec_inquiry_q INTO TABLE @DATA(lt_inquiryq)
     FOR ALL ENTRIES IN @it_inquiry_tmp
      WHERE inquiryid = @it_inquiry_tmp-inquiryid
      AND sellstatus = 'ORDERED'.

    LOOP AT lt_inquiryq INTO DATA(ls_inquiryq).
      ls_zticec_inquiry_q-inquiryid = ls_inquiryq-inquiryid.
      ls_zticec_inquiry_q-ordersku = ls_zticec_inquiry_q-ordersku + 1.
      COLLECT ls_zticec_inquiry_q INTO lt_zticec_inquiry_q.
      CLEAR ls_zticec_inquiry_q.
    ENDLOOP.
    SORT lt_zticec_inquiry_q BY inquiryid.
*****将分页提前，后面的不需要查所有询价单的
    IF iv_orderby IS INITIAL OR  iv_orderby = 'Lastcreate'.
      SORT it_inquiry_tmp BY createdate DESCENDING createtime DESCENDING.
    ELSEIF iv_orderby = 'Amountasc'.
      SORT it_inquiry_tmp BY amount ASCENDING.
    ELSEIF iv_orderby =  'Amountdes'.
      SORT it_inquiry_tmp BY amount DESCENDING .
    ENDIF.

    "剔除掉状态，然后按照分页页码数来
    IF lt_zticec_inquiry_q IS NOT INITIAL AND iv_status IS NOT INITIAL.
      LOOP AT it_inquiry_tmp INTO DATA(ls_inquiry).
        DATA(lv_tabix) = sy-tabix.
        READ TABLE lt_zticec_inquiry_q TRANSPORTING NO FIELDS WITH KEY inquiryid = ls_inquiry-inquiryid
                                       BINARY SEARCH.
        IF sy-subrc EQ 0 AND iv_status NE 'ORDERED' AND iv_status IS NOT INITIAL.
          DELETE it_inquiry_tmp INDEX lv_tabix.
        ELSEIF sy-subrc NE 0 AND iv_status EQ 'ORDERED'.
          DELETE it_inquiry_tmp INDEX lv_tabix.
        ENDIF.
      ENDLOOP.
    ENDIF.

    DATA: lv_from TYPE int4,
          lv_to   TYPE int4.
    DATA: lv_total TYPE int4.
    DATA: lv_pagetotal TYPE int4.
    DATA: lv_mod TYPE   int4.
    DATA: lv_page TYPE int4,
          lv_size TYPE int4.
    CLEAR:lv_from,lv_to,lv_total,lv_pagetotal,lv_mod,lv_page,lv_size.
    "分页
    IF iv_export IS INITIAL.

      er_deep_entity-totalnum = lines( it_inquiry_tmp ).
      CONDENSE er_deep_entity-totalnum.

      IF iv_page IS INITIAL . "没有这显示第一页
        lv_page = 1.
      ELSE.
        lv_page = iv_page.
      ENDIF.

      IF iv_size IS INITIAL. "没有则默认50条
        lv_size = 20.
      ELSE.
        lv_size = iv_size.
      ENDIF.

      lv_total =  er_deep_entity-totalnum. "总条数
      lv_mod = lv_total MOD lv_size.
      lv_pagetotal = lv_total DIV lv_size. "总页数
      IF lv_mod NE 0.
        lv_pagetotal = lv_pagetotal + 1.
      ENDIF.
      IF lv_page > lv_pagetotal. "当前页数不能大于总页数
        RETURN.
      ENDIF.

      lv_from = ( lv_page - 1 ) * lv_size + 1."条数开始
      lv_to = lv_page * lv_size."条数结束


      er_deep_entity-pagetotal = lv_pagetotal."总页数
      CONDENSE er_deep_entity-pagetotal.

      APPEND LINES OF it_inquiry_tmp FROM lv_from TO lv_to TO it_inquiry.
    ELSE.
      it_inquiry = it_inquiry_tmp.
    ENDIF.

*  取客户经理名称
    IF mv_type = 1 AND mv_cus_condition IS NOT INITIAL.
      IF iv_isdelete NE 'X'.
        SELECT u~cusid,u~userid,i~username INTO TABLE @DATA(lt_cususer)
          FROM ztint_cus_user AS u
         INNER JOIN ztint_user_inf AS i
            ON u~userid = i~userid
          FOR ALL ENTRIES IN @it_inquiry_cus
          WHERE cusid = @it_inquiry_cus-cusid
          AND isdelete = ''
          AND usertype = '1'.
      ELSE.
        SELECT u~cusid,u~userid,i~username INTO TABLE @lt_cususer
          FROM ztint_cus_user AS u
         INNER JOIN ztint_user_inf AS i
            ON u~userid = i~userid
          FOR ALL ENTRIES IN @it_inquiry_cus
          WHERE cusid = @it_inquiry_cus-cusid
          AND ispre = 'X'
          AND usertype = '1'.
      ENDIF.

    ELSE.
      DATA(lt_temp) = it_inquiry.
      SORT lt_temp BY cusid.
      DELETE ADJACENT DUPLICATES FROM lt_temp COMPARING cusid.
      IF lt_temp IS NOT INITIAL.
        IF iv_isdelete NE 'X'.
          SELECT u~cusid,u~userid,i~username
            INTO CORRESPONDING FIELDS OF TABLE @lt_cususer
            FROM ztint_cus_user AS u
           INNER JOIN ztint_user_inf AS i
              ON u~userid = i~userid
            FOR ALL ENTRIES IN @lt_temp
            WHERE cusid = @lt_temp-cusid
            AND isdelete = ''
            AND usertype = '1'.
        ELSE.
          SELECT u~cusid,u~userid,i~username
            INTO CORRESPONDING FIELDS OF TABLE @lt_cususer
            FROM ztint_cus_user AS u
           INNER JOIN ztint_user_inf AS i
              ON u~userid = i~userid
            FOR ALL ENTRIES IN @lt_temp
            WHERE cusid = @lt_temp-cusid
            AND ispre = 'X'
            AND usertype = '1'.
        ENDIF.
        REFRESH lt_temp.
      ENDIF.
    ENDIF.
*  获取找货状态描述
    SELECT * INTO  TABLE @DATA(lt_dd07t)
       FROM dd07t WHERE domname = 'ZDM_FOUNDSTATE'
       AND ddlanguage = @sy-langu AND as4local   = 'A'.
    SORT lt_dd07t BY domname domvalue_l.
*  获取战区名称
    SELECT zoneid,zonename FROM ztcass_zone INTO TABLE @DATA(lt_custzone).
    SORT lt_custzone BY zoneid.

* 跟进类型F4 跟进来源F4 "订单来源F4
    SELECT fnam,val_low,text
      INTO TABLE @DATA(lt_f4config)
      FROM ztbc_f4_config
     WHERE fnam = 'ZICERP_CASSINT_FOLLOWSOURCE'
        OR fnam = 'ZICERP_CASSINT_FOLLOWTYPE'
        OR fnam = 'ZICERP_MT_SOURCE'.
    SORT lt_f4config BY fnam val_low .

* 跟进信息
    SELECT * FROM ztint_follow_inf
      INTO CORRESPONDING FIELDS OF TABLE @lt_followinf
       FOR ALL ENTRIES IN @it_inquiry
*     WHERE billno = @it_inquiry-billno.
     WHERE billno = @it_inquiry-inquiryid.
    IF sy-subrc EQ 0.
      lt_follow_latest = lt_followinf.
      SORT lt_follow_latest BY billno followdate  DESCENDING  followtime DESCENDING .
      DELETE ADJACENT DUPLICATES FROM lt_follow_latest COMPARING billno.

      SORT lt_followinf  BY billno.
      LOOP AT lt_followinf INTO DATA(ls_followinf).
        ls_trail-billno = ls_followinf-billno.
        IF ls_followinf-followremark IS NOT INITIAL.
          IF ls_trail-followremark IS INITIAL.
            ls_trail-followremark = |{ ls_followinf-partsname }({ ls_followinf-followremark })|.
          ELSE.
            ls_trail-followremark = |{ ls_trail-followremark };{ ls_followinf-partsname }({ ls_followinf-followremark })|.
          ENDIF.
        ENDIF.

        IF ls_followinf-followtype IS NOT INITIAL.
          READ TABLE lt_f4config INTO DATA(ls_f4config) WITH KEY fnam = 'ZICERP_CASSINT_FOLLOWTYPE'
                                                                 val_low = ls_followinf-followtype
                                                        BINARY SEARCH .
          IF sy-subrc EQ 0.
            IF ls_trail-followtypedesc IS INITIAL.
              ls_trail-followtypedesc = |{ ls_f4config-text }|.
            ELSE.
              ls_trail-followtypedesc = |{ ls_trail-followtypedesc };{ ls_f4config-text }|.
            ENDIF.
            CLEAR ls_f4config.
          ENDIF.
        ENDIF.

        IF ls_followinf-followsource IS NOT INITIAL.
          READ TABLE lt_f4config INTO ls_f4config WITH KEY fnam = 'ZICERP_CASSINT_FOLLOWSOURCE'
                                                             val_low = ls_followinf-followsource
                                                    BINARY SEARCH .
          IF sy-subrc EQ 0.
            IF ls_trail-followsourcedesc IS INITIAL.
              ls_trail-followsourcedesc = |{ ls_f4config-text }|.
            ELSE.
              ls_trail-followsourcedesc = |{ ls_trail-followsourcedesc };{ ls_f4config-text }|.
            ENDIF.
            CLEAR ls_f4config.
          ENDIF.
        ENDIF.

        AT END OF billno.
          APPEND ls_trail TO lt_trail.
          CLEAR ls_trail.
        ENDAT.
      ENDLOOP.
    ENDIF.
    SORT lt_trail BY billno.
    DATA lv_newinqsku TYPE int4.
    DATA lv_quotasku TYPE int4.
    DATA:ls_data_item TYPE zsicec_inquiry_h,
         l_tabix      TYPE i.
    DATA:ls_export TYPE zord_s_inquiry_excel,
         lt_export TYPE zord_t_inquiry_excel.
    SORT lt_cususer BY cusid.
    "取sku配置是否跳转新询价单临界报价sku数量
    SELECT SINGLE value INTO @DATA(lv_par) FROM ztint_par WHERE fname = 'TONEWINQSKU'.
    lv_newinqsku = lv_par.
    LOOP AT it_inquiry INTO ls_inquiry.
      MOVE-CORRESPONDING ls_inquiry  TO ls_data_item.
      ls_data_item-tonewinqdetail = COND #( WHEN  ls_inquiry-codingsku GT lv_newinqsku OR ls_inquiry-needcount GT lv_newinqsku THEN 'X' ELSE '' ).
      ls_data_item-sno = lv_from.
      lv_from = lv_from + 1.
      CONDENSE ls_data_item-sno.
      READ TABLE lt_zticec_inquiry_q INTO ls_zticec_inquiry_q WITH KEY inquiryid = ls_inquiry-inquiryid
                                                                    BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data_item-statusid = 'ORDERED'.
        ls_data_item-statusdesc = '已下单'.
        ls_data_item-ordersku = ls_zticec_inquiry_q-ordersku.
        CLEAR ls_zticec_inquiry_q.
      ENDIF.
      ls_data_item-createdbyname = ls_inquiry-createdbyname."创建人名称
      ls_data_item-corporateid = ls_inquiry-companyid."公司ID
      ls_data_item-corporatename = ls_inquiry-displayname." 公司名称
      ls_data_item-geocityid = ls_inquiry-citygeoid ." 城市ID
      ls_data_item-geoprovinceid = ls_inquiry-provincegeoid ." 省份ID
      ls_data_item-geoprovincename = ls_inquiry-provincegeoname ." 省份名称
      ls_data_item-geocityname = ls_inquiry-citygeoname ." 城市名称
      ls_data_item-custcompanyid = ls_inquiry-companyid." EC客户ID
      ls_data_item-geocountygeoid = ls_inquiry-countygeoid."区县编码
      ls_data_item-geocountygeoname = ls_inquiry-countygeoname."区县名称
      ls_data_item-zoneid = ls_inquiry-zoneid ." 战区ID
      READ TABLE lt_custzone INTO DATA(ls_custzone) WITH KEY zoneid = ls_inquiry-zoneid BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data_item-zonename = ls_custzone-zonename."战区名称
        CLEAR ls_custzone.
      ENDIF.
      ls_data_item-companycode = ls_inquiry-companycode." ICEC公司code
      READ TABLE lt_cususer INTO DATA(ls_cususer) WITH KEY cusid = ls_inquiry-cusid BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data_item-userid = ls_cususer-userid."客户经理ID
        ls_data_item-cuname  = ls_cususer-username."客户经理
        CLEAR ls_cususer.
      ENDIF.
      "新增询价单跟进信息开始
      READ TABLE lt_trail INTO ls_trail WITH KEY billno = ls_inquiry-inquiryid BINARY SEARCH .
      IF sy-subrc EQ 0.
        ls_data_item-followremark  = ls_trail-followremark.
        ls_data_item-followtypedesc =  ls_trail-followtypedesc.
        ls_data_item-followsourcedesc = ls_trail-followsourcedesc.
        CLEAR ls_trail.
      ENDIF.
      READ TABLE lt_follow_latest INTO ls_trail WITH KEY billno = ls_inquiry-inquiryid BINARY SEARCH.
      IF sy-subrc = 0.
        ls_data_item-followname = ls_trail-followname.
        ls_data_item-followdate = |{ ls_trail-followdate DATE = ISO }|.
        ls_data_item-followtime = |{ ls_trail-followtime TIME = ISO }|.
        CLEAR:ls_trail.
      ENDIF.

      READ TABLE lt_f4config INTO DATA(ls_f4_config) WITH KEY fnam = 'ZICERP_MT_SOURCE' val_low = ls_inquiry-sourceid BINARY SEARCH .
      ls_data_item-sourcename = ls_f4_config-text.

      "找货状态
      READ TABLE lt_dd07t INTO DATA(ls_dd07t) WITH KEY domname = 'ZDM_FOUNDSTATE' domvalue_l = ls_data_item-foundstate.
      IF sy-subrc EQ 0.
        ls_data_item-foundstatedesc = COND #( WHEN iv_export = 'X' AND ls_data_item-needcount IS NOT INITIAL THEN |{ ls_dd07t-ddtext }(缺货{ ls_data_item-needcount })| ELSE ls_dd07t-ddtext ).
      ENDIF.
      CLEAR ls_dd07t.

      "轮胎规格 add by zhangh A64 20211229
      IF iv_terminal EQ 'PHONE' AND ls_data_item-inquirytype EQ 'TYRE_INQUIRY'.
        ls_data_item-ordersku = ls_inquiry-tiresize.
      ENDIF.

****事故车疑是事故车标签
      IF ls_inquiry-inquirytype EQ 'CUSTOMIZE_INQUIRY' OR ls_inquiry-inquirytype EQ 'ACCIDENT_INQUIRY'.
        ls_data_item-tagid = 'ACVHI'.
        ls_data_item-tagdesc = '事故单'.
        ls_data_item-isaccidentinquiry = 'X'.
      ELSEIF ls_inquiry-inquirytype EQ '===='."目前没有判断标准
        ls_data_item-tagid = 'NON-ACVHI'.
        ls_data_item-tagdesc = '疑是事故单'.
      ENDIF.

      CLEAR ls_data_item-amount.
      WRITE ls_inquiry-amount TO ls_data_item-amount.
      ls_data_item-amount_dec = ls_inquiry-amount.
      CONDENSE ls_data_item-amount.
      CONDENSE ls_data_item-inquiryid NO-GAPS .
      CONDENSE ls_data_item-inquirytype NO-GAPS.
      CONDENSE ls_data_item-inquirytypename NO-GAPS.
      CONDENSE ls_data_item-carbrandid NO-GAPS.
      CONDENSE ls_data_item-carbrandname NO-GAPS .
      CONDENSE ls_data_item-licenseplate NO-GAPS .
      CONDENSE ls_data_item-needcount NO-GAPS .
      CONDENSE ls_data_item-corporatename NO-GAPS.
      CONDENSE ls_data_item-companycode NO-GAPS.
      CONDENSE ls_data_item-cuname NO-GAPS.
      CONDENSE ls_data_item-statusid NO-GAPS.
      CONDENSE ls_data_item-statusdesc NO-GAPS.
      CONDENSE ls_data_item-sourcename NO-GAPS.
      CONDENSE ls_data_item-ordersku NO-GAPS.

      APPEND ls_data_item TO er_deep_entity-cassintinqhomeset.
      DATA(lv_needcount) = ls_data_item-needcount.
      CLEAR ls_data_item-needcount.
      MOVE-CORRESPONDING ls_data_item TO ls_export.
      ls_export-needcount = un_quantity_formatter_dcm( EXACT string( lv_needcount ) ).
      APPEND ls_export TO lt_export.

      CLEAR :ls_data_item,ls_inquiry,ls_f4_config,ls_trail,lv_quotasku,lv_needcount,ls_export.
      CLEAR ls_zticec_inquiry_q.

    ENDLOOP.

    IF iv_export = 'X'.
* 保存日志
      "释放程序内存
      FREE:lt_cususer,it_inquiry,lt_temp,lt_dd07t,lt_custzone,lt_f4config,lt_followinf,
      lt_followinf,lt_follow_latest,lt_trail,lt_zticec_inquiry_q,er_deep_entity.
      DATA:l_keyvaule1 TYPE zde_key_value,
           l_keyvaule2 TYPE zde_key_value.
      l_keyvaule1 = mv_userid.
      l_keyvaule2 = mv_username.
      CALL FUNCTION 'Z_FMINT_LOG_SAVE'
        EXPORTING
          iv_event_id   = 'INQUIRYHOMEEXPORT'
          iv_event_desc = '开思助手询价单导出！'
          iv_status     = 'S'
          iv_key_value1 = l_keyvaule1
          iv_key_value2 = l_keyvaule2
          iv_zcrt_bdate = sy-datum
          iv_zcrt_btime = sy-uzeit.
      CHECK is_excellist-filename IS NOT INITIAL.
      SORT lt_export BY createdstamp DESCENDING.
      create_inquiry_excel( it_inquiry = lt_export is_excellist = is_excellist ).
***    ELSE.
***      IF iv_orderby IS INITIAL OR  iv_orderby = 'Lastcreate'.
***        SORT er_deep_entity-cassintinqhomeset BY createdate DESCENDING createtime DESCENDING.
***      ELSEIF iv_orderby = 'Amountasc'.
***        SORT er_deep_entity-cassintinqhomeset BY amount_dec ASCENDING.
***      ELSEIF iv_orderby =  'Amountdes'.
***        SORT er_deep_entity-cassintinqhomeset BY amount_dec DESCENDING .
***      ENDIF.
***
***      er_deep_entity-totalnum = lines( er_deep_entity-cassintinqhomeset ).
***      CONDENSE er_deep_entity-totalnum.
***
***
***      DATA: lv_from TYPE int4,
***            lv_to   TYPE int4.
***      DATA: lv_total TYPE int4.
***      DATA: lv_pagetotal TYPE int4.
***      DATA: lv_mod TYPE   int4.
***      DATA: lv_page TYPE int4,
***            lv_size TYPE int4.
***      CLEAR:lv_from,lv_to,lv_total,lv_pagetotal,lv_mod,lv_page,lv_size.
***      "分页
***      IF iv_page IS INITIAL . "没有这显示第一页
***        lv_page = 1.
***      ELSE.
***        lv_page = iv_page.
***      ENDIF.
***
***      IF iv_size IS INITIAL. "没有则默认50条
***        lv_size = 20.
***      ELSE.
***        lv_size = iv_size.
***      ENDIF.
***
***      lv_total =  er_deep_entity-totalnum. "总条数
***      lv_mod = lv_total MOD lv_size.
***      lv_pagetotal = lv_total DIV lv_size. "总页数
***      IF lv_mod NE 0.
***        lv_pagetotal = lv_pagetotal + 1.
***      ENDIF.
***      IF lv_page > lv_pagetotal. "当前页数不能大于总页数
***        RETURN.
***      ENDIF.
***
***      lv_from = ( lv_page - 1 ) * lv_size + 1."条数开始
***      lv_to = lv_page * lv_size."条数结束
***
***      er_deep_entity-pagetotal = lv_pagetotal."总页数
***      CONDENSE er_deep_entity-pagetotal.
***
***      DATA(lt_items) = er_deep_entity-cassintinqhomeset.
***      CLEAR er_deep_entity-cassintinqhomeset.
***      APPEND LINES OF lt_items FROM lv_from TO lv_to TO er_deep_entity-cassintinqhomeset.
***      LOOP AT er_deep_entity-cassintinqhomeset ASSIGNING FIELD-SYMBOL(<lfs>).
***        <lfs>-sno = lv_from.
***        CONDENSE <lfs>-sno.
***        lv_from = lv_from + 1.
***      ENDLOOP.
    ENDIF.

  ENDMETHOD.


  METHOD set_inq_overview_new_v2.
    DATA:so_shipstore TYPE /iwbep/t_cod_select_options.
    TYPES:BEGIN OF ty_inquiryq,
            inquiryid TYPE zticec_inquiry_q-inquiryid,
            ordersku  TYPE int4,
          END OF ty_inquiryq.
    DATA:ls_zticec_inquiry_q TYPE ty_inquiryq,
         lt_zticec_inquiry_q TYPE STANDARD TABLE OF ty_inquiryq.
    DATA:lt_followinf     TYPE STANDARD TABLE OF zord_s_trail,
         lt_follow_latest TYPE STANDARD TABLE OF zord_s_trail,
         lt_trail         TYPE STANDARD TABLE OF zord_s_trail,
         ls_trail         TYPE zord_s_trail.

    SELECT 'I' AS sign,'EQ' AS option,val_low AS low
    INTO CORRESPONDING FIELDS OF TABLE @so_shipstore
         FROM ztbc_f4_config
         WHERE fnam = 'FLGSHIPSTORE'.

    SELECT DISTINCT a~inquiryid,a~isproxy,a~prerecordnumber,a~personid,a~personname,i~cusid,i~companyid,
    i~companycode,i~provincegeoid, i~provincegeoname,t~amount,t~preamount,a~tiresize,a~ksbsinq,a~yunflg,
    i~citygeoid, i~citygeoname,i~countygeoid,i~countygeoname,i~zoneid,a~createdbyname,a~inquirytype,a~codingsku,a~vin,
    a~quotasku,a~inquirytypename,a~carbrandid,a~carbrandname,a~carmodelname,a~needcount,a~statusdesc,a~sourceid,a~sourcename,
    i~cusname AS displayname,a~createdate,a~createtime,a~createdstamp,a~missingsku,a~foundstate,a~statusid,a~tyrefg,a~assistantflg,
      a~carenergytype,a~isrightdriving,r~regionid,r~regionname,r~cityname
    INTO TABLE @DATA(lt_inquirydata) FROM zticec_inquiry_h AS a
          INNER JOIN ztint_cus_inf AS i ON a~custcompanyid = i~companyid
          LEFT JOIN zticec_inquiry_t AS t ON a~inquiryid = t~inquiryid "zv_inquirycus AS a
                  LEFT JOIN ztint_area_city AS r ON i~provincegeoid = r~provincegeoid AND i~citygeoid = r~citygeoid
                        AND i~countygeoid = r~countygeoid AND i~villagegeoid = r~villageoid
          FOR ALL ENTRIES IN @it_inquiry
          WHERE a~inquiryid = @it_inquiry-inquiryid.

    "主机直供店铺对应的询价单
    SELECT DISTINCT a~inquiryid,v~productstoreid
    INTO TABLE @DATA(lt_inquirystore) FROM zticec_inquiry_h AS a
          LEFT JOIN zticec_inquiry_v AS v ON a~inquiryid = v~inquiryid
          FOR ALL ENTRIES IN @it_inquiry
          WHERE a~inquiryid = @it_inquiry-inquiryid
          AND v~productstoreid IN @so_shipstore.
    SORT lt_inquirystore BY inquiryid.

    IF iv_inq IS NOT INITIAL AND lt_inquirydata IS INITIAL..  "说明是很久远的数据，需要从平台获取且it_inquiry[]也是调平台接口取得数据
      DATA(lo_inquiry) = NEW zcl_icec_inquiry_api( ).
      lo_inquiry->get_coldinquiry_header( EXPORTING iv_inquiryid = iv_inq
      IMPORTING es_inquiryhead = DATA(ls_head) ev_msg = DATA(ev_msg) ).
      READ TABLE lt_inquirydata INTO DATA(ls_inquirydata1) INDEX 1.
      LOOP AT it_inquiry INTO DATA(is_inquiry).
        MOVE-CORRESPONDING is_inquiry TO ls_inquirydata1.
        SELECT SINGLE * INTO @DATA(ls_cusinf) FROM ztint_cus_inf WHERE companyid = @ls_head-inquiryuserinfos-garagecompanyid.
        MOVE-CORRESPONDING ls_cusinf TO ls_inquirydata1.
        CLEAR ls_cusinf.
        ls_inquirydata1-statusid = ls_head-inquirybaseinfos-statusid.
        SELECT SINGLE statusdesc INTO ls_inquirydata1-statusdesc FROM zticec_inquiry_h WHERE statusid = ls_inquirydata1-statusid.
*        ls_inquirydata1-
        ls_inquirydata1-vin = ls_head-inquirycarinfos-vin.
        ls_inquirydata1-inquirytype = ls_head-inquirybaseinfos-inquirytype.
        SELECT SINGLE inquirytypename INTO ls_inquirydata1-inquirytypename FROM zticec_inquiry_h WHERE inquirytype = ls_inquirydata1-inquirytype.
        ls_inquirydata1-provincegeoid = ls_head-addressinfos-geoprovinceid.
        ls_inquirydata1-provincegeoname = ls_head-addressinfos-geoprovincename.
        ls_inquirydata1-citygeoid = ls_head-addressinfos-geocityid.
        ls_inquirydata1-citygeoname = ls_head-addressinfos-geocityname.
        ls_inquirydata1-countygeoid = ls_head-addressinfos-countygeoid.
        ls_inquirydata1-countygeoname = ls_head-addressinfos-countygeoname.
        ls_inquirydata1-carbrandid = ls_head-inquirycarinfos-carbrandid.
        ls_inquirydata1-carbrandname = ls_head-inquirycarinfos-carbrandname.
        ls_inquirydata1-carmodelname = ls_head-inquirycarinfos-carmodelname.
        ls_inquirydata1-sourceid = ls_head-inquirybaseinfos-customerserviceqq.
        SELECT SINGLE sourcename INTO ls_inquirydata1-sourcename FROM zticec_inquiry_h WHERE sourceid = ls_inquirydata1-sourceid.
        APPEND ls_inquirydata1 TO lt_inquirydata.
        CLEAR ls_inquirydata1.
      ENDLOOP.
    ENDIF.

    DATA(lt_inqcus) = it_inquiry.
    SORT lt_inqcus BY custcompanyid.
    DELETE ADJACENT DUPLICATES FROM lt_inqcus COMPARING custcompanyid.

    IF iv_isdelete IS INITIAL.
      "取当前客户经理
      SELECT u~cusid,u~userid,i~username INTO TABLE @DATA(lt_cususer)
            FROM ztint_cus_user AS u
            INNER JOIN ztint_cus_inf AS c ON c~cusid = u~cusid
            INNER JOIN ztint_user_inf AS i ON u~userid = i~userid
            FOR ALL ENTRIES IN @lt_inqcus
            WHERE companyid = @lt_inqcus-custcompanyid AND usertype = '1' AND ispre = '' AND u~isdelete = ''.
    ELSE.
      "取前任客户经理
      SELECT u~cusid,u~userid,i~username INTO TABLE @lt_cususer
      FROM ztint_cus_user AS u
      INNER JOIN ztint_cus_inf AS c ON c~cusid = u~cusid
      INNER JOIN ztint_user_inf AS i ON u~userid = i~userid
      FOR ALL ENTRIES IN @lt_inqcus
      WHERE companyid = @lt_inqcus-custcompanyid AND usertype = '1' AND ispre = 'X' AND u~isdelete = 'X'.
    ENDIF.

*  获取找货状态描述
    SELECT * INTO  TABLE @DATA(lt_dd07t)
          FROM dd07t WHERE domname = 'ZDM_FOUNDSTATE'
          AND ddlanguage = @sy-langu AND as4local   = 'A'.
    SORT lt_dd07t BY domname domvalue_l.
*  获取战区名称
    SELECT zoneid,zonename FROM ztcass_zone INTO TABLE @DATA(lt_custzone).
    SORT lt_custzone BY zoneid.

    "已下单
    SELECT inquiryid,resolveuserneedsid FROM zticec_inquiry_q INTO TABLE @DATA(lt_inquiryq)
          FOR ALL ENTRIES IN @it_inquiry
          WHERE inquiryid = @it_inquiry-inquiryid
          AND sellstatus = 'ORDERED'.

    LOOP AT lt_inquiryq INTO DATA(ls_inquiryq).
      ls_zticec_inquiry_q-inquiryid = ls_inquiryq-inquiryid.
      ls_zticec_inquiry_q-ordersku = ls_zticec_inquiry_q-ordersku + 1.
      COLLECT ls_zticec_inquiry_q INTO lt_zticec_inquiry_q.
      CLEAR ls_zticec_inquiry_q.
    ENDLOOP.
    SORT lt_zticec_inquiry_q BY inquiryid.

* 跟进类型F4 跟进来源F4 "订单来源F4 "主机直供标签
    SELECT fnam,val_low,text
    INTO TABLE @DATA(lt_f4config)
          FROM ztbc_f4_config
          WHERE fnam = 'ZICERP_CASSINT_FOLLOWSOURCE'
          OR fnam = 'ZICERP_CASSINT_FOLLOWTYPE'
          OR fnam = 'ZICERP_MT_SOURCE'
          OR fnam = 'FLGSHIPSTORE'.
    SORT lt_f4config BY fnam val_low .

* 跟进信息

    SELECT billno,followdate,followtime,partsname,followremark,followtype,followsource,followname
    FROM ztint_follow_inf INTO CORRESPONDING FIELDS OF TABLE @lt_followinf
    FOR ALL ENTRIES IN @it_inquiry WHERE billno = @it_inquiry-inquiryid.
    "获取是否跟单时要排除已删除的跟单记录 isdelete = ''.
    SELECT billno,followdate,followtime, remark AS followremark, followname
    FROM ztint_followlist APPENDING CORRESPONDING FIELDS OF TABLE @lt_followinf
    FOR ALL ENTRIES IN @it_inquiry WHERE billno = @it_inquiry-inquiryid AND isdelete = ''.

    "询价单跟单反馈(多条时取最近一条,排除删除的）
    SELECT * INTO TABLE @DATA(lt_followlist)
          FROM ztint_followlist
          FOR ALL ENTRIES IN @it_inquiry
          WHERE billno  = @it_inquiry-inquiryid
          AND billtype  = 'INQ0001'
          AND isdelete = ''.
    SORT lt_followlist BY billno zcrt_bdate zcrt_btime DESCENDING.

    IF lt_followinf IS NOT INITIAL.
      lt_follow_latest = lt_followinf.
      SORT lt_follow_latest BY billno followdate  DESCENDING  followtime DESCENDING .
      DELETE ADJACENT DUPLICATES FROM lt_follow_latest COMPARING billno.

      SORT lt_followinf  BY billno.
      LOOP AT lt_followinf INTO DATA(ls_followinf).
        ls_trail-billno = ls_followinf-billno.
        IF ls_followinf-followremark IS NOT INITIAL.
          ls_followinf-followremark = zcl_cassint_formatter=>filter_emoji_string( ls_followinf-followremark ) .
          IF ls_trail-followremark IS INITIAL.
            ls_trail-followremark = |{ ls_followinf-partsname }({ ls_followinf-followremark })|.
          ELSE.
            ls_trail-followremark = |{ ls_trail-followremark };{ ls_followinf-partsname }({ ls_followinf-followremark })|.
          ENDIF.
        ENDIF.

        IF ls_followinf-followtype IS NOT INITIAL.
          READ TABLE lt_f4config INTO DATA(ls_f4config) WITH KEY fnam = 'ZICERP_CASSINT_FOLLOWTYPE'
                val_low = ls_followinf-followtype
                BINARY SEARCH .
          IF sy-subrc EQ 0.
            IF ls_trail-followtypedesc IS INITIAL.
              ls_trail-followtypedesc = |{ ls_f4config-text }|.
            ELSE.
              ls_trail-followtypedesc = |{ ls_trail-followtypedesc };{ ls_f4config-text }|.
            ENDIF.
            CLEAR ls_f4config.
          ENDIF.
        ENDIF.

        IF ls_followinf-followsource IS NOT INITIAL.
          READ TABLE lt_f4config INTO ls_f4config WITH KEY fnam = 'ZICERP_CASSINT_FOLLOWSOURCE'
          val_low = ls_followinf-followsource
          BINARY SEARCH .
          IF sy-subrc EQ 0.
            IF ls_trail-followsourcedesc IS INITIAL.
              ls_trail-followsourcedesc = |{ ls_f4config-text }|.
            ELSE.
              ls_trail-followsourcedesc = |{ ls_trail-followsourcedesc };{ ls_f4config-text }|.
            ENDIF.
            CLEAR ls_f4config.
          ENDIF.
        ENDIF.

        AT END OF billno.
          APPEND ls_trail TO lt_trail.
          CLEAR ls_trail.
        ENDAT.
      ENDLOOP.
    ENDIF.
    SORT lt_trail BY billno.
    DATA lv_newinqsku TYPE int4.
    DATA lv_quotasku TYPE int4.
    DATA:ls_data_item TYPE zsicec_inquiry_h,
         l_tabix      TYPE i,
         lv_from      TYPE i.
    DATA:ls_export TYPE zord_s_inquiry_excel,
         lt_export TYPE zord_t_inquiry_excel.
    SORT lt_cususer BY cusid.
    IF iv_page IS NOT INITIAL AND iv_size IS NOT INITIAL.
      lv_from = ( iv_page - 1 ) * iv_size + 1.
    ELSE.
      lv_from = 1.
    ENDIF.
*----
    TYPES:BEGIN OF ty_inquirydata,
            inquiryid       TYPE zticec_inquiry_h-inquiryid,
            isproxy         TYPE zticec_inquiry_h-isproxy,
            prerecordnumber TYPE zticec_inquiry_h-prerecordnumber,
            personid        TYPE zticec_inquiry_h-personid,
            personname      TYPE zticec_inquiry_h-personname,
            cusid           TYPE ztint_cus_inf-cusid,
            companyid       TYPE ztint_cus_inf-companyid,
            companycode     TYPE ztint_cus_inf-companycode,
            provincegeoid   TYPE ztint_cus_inf-provincegeoid,
            provincegeoname TYPE ztint_cus_inf-provincegeoname,
            amount          TYPE zticec_inquiry_t-amount,
            preamount       TYPE zticec_inquiry_t-preamount,
            tiresize        TYPE zticec_inquiry_h-tiresize,
            ksbsinq         TYPE zticec_inquiry_h-ksbsinq,
            yunflg          TYPE zticec_inquiry_h-yunflg,
            citygeoid       TYPE ztint_cus_inf-citygeoid,
            citygeoname     TYPE ztint_cus_inf-citygeoname,
            countygeoid     TYPE ztint_cus_inf-countygeoid,
            countygeoname   TYPE ztint_cus_inf-countygeoname,
            zoneid          TYPE ztint_cus_inf-zoneid,
            createdbyname   TYPE zticec_inquiry_h-createdbyname,
            inquirytype     TYPE zticec_inquiry_h-inquirytype,
            codingsku       TYPE zticec_inquiry_h-codingsku,
            vin             TYPE zticec_inquiry_h-vin,
            quotasku        TYPE zticec_inquiry_h-quotasku,
            inquirytypename TYPE zticec_inquiry_h-inquirytypename,
            carbrandid      TYPE zticec_inquiry_h-carbrandid,
            carbrandname    TYPE zticec_inquiry_h-carbrandname,
            carmodelname    TYPE zticec_inquiry_h-carmodelname,
            needcount       TYPE zticec_inquiry_h-needcount,
            statusdesc      TYPE zticec_inquiry_h-statusdesc,
            sourceid        TYPE zticec_inquiry_h-sourceid,
            sourcename      TYPE zticec_inquiry_h-sourcename,
            displayname     TYPE ztint_cus_inf-cusname,
            createdate      TYPE zticec_inquiry_h-createdate,
            createtime      TYPE zticec_inquiry_h-createtime,
            createdstamp    TYPE zticec_inquiry_h-createdstamp,
            missingsku      TYPE zticec_inquiry_h-missingsku,
            foundstate      TYPE zticec_inquiry_h-foundstate,
            statusid        TYPE zticec_inquiry_h-statusid,
            tyrefg          TYPE zticec_inquiry_h-tyrefg,
            assistantflg    TYPE zticec_inquiry_h-assistantflg,
            carenergytype   TYPE zticec_inquiry_h-carenergytype,
            isrightdriving  TYPE zticec_inquiry_h-isrightdriving,
            regionid        TYPE ztint_area_city-regionid,
            regionname      TYPE ztint_area_city-regionname,
            cityname        TYPE ztint_area_city-cityname,
          END OF ty_inquirydata.
    DATA ls_inquirydata TYPE ty_inquirydata.
    TYPES:BEGIN OF ty_inquirydatanum,
            inquiryid       TYPE zticec_inquiry_h-inquiryid,
            isproxy         TYPE zticec_inquiry_h-isproxy,
            prerecordnumber TYPE zticec_inquiry_h-prerecordnumber,
            personid        TYPE zticec_inquiry_h-personid,
            personname      TYPE zticec_inquiry_h-personname,
            cusid           TYPE ztint_cus_inf-cusid,
            companyid       TYPE ztint_cus_inf-companyid,
            companycode     TYPE ztint_cus_inf-companycode,
            provincegeoid   TYPE ztint_cus_inf-provincegeoid,
            provincegeoname TYPE ztint_cus_inf-provincegeoname,
            amount          TYPE zticec_inquiry_t-amount,
            preamount       TYPE zticec_inquiry_t-preamount,
            tiresize        TYPE zticec_inquiry_h-tiresize,
            ksbsinq         TYPE zticec_inquiry_h-ksbsinq,
            yunflg          TYPE zticec_inquiry_h-yunflg,
            citygeoid       TYPE ztint_cus_inf-citygeoid,
            citygeoname     TYPE ztint_cus_inf-citygeoname,
            countygeoid     TYPE ztint_cus_inf-countygeoid,
            countygeoname   TYPE ztint_cus_inf-countygeoname,
            zoneid          TYPE ztint_cus_inf-zoneid,
            createdbyname   TYPE zticec_inquiry_h-createdbyname,
            inquirytype     TYPE zticec_inquiry_h-inquirytype,
            codingsku       TYPE zticec_inquiry_h-codingsku,
            vin             TYPE zticec_inquiry_h-vin,
            quotasku        TYPE zticec_inquiry_h-quotasku,
            inquirytypename TYPE zticec_inquiry_h-inquirytypename,
            carbrandid      TYPE zticec_inquiry_h-carbrandid,
            carbrandname    TYPE zticec_inquiry_h-carbrandname,
            carmodelname    TYPE zticec_inquiry_h-carmodelname,
            needcount       TYPE zticec_inquiry_h-needcount,
            statusdesc      TYPE zticec_inquiry_h-statusdesc,
            sourceid        TYPE zticec_inquiry_h-sourceid,
            sourcename      TYPE zticec_inquiry_h-sourcename,
            displayname     TYPE ztint_cus_inf-cusname,
            createdate      TYPE zticec_inquiry_h-createdate,
            createtime      TYPE zticec_inquiry_h-createtime,
            createdstamp    TYPE zticec_inquiry_h-createdstamp,
            missingsku      TYPE zticec_inquiry_h-missingsku,
            foundstate      TYPE zticec_inquiry_h-foundstate,
            statusid        TYPE zticec_inquiry_h-statusid,
            tyrefg          TYPE zticec_inquiry_h-tyrefg,
            assistantflg    TYPE zticec_inquiry_h-assistantflg,
            carenergytype   TYPE zticec_inquiry_h-carenergytype,
            isrightdriving  TYPE zticec_inquiry_h-isrightdriving,
            regionid        TYPE ztint_area_city-regionid,
            regionname      TYPE ztint_area_city-regionname,
            cityname        TYPE ztint_area_city-cityname,
          END OF ty_inquirydatanum.
    DATA: lt_inquirydatanum TYPE TABLE OF ty_inquirydatanum,
          ls_inquirydatanum TYPE ty_inquirydatanum.
    DATA:lv_num TYPE zticec_inquiry_h-codingsku.
    MOVE-CORRESPONDING lt_inquirydata TO lt_inquirydatanum.

    IF iv_orderby IS INITIAL OR  iv_orderby = 'Lastcreate'.
      SORT lt_inquirydatanum BY createdate DESCENDING createtime DESCENDING.
    ELSEIF iv_orderby = 'Amountasc'.
      SORT lt_inquirydatanum BY preamount ASCENDING.
    ELSEIF iv_orderby =  'Amountdes'.
      SORT lt_inquirydatanum BY preamount DESCENDING .
    ELSEIF iv_orderby =  'Needcountasc'.  "sku
      SORT lt_inquirydatanum BY needcount ASCENDING.
    ELSEIF iv_orderby =  'Needcountdes'.
      SORT lt_inquirydatanum BY needcount DESCENDING .
    ELSEIF iv_orderby =  'Codingskuasc'.  "译码sku
      SORT lt_inquirydatanum BY codingsku ASCENDING.
    ELSEIF iv_orderby =  'Codingskudes'.
      SORT lt_inquirydatanum BY codingsku DESCENDING .
    ELSEIF iv_orderby =  'Quotaskuasc'. "报价sku
      SORT lt_inquirydatanum BY quotasku ASCENDING.
    ELSEIF iv_orderby =  'Quotaskudes'.
      SORT lt_inquirydatanum BY quotasku DESCENDING .
    ENDIF.
    REFRESH: lt_inquirydata.
    LOOP AT lt_inquirydatanum INTO ls_inquirydatanum.
      MOVE-CORRESPONDING ls_inquirydatanum TO ls_inquirydata.
      lv_num = ls_inquirydatanum-needcount.
      ls_inquirydata-needcount = lv_num.
      lv_num = ls_inquirydatanum-codingsku.
      ls_inquirydata-codingsku = lv_num.
      lv_num = ls_inquirydatanum-quotasku.
      ls_inquirydata-quotasku = lv_num.
      APPEND ls_inquirydata TO lt_inquirydata.
    ENDLOOP.
*----

    "取sku配置是否跳转新询价单临界报价sku数量
    SELECT SINGLE value INTO @DATA(lv_par) FROM ztint_par WHERE fname = 'TONEWINQSKU'.
    lv_newinqsku = lv_par.
    LOOP AT lt_inquirydata INTO DATA(ls_inquiry).
      MOVE-CORRESPONDING ls_inquiry  TO ls_data_item.
      ls_data_item-isproxy = COND #( WHEN ls_data_item-isproxy EQ 'Y' THEN '是' WHEN ls_data_item-isproxy EQ 'N' THEN '否' ELSE '' ).
      ls_data_item-tonewinqdetail = COND #( WHEN  ls_inquiry-codingsku GT lv_newinqsku OR ls_inquiry-needcount GT lv_newinqsku THEN 'X' ELSE '' ).
      ls_data_item-sno = lv_from.
      lv_from = lv_from + 1.
      CONDENSE ls_data_item-sno.
      READ TABLE lt_zticec_inquiry_q INTO ls_zticec_inquiry_q WITH KEY inquiryid = ls_inquiry-inquiryid
      BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data_item-statusid = 'ORDERED'.
        ls_data_item-statusdesc = '已下单'.
        ls_data_item-ordersku = ls_zticec_inquiry_q-ordersku.
        CLEAR ls_zticec_inquiry_q.
      ENDIF.

      "主机直供标签
      READ TABLE lt_inquirystore INTO DATA(ls_inquirystore) WITH KEY inquiryid = ls_inquiry-inquiryid BINARY SEARCH.
      IF sy-subrc = 0.
        ls_data_item-shipstoreflg = 'X'.
      ENDIF.

      ls_data_item-createdbyname = ls_inquiry-createdbyname."创建人名称
      ls_data_item-corporateid = ls_inquiry-companyid."公司ID
      ls_data_item-corporatename = ls_inquiry-displayname." 公司名称
      ls_data_item-geocityid = ls_inquiry-citygeoid ." 城市ID
      ls_data_item-geoprovinceid = ls_inquiry-provincegeoid ." 省份ID
      ls_data_item-geoprovincename = ls_inquiry-provincegeoname ." 省份名称
      ls_data_item-geocityname = ls_inquiry-citygeoname ." 城市名称
      ls_data_item-custcompanyid = ls_inquiry-companyid." EC客户ID
      ls_data_item-geocountygeoid = ls_inquiry-countygeoid."区县编码
      ls_data_item-geocountygeoname = ls_inquiry-countygeoname."区县名称
      ls_data_item-tyrefg = ls_inquiry-tyrefg."轮胎找货标记
      ls_data_item-personname = ls_inquiry-personname."代客下单人

      ls_data_item-zoneid = ls_inquiry-regionid."ls_inquiry-zoneid ." 战区ID
      ls_data_item-zonename = COND #( WHEN ls_inquiry-regionid IS NOT INITIAL THEN |{ ls_inquiry-regionname }-{ ls_inquiry-cityname }| ).
*    READ TABLE lt_custzone INTO DATA(ls_custzone) WITH KEY zoneid = ls_inquiry-zoneid BINARY SEARCH.
*    IF sy-subrc EQ 0.
*      ls_data_item-zonename = ls_custzone-zonename."战区名称
*      CLEAR ls_custzone.
*    ENDIF.
      ls_data_item-companycode = ls_inquiry-companycode." ICEC公司code
      READ TABLE lt_cususer INTO DATA(ls_cususer) WITH KEY cusid = ls_inquiry-cusid BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data_item-userid = ls_cususer-userid."客户经理ID
        ls_data_item-cuname  = ls_cususer-username."客户经理
        CLEAR ls_cususer.
      ENDIF.
      "新增询价单跟进信息开始
      READ TABLE lt_trail INTO ls_trail WITH KEY billno = ls_inquiry-inquiryid BINARY SEARCH .
      IF sy-subrc EQ 0.
        ls_data_item-followremark  = ls_trail-followremark.
        ls_data_item-followtypedesc =  ls_trail-followtypedesc.
        ls_data_item-followsourcedesc = ls_trail-followsourcedesc.
        CLEAR ls_trail.
      ENDIF.
      READ TABLE lt_followlist INTO DATA(ls_followlist) WITH KEY billno = ls_inquiry-inquiryid BINARY SEARCH.
      IF sy-subrc = 0.
        ls_data_item-effectid = ls_followlist-effectid. "跟进状态id
        ls_data_item-effectdesc = ls_followlist-effectdesc. "跟进状态描述
        ls_data_item-feedbackdesc = ls_followlist-feedbackdesc. "跟进反馈
      ENDIF.
      READ TABLE lt_follow_latest INTO ls_trail WITH KEY billno = ls_inquiry-inquiryid BINARY SEARCH.
      IF sy-subrc = 0.
        ls_data_item-followname = ls_trail-followname.
        ls_data_item-followdate = |{ ls_trail-followdate DATE = ISO }|.
        ls_data_item-followtime = |{ ls_trail-followtime TIME = ISO }|.
        CLEAR:ls_trail.
      ENDIF.

      READ TABLE lt_f4config INTO DATA(ls_f4_config) WITH KEY fnam = 'ZICERP_MT_SOURCE' val_low = ls_inquiry-sourceid BINARY SEARCH .
      ls_data_item-sourcename = ls_f4_config-text.

      "找货状态
      READ TABLE lt_dd07t INTO DATA(ls_dd07t) WITH KEY domname = 'ZDM_FOUNDSTATE' domvalue_l = ls_data_item-foundstate.
      IF sy-subrc EQ 0.
        ls_data_item-foundstatedesc = COND #( WHEN iv_export = 'X' AND ls_data_item-needcount IS NOT INITIAL THEN |{ ls_dd07t-ddtext }(缺货{ ls_data_item-needcount })| ELSE ls_dd07t-ddtext ).
      ENDIF.
      CLEAR ls_dd07t.

      "轮胎规格 add by zhangh A64 20211229
      IF iv_terminal EQ 'PHONE' AND ls_data_item-inquirytype EQ 'TYRE_INQUIRY'.
        ls_data_item-ordersku = ls_inquiry-tiresize.
      ENDIF.

****事故车疑是事故车标签
      IF ls_inquiry-inquirytype EQ 'CUSTOMIZE_INQUIRY' OR ls_inquiry-inquirytype EQ 'ACCIDENT_INQUIRY'.
        ls_data_item-tagid = 'ACVHI'.
        ls_data_item-tagdesc = '事故单'.
        ls_data_item-isaccidentinquiry = 'X'.
      ELSEIF ls_inquiry-inquirytype EQ '===='."目前没有判断标准
        ls_data_item-tagid = 'NON-ACVHI'.
        ls_data_item-tagdesc = '疑是事故单'.
      ENDIF.

      CLEAR ls_data_item-amount.
      WRITE ls_inquiry-preamount TO ls_data_item-amount.
      ls_data_item-amount_dec = ls_inquiry-preamount.
      CONDENSE ls_data_item-amount.
      CONDENSE ls_data_item-inquiryid NO-GAPS .
      CONDENSE ls_data_item-inquirytype NO-GAPS.
      CONDENSE ls_data_item-inquirytypename NO-GAPS.
      CONDENSE ls_data_item-carbrandid NO-GAPS.
      CONDENSE ls_data_item-carbrandname NO-GAPS .
      CONDENSE ls_data_item-licenseplate NO-GAPS .
      CONDENSE ls_data_item-needcount NO-GAPS .
      CONDENSE ls_data_item-corporatename NO-GAPS.
      CONDENSE ls_data_item-companycode NO-GAPS.
      CONDENSE ls_data_item-cuname NO-GAPS.
      CONDENSE ls_data_item-statusid NO-GAPS.
      CONDENSE ls_data_item-statusdesc NO-GAPS.
      CONDENSE ls_data_item-sourcename NO-GAPS.
      CONDENSE ls_data_item-ordersku NO-GAPS.

      APPEND ls_data_item TO er_deep_entity-cassintinqhomeset.
      DATA(lv_needcount) = ls_data_item-needcount.
      CLEAR ls_data_item-needcount.
      MOVE-CORRESPONDING ls_data_item TO ls_export.
      "导出字段新增单据标签
      IF ls_inquiry-ksbsinq IS NOT INITIAL."开思严选
        ls_export-inqlabel = COND #( WHEN ls_export-inqlabel IS INITIAL THEN '开思严选;' ELSE  |{ ls_export-inqlabel }开思严选;| ).
      ENDIF.
      IF ls_inquiry-tyrefg IS NOT INITIAL."轮胎找货
        ls_export-inqlabel = COND #( WHEN ls_export-inqlabel IS INITIAL THEN '轮胎找货;' ELSE  |{ ls_export-inqlabel }轮胎找货;| ).
      ENDIF.
      IF ls_inquiry-yunflg IS NOT INITIAL."共享仓
        ls_export-inqlabel = COND #( WHEN ls_export-inqlabel IS INITIAL THEN '共享仓;' ELSE  |{ ls_export-inqlabel }共享仓;| ).
      ENDIF.
      IF ls_data_item-carenergytype  EQ 1."新能源
        ls_export-inqlabel = COND #( WHEN ls_export-inqlabel IS INITIAL THEN '新能源;' ELSE  |{ ls_export-inqlabel }新能源;| ).
      ENDIF.
      IF ls_data_item-shipstoreflg IS NOT INITIAL."主机直供
        ls_export-inqlabel = COND #( WHEN ls_export-inqlabel IS INITIAL THEN '主机直供;' ELSE  |{ ls_export-inqlabel }主机直供;| ).
      ENDIF.
      IF ls_data_item-assistantflg EQ 'Y' ."智能采购助手
        ls_export-inqlabel = COND #( WHEN ls_export-inqlabel IS INITIAL THEN '智能采购;' ELSE  |{ ls_export-inqlabel }智能采购;| ).
      ENDIF.
      IF ls_data_item-isrightdriving EQ 'X' ."智能采购助手
        ls_export-inqlabel = COND #( WHEN ls_export-inqlabel IS INITIAL THEN '右舵车;' ELSE  |{ ls_export-inqlabel }右舵车;| ).
      ENDIF.

      ls_export-needcount = un_quantity_formatter_dcm( EXACT string( lv_needcount ) ).
      APPEND ls_export TO lt_export.

      CLEAR :ls_data_item,ls_inquiry,ls_f4_config,ls_trail,lv_quotasku,lv_needcount,ls_export.
      CLEAR ls_zticec_inquiry_q.

    ENDLOOP.

    IF iv_export = 'X'.
* 保存日志
      "释放程序内存
      FREE:lt_cususer,it_inquiry,lt_dd07t,lt_custzone,lt_f4config,lt_followinf,
      lt_followinf,lt_follow_latest,lt_trail,lt_zticec_inquiry_q,er_deep_entity.
      DATA:l_keyvaule1 TYPE zde_key_value,
           l_keyvaule2 TYPE zde_key_value.
      l_keyvaule1 = mv_userid.
      l_keyvaule2 = mv_username.
      CALL FUNCTION 'Z_FMINT_LOG_SAVE'
        EXPORTING
          iv_event_id   = 'INQUIRYHOMEEXPORT'
          iv_event_desc = '开思助手询价单导出！'
          iv_status     = 'S'
          iv_key_value1 = l_keyvaule1
          iv_key_value2 = l_keyvaule2
          iv_zcrt_bdate = sy-datum
          iv_zcrt_btime = sy-uzeit.
      CHECK is_excellist-filename IS NOT INITIAL.
      SORT lt_export BY createdstamp DESCENDING.
      create_inquiry_excel( it_inquiry = lt_export is_excellist = is_excellist ).
    ENDIF.

  ENDMETHOD.


  METHOD set_order_detail.
    DATA lt_order TYPE STANDARD TABLE OF zcl_icec_order_api=>ty_orders WITH DEFAULT KEY.
    DATA:lv_date TYPE sy-datum,
         lv_time TYPE sy-uzeit.
    DATA:lv_amount TYPE zde_intamount.
    DATA:lv_temp_amt TYPE zde_intamount.
    DATA lt_newpolicys TYPE STANDARD TABLE OF ztint_policys WITH DEFAULT KEY.
    DATA lv_flag TYPE char1.
*****header
    cs_entity-orderid = is_detail-orderheader-orderid."订单编号
    cs_entity-ordername = is_detail-orderheader-ordername."订单说明
    cs_entity-ordertypeiddesc = is_detail-orderheader-ordertypeiddesc."订单类型
    cs_entity-statusid = is_detail-orderheader-statusid."订单状态
    cs_entity-statusdesc = is_detail-orderheader-statusiddesc."订单状态描述
    cs_entity-createname = is_detail-orderheader-createname."下单人
    "处理订单状态有退货的
    SELECT asid,orderid,orderitemseqid FROM zticec_af_order INTO TABLE @DATA(lt_as)
       WHERE orderid = @is_detail-orderheader-orderid.
    IF sy-subrc EQ 0.
      SORT lt_as BY orderid.
      SELECT id,asid,asstatusid,lastupdatedstamp FROM zticec_af_status INTO TABLE @DATA(lt_asstatus)
        FOR ALL ENTRIES IN @lt_as WHERE asid = @lt_as-asid.
      LOOP AT lt_asstatus INTO DATA(ls_closeas) WHERE asstatusid = 'RETURN_CLOSED'.
        DELETE lt_asstatus WHERE asstatusid = 'RETURN_CLOSED'.
        DELETE lt_as  WHERE asid = ls_closeas-asid.
      ENDLOOP.
      SORT lt_asstatus BY asid lastupdatedstamp DESCENDING.
      DELETE ADJACENT DUPLICATES FROM lt_asstatus COMPARING asid.

      READ TABLE lt_as INTO DATA(ls_as) WITH KEY orderid = is_detail-orderheader-orderid BINARY SEARCH.
      IF sy-subrc EQ 0.
        READ TABLE lt_asstatus INTO DATA(ls_asstatus) WITH KEY asid = ls_as-asid BINARY SEARCH.
        IF sy-subrc EQ 0 AND ls_asstatus-asstatusid NE 'RETURN_CLOSED'.
          cs_entity-statusdesc = |{ cs_entity-statusdesc }(有退货)|.
        ENDIF.
      ENDIF.
    ENDIF.

    timestamp_formatter( EXPORTING iv_timestamp = is_detail-orderheader-orderdate
          IMPORTING ev_string =   cs_entity-orderdate  )."下单时间
    cs_entity-paymentmethodtypedesc = is_detail-orderpayment-paymentmethodtypedesc."付款方式
    cs_entity-couponamount = currency_formatter( is_detail-orderpayment-cassdiscountamount )."开思券
    cs_entity-actualcurrencyamount = currency_formatter( is_detail-orderpayment-orderactualcurrencyamount )."订单金额

    cs_entity-insurancefee = currency_formatter( is_detail-orderpayment-insurancefee )."保险费
    cs_entity-tmsfee =  currency_formatter( is_detail-orderpayment-shipfee )."运费
    cs_entity-originalsource = is_detail-orderheader-originalsource."订单来源
    cs_entity-originalsourcedesc = is_detail-orderheader-originalsourcedesc."订单来源
    IF is_detail-orderheader-originalsource = 'PREPARE_GOODS'."备货协议订单
      cs_entity-shoppinglistid = is_detail-orderheader-contractid."备货协议编号
    ELSE.
      cs_entity-shoppinglistid = is_detail-orderheader-inquiryid."询价单号
    ENDIF.
    cs_entity-custcompanycode = is_detail-orderheader-buyer-companycode."客户代码
    cs_entity-custcompanyname = is_detail-orderheader-buyer-companyname."客户名称
    SELECT SINGLE cusid,displayname,doorname INTO ( @cs_entity-cusid, @cs_entity-displayname, @cs_entity-doorname ) FROM ztint_cus_inf WHERE companyid = @is_detail-orderheader-buyer-companyid.
    SELECT SINGLE venid INTO cs_entity-venid FROM ztint_ven_inf WHERE productstoreid = is_detail-orderheader-seller-companystoreid.
    DATA:lv_carbrandname TYPE zticec_inquiry_h-carmodelname.
    IF is_detail-orderheader-inquiryid IS NOT INITIAL.
      SELECT SINGLE carbrandid,carmodelname,carbrandname,vin INTO ( @cs_entity-carbrandid,@cs_entity-carbrandname,@lv_carbrandname,@cs_entity-vin )
        FROM  zticec_inquiry_h WHERE inquiryid = @is_detail-orderheader-inquiryid.
      IF sy-subrc NE 0.
        SELECT SINGLE carbrandid,carbrandname,carbrandname,vhvin INTO ( @cs_entity-carbrandid,@cs_entity-carbrandname,@lv_carbrandname,@cs_entity-vin )
        FROM  zticec_order_h WHERE orderid = @is_detail-orderheader-orderid.
      ENDIF.
    ELSE.
      READ TABLE is_detail-orderattributes INTO DATA(ls_bu) WITH KEY attrname = 'CAR_BRAND_NAME'.
      IF sy-subrc EQ 0.
        lv_carbrandname = ls_bu-attrvalue.
      ENDIF.
    ENDIF.
    cs_entity-carbrandname = COND #( WHEN cs_entity-carbrandname IS INITIAL THEN lv_carbrandname ELSE cs_entity-carbrandname ).
    "客户等级和会员权益等级
    IF is_detail-orderheader-buyer-companyid IS NOT INITIAL .
      SELECT * FROM ztint_level INTO TABLE @DATA(lt_ztint_level)
        WHERE zleveltype = '1' OR zleveltype = '2'.
      SORT lt_ztint_level BY zlevel zleveltype.

      DATA lv_companyid TYPE string.

      lv_companyid = is_detail-orderheader-buyer-companyid .
      DATA ls_levelinfo TYPE zrts_s_levelinfo.
      DATA(lo_rights) = NEW zcl_icec_rights_api( ).
      CALL METHOD lo_rights->get_levelinfo_bycompanyid
        EXPORTING
          iv_companyid = lv_companyid
        IMPORTING
          es_levelinfo = ls_levelinfo
*         ev_msg       =
        .
      IF ls_levelinfo-rightslevelcode IS NOT INITIAL .
        READ TABLE lt_ztint_level INTO DATA(ls_ztint_level) WITH  KEY zlevel = ls_levelinfo-rightslevelcode zleveltype = '2' BINARY SEARCH.
        IF sy-subrc = 0.
          cs_entity-cusvlevel = ls_ztint_level-zlevelicon.
        ENDIF.

      ENDIF.
      "公司等级
      DATA: ls_rank TYPE zrts_s_companyrank.

      CALL METHOD lo_rights->get_rank_bycompanyid
        EXPORTING
          iv_companyid = lv_companyid
        IMPORTING
          es_rank      = ls_rank
*         ev_msg       =
        .
      IF ls_rank-levelcode IS NOT INITIAL .
        CLEAR ls_ztint_level.
        READ TABLE lt_ztint_level INTO ls_ztint_level WITH  KEY zlevel = ls_rank-levelcode zleveltype = '1' BINARY SEARCH.
        IF sy-subrc = 0.
          cs_entity-cusllevel = ls_ztint_level-zlevelicon.
          cs_entity-cusllevelnum = ls_ztint_level-zlevelnum.
        ENDIF.
      ENDIF.

    ENDIF.




    cs_entity-productstorename = is_detail-orderheader-seller-companydisplayname."店铺简称
    cs_entity-fulfillstorename = is_detail-orderheader-fulfillstore-storename."履约方店铺名称
    cs_entity-fulfillstoreid = is_detail-orderheader-fulfillstore-storeid."履约方店铺id
    IF is_detail-orderpayment-invoicetype = 'A'."需要发票
      cs_entity-invoicetype = '是'.
      READ TABLE is_detail-orderattributes INTO DATA(ls_attri) WITH KEY attrname = 'ITEM_INVOICE' attrvalue = 'Y'.
      IF sy-subrc = 0.
        cs_entity-invoicetype = cs_entity-invoicetype && '(' && '对项发票' && ')'.
      ENDIF.
    ELSEIF is_detail-orderpayment-invoicetype = 'B'.
      cs_entity-invoicetype = '否'.
    ENDIF .
    CONDENSE cs_entity-invoicetype NO-GAPS.

    READ TABLE is_detail-orderattributes INTO DATA(ls_pack) WITH KEY orderid = is_detail-orderheader-orderid  attrname =  'PACKINGMETHOD'.
    cs_entity-packingmethod = ls_pack-attrvalue.

    cs_entity-toname = is_detail-orderpostaladdress-toname."收货人姓名
    cs_entity-contactnumber = is_detail-orderpostaladdress-contactnumber."手机号码
    cs_entity-contacttel = is_detail-orderpostaladdress-contacttel."固定号码
    cs_entity-destination = is_detail-orderpostaladdress-provincename
      && is_detail-orderpostaladdress-cityname && is_detail-orderpostaladdress-countyname
      && is_detail-orderpostaladdress-villagegeoname
      &&  is_detail-orderpostaladdress-address
      &&  is_detail-orderpostaladdress-housenumber."配送地址
    SELECT SINGLE warehousedesc INTO cs_entity-transferwarehouse FROM ztint_warehouse
     WHERE warehouse = is_detail-orderheader-transferwarehouseid."物流方式
    cs_entity-waydetail = is_detail-displaylogisticsinfo."配送信息
*    READ TABLE is_detail-orderattributes INTO ls_attri WITH KEY attrname = 'wayDetail'.
*    IF sy-subrc EQ 0.
*      DATA:lt_waydetail TYPE zord_t_od_attribute_attrvalue.
*      /ui2/cl_json=>deserialize(
*              EXPORTING
*                json = ls_attri-attrvalue
*              CHANGING
*                data = lt_waydetail  ).
*
*      LOOP AT lt_waydetail INTO DATA(ls_waydetai) .
*        IF cs_entity-waydetail IS INITIAL.
*          cs_entity-waydetail = |{ ls_waydetai-facilityname }发货/{ ls_waydetai-company } { ls_waydetai-location }|.
*        ELSE.
*          cs_entity-waydetail = |{ cs_entity-waydetail } { ls_waydetai-facilityname }发货/{ ls_waydetai-company } { ls_waydetai-location }|.
*        ENDIF.
*        IF ls_waydetai-landing = 'Y'.
*          cs_entity-waydetail = cs_entity-waydetail && '(落地配)'. "配送信息
*        ENDIF.
*      ENDLOOP.
*    ENDIF.
    DATA:lt_ztint_adjustment_new TYPE STANDARD TABLE OF ztint_adjustment.

    SELECT * FROM ztint_policys INTO TABLE @DATA(lt_ztint_policys).
    SORT lt_ztint_policys BY policys value.
    SELECT * FROM ztint_num INTO TABLE @DATA(lt_ztint_num) .
    SORT lt_ztint_num BY num.
    SELECT  * FROM ztint_adjustment INTO TABLE @DATA(lt_ztint_adjustment).
    SORT lt_ztint_adjustment BY adjustmenttype.
*****Item
    DATA:ls_item          LIKE LINE OF cs_entity-orderhomedetailitemsset,
         ls_item_total    LIKE LINE OF cs_entity-orderhomedetailitemheaderset,
         ls_payment       LIKE LINE OF cs_entity-orderdetailpaymentsset,
         ls_asp           TYPE zord_s_od_orderitems_asp,
         lv_quotebody     TYPE string,
         lv_businessgroup TYPE string,
         lv_productid     TYPE string.
    CLEAR:ls_item,ls_item_total,ls_payment,ls_asp.
    CLEAR:cs_entity-orderdetailpaymentsset,cs_entity-orderhomedetailitemheaderset,
    cs_entity-orderhomedetailitemsset.
    DATA(lo_order) = NEW zcl_icec_order_api( ).
    lt_order = VALUE #( ( orderid =  is_detail-orderheader-orderid ) ).
    DATA(ls_appsalepolicy) = lo_order->get_aftersale_policy( EXPORTING it_order = lt_order showsource = 'PLATFORM' terminal = 'APP' version = '1').
    DATA(lt_apppolicy) = ls_appsalepolicy-data.
    SORT lt_apppolicy BY itemid.

    lo_order->get_order_returndeadline_data( EXPORTING iv_orderid = is_detail-orderheader-orderid
      IMPORTING ev_deadline = DATA(lv_deadline) ).
    LOOP AT is_detail-orderitems INTO DATA(ls_orderitem).
      ls_item-sno = sy-tabix.
      CONDENSE ls_item-sno.
      ls_item-acturalprice = nosign_currency_formatter( ls_orderitem-orderitempayment-buyeractualprice ).
      ls_item-brandname = ls_orderitem-brandname.
      IF ls_orderitem-dispatch IS NOT INITIAL.
        ls_item-dispatchgoods = |调货+{ ls_orderitem-dispatchtime }天|.
      ENDIF.
      LOOP AT  ls_orderitem-deductinventories INTO DATA(ls_ddi) WHERE orderitemseqid = ls_orderitem-orderitemseqid.
        ls_item-orderitemsfacilityset = VALUE #( BASE ls_item-orderitemsfacilityset ( facilityid = ls_ddi-facilityid
                                                                                      facilityname = ls_ddi-facilityname
                                                                                      quantity = zcl_cassint_formatter=>remove_zero_formatter( ls_ddi-inventorycount ) ) ).
      ENDLOOP.

      timestamp_formatter( EXPORTING iv_timestamp = ls_orderitem-guaranteeperiod
        IMPORTING ev_string =   ls_item-guaranteeperiod ).
*---------订单优惠信息悬浮
      DATA:
*        lv_flow TYPE dmbtr,"FLOW	开思立减:
        lv_fullcutadjustment TYPE dmbtr, "STORE_PROMOTION_SUM  商家促销: INQUIRY_FULLOFF 商家报价优惠:
        lv_fullreduce        TYPE dmbtr, "STORE_PROMOTION_FULLOFF	商家满减:
        lv_fulldiscount      TYPE dmbtr, "STORE_PROMOTION_FULLDISCOUNT  商家满折:
        lv_perfulldiscount   TYPE dmbtr. "STORE_PROMOTION_PER_FULL  每满立减优惠:
*        lv_flag TYPE char1,"划线价标记
*        lv_selleradjustment TYPE dmbtr,"划线价
*        lv_inquiryfullcutadjustment TYPE dmbtr,"STORE_CUSTOMIZE_INQ_FULLOFF  事故车满减:
*        lv_storecouponadjustment TYPE dmbtr,"STORE_COUPON  商家优惠:
*        lv_couponadjustment TYPE dmbtr,"COUPON  开思优惠:
*        lv_goldadjustment TYPE dmbtr,"GOLDCOIN  金币抵扣:
*        lv_payonlineadjustment TYPE dmbtr,"PAY_ONLINE  现付优惠:
*        lv_paynowadjustment TYPE dmbtr."SELLER_PAY_ONLINE  商家现付优惠:
      LOOP AT ls_orderitem-adjustments INTO DATA(ls_adjustment1).
        IF ls_adjustment1-adjustmenttype = 'STORE_PROMOTION_SUM' OR ls_adjustment1-adjustmenttype = 'INQUIRY_FULLOFF'.
          lv_fullcutadjustment = lv_fullcutadjustment + ls_adjustment1-buyeradjustment.
        ENDIF.
        IF ls_adjustment1-adjustmenttype = 'STORE_PROMOTION_FULLOFF'.
          lv_fullreduce = lv_fullreduce + ls_adjustment1-buyeradjustment.
        ENDIF.
        IF ls_adjustment1-adjustmenttype = 'STORE_PROMOTION_FULLDISCOUNT'.
          lv_fulldiscount = lv_fulldiscount + ls_adjustment1-buyeradjustment.
        ENDIF.
        IF ls_adjustment1-adjustmenttype = 'STORE_PROMOTION_PER_FULL'.
          lv_perfulldiscount = lv_perfulldiscount + ls_adjustment1-buyeradjustment.
        ENDIF.
      ENDLOOP.

*---------订单优惠信息悬浮
      LOOP AT ls_orderitem-adjustments INTO DATA(ls_adj) WHERE orderitemseqid = ls_orderitem-orderitemseqid.
        lv_amount = ls_adj-buyeradjustment.
        IF lv_amount EQ 0.
          CLEAR lv_amount.
          CONTINUE.
        ENDIF.
        READ TABLE lt_ztint_adjustment INTO DATA(ls_adjustment) WITH KEY adjustmenttype = ls_adj-adjustmenttype BINARY SEARCH.
        IF sy-subrc = 0.

          "优惠券信息浮窗标志（X表示悬浮展示）
          IF lv_fullcutadjustment IS NOT INITIAL AND lv_fullcutadjustment NE 0.
            IF lv_fullreduce IS NOT INITIAL AND lv_fullreduce NE 0 AND ls_adj-adjustmenttype = 'STORE_PROMOTION_FULLOFF  '.
*              ls_orderdetailitemsadjustment-suspension = 'X'.
            ENDIF.
            IF lv_fulldiscount IS NOT INITIAL AND lv_fulldiscount NE 0 AND ls_adj-adjustmenttype = 'STORE_PROMOTION_FULLDISCOUNT'.
*              ls_orderdetailitemsadjustment-suspension = 'X'.
            ENDIF.
            IF lv_perfulldiscount IS NOT INITIAL AND lv_perfulldiscount NE 0 AND ls_adj-adjustmenttype = 'STORE_PROMOTION_PER_FULL'.
*              ls_orderdetailitemsadjustment-suspension = 'X'.
            ENDIF.
          ENDIF.
          "优惠券信息浮窗

          lv_temp_amt = ls_adj-buyeradjustment." *  ls_orderitem-quantity.
          ls_item-orderdetailitemsadjustmentset = VALUE #( BASE ls_item-orderdetailitemsadjustmentset (
                                    adjustmenttype = ls_adj-adjustmenttype
                                    adjustmenttypedesc = ls_adjustment-adjustmenttypedesc
                                    isshowbyhang = ls_adjustment-isshowbyhang
                                    buyyeradjustment = nosign_currency_formatter( EXACT string( lv_temp_amt ) ) ) ).
        ELSE.
          lv_temp_amt = ls_adj-buyeradjustment." *  ls_orderitem-quantity.
          ls_item-orderdetailitemsadjustmentset = VALUE #( BASE ls_item-orderdetailitemsadjustmentset (
                                    adjustmenttype = ls_adj-adjustmenttype
                                    adjustmenttypedesc = |{ ls_adj-adjustmentdesc }:|
                                    buyyeradjustment = nosign_currency_formatter( EXACT string( lv_temp_amt ) ) ) ).
          ls_adjustment-adjustmenttype =  ls_adj-adjustmenttype.
          ls_adjustment-adjustmenttypedesc = |{ ls_adj-adjustmentdesc }:|.
          APPEND ls_adjustment TO lt_ztint_adjustment_new.
        ENDIF.
        IF ls_adj-adjustmenttype EQ  'NAIL_BOX'."钉箱费
          ls_item-nailboxfee = abs( ls_adj-selleradjustment ) + ls_item-nailboxfee.
          CONDENSE ls_item-nailboxfee.
          cs_entity-selleradjustment = abs( ls_adj-selleradjustment ) + cs_entity-selleradjustment.
          CONDENSE cs_entity-selleradjustment."抬头的钉箱费
        ENDIF.
        CLEAR:lv_amount,ls_adjustment,ls_adj,lv_temp_amt.
      ENDLOOP.
      IF ls_item-nailboxfee IS NOT INITIAL.
        ls_item-nailboxfee = nosign_currency_formatter( EXACT string( ls_item-nailboxfee ) ).
      ENDIF.


      READ TABLE lt_apppolicy INTO DATA(ls_apppolicy) WITH KEY itemid = ls_orderitem-orderitemseqid BINARY SEARCH.
      LOOP AT ls_apppolicy-policys INTO DATA(ls_policy).
        IF ls_policy-display EQ 'X'.
          IF ls_policy-key EQ 'CassQualityAssurePolicy' OR ls_policy-key EQ 'LongAssurePolicy'
                        OR ls_policy-key EQ 'QualityAssurePolicy'.
            READ TABLE lt_ztint_policys INTO DATA(ls_ztint_policys) WITH KEY policys =  ls_policy-key
                                                                            value = ls_policy-value BINARY SEARCH .
            IF sy-subrc EQ 0.
              ls_policy-displayname = ls_ztint_policys-displayname.
            ENDIF.
          ENDIF.
          ls_item-orderitemspolicysset = VALUE #( BASE ls_item-orderitemspolicysset ( policys = ls_policy-key
                                                       value = ls_policy-value  policysdesc = ls_policy-displayname
                                                       appicon = ls_policy-icon cellphone = ls_policy-cellphone
                                                       technicalinstructor = ls_policy-technicalinstructor groupid = ls_policy-groupid
                                                       floattext = ls_policy-floattext repairdocumenturl = ls_policy-repairdocumenturl
                                                       servicecategorycode = ls_policy-servicecategorycode scenarioid = ls_policy-scenarioid ) ).

          READ TABLE lt_ztint_policys INTO ls_ztint_policys WITH KEY policys =  ls_policy-key
                                                                           value = ls_policy-value BINARY SEARCH .
          IF sy-subrc NE 0.
            lt_newpolicys = VALUE #( BASE  lt_newpolicys  ( policys = ls_policy-key value = ls_policy-value
                                           policysdesc = ls_policy-explanation displayname = ls_policy-displayname
                                           appicon = ls_policy-icon ) ).
          ENDIF.
        ENDIF.
        CLEAR: ls_policy,ls_ztint_policys.
      ENDLOOP.
*      CLEAR:ls_asp.
*      REPLACE  ALL OCCURRENCES OF '\'  IN ls_orderitem-aftersalepolicy  WITH ''.
*      CONDENSE ls_orderitem-aftersalepolicy NO-GAPS.
*      REPLACE ALL OCCURRENCES OF '"['  IN ls_orderitem-aftersalepolicy  WITH '['.
*      REPLACE ALL OCCURRENCES OF ']"'  IN ls_orderitem-aftersalepolicy  WITH ']'.
*      /ui2/cl_json=>deserialize(
*              EXPORTING
*              json = ls_orderitem-aftersalepolicy
*              CHANGING
*              data = ls_asp  ).
*
*      DATA:lv_havelasp TYPE c."是否有超长质保--add at 2021.06.04
*      CLEAR lv_havelasp.
      "调商家组接口获取展示售后政策信息
*      LOOP AT ls_asp-policys INTO DATA(ls_policys) .
*        READ TABLE lt_ztint_policys INTO DATA(ls_ztint_policys) WITH KEY policys = ls_policys-key value = ls_policys-value BINARY SEARCH .
*        IF sy-subrc = 0 AND ls_ztint_policys-appicon IS NOT INITIAL AND ls_ztint_policys-pcicon IS NOT INITIAL.
*
*          ls_item-orderitemspolicysset = VALUE #( BASE ls_item-orderitemspolicysset ( policys = ls_ztint_policys-policys
*                                                        value = ls_policys-value  policysdesc = ls_ztint_policys-displayname
*                                                        appicon = ls_ztint_policys-appicon pcicon = ls_ztint_policys-pcicon ) ).
*        ELSE.
*          IF lv_flag IS INITIAL.
*            lt_order = VALUE #( ( orderid =  is_detail-orderheader-orderid ) ).
*            "DATA(ls_pcsalepolicy) = lo_order->get_aftersale_policy( EXPORTING it_order = lt_order showsource = 'PLATFORM' terminal = 'PC' ).
*
*            "DATA(lt_pcpolicy) = ls_pcsalepolicy-data.
*            "DATA(lt_apppolicy) = ls_appsalepolicy-data.
*            lv_flag = 'X'.
*          ENDIF.
*          READ TABLE lt_apppolicy INTO DATA(ls_appploicy) WITH KEY itemid = ls_orderitem-orderitemseqid.
*          "READ TABLE lt_pcpolicy INTO DATA(ls_pcploicy) WITH KEY itemid = ls_orderitem-orderitemseqid.
*          IF sy-subrc EQ 0.
*            READ TABLE ls_appploicy-policys INTO DATA(ls_apptemp) WITH KEY key = ls_policys-key value = ls_policys-value.
*            " READ TABLE ls_pcploicy-policys INTO DATA(ls_pctemp) WITH KEY key = ls_policys-key value = ls_policys-value.
*            IF sy-subrc EQ 0.
*              ls_item-orderitemspolicysset = VALUE #( BASE ls_item-orderitemspolicysset ( policys = ls_policys-key
*                                                      value = ls_policys-value  policysdesc = ls_apptemp-displayname
*                                                      appicon = ls_apptemp-icon ) ).
*
*            ENDIF.
*            IF ls_apptemp IS NOT INITIAL.
*              lt_newpolicys = VALUE #( BASE  lt_newpolicys  ( policys = ls_policys-key value = ls_policys-value
*                                              policysdesc = ls_apptemp-title displayname = ls_apptemp-displayname
*                                              appicon = ls_apptemp-icon ) ).
*            ENDIF.
*          ENDIF.
*
*        ENDIF.
*        IF ls_policys-key EQ 'LongAssurePolicy'.
*          lv_havelasp = 'X'.
*        ENDIF.
*        CLEAR:ls_policys,ls_ztint_policys,ls_apptemp,ls_appploicy.
*      ENDLOOP.
      IF lt_newpolicys IS NOT INITIAL.
        MODIFY ztint_policys FROM TABLE lt_newpolicys.
      ENDIF.

*      IF lv_havelasp = 'X'."SKU有开思质保和超长质保就显示超长质保；没有超长质保就显示开思质保。--add at 2021.06.04
*        DELETE ls_item-orderitemspolicysset WHERE policys = 'CassQualityAssurePolicy'.
*      ENDIF.

****item total
      ls_item_total-cassdiscountamount = ls_orderitem-orderitempayment-cassdiscountamount + ls_item_total-cassdiscountamount.
      CONDENSE ls_item_total-cassdiscountamount.
      ls_item_total-coupon = ls_orderitem-orderitempayment-casscouponamount + ls_item_total-coupon.
      CONDENSE ls_item_total-coupon.
      ls_item_total-goldcoin = ls_orderitem-orderitempayment-goldcoincount + ls_item_total-goldcoin.
      CONDENSE ls_item_total-goldcoin.
      ls_item_total-totalamount = ls_orderitem-orderitempayment-buyeractualamount + ls_item_total-totalamount.
      CONDENSE ls_item_total-totalamount.
      ls_item_total-totalnum = ls_item_total-totalnum + 1.
      CONDENSE ls_item_total-totalnum.
      ls_item_total-totalquantity = ls_orderitem-quantity + ls_item_total-totalquantity.
      CONDENSE ls_item_total-totalquantity.

      ls_item-orderid = ls_orderitem-orderid.
      ls_item-orderitemseqid = ls_orderitem-orderitemseqid.
      ls_item-originalsellerprice = nosign_currency_formatter( ls_orderitem-orderitempayment-sellerprice ).
      ls_item-partsname = ls_orderitem-productname.
      ls_item-partsnum = ls_orderitem-internalnum."partsnum.
      ls_item-partsnumber = ls_orderitem-partsnum.
      SPLIT ls_orderitem-originalpartsnumtrim AT ',' INTO TABLE DATA(lt_originalpartsnum). "原厂零件号
      IF lt_originalpartsnum IS NOT INITIAL.
        ls_item-original_partsnum = VALUE #( lt_originalpartsnum[ 1 ] OPTIONAL ).
      ENDIF.
      CLEAR lt_originalpartsnum.
      ls_item-acturalamount = nosign_currency_formatter( ls_orderitem-orderitempayment-buyeractualamount ).
      ls_item-quality = ls_orderitem-quality.
      ls_item-qualityname =  ls_orderitem-qualityname .
*      ls_item-quantity = quantity_formatter( ls_orderitem-quantity ).
      ls_item-quantity = zcl_cassint_formatter=>remove_zero_formatter( ls_orderitem-quantity ).
      ls_item-whetherproductset = COND #( WHEN ls_orderitem-producttype EQ 'SUITE_PARTS' THEN 'X' ELSE '' ).
      ls_item-productsetversion = ls_orderitem-productversion.
      ls_item-productsetid = ls_orderitem-productid.
      ls_item-quoteid = ls_orderitem-quoteid.

      "拆车件处理
      lv_businessgroup = COND #( WHEN is_detail-orderheader-originalsource EQ 'PLATMALL' THEN 'PLATMALL'
                                 WHEN is_detail-orderheader-originalsource EQ 'INQUIRYORDER' THEN 'INQUIRY'
                                 WHEN is_detail-orderheader-originalsource EQ 'DIRECTIONAL' THEN 'DIRECTIONAL' ).
      lv_productid = COND #( WHEN is_detail-orderheader-originalsource EQ 'PLATMALL' THEN  ls_orderitem-productid
                             WHEN is_detail-orderheader-originalsource EQ 'INQUIRYORDER' OR
                                  is_detail-orderheader-originalsource EQ 'DIRECTIONAL' THEN ls_orderitem-quoteid ).
      IF lv_businessgroup IS NOT INITIAL.
        "拆车件查询
        lv_quotebody = |\{"businessGroup": "{ lv_businessgroup }","productIds": ["{ lv_productid }"]\}|.
        lo_order->get_order_quoteresource(
          EXPORTING
            iv_body          = lv_quotebody
          IMPORTING
            ev_msg           = DATA(ls_quotemsg)     " 返回参数
            et_quoteresource = DATA(lt_quoteresource)
        ).

        LOOP AT lt_quoteresource INTO DATA(ls_quoteresource).
          LOOP AT ls_quoteresource-imageanddescinfos INTO DATA(imageanddescinfos).
            ls_item-quoteresourceset = VALUE #( BASE ls_item-quoteresourceset
                                          (  mimetype = imageanddescinfos-resourcetype
                                             photodescription = imageanddescinfos-photodescription
                                             resourcesize = imageanddescinfos-resourcesize
                                             resourcevalue = imageanddescinfos-resourcevalue ) ).
          ENDLOOP.
          LOOP AT ls_quoteresource-descriptions INTO DATA(ls_descirp).
            ls_item-quoteremark  = COND #( WHEN ls_item-quoteremark IS INITIAL
                                              THEN |{ sy-tabix }、{ ls_descirp-descriptionvalue }|
                                           ELSE |{ ls_item-quoteremark }；{ sy-tabix }、{ ls_descirp-descriptionvalue }| ).
          ENDLOOP.

        ENDLOOP.
*        IF lt_quoteresource IS NOT INITIAL.
*          ls_item-quoteremark = |+{ lines( lt_quoteresource ) }|.
*        ENDIF.
      ENDIF.
      IF lv_deadline IS NOT INITIAL.
        zcl_cassint_formatter=>convert_java_timestamp_to_abap( EXPORTING iv_timestamp = lv_deadline
          IMPORTING ev_date = DATA(lv_deadlinedate) ev_time = DATA(lv_deadlinetime) ).
        ls_item-returndeadline = |{ lv_deadlinedate DATE = ISO } { lv_deadlinetime TIME = ISO }|.
      ENDIF.
      APPEND ls_item TO cs_entity-orderhomedetailitemsset.
      CLEAR: ls_item,lv_quotebody,lv_businessgroup,lv_productid,lt_quoteresource,ls_apppolicy..
    ENDLOOP.

    cs_entity-selleradjustment =  currency_formatter( EXACT string( cs_entity-selleradjustment ) )."抬头的钉箱费
****item total
    ls_item_total-cassdiscountamount = currency_formatter( EXACT string( ls_item_total-cassdiscountamount ) ).
    ls_item_total-coupon =  currency_formatter( EXACT string( ls_item_total-coupon ) ).
    ls_item_total-totalamount =  nosign_currency_formatter( EXACT string( ls_item_total-totalamount ) ).
*    ls_item_total-totalquantity = quantity_formatter(   ls_item_total-totalquantity  ).
    ls_item_total-totalquantity = zcl_cassint_formatter=>remove_zero_formatter(   ls_item_total-totalquantity  ).
    APPEND ls_item_total TO cs_entity-orderhomedetailitemheaderset.
    CLEAR ls_item_total.

****付款信息
    ls_payment-actualcurrencyamount = currency_formatter( is_detail-orderpayment-orderactualcurrencyamount ).
    ls_payment-cassdiscountamount =  currency_formatter( is_detail-orderpayment-cassdiscountamount ).
    ls_payment-garagepaymentstatusdesc = is_detail-orderpayment-garagepaymentstatusdesc.
    CONDENSE  ls_payment-garagepaymentstatusdesc.
    ls_payment-invoicediscount = is_detail-orderpayment-invoicediscount.
    CONDENSE ls_payment-invoicediscount.
    IF ls_payment-invoicediscount NE '0'.
*      ls_payment-invoicediscount = |{ quantity_formatter( EXACT string( ls_payment-invoicediscount ) ) }%|.
      ls_payment-invoicediscount = |{ zcl_cassint_formatter=>remove_zero_formatter( EXACT string( ls_payment-invoicediscount ) ) }%|.
      CONDENSE ls_payment-invoicediscount.
    ENDIF.
    ls_payment-invoicediscountamount = currency_formatter( is_detail-orderpayment-invoicediscountamount ).
    ls_payment-paymentfinishtime = is_detail-orderpayment-paymentfinishtime.
    CONDENSE ls_payment-paymentfinishtime.
    IF is_detail-orderpayment-paymentmethodtype EQ 'CASSLOAN'.
      ls_payment-paymentmethodtypedesc = '开思单结'.
    ELSE.
      ls_payment-paymentmethodtypedesc = is_detail-orderpayment-paymentmethodtypedesc.
      IF is_detail-orderpayment-paymentmethod IS NOT INITIAL.
        ls_payment-paymentmethodtypedesc = |{ ls_payment-paymentmethodtypedesc }({ is_detail-orderpayment-paymentmethoddesc })|.
      ENDIF.
      CONDENSE ls_payment-paymentmethodtypedesc.
    ENDIF.
    ls_payment-storediscountamount = currency_formatter( is_detail-orderpayment-storediscountamount ).
    APPEND ls_payment TO cs_entity-orderdetailpaymentsset.
    CLEAR ls_payment.

****订单备注信息
    LOOP AT is_detail-ordernotes INTO DATA(ls_note).
      CASE ls_note-orderrole.
        WHEN 'GARAGE'.
          cs_entity-noteinfoid = ls_note-noteid.
          cs_entity-noteinfo = ls_note-note."订单备注
        WHEN 'PLATFORM'.
          cs_entity-customerservicenoteid = ls_note-noteid.
          cs_entity-customerservicenote = ls_note-note."客服留言
        WHEN OTHERS.
      ENDCASE.
    ENDLOOP.

    LOOP AT is_detail-waydetails INTO DATA(ls_waydetail).
      READ TABLE is_detail-displaylogisticsinfos INTO DATA(ls_logisinfo) WITH KEY facilityid = ls_waydetail-facilityid.
      cs_entity-orderdetaillogisinfoset = VALUE #( BASE cs_entity-orderdetaillogisinfoset
      ( facilityname = |{ ls_waydetail-facilityname }发货| wholion = COND #( WHEN ls_waydetail-wholion IS NOT INITIAL THEN ls_waydetail-company ELSE '' )
        sendinfo = COND #( WHEN ls_waydetail-wholion IS NOT INITIAL
                               THEN | { COND #( WHEN ls_waydetail-wholioncarmodel EQ 'electric' THEN '电单车 '
                                                                        WHEN ls_waydetail-wholioncarmodel EQ 'minivan' THEN '微面 ' ) }| &&
                                    | { ls_waydetail-deliverytimedesc } { ls_logisinfo-displaylogisticsfees }|
                            ELSE |/{ ls_waydetail-company } { ls_waydetail-transportationname } | &&
                            |{ ls_waydetail-displayshiftname }| && COND #( WHEN ls_waydetail-departuretime IS NOT INITIAL THEN | ({ ls_waydetail-departuretime })| ) &&
                            | { ls_waydetail-displaylocation }| && COND #( WHEN ls_waydetail-location IS NOT INITIAL THEN | ({ ls_waydetail-location })| ) &&
                            | { ls_logisinfo-displaylogisticsfees }|  )
       ) ).
      CLEAR:ls_waydetail,ls_logisinfo.
    ENDLOOP.

    IF lt_ztint_adjustment_new IS NOT INITIAL.
      MODIFY ztint_adjustment FROM TABLE lt_ztint_adjustment_new.
    ENDIF.
*    IF lines( is_detail-displaylogisticsinfos ) > 1.
*      LOOP AT is_detail-displaylogisticsinfos INTO DATA(ls_logisinfo).
*        cs_entity-orderdetaillogisfeeset = VALUE #( BASE cs_entity-orderdetaillogisfeeset
*             ( displaycompany = ls_logisinfo-displaycompany
*               displaylogisticsfees = ls_logisinfo-displaylogisticsfees ) ).
*      ENDLOOP.
*    ENDIF.
  ENDMETHOD.


  METHOD set_order_overview.
    TYPES:BEGIN OF ty_status_num,
            statusid TYPE c LENGTH 50,
            num      TYPE i,
          END OF ty_status_num.
    DATA:lv_couponamount TYPE zde_intamount.
    DATA:lv_orderamount TYPE zde_intamount.
    DATA: lv_goldcoinamount TYPE zde_intamount.
    DATA: lv_flowdiscountamount TYPE zde_intamount.
    DATA: lv_payonlinediscountamount TYPE zde_intamount.
    DATA: lv_cassdiscountamount TYPE zde_intamount.
    DATA: lv_discountamount TYPE zde_intamount.
    DATA: lv_tmsfee TYPE zde_intamount.
    DATA: ls_status_num TYPE ty_status_num,
          lt_status_num TYPE STANDARD TABLE OF ty_status_num.
    DATA: lr_exprot TYPE /iwbep/t_cod_select_options.

    DATA:lt_followinf     TYPE STANDARD TABLE OF zord_s_trail,
         lt_follow_latest TYPE STANDARD TABLE OF zord_s_trail,
         lt_trail         TYPE STANDARD TABLE OF zord_s_trail,
         ls_trail         TYPE zord_s_trail.
*    DATA: lt_orderitem TYPE STANDARD TABLE OF zord_s_order_i,
*          ls_orderitem TYPE zord_s_order_i.
    CHECK it_order IS NOT INITIAL.
**支付信息
    SELECT  orderid,
            paymentmethodtypeid,
            paymentmethodtypedesc,
            garagepaymentstatusdesc,
            paymentmethoddesc,
            shipfee,
            goldcoinamount,
            couponamount,
            flowdiscountamount,
            payonlinediscountamount,
            actualcurrencyamount,
            cassdiscountamount
       FROM zticec_payments
       INTO TABLE @DATA(lt_payments)
        FOR ALL ENTRIES IN @it_order
      WHERE paymentmethodtypeid IN @so_paymentmethodtypeid
        AND orderid = @it_order-orderid.
    SORT lt_payments BY  orderid.

** SKU汇总
*    SELECT orderid,
*           quantity
*      FROM zticec_order_i
*      INTO TABLE @DATA(lt_order_i)
*      FOR ALL ENTRIES IN @it_order
*        WHERE  orderid = @it_order-orderid.
*    IF sy-subrc EQ 0.
*      SORT lt_order_i BY  orderid.
*      LOOP AT lt_order_i INTO DATA(ls_order_i).
*        ls_orderitem-orderid = ls_order_i-orderid.
*        IF ls_orderitem-needcount IS INITIAL.
*          ls_orderitem-needcount =  ls_order_i-quantity.
*        ELSE.
*          ls_orderitem-needcount = ls_orderitem-needcount + ls_order_i-quantity.
*        ENDIF.
*
*        AT END OF orderid.
*          APPEND ls_orderitem TO lt_orderitem.
*          CLEAR ls_orderitem.
*        ENDAT.
*      ENDLOOP.
*    ENDIF.

*  取客户经理名称
    IF mv_type = 1 AND mv_cus_condition IS NOT INITIAL.
      IF iv_isdelete NE 'X'.
        SELECT u~cusid,u~userid,i~username INTO TABLE @DATA(lt_cususer)
          FROM ztint_cus_user AS u
         INNER JOIN ztint_user_inf AS i
            ON u~userid = i~userid
          FOR ALL ENTRIES IN @it_order_cus
          WHERE cusid = @it_order_cus-cusid
          AND isdelete = ''
          AND usertype = '1'.
      ELSE.
        "回收站客户去前任经理
        SELECT u~cusid,u~userid,i~username INTO TABLE @lt_cususer
         FROM ztint_cus_user AS u
        INNER JOIN ztint_user_inf AS i
           ON u~userid = i~userid
         FOR ALL ENTRIES IN @it_order_cus
         WHERE cusid = @it_order_cus-cusid
         AND ispre = 'X'
         AND usertype = '1'.
      ENDIF.

*  获取战区名称
      SELECT zoneid,zonename FROM ztcass_custzone INTO TABLE @DATA(lt_custzone)
         FOR ALL ENTRIES IN @it_order_cus
         WHERE zoneid = @it_order_cus-zoneid.
      SORT lt_custzone BY zoneid.
      DELETE ADJACENT DUPLICATES FROM lt_custzone COMPARING  zoneid.

    ELSE.
      IF iv_isdelete NE 'X'.

        SELECT u~cusid,u~userid,i~username
          INTO TABLE @lt_cususer
          FROM ztint_cus_user AS u
          INNER JOIN ztint_user_inf AS i ON u~userid = i~userid
          FOR ALL ENTRIES IN @it_order
          WHERE cusid = @it_order-cusid
          AND isdelete = ''
          AND usertype = '1'.
      ELSE.

        SELECT u~cusid,u~userid,i~username
         INTO CORRESPONDING FIELDS OF TABLE @lt_cususer
         FROM ztint_cus_user AS u
         INNER JOIN ztint_user_inf AS i ON u~userid = i~userid
         FOR ALL ENTRIES IN @it_order
         WHERE cusid = @it_order-cusid
         AND ispre = 'X'
         AND usertype = '1'.
      ENDIF.
    ENDIF.
    SORT lt_cususer BY cusid.

*  获取战区名称
    SELECT zoneid,zonename FROM ztcass_custzone
      INTO TABLE @lt_custzone
       FOR ALL ENTRIES IN @it_order
       WHERE zoneid = @it_order-zoneid.
    SORT lt_custzone BY zoneid.
    DELETE ADJACENT DUPLICATES FROM lt_custzone COMPARING  zoneid.
*    ENDIF.


*  供应商拓展人员
    SELECT i~productstoreid,v~userid,u~username
      FROM ztint_ven_user AS v
      INNER JOIN ztint_ven_inf AS i ON v~venid = i~venid
      INNER JOIN ztint_user_inf AS u ON v~userid = u~userid
      INTO TABLE @DATA(lt_venuser)
      FOR ALL ENTRIES IN @it_order
      WHERE productstoreid = @it_order-productstoreid
       AND usertype = '1'
       AND isdelete = ''.
    SORT lt_venuser BY productstoreid.


* 跟进类型F4 跟进来源F4 "订单来源F4
    SELECT fnam,val_low,text INTO TABLE @DATA(lt_f4config) FROM ztbc_f4_config
      WHERE fnam = 'ZICERP_MT_ORIGINALSOURCE'
      OR fnam = 'ZICERP_CASSINT_FOLLOWSOURCE'
      OR fnam = 'ZICERP_CASSINT_FOLLOWTYPE'.
    SORT lt_f4config BY fnam val_low .

* 跟进信息
    SELECT * FROM ztint_follow_inf INTO CORRESPONDING FIELDS OF TABLE @lt_followinf
      FOR ALL ENTRIES IN @it_order WHERE billno = @it_order-billno.

    IF sy-subrc EQ 0.
      lt_follow_latest = lt_followinf.
      SORT lt_follow_latest BY billno followdate  DESCENDING  followtime DESCENDING .
      DELETE ADJACENT DUPLICATES FROM lt_follow_latest COMPARING billno.

      SORT lt_followinf  BY billno.
      LOOP AT lt_followinf INTO DATA(ls_followinf).
        ls_trail-billno = ls_followinf-billno.
        IF ls_followinf-followremark IS NOT INITIAL.
          IF ls_trail-followremark IS INITIAL.
            ls_trail-followremark = |{ ls_followinf-partsname }({ ls_followinf-followremark })|.
          ELSE.
            ls_trail-followremark = |{ ls_trail-followremark };{ ls_followinf-partsname }({ ls_followinf-followremark })|.
          ENDIF.
        ENDIF.

        IF ls_followinf-followtype IS NOT INITIAL.
          READ TABLE lt_f4config INTO DATA(ls_f4config) WITH KEY fnam = 'ZICERP_CASSINT_FOLLOWTYPE'
                                                                 val_low = ls_followinf-followtype
                                                        BINARY SEARCH .
          IF sy-subrc EQ 0.
            IF ls_trail-followtypedesc IS INITIAL.
              ls_trail-followtypedesc = |{ ls_f4config-text }|.
            ELSE.
              ls_trail-followtypedesc = |{ ls_trail-followtypedesc };{ ls_f4config-text }|.
            ENDIF.
            CLEAR ls_f4config.
          ENDIF.
        ENDIF.

        IF ls_followinf-followsource IS NOT INITIAL.
          READ TABLE lt_f4config INTO ls_f4config WITH KEY fnam = 'ZICERP_CASSINT_FOLLOWSOURCE'
                                                             val_low = ls_followinf-followsource
                                                    BINARY SEARCH .
          IF sy-subrc EQ 0.
            IF ls_trail-followsourcedesc IS INITIAL.
              ls_trail-followsourcedesc = |{ ls_f4config-text }|.
            ELSE.
              ls_trail-followsourcedesc = |{ ls_trail-followsourcedesc };{ ls_f4config-text }|.
            ENDIF.
            CLEAR ls_f4config.
          ENDIF.
        ENDIF.

        AT END OF billno.
          APPEND ls_trail TO lt_trail.
          CLEAR ls_trail.
        ENDAT.
      ENDLOOP.

    ENDIF.
    SORT lt_trail BY billno.

    IF iv_export IS NOT INITIAL.
      "取可导出数据
      SELECT 'I' AS sign, 'EQ' AS option,
        CASE type
       	  WHEN 'C' THEN companyid
       	  WHEN 'V' THEN productstoreid
        END AS low
         FROM ztint_export_cf
        INTO CORRESPONDING FIELDS OF TABLE @lr_exprot
        WHERE userid = @mv_userid.
      "记录日志
    ENDIF.
    DATA: lv_export_flag TYPE c.

    DATA:lt_cassintorderhomeset  TYPE STANDARD TABLE OF zcl_zgs_icerp_cassint_mpc_ext=>ts_order_adj.
    DATA:ls_data_item  TYPE zcl_zgs_icerp_cassint_mpc_ext=>ts_order_adj,
         ls_adjustment TYPE zsint_order_items_adjustment.
    DATA:ls_export TYPE zord_s_ord_excel,
         lt_export TYPE zord_t_ord_excel.
    DATA:l_tabix TYPE i.
    CLEAR er_deep_entity-cassintorderhomeset.

    LOOP AT it_order INTO DATA(ls_order).
      IF iv_export  = 'X'.     "增加导出限制
        CLEAR lv_export_flag.
        IF lr_exprot IS NOT INITIAL AND ( ls_order-custcompanyid IN lr_exprot
          OR ls_order-productstoreid IN lr_exprot ) .
          lv_export_flag = 'X'.
        ELSEIF lr_exprot IS INITIAL.
          lv_export_flag = 'X'.
        ELSE.
          CONTINUE.
        ENDIF.
      ENDIF.
****
      IF mv_type EQ 1 AND mv_cus_condition IS NOT INITIAL.
        READ TABLE it_order_cus INTO DATA(ls_order_cus) WITH KEY companyid = ls_order-custcompanyid BINARY SEARCH.
        IF sy-subrc EQ 0.
          ls_order-cusid = ls_order_cus-cusid.
          ls_order-displayname = ls_order_cus-displayname.
          ls_order-companyid = ls_order_cus-companyid.
          ls_order-companycode = ls_order_cus-companycode.
          ls_order-provincegeoid = ls_order_cus-provincegeoid.
          ls_order-provincegeoname = ls_order_cus-provincegeoname.
          ls_order-citygeoid = ls_order_cus-citygeoid.
          ls_order-citygeoname = ls_order_cus-citygeoname.
          ls_order-countygeoid = ls_order_cus-countygeoid.
          ls_order-countygeoname = ls_order_cus-countygeoname.
          ls_order-zoneid = ls_order_cus-zoneid.
        ENDIF.
      ENDIF.
**** SKU
*      READ TABLE lt_orderitem INTO DATA(ls_orderitem_i) WITH KEY orderid = ls_order-orderid BINARY SEARCH.
*      IF sy-subrc EQ 0.
*        ls_data_item-needcount  = ls_orderitem_i-needcount."SKU总数
*        ls_data_item-needcount = zcl_cassint_formatter=>remove_zero_formatter( EXACT string( ls_data_item-needcount  )  ).
*        CONDENSE ls_data_item-needcount NO-GAPS .
*        CLEAR ls_orderitem_i.
*      ENDIF.

****订单状态--所有的单都应该有订单状态
      READ TABLE it_order_status INTO DATA(ls_status) WITH KEY orderid = ls_order-orderid BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data_item-statusid = ls_status-statusid."状态ID
        ls_data_item-statusiddesc = ls_status-statusiddesc."状态描述
        IF ls_status-statusid = 'ORDER_CANCELLED'.
          ls_data_item-cancelleddate = ls_status-lastupdatedstamp."取消时间
          ls_data_item-changdesc = ls_status-changdesc."取消原因
        ENDIF.
        CLEAR ls_status.
      ELSE.
        ls_data_item-statusid = ls_order-statusid.
        ls_data_item-statusiddesc = ls_order-statusiddesc.
      ENDIF.

****支付方式及订单金额判断。
      READ TABLE lt_payments INTO DATA(ls_payments) WITH  KEY orderid = ls_order-orderid BINARY SEARCH.
      IF sy-subrc NE 0 AND so_paymentmethodtypeid  IS NOT INITIAL."当支付方式筛选不为空时.
        CONTINUE.
      ELSE.
        DATA(lv_index) = sy-tabix.
        DATA(lv_orderid) = ls_payments-orderid.
        LOOP AT lt_payments INTO ls_payments FROM lv_index.
          IF lv_orderid NE ls_payments-orderid.
            EXIT.
          ELSE.
            lv_index = lv_index + 1.
            IF ls_payments-paymentmethodtypeid = 'PAY_ONLINE'."在线支付
              ls_data_item-paymentmethodtypeid = ls_payments-paymentmethodtypeid.
              ls_data_item-paymentmethodtypedesc = ls_payments-garagepaymentstatusdesc.
              IF ls_payments-paymentmethoddesc IS NOT INITIAL .
                ls_data_item-paymentmethodtypedesc = ls_payments-paymentmethodtypedesc && '-' && ls_payments-paymentmethoddesc .
              ENDIF.
            ELSE.
              ls_data_item-paymentmethodtypeid = ls_payments-paymentmethodtypeid.
              ls_data_item-paymentmethodtypedesc = ls_payments-paymentmethodtypedesc.
            ENDIF.

            IF ls_payments-shipfee IS NOT INITIAL.
              ls_data_item-tmsfee = ls_payments-shipfee  ."运费
            ELSE.
              ls_data_item-tmsfee = ''.
            ENDIF.
            lv_tmsfee = lv_tmsfee + ls_payments-shipfee."运费汇总
            "优惠信息
            IF ls_payments-goldcoinamount IS NOT INITIAL.
              ls_adjustment-adjustmenttypedesc = '金币抵扣:'.
              ls_adjustment-buyyeradjustment = currency_formatter( EXACT string( ls_payments-goldcoinamount ) ).
              APPEND ls_adjustment TO ls_data_item-orderdetailitemsadjustmentset.
              CLEAR ls_adjustment.
              IF so_statusid IS INITIAL OR ls_data_item-statusid IN so_statusid.
                lv_goldcoinamount = lv_goldcoinamount + ls_payments-goldcoinamount. "金币汇总
              ENDIF.
            ENDIF.

            IF ls_payments-couponamount IS NOT INITIAL.
              ls_adjustment-adjustmenttypedesc = '开思优惠:'.
              ls_adjustment-buyyeradjustment = currency_formatter( EXACT string( ls_payments-couponamount ) ).
              APPEND ls_adjustment  TO ls_data_item-orderdetailitemsadjustmentset.
              CLEAR ls_adjustment.
              IF so_statusid IS INITIAL OR ls_data_item-statusid IN so_statusid.
                lv_couponamount = lv_couponamount + ls_payments-couponamount. "优惠券汇总
              ENDIF.
            ENDIF.
            IF ls_payments-flowdiscountamount IS NOT INITIAL.
              ls_adjustment-adjustmenttypedesc = '开思立减:'.
              ls_adjustment-buyyeradjustment = currency_formatter( EXACT string( ls_payments-flowdiscountamount ) ).
              APPEND ls_adjustment  TO ls_data_item-orderdetailitemsadjustmentset.
              CLEAR ls_adjustment.
              IF so_statusid IS INITIAL OR ls_data_item-statusid IN so_statusid.
                lv_flowdiscountamount = lv_flowdiscountamount + ls_payments-flowdiscountamount. "流量调节总额
              ENDIF.
            ENDIF.
            IF ls_payments-payonlinediscountamount IS NOT INITIAL.
              ls_adjustment-adjustmenttypedesc = '现付优惠:'.
              ls_adjustment-buyyeradjustment = currency_formatter( EXACT string( ls_payments-payonlinediscountamount ) ).
              APPEND ls_adjustment  TO ls_data_item-orderdetailitemsadjustmentset.
              CLEAR ls_adjustment.
              IF so_statusid IS INITIAL OR ls_data_item-statusid IN so_statusid.
                lv_payonlinediscountamount = lv_payonlinediscountamount + ls_payments-payonlinediscountamount."现付优惠总额
              ENDIF.
            ENDIF.
            ls_data_item-actualcurrencyamount = currency_formatter( EXACT string( ls_payments-actualcurrencyamount ) )."订单金额
            ls_data_item-cassdiscountamount = ls_data_item-cassdiscountamount + ls_payments-cassdiscountamount."开思券金额

            CLEAR ls_payments.

          ENDIF.
        ENDLOOP.
        CONDENSE ls_data_item-tmsfee NO-GAPS.
        IF ls_data_item-tmsfee EQ '0.00'.
          ls_data_item-tmsfee = ''.
        ENDIF.

        CLEAR: lv_index,lv_orderid.
      ENDIF.

*******订单总额的获取没有使用payment上的值，使用的是order_h表中的值
      IF so_statusid IS INITIAL OR ls_data_item-statusid IN so_statusid.
        lv_orderamount =  lv_orderamount +  ls_order-actualcurrencyamount."订单总额
      ENDIF.

      ls_data_item-citygeoid  = ls_order-citygeoid."市编码
      ls_data_item-cityname = ls_order-citygeoname."城市
      ls_data_item-provincename = ls_order-provincegeoname.  "省
      ls_data_item-zoneid = ls_order-zoneid."  战区ID
      READ TABLE lt_custzone INTO DATA(ls_custzone) WITH KEY zoneid = ls_order-zoneid BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data_item-zonename = ls_custzone-zonename."战区名称
        CLEAR ls_custzone.
      ENDIF.

      ls_data_item-address = ls_order-address."地址
      ls_data_item-carbrandid  = ls_order-carbrandid."车型品牌
      ls_data_item-carbrandname  = ls_order-carbrandname."车型品牌描述
      ls_data_item-companycode  = ls_order-companycode."公司code
      ls_data_item-contactnumber  = ls_order-contactnumber."手机
      ls_data_item-contacttel  = ls_order-contacttel."电话
      ls_data_item-countryname  = ls_order-countryname."区
      ls_data_item-createdate  = ls_order-createdate."订单创建日期
      ls_data_item-createdby  = ls_order-createdby."下单人ID
      ls_data_item-createdname  = ls_order-createdname."下单人名称
      ls_data_item-createtime  = ls_order-createtime."订单创建时间
      READ TABLE lt_cususer INTO DATA(ls_cususer) WITH KEY cusid = ls_order-cusid BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data_item-userid = ls_cususer-userid."客户经理ID
        ls_data_item-cuname  = ls_cususer-username."客户经理
        CLEAR ls_cususer.
      ENDIF.
      ls_data_item-cusname  = ls_order-cusname."收货名称
      ls_data_item-custcompanyid  = ls_order-custcompanyid."EC客户ID
      ls_data_item-custcompanyname  = ls_order-displayname."EC客户名称
      ls_data_item-customerid  = ls_order-customerid."下单人ID
      ls_data_item-customername  = ls_order-customername."下单人名称
      ls_data_item-inquirytype  = ls_order-inquirytype."询价类型
      ls_data_item-licpl  = ls_order-licpl."车牌号
      ls_data_item-orderdate  = ls_order-orderdate."下单日期
      ls_data_item-orderid  = ls_order-orderid."订单ID
      ls_data_item-ordername  = ls_order-ordername."订单描述
      ls_data_item-ordertypeid  = ls_order-ordertypeid."订单类型
      ls_data_item-originalorderid  = ls_order-originalorderid."原订单ID
      ls_data_item-originalsourcedesc  = ls_order-originalsourcedesc."订单源名称
      ls_data_item-productstorecompany  = ls_order-productstorecompany."店铺公司名称
      ls_data_item-productstoreid  = ls_order-productstoreid."EC店铺ID
      ls_data_item-productstorename  = ls_order-productstorename."店铺名称
      ls_data_item-internalcode   = ls_order-internalcode."排除订单
      ls_data_item-shoppinglistid   = ls_order-shoppinglistid."询价单
      ls_data_item-toname   = ls_order-toname."收货人
      ls_data_item-vhvin   = ls_order-vhvin."车辆标识号
      ls_data_item-vkorg   = ls_order-vkorg."销售组织
      ls_data_item-waydetail   = ls_order-waydetail."配送方式
      ls_data_item-needcount = ls_order-skunum."SKU数量

* 是否开票
      IF ls_order-invoicetype = 'A'.
        ls_data_item-invoicetype = '是'.
      ELSEIF ls_order-invoicetype = 'B'.
        ls_data_item-invoicetype = '否'.
      ENDIF.
* 供应商拓展
      READ TABLE lt_venuser INTO DATA(ls_venuser) WITH  KEY productstoreid = ls_order-productstoreid BINARY SEARCH.
      IF sy-subrc = 0.
        ls_data_item-vuname = ls_venuser-username.
        CLEAR ls_venuser.
      ENDIF.
* 订单来源描述
      ls_data_item-originalsource = ls_order-originalsource."  订单源
      TRANSLATE ls_order-originalsource TO UPPER CASE.
      READ TABLE  lt_f4config INTO ls_f4config WITH KEY fnam = 'ZICERP_MT_ORIGINALSOURCE'
                                                              val_low = ls_order-originalsource
                                                     BINARY SEARCH .
      IF sy-subrc EQ 0.
        ls_data_item-originalsourcedesc = ls_f4config-text.
        CLEAR ls_f4config.
      ENDIF.

* 订单跟进信息开始
      READ TABLE lt_trail INTO ls_trail WITH KEY billno = ls_order-orderid BINARY SEARCH .
      IF sy-subrc EQ 0.
        ls_data_item-followremark  = ls_trail-followremark.
        ls_data_item-followtypedesc =  ls_trail-followtypedesc.
        ls_data_item-followsourcedesc = ls_trail-followsourcedesc.
        CLEAR ls_trail.
      ENDIF.
****最新跟进信息
      READ TABLE lt_follow_latest INTO ls_trail WITH KEY billno = ls_order-orderid BINARY SEARCH.
      IF sy-subrc = 0.
        ls_data_item-followname = ls_trail-followname.
        CLEAR ls_trail.
      ENDIF.
      ls_data_item-sno = l_tabix + 1.
      CONDENSE ls_data_item-sno.
      l_tabix = l_tabix + 1.
      APPEND ls_data_item TO er_deep_entity-cassintorderhomeset.
*****状态汇总
      ls_status_num-statusid = ls_data_item-statusid.
      ls_status_num-num = 1.
      COLLECT ls_status_num INTO lt_status_num.
      CLEAR ls_status_num.
      IF iv_export IS NOT INITIAL.
        ls_data_item-actualcurrencyamount = un_currency_formatter( EXACT string( ls_data_item-actualcurrencyamount ) ).
        MOVE-CORRESPONDING ls_data_item TO ls_export.
        APPEND ls_export TO lt_export.
      ENDIF.
      CLEAR:ls_export,ls_data_item.
    ENDLOOP.

    IF iv_export = 'X'.
* 保存日志

      DATA:l_keyvaule1 TYPE zde_key_value,
           l_keyvaule2 TYPE zde_key_value.
      l_keyvaule1 = mv_userid.
      l_keyvaule2 = mv_username.

      CALL FUNCTION 'Z_FMINT_LOG_SAVE'
        EXPORTING
          iv_event_id   = 'ORDERHOMEEXPORT'
          iv_event_desc = '开思助手订单导出！'
          iv_status     = 'S'
          iv_key_value1 = l_keyvaule1
          iv_key_value2 = l_keyvaule2
          iv_zcrt_bdate = sy-datum
          iv_zcrt_btime = sy-uzeit.

      CHECK is_excellist-filename IS NOT INITIAL.
      create_order_excel( it_order = lt_export is_excellist = is_excellist ).

    ELSE.

      er_deep_entity-totalnum =  lines( er_deep_entity-cassintorderhomeset ) .                          "所有订单
      SORT lt_status_num BY statusid.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_CREATED' BINARY SEARCH ."等待商家确认数量
      er_deep_entity-waitvendorconfirmnum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_WAIT_PAYED' BINARY SEARCH ."等待买家付款数量
      er_deep_entity-waitcuspaynum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_APPROVED' BINARY SEARCH ."待发货数量
      er_deep_entity-waitdelivernum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_SENT' BINARY SEARCH ."已发货数量
      er_deep_entity-deliverdnum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_RETURN_APPROVE' BINARY SEARCH ."退货审核中数量
      er_deep_entity-returnchecknum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_CANCELLING' BINARY SEARCH ."取消中数量
      er_deep_entity-cancellingnum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_CANCELLED' BINARY SEARCH ."已取消数量
      er_deep_entity-cancelednum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_COMPLETED' BINARY SEARCH ."已完成数量
      er_deep_entity-completenum = ls_status_num-num.
      CONDENSE er_deep_entity-waitvendorconfirmnum .
      CONDENSE er_deep_entity-waitcuspaynum .
      CONDENSE er_deep_entity-waitdelivernum .
      CONDENSE er_deep_entity-deliverdnum .
      CONDENSE er_deep_entity-returnchecknum .
      CONDENSE er_deep_entity-cancellingnum .
      CONDENSE er_deep_entity-cancelednum .
      CONDENSE er_deep_entity-completenum .

*******各状态下的金额
      lv_cassdiscountamount = lv_goldcoinamount + lv_couponamount + lv_flowdiscountamount + lv_payonlinediscountamount."开思券汇总
      WRITE lv_cassdiscountamount TO er_deep_entity-cassdiscountamout."开思券总额
      WRITE lv_goldcoinamount TO er_deep_entity-goldcoinamount."金币总额
      WRITE lv_couponamount TO  er_deep_entity-couponamount."优惠总额
      WRITE lv_flowdiscountamount TO er_deep_entity-flowdiscountamount."流量调节总额
      WRITE lv_payonlinediscountamount TO er_deep_entity-payonlinediscountamount."现付优惠总额
      WRITE lv_orderamount TO   er_deep_entity-orderamount ."订单总额
      WRITE lv_tmsfee TO er_deep_entity-tmsfee."运费汇总


****删除不在状态下的单据
      IF so_statusid IS NOT INITIAL.
        DELETE er_deep_entity-cassintorderhomeset WHERE statusid NOT IN so_statusid.
      ENDIF.
      er_deep_entity-statustotalnum = lines( er_deep_entity-cassintorderhomeset ).

      "排序
*      IF so_orderby IS NOT INITIAL.
*        DATA:lt_otab  TYPE abap_sortorder_tab.
*        DATA: ls_line LIKE LINE OF lt_otab .
*        LOOP AT  so_orderby INTO DATA(ls_orderby).
*          CLEAR ls_line.
*          IF ls_orderby-low = 'ASCCANCELLED'.
*            ls_line-name = 'CANCELLEDDATE'.
*            APPEND ls_line TO lt_otab.
*          ELSEIF   ls_orderby-low = 'DESCANCELLED'.
*            ls_line-name = 'CANCELLEDDATE'.
*            ls_line-descending = 'X'.
*            APPEND ls_line TO lt_otab.
*          ELSEIF   ls_orderby-low = 'ASCFOLLOWTYPEDESC'.
*            ls_line-name = 'FOLLOWTYPEDESC'.
*            APPEND ls_line TO lt_otab.
*          ELSEIF   ls_orderby-low = 'DESFOLLOWTYPEDESC'.
*            ls_line-name = 'FOLLOWTYPEDESC'.
*            ls_line-descending = 'X'.
*            APPEND ls_line TO lt_otab.
*          ENDIF..
*          CLEAR ls_orderby.
*        ENDLOOP.
*      ENDIF.

      DATA:lt_otab  TYPE abap_sortorder_tab.
      lt_otab = VALUE #( FOR wa IN so_orderby ( name = COND #( WHEN wa-low = 'ASCCANCELLED' THEN 'CANCELLEDDATE'
                                                               WHEN wa-low = 'DESCANCELLED' THEN 'CANCELLEDDATE'
                                                               WHEN wa-low = 'ASCFOLLOWTYPEDESC' THEN 'FOLLOWTYPEDESC'
                                                               WHEN wa-low = 'DESFOLLOWTYPEDESC' THEN 'FOLLOWTYPEDESC' )
                                                descending = COND #( WHEN wa-low = 'DESCANCELLED' OR  wa-low = 'DESFOLLOWTYPEDESC' THEN 'X'
                                                                     ELSE '' )
                                                )
                        ).





      IF lt_otab IS NOT INITIAL.
        SORT er_deep_entity-cassintorderhomeset BY (lt_otab).
      ELSE.
        SORT er_deep_entity-cassintorderhomeset BY createdate DESCENDING  createtime DESCENDING.
      ENDIF.
      .
      DATA: lv_from TYPE int4,
            lv_to   TYPE int4.
      DATA: lv_total TYPE int4.
      DATA: lv_pagetotal TYPE int4.
      DATA: lv_mod TYPE   int4.
      DATA: lv_page TYPE int4,
            lv_size TYPE int4.
      "分页
      IF iv_page IS INITIAL . "没有这显示第一页
        lv_page = 1.
      ELSE.
        lv_page = iv_page.
      ENDIF.

      IF iv_size IS INITIAL. "没有则默认50条
        lv_size = 20.
      ELSE.
        lv_size = iv_size.
      ENDIF.

      lv_total = er_deep_entity-statustotalnum. "总条数
      lv_mod = lv_total MOD lv_size.
      lv_pagetotal = lv_total DIV lv_size. "总页数
      IF lv_mod NE 0.
        lv_pagetotal = lv_pagetotal + 1.
      ENDIF.

      IF lv_page > lv_pagetotal. "当前页数不能大于总页数
        RETURN.
      ENDIF.

      lv_from = ( lv_page - 1 ) * lv_size + 1."条数开始
      lv_to = lv_page * lv_size."条数结束

      er_deep_entity-pagetotal = lv_pagetotal."总页数
      CONDENSE er_deep_entity-pagetotal.
      "  er_deep_entity-statustotalnum = lv_total.
      CONDENSE er_deep_entity-statustotalnum.

*      MOVE-CORRESPONDING er_deep_entity TO er_deep_entity.
*      CLEAR er_deep_entity-cassintorderhomeset.

      APPEND LINES OF er_deep_entity-cassintorderhomeset FROM lv_from TO lv_to TO lt_cassintorderhomeset.
      CLEAR er_deep_entity-cassintorderhomeset.
      er_deep_entity-cassintorderhomeset = lt_cassintorderhomeset.

      LOOP AT er_deep_entity-cassintorderhomeset ASSIGNING FIELD-SYMBOL(<fs>).
        <fs>-sno = lv_from.
        CONDENSE <fs>-sno.
        lv_from = lv_from + 1.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.


  METHOD set_order_overview_new.
    TYPES:BEGIN OF ty_status_num,
            statusid TYPE c LENGTH 50,
            num      TYPE i,
          END OF ty_status_num.
    TYPES:BEGIN OF ty_payment,
            orderid                      TYPE zticec_payments-orderid,
            paymentmethodtypeid(100)     TYPE c,
            paymentmethodtypeiddesc(100) TYPE c,
            shipfee                      TYPE zticec_payments-shipfee,
            goldcoinamount               TYPE zticec_payments-goldcoinamount,
            couponamount                 TYPE zticec_payments-couponamount,
            flowdiscountamount           TYPE zticec_payments-flowdiscountamount,
            payonlinediscountamount      TYPE zticec_payments-payonlinediscountamount,
            actualcurrencyamount         TYPE zticec_payments-actualcurrencyamount,
            cassdiscountamount           TYPE zticec_payments-cassdiscountamount,
          END OF ty_payment.
    DATA:lv_couponamount TYPE zde_intamount.
    DATA:lv_orderamount TYPE zde_intamount.
    DATA: lv_goldcoinamount TYPE zde_intamount.
    DATA: lv_flowdiscountamount TYPE zde_intamount.
    DATA: lv_payonlinediscountamount TYPE zde_intamount.
    DATA: lv_cassdiscountamount TYPE zde_intamount.
    DATA: lv_discountamount TYPE zde_intamount.
    DATA: lv_tmsfee TYPE zde_intamount.
    DATA: ls_status_num TYPE ty_status_num,
          lt_status_num TYPE STANDARD TABLE OF ty_status_num.
    DATA: lr_exprot TYPE /iwbep/t_cod_select_options.
    DATA: lv_export_flag TYPE c.
    DATA:lt_cassintorderhomeset  TYPE STANDARD TABLE OF zcl_zgs_icerp_cassint_mpc_ext=>ts_order_adj.
    DATA:ls_data_item  TYPE zcl_zgs_icerp_cassint_mpc_ext=>ts_order_adj,
         ls_adjustment TYPE zsint_order_items_adjustment.
    DATA:ls_export TYPE zord_s_ord_excel,
         lt_export TYPE zord_t_ord_excel.
    DATA:lt_payments TYPE STANDARD TABLE OF ty_payment,
         ls_payments TYPE ty_payment.
    DATA:l_tabix TYPE i.

    DATA:lt_followinf     TYPE STANDARD TABLE OF zord_s_trail,
         lt_follow_latest TYPE STANDARD TABLE OF zord_s_trail,
         lt_trail         TYPE STANDARD TABLE OF zord_s_trail,
         ls_trail         TYPE zord_s_trail.
    DATA:lv_from      TYPE int4,
         lv_to        TYPE int4,
         lv_total     TYPE int4,
         lv_pagetotal TYPE int4,
         lv_mod       TYPE   int4,
         lv_page      TYPE int4,
         lv_size      TYPE int4.

**支付信息
    SELECT orderid,paymentid,paymentmethodtypeid,paymentmethodtypedesc,
            shipfee,goldcoinamount,couponamount,flowdiscountamount,
            payonlinediscountamount,actualcurrencyamount,cassdiscountamount
         FROM zticec_payments INTO TABLE @DATA(lt_payments_tmp)
         FOR ALL ENTRIES IN @it_order
         WHERE paymentmethodtypeid IN @so_paymentmethodtypeid
         AND orderid = @it_order-orderid.
    SORT lt_payments_tmp BY orderid.
    LOOP AT lt_payments_tmp INTO DATA(ls_payments_tmp).
      ls_payments-orderid = ls_payments_tmp-orderid.
      ls_payments-shipfee = ls_payments-shipfee + ls_payments_tmp-shipfee.
      ls_payments-goldcoinamount = ls_payments-goldcoinamount +  ls_payments_tmp-goldcoinamount.
      ls_payments-couponamount            =  ls_payments-couponamount + ls_payments_tmp-couponamount.
      ls_payments-flowdiscountamount      = ls_payments-flowdiscountamount + ls_payments_tmp-flowdiscountamount.
      ls_payments-payonlinediscountamount =  ls_payments-payonlinediscountamount + ls_payments_tmp-payonlinediscountamount.
      ls_payments-actualcurrencyamount    =  ls_payments-actualcurrencyamount + ls_payments_tmp-actualcurrencyamount.
      ls_payments-cassdiscountamount      = ls_payments-cassdiscountamount + ls_payments_tmp-cassdiscountamount.
      ls_payments-paymentmethodtypeid = COND #( WHEN  ls_payments-paymentmethodtypeid IS INITIAL THEN ls_payments_tmp-paymentmethodtypeid
                                       ELSE |{  ls_payments-paymentmethodtypeid }-{ ls_payments_tmp-paymentmethodtypeid }| ).
      ls_payments-paymentmethodtypeiddesc = COND #( WHEN  ls_payments-paymentmethodtypeiddesc IS INITIAL THEN ls_payments_tmp-paymentmethodtypedesc
                                       ELSE |{  ls_payments-paymentmethodtypeiddesc }-{ ls_payments_tmp-paymentmethodtypedesc }| ).

      AT END OF orderid.
        APPEND ls_payments TO lt_payments.
        CLEAR:ls_payments_tmp,ls_payments.
      ENDAT.
    ENDLOOP.


    DATA(lt_tmp) = it_order.
    SORT lt_tmp BY cusid.
    DELETE ADJACENT DUPLICATES FROM lt_tmp COMPARING cusid.
    IF lt_tmp IS NOT INITIAL.
      IF iv_isdelete NE 'X'.
        SELECT u~cusid,u~userid,i~username
          INTO TABLE @DATA(lt_cususer)
          FROM ztint_cus_user AS u
          INNER JOIN ztint_user_inf AS i ON u~userid = i~userid
          FOR ALL ENTRIES IN @lt_tmp
          WHERE cusid = @lt_tmp-cusid
          AND  isdelete = ''
          AND usertype = '1'.
      ELSE.
        SELECT u~cusid,u~userid,i~username
         INTO CORRESPONDING FIELDS OF TABLE @lt_cususer
         FROM ztint_cus_user AS u
         INNER JOIN ztint_user_inf AS i ON u~userid = i~userid
         FOR ALL ENTRIES IN @lt_tmp
         WHERE cusid = @lt_tmp-cusid
         AND ispre = 'X'
         AND usertype = '1'.
      ENDIF.
      SORT lt_cususer BY cusid.
    ENDIF.
    CLEAR lt_tmp.

    SELECT * FROM ztint_order_sta INTO TABLE @DATA(lt_ordsta).
    SORT lt_ordsta BY orderstate.

*  获取战区名称
    SELECT zoneid,zonename FROM ztcass_zone
      INTO TABLE @DATA(lt_custzone)
       FOR ALL ENTRIES IN @it_order
       WHERE zoneid = @it_order-zoneid.
    SORT lt_custzone BY zoneid.
    DELETE ADJACENT DUPLICATES FROM lt_custzone COMPARING  zoneid.

*  供应商拓展人员
    lt_tmp = it_order.
    SORT lt_tmp BY productstoreid.
    DELETE ADJACENT DUPLICATES FROM lt_tmp COMPARING productstoreid.
    IF lt_tmp IS NOT INITIAL.
      SELECT i~productstoreid,v~userid,u~username
        FROM ztint_ven_user AS v
        INNER JOIN ztint_ven_inf AS i ON v~venid = i~venid
        INNER JOIN ztint_user_inf AS u ON v~userid = u~userid
        INTO TABLE @DATA(lt_venuser)
        FOR ALL ENTRIES IN @lt_tmp
        WHERE productstoreid = @lt_tmp-productstoreid
         AND usertype = '1'
         AND isdelete = ''.
      SORT lt_venuser BY productstoreid.
    ENDIF.
    CLEAR lt_tmp.


*截单时间
*
**      "商家休息日/截单时间
*    DATA lv_storeid TYPE string.
*    DATA lv_keyid TYPE string.
*    DATA lt_constru TYPE STANDARD TABLE OF zmer_s_idvalue WITH DEFAULT KEY.
*    DATA ls_constru TYPE zmer_s_idvalue.
*    DATA lt_deadline TYPE STANDARD TABLE OF zmer_s_configvalue.
*    DATA ls_deadline TYPE zmer_s_configvalue.
*    DATA lv_string_01 TYPE string.
*    DATA lv_string_02 TYPE string.
*    DATA lv_string TYPE string.
*    DATA :lt_result TYPE STANDARD TABLE OF zmer_s_result WITH DEFAULT KEY,
*          ls_result TYPE zmer_s_result.
*    DATA:lt_storeholiday TYPE zinq_t_storeconfholiday,
*         ls_storeholiday LIKE LINE OF lt_storeholiday.
*
*
*    IF iv_export = 'X'.
*
*      DATA(lt_idresource) = it_order.
*      SORT lt_idresource BY productstoreid.
*      DELETE ADJACENT DUPLICATES FROM lt_idresource COMPARING productstoreid.
*      IF lt_idresource IS NOT INITIAL.
*        lv_storeid = REDUCE string(
*        INIT x = ||
*        FOR ls_idresource IN lt_idresource
*        NEXT x = COND #( WHEN x = '' THEN |{ ls_idresource-productstoreid }|
*        ELSE |{ x },{ ls_idresource-productstoreid }| ) ).
*
*
*        "获取当前星期
*        DATA wotnr TYPE p.
*        CALL FUNCTION 'DAY_IN_WEEK'
*          EXPORTING
*            datum = sy-datum
*          IMPORTING
*            wotnr = wotnr.
*
*        DATA(lo_obj) = NEW zcl_icec_merchant_api( ).
*        CALL METHOD lo_obj->get_merchant_deadline
*          EXPORTING
*            iv_storeid  = lv_storeid
*          IMPORTING
*            et_deadline = lt_constru
**           EV_MSG      =
*          .
*        LOOP AT lt_constru INTO ls_constru.
*          ls_result-id = ls_constru-id.
*          lt_deadline = ls_constru-value.
*
*          LOOP AT lt_deadline INTO ls_deadline.
**          CLEAR :lv_string_01,lv_string_02.
*            IF wotnr >= ls_deadline-weekfrom AND wotnr <= ls_deadline-weekto .
*
*              IF ls_deadline-dayperiod = 'AM'.
*                lv_string_01 = '上午' && ls_deadline-dayend_hour && ':' && ls_deadline-dayend_minute.
*
*              ELSEIF ls_deadline-dayperiod = 'PM'.
*                lv_string_02 = '下午' && ls_deadline-dayend_hour && ':' && ls_deadline-dayend_minute.
*              ENDIF.
*
*            ENDIF.
*
*          ENDLOOP.
**              lv_string = '商家截单时间: ' && lv_string_01 && ',' && lv_string_02.
*          lv_string = |{ lv_string_01 } { lv_string_02 }|.
*
**        ENDIF.
*
*
*          ls_result-deadline = lv_string.
*
*          APPEND ls_result TO lt_result.
*          CLEAR ls_result.
*        ENDLOOP.
*
*        SORT lt_result BY id.
*      ENDIF.
*
*
*    ENDIF.






* 跟进类型F4 跟进来源F4 "订单来源F4
    SELECT fnam,val_low,text INTO TABLE @DATA(lt_f4config) FROM ztbc_f4_config
      WHERE fnam = 'ZICERP_MT_ORIGINALSOURCE'
      OR fnam = 'ZICERP_CASSINT_FOLLOWSOURCE'
      OR fnam = 'ZICERP_CASSINT_FOLLOWTYPE'.
    SORT lt_f4config BY fnam val_low .

* 跟进信息
    lt_tmp = it_order.
    SORT lt_tmp BY billno.
    DELETE lt_tmp WHERE billno = ''.
    DELETE ADJACENT DUPLICATES FROM lt_tmp COMPARING billno.
    IF lt_tmp IS NOT INITIAL.
      SELECT * FROM ztint_follow_inf INTO CORRESPONDING FIELDS OF TABLE @lt_followinf
        FOR ALL ENTRIES IN @it_order WHERE billno = @it_order-billno.

      IF sy-subrc EQ 0.
        lt_follow_latest = lt_followinf.
        SORT lt_follow_latest BY billno followdate  DESCENDING  followtime DESCENDING .
        DELETE ADJACENT DUPLICATES FROM lt_follow_latest COMPARING billno.

        SORT lt_followinf  BY billno.
        LOOP AT lt_followinf INTO DATA(ls_followinf).
          ls_trail-billno = ls_followinf-billno.
          IF ls_followinf-followremark IS NOT INITIAL.
            IF ls_trail-followremark IS INITIAL.
              ls_trail-followremark = |{ ls_followinf-partsname }({ ls_followinf-followremark })|.
            ELSE.
              ls_trail-followremark = |{ ls_trail-followremark };{ ls_followinf-partsname }({ ls_followinf-followremark })|.
            ENDIF.
          ENDIF.

          IF ls_followinf-followtype IS NOT INITIAL.
            READ TABLE lt_f4config INTO DATA(ls_f4config) WITH KEY fnam = 'ZICERP_CASSINT_FOLLOWTYPE'
                                                                   val_low = ls_followinf-followtype
                                                          BINARY SEARCH .
            IF sy-subrc EQ 0.
              IF ls_trail-followtypedesc IS INITIAL.
                ls_trail-followtypedesc = |{ ls_f4config-text }|.
              ELSE.
                ls_trail-followtypedesc = |{ ls_trail-followtypedesc };{ ls_f4config-text }|.
              ENDIF.
              CLEAR ls_f4config.
            ENDIF.
          ENDIF.

          IF ls_followinf-followsource IS NOT INITIAL.
            READ TABLE lt_f4config INTO ls_f4config WITH KEY fnam = 'ZICERP_CASSINT_FOLLOWSOURCE'
                                                               val_low = ls_followinf-followsource
                                                      BINARY SEARCH .
            IF sy-subrc EQ 0.
              IF ls_trail-followsourcedesc IS INITIAL.
                ls_trail-followsourcedesc = |{ ls_f4config-text }|.
              ELSE.
                ls_trail-followsourcedesc = |{ ls_trail-followsourcedesc };{ ls_f4config-text }|.
              ENDIF.
              CLEAR ls_f4config.
            ENDIF.
          ENDIF.

          AT END OF billno.
            APPEND ls_trail TO lt_trail.
            CLEAR ls_trail.
          ENDAT.
        ENDLOOP.

      ENDIF.
      SORT lt_trail BY billno.
    ENDIF.
    CLEAR:lt_tmp,lt_followinf.
    REFRESH:lt_tmp,lt_followinf,lt_payments_tmp.

    IF iv_export IS NOT INITIAL.
      "取可导出数据
      SELECT 'I' AS sign, 'EQ' AS option,
        CASE type
       	  WHEN 'C' THEN companyid
       	  WHEN 'V' THEN productstoreid
        END AS low
         FROM ztint_export_cf
        INTO CORRESPONDING FIELDS OF TABLE @lr_exprot
        WHERE userid = @mv_userid.
      "记录日志
    ENDIF.

    CLEAR er_deep_entity-cassintorderhomeset.

    LOOP AT it_order INTO DATA(ls_order).
      IF iv_export  = 'X'.     "增加导出限制
        CLEAR lv_export_flag.
        IF lr_exprot IS NOT INITIAL AND ( ls_order-custcompanyid IN lr_exprot
          OR ls_order-productstoreid IN lr_exprot ) .
          lv_export_flag = 'X'.
        ELSEIF lr_exprot IS INITIAL.
          lv_export_flag = 'X'.
        ELSE.
          CONTINUE.
        ENDIF.
      ENDIF.

**订单状态--所有的单都应该有订单状态
      ls_data_item-statusid = ls_order-statusid."状态ID
      ls_data_item-noteinfo = ls_order-noteinfo."订单备注

      READ TABLE lt_ordsta INTO DATA(ls_ordsta) WITH KEY orderstate = ls_order-statusid BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data_item-statusiddesc = ls_ordsta-orderstatedesc.

        "特别的团购订单和预售订单预售中或者拼团中状态ID为=ORDER_GROUP_BUYING,失败状态为=GROUP_BUYING_FAIL
        IF ls_order-statusid = 'ORDER_GROUP_BUYING' OR ls_order-statusid = 'GROUP_BUYING_FAIL'.
          IF ls_order-originalsource = 'PRESELL_ORDER'."预售订单
            ls_data_item-statusid = |PRE{ ls_order-statusid }|.
            ls_data_item-statusiddesc = COND #( WHEN ls_order-statusid EQ 'ORDER_GROUP_BUYING' THEN '预售中'
                                                WHEN ls_order-statusid EQ 'GROUP_BUYING_FAIL' THEN '预售失败' ).
          ELSEIF ls_order-originalsource = 'GROUP_BUYING'.
            ls_data_item-statusiddesc = COND #( WHEN ls_order-statusid EQ 'ORDER_GROUP_BUYING' THEN '拼团中'
                                                WHEN ls_order-statusid EQ 'GROUP_BUYING_FAIL' THEN '拼团失败' ).
          ENDIF.
        ENDIF.
      ENDIF.

      IF ls_data_item-statusid = 'ORDER_CANCELLED' AND ( ls_order-canceldate IS NOT INITIAL OR ls_order-canceltime IS NOT INITIAL ).
        ls_data_item-cancelleddate = | { ls_order-canceldate DATE = ISO } { ls_order-canceltime TIME = ISO }|."取消时间
        IF ls_order-cancelreason IS NOT INITIAL OR ls_order-lastlevelreason IS NOT INITIAL.
          ls_data_item-changdesc = COND #( WHEN ls_order-cancelreason IS INITIAL THEN ls_order-lastlevelreason
                                           WHEN ls_order-lastlevelreason IS INITIAL THEN ls_order-cancelreason
                                           ELSE |{ ls_order-lastlevelreason },{ ls_order-cancelreason }| )."取消原因
          ls_data_item-cancelreason = ls_order-cancelreason.
          ls_data_item-lastlevelreason = ls_order-lastlevelreason.
        ENDIF.
      ENDIF.

****支付方式及订单金额判断。
      READ TABLE lt_payments INTO ls_payments WITH KEY orderid = ls_order-orderid BINARY SEARCH.
      IF sy-subrc NE 0 AND so_paymentmethodtypeid  IS NOT INITIAL."当支付方式筛选不为空时.
        CONTINUE.
      ELSE.
        ls_data_item-paymentmethodtypeid = ls_payments-paymentmethodtypeid.
        ls_data_item-paymentmethodtypedesc = ls_payments-paymentmethodtypeiddesc.

        ls_data_item-tmsfee = ls_data_item-tmsfee + ls_payments-shipfee.
        lv_tmsfee = lv_tmsfee + ls_payments-shipfee."运费汇总
        "优惠信息
        IF ls_payments-goldcoinamount IS NOT INITIAL.
          ls_adjustment-adjustmenttypedesc = '金币抵扣:'.
          ls_adjustment-buyyeradjustment = currency_formatter( EXACT string( ls_payments-goldcoinamount ) ).
          APPEND ls_adjustment TO ls_data_item-orderdetailitemsadjustmentset.
          CLEAR ls_adjustment.
          IF so_statusid IS INITIAL OR ls_data_item-statusid IN so_statusid.
            lv_goldcoinamount = lv_goldcoinamount + ls_payments-goldcoinamount. "金币汇总
          ENDIF.
        ENDIF.

        IF ls_payments-couponamount IS NOT INITIAL.
          ls_adjustment-adjustmenttypedesc = '开思优惠:'.
          ls_adjustment-buyyeradjustment = currency_formatter( EXACT string( ls_payments-couponamount ) ).
          APPEND ls_adjustment  TO ls_data_item-orderdetailitemsadjustmentset.
          CLEAR ls_adjustment.
          IF so_statusid IS INITIAL OR ls_data_item-statusid IN so_statusid.
            lv_couponamount = lv_couponamount + ls_payments-couponamount. "优惠券汇总
          ENDIF.
        ENDIF.
        IF ls_payments-flowdiscountamount IS NOT INITIAL.
          ls_adjustment-adjustmenttypedesc = '开思立减:'.
          ls_adjustment-buyyeradjustment = currency_formatter( EXACT string( ls_payments-flowdiscountamount ) ).
          APPEND ls_adjustment  TO ls_data_item-orderdetailitemsadjustmentset.
          CLEAR ls_adjustment.
          IF so_statusid IS INITIAL OR ls_data_item-statusid IN so_statusid.
            lv_flowdiscountamount = lv_flowdiscountamount + ls_payments-flowdiscountamount. "流量调节总额
          ENDIF.
        ENDIF.
        IF ls_payments-payonlinediscountamount IS NOT INITIAL.
          ls_adjustment-adjustmenttypedesc = '现付优惠:'.
          ls_adjustment-buyyeradjustment = currency_formatter( EXACT string( ls_payments-payonlinediscountamount ) ).
          APPEND ls_adjustment  TO ls_data_item-orderdetailitemsadjustmentset.
          CLEAR ls_adjustment.
          IF so_statusid IS INITIAL OR ls_data_item-statusid IN so_statusid.
            lv_payonlinediscountamount = lv_payonlinediscountamount + ls_payments-payonlinediscountamount."现付优惠总额
          ENDIF.
        ENDIF.
        ls_data_item-actualcurrencyamount = currency_formatter( EXACT string( ls_payments-actualcurrencyamount ) )."订单金额
        ls_data_item-cassdiscountamount = ls_data_item-cassdiscountamount + ls_payments-cassdiscountamount."开思券金额

        CLEAR ls_payments.


        CONDENSE ls_data_item-tmsfee NO-GAPS.
        IF ls_data_item-tmsfee EQ '0.00'.
          ls_data_item-tmsfee = ''.
        ENDIF.

      ENDIF.

*******订单总额的获取没有使用payment上的值，使用的是order_h表中的值
      IF so_statusid IS INITIAL OR ls_data_item-statusid IN so_statusid.
        lv_orderamount =  lv_orderamount +  ls_order-actualcurrencyamount."订单总额
      ENDIF.

      ls_data_item-orderid  = ls_order-orderid."订单ID
      ls_data_item-ordertypeid  = ls_order-ordertypeid."订单类型
      ls_data_item-originalorderid  = ls_order-originalorderid."原订单id
      ls_data_item-originalsourcedesc  = ls_order-originalsourcedesc."订单源名称
      ls_data_item-ordername  = ls_order-ordername."订单描述
      ls_data_item-shoppinglistid   = ls_order-shoppinglistid."询价单号
      ls_data_item-inquirytype  = ls_order-inquirytype."询价类型
      ls_data_item-carbrandid  = ls_order-carbrandid."车型品牌
      ls_data_item-carbrandname  = ls_order-carbrandname."车型品牌描述
      ls_data_item-needcount = ls_order-skunum."SKU数量
      ls_data_item-custcompanyid  = ls_order-custcompanyid."EC客户ID
      ls_data_item-custcompanyname  = ls_order-displayname."EC客户名称
      ls_data_item-companycode  = ls_order-companycode."公司code
      ls_data_item-zoneid = ls_order-zoneid."  战区ID
      ls_data_item-provincename = ls_order-provincegeoname. "省
      ls_data_item-citygeoid  = ls_order-citygeoid."市编码
      ls_data_item-cityname = ls_order-citygeoname."城市
      ls_data_item-countygeoid = ls_order-countygeoid."区县编码
      ls_data_item-countygeoname = ls_order-countygeoname."区县名称
      ls_data_item-countryname  = ls_order-countryname."区
      ls_data_item-address = ls_order-address."地址
      ls_data_item-createdby  = ls_order-createdby."下单人ID
      ls_data_item-customerid  = ls_order-customerid."下单人ID
      ls_data_item-createdname  = ls_order-createdname."下单人名称
      ls_data_item-customername  = ls_order-customername."下单人名称
      ls_data_item-productstoreid  = ls_order-productstoreid."EC店铺ID
      ls_data_item-productstorename  = ls_order-productstorename."店铺名称
      ls_data_item-productstorecompany  = ls_order-productstorecompany."店铺公司名称
      ls_data_item-fulfillstoreid  = ls_order-fulfillstoreid."履约店铺id
      ls_data_item-fulfillstorename  = ls_order-fulfillstorename."履约店铺名称（服务商名称）
      ls_data_item-orderdate  = ls_order-orderdate."下单日期
      ls_data_item-createdate  = ls_order-createdate."订单创建日期
      ls_data_item-createtime  = ls_order-createtime."订单创建时间
      ls_data_item-contactnumber  = ls_order-contactnumber."手机
      ls_data_item-contacttel  = ls_order-contacttel."电话
      ls_data_item-cusname  = ls_order-cusname."收货名称
      ls_data_item-licpl  = ls_order-licpl."车牌号
      ls_data_item-internalcode   = ls_order-internalcode."排除订单
      ls_data_item-toname   = ls_order-toname."收货人
      ls_data_item-vhvin   = ls_order-vhvin."车辆标识号
      ls_data_item-vkorg   = ls_order-vkorg."销售组织
      ls_data_item-waydetail   = ls_order-waydetail."配送方式

*  战区名称
      READ TABLE lt_custzone INTO DATA(ls_custzone) WITH KEY zoneid = ls_order-zoneid BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data_item-zonename = ls_custzone-zonename.
        CLEAR ls_custzone.
      ENDIF.

* 是否开票
      IF ls_order-invoicetype = 'A'.
        ls_data_item-invoicetype = '是'.
      ELSEIF ls_order-invoicetype = 'B'.
        ls_data_item-invoicetype = '否'.
      ENDIF.
* 客户经理
      READ TABLE lt_cususer INTO DATA(ls_cususer) WITH KEY cusid = ls_order-cusid BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_data_item-userid = ls_cususer-userid."客户经理ID
        ls_data_item-cuname  = ls_cususer-username."客户经理
        CLEAR ls_cususer.
      ENDIF.
* 供应商拓展
      READ TABLE lt_venuser INTO DATA(ls_venuser) WITH  KEY productstoreid = ls_order-productstoreid BINARY SEARCH.
      IF sy-subrc = 0.
        ls_data_item-vuname = ls_venuser-username.
        CLEAR ls_venuser.
      ENDIF.
* 订单来源描述
      ls_data_item-originalsource = ls_order-originalsource."  订单源
      TRANSLATE ls_order-originalsource TO UPPER CASE.
      READ TABLE  lt_f4config INTO ls_f4config WITH KEY fnam = 'ZICERP_MT_ORIGINALSOURCE'
                                                              val_low = ls_order-originalsource
                                                     BINARY SEARCH .
      IF sy-subrc EQ 0.
        ls_data_item-originalsourcedesc = ls_f4config-text.
        CLEAR ls_f4config.
      ENDIF.

* 订单跟进信息开始
      READ TABLE lt_trail INTO ls_trail WITH KEY billno = ls_order-orderid BINARY SEARCH .
      IF sy-subrc EQ 0.
        ls_data_item-followremark  = ls_trail-followremark.
        ls_data_item-followtypedesc =  ls_trail-followtypedesc.
        ls_data_item-followsourcedesc = ls_trail-followsourcedesc.
        CLEAR ls_trail.
      ENDIF.
****最新跟进信息
      READ TABLE lt_follow_latest INTO ls_trail WITH KEY billno = ls_order-orderid BINARY SEARCH.
      IF sy-subrc = 0.
        ls_data_item-followname = ls_trail-followname.
        CLEAR ls_trail.
      ENDIF.
      ls_data_item-sno = l_tabix + 1.
      CONDENSE ls_data_item-sno.
      l_tabix = l_tabix + 1.
      APPEND ls_data_item TO er_deep_entity-cassintorderhomeset.
*****状态汇总
      ls_status_num-statusid = ls_data_item-statusid.
      ls_status_num-num = 1.
      COLLECT ls_status_num INTO lt_status_num.
      CLEAR ls_status_num.
      IF iv_export IS NOT INITIAL.
        ls_data_item-actualcurrencyamount = un_currency_formatter( EXACT string( ls_data_item-actualcurrencyamount ) ).
        MOVE-CORRESPONDING ls_data_item TO ls_export.
        APPEND ls_export TO lt_export.
      ENDIF.
      CLEAR:ls_export,ls_data_item.
    ENDLOOP.

    IF iv_export = 'X'.
* 保存日志
      DATA:l_keyvaule1 TYPE zde_key_value,
           l_keyvaule2 TYPE zde_key_value.
      l_keyvaule1 = mv_userid.
      l_keyvaule2 = mv_username.

      CALL FUNCTION 'Z_FMINT_LOG_SAVE'
        EXPORTING
          iv_event_id   = 'ORDERHOMEEXPORT'
          iv_event_desc = '开思助手订单导出！'
          iv_status     = 'S'
          iv_key_value1 = l_keyvaule1
          iv_key_value2 = l_keyvaule2
          iv_zcrt_bdate = sy-datum
          iv_zcrt_btime = sy-uzeit.

      CHECK is_excellist-filename IS NOT INITIAL.
      create_order_excel( it_order = lt_export is_excellist = is_excellist ).

    ELSE.

      er_deep_entity-totalnum =  lines( er_deep_entity-cassintorderhomeset ) .                          "所有订单
      SORT lt_status_num BY statusid.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_CREATED' BINARY SEARCH ."等待商家确认数量
      er_deep_entity-waitvendorconfirmnum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_WAIT_PAYED' BINARY SEARCH ."等待买家付款数量
      er_deep_entity-waitcuspaynum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_APPROVED' BINARY SEARCH ."待发货数量
      er_deep_entity-waitdelivernum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_SENT' BINARY SEARCH ."已发货数量
      er_deep_entity-deliverdnum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_RETURN_APPROVE' BINARY SEARCH ."退货审核中数量
      er_deep_entity-returnchecknum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_CANCELLING' BINARY SEARCH ."取消中数量
      er_deep_entity-cancellingnum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_CANCELLED' BINARY SEARCH ."已取消数量
      er_deep_entity-cancelednum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_GROUP_BUYING' BINARY SEARCH ."拼团中数量
      er_deep_entity-groupbuyingnum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'GROUP_BUYING_FAIL' BINARY SEARCH ."拼团失败数量
      er_deep_entity-groupfailnum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_COMPLETED' BINARY SEARCH ."已完成数量
      er_deep_entity-completenum = ls_status_num-num.
      CONDENSE er_deep_entity-waitvendorconfirmnum .
      CONDENSE er_deep_entity-waitcuspaynum .
      CONDENSE er_deep_entity-waitdelivernum .
      CONDENSE er_deep_entity-deliverdnum .
      CONDENSE er_deep_entity-returnchecknum .
      CONDENSE er_deep_entity-cancellingnum .
      CONDENSE er_deep_entity-cancelednum .
      CONDENSE er_deep_entity-completenum .

*******各状态下的金额
      lv_cassdiscountamount = lv_goldcoinamount + lv_couponamount + lv_flowdiscountamount + lv_payonlinediscountamount."开思券汇总
      WRITE lv_cassdiscountamount TO er_deep_entity-cassdiscountamout."开思券总额
      WRITE lv_goldcoinamount TO er_deep_entity-goldcoinamount."金币总额
      WRITE lv_couponamount TO  er_deep_entity-couponamount."优惠总额
      WRITE lv_flowdiscountamount TO er_deep_entity-flowdiscountamount."流量调节总额
      WRITE lv_payonlinediscountamount TO er_deep_entity-payonlinediscountamount."现付优惠总额
      WRITE lv_orderamount TO   er_deep_entity-orderamount ."订单总额
      WRITE lv_tmsfee TO er_deep_entity-tmsfee."运费汇总

****删除不在状态下的单据
      IF so_statusid IS NOT INITIAL.
        DELETE er_deep_entity-cassintorderhomeset WHERE statusid NOT IN so_statusid.
      ENDIF.

      er_deep_entity-statustotalnum = lines( er_deep_entity-cassintorderhomeset ).

      DATA:lt_otab  TYPE abap_sortorder_tab.
      lt_otab = VALUE #( FOR wa IN so_orderby ( name = COND #( WHEN wa-low = 'ASCCANCELLED' THEN 'CANCELLEDDATE'
                                                               WHEN wa-low = 'DESCANCELLED' THEN 'CANCELLEDDATE'
                                                               WHEN wa-low = 'ASCFOLLOWTYPEDESC' THEN 'FOLLOWTYPEDESC'
                                                               WHEN wa-low = 'DESFOLLOWTYPEDESC' THEN 'FOLLOWTYPEDESC' )
                                                descending = COND #( WHEN wa-low = 'DESCANCELLED' OR  wa-low = 'DESFOLLOWTYPEDESC' THEN 'X'
                                                                     ELSE '' )
                                                )
                        ).





      IF lt_otab IS NOT INITIAL.
        SORT er_deep_entity-cassintorderhomeset BY (lt_otab).
      ELSE.
        SORT er_deep_entity-cassintorderhomeset BY createdate DESCENDING  createtime DESCENDING.
      ENDIF.

      "分页
      IF iv_page IS INITIAL . "没有这显示第一页
        lv_page = 1.
      ELSE.
        lv_page = iv_page.
      ENDIF.

      IF iv_size IS INITIAL. "没有则默认50条
        lv_size = 20.
      ELSE.
        lv_size = iv_size.
      ENDIF.

      lv_total = er_deep_entity-statustotalnum. "总条数
      lv_mod = lv_total MOD lv_size.
      lv_pagetotal = lv_total DIV lv_size. "总页数
      IF lv_mod NE 0.
        lv_pagetotal = lv_pagetotal + 1.
      ENDIF.

      IF lv_page > lv_pagetotal. "当前页数不能大于总页数
        RETURN.
      ENDIF.

      lv_from = ( lv_page - 1 ) * lv_size + 1."条数开始
      lv_to = lv_page * lv_size."条数结束

      er_deep_entity-pagetotal = lv_pagetotal."总页数
      CONDENSE er_deep_entity-pagetotal.
      CONDENSE er_deep_entity-statustotalnum.

      APPEND LINES OF er_deep_entity-cassintorderhomeset FROM lv_from TO lv_to TO lt_cassintorderhomeset.
      CLEAR er_deep_entity-cassintorderhomeset.
      er_deep_entity-cassintorderhomeset = lt_cassintorderhomeset.

      "获取订单对应的售后申请
      IF lt_cassintorderhomeset IS NOT INITIAL.
        SELECT asid,orderid,orderitemseqid FROM zticec_af_order INTO TABLE @DATA(lt_as)
          FOR ALL ENTRIES IN @lt_cassintorderhomeset WHERE orderid = @lt_cassintorderhomeset-orderid(35).
        IF sy-subrc EQ 0.
          SORT lt_as BY orderid.
          SELECT id,asid,asstatusid,lastupdatedstamp FROM zticec_af_status INTO TABLE @DATA(lt_asstatus)
            FOR ALL ENTRIES IN @lt_as WHERE asid = @lt_as-asid.
          SORT lt_asstatus BY asid lastupdatedstamp DESCENDING.
          DELETE ADJACENT DUPLICATES FROM lt_asstatus COMPARING asid.
        ENDIF.
      ENDIF.

      LOOP AT er_deep_entity-cassintorderhomeset ASSIGNING FIELD-SYMBOL(<fs>).
        <fs>-sno = lv_from.
        CONDENSE <fs>-sno.
        lv_from = lv_from + 1.

        READ TABLE lt_as INTO DATA(ls_as) WITH KEY orderid = <fs>-orderid BINARY SEARCH.
        IF sy-subrc EQ 0.
          READ TABLE lt_asstatus INTO DATA(ls_asstatus) WITH KEY asid = ls_as-asid BINARY SEARCH.
          IF sy-subrc EQ 0 AND ls_asstatus-asstatusid NE 'RETURN_CLOSED'.
            <fs>-statusiddesc = |{ <fs>-statusiddesc }(有退货)|.
          ENDIF.
        ENDIF.

      ENDLOOP.

    ENDIF.

  ENDMETHOD.


  METHOD set_order_overview_new_v2.
    TYPES:BEGIN OF ty_status_num,
            statusid TYPE c LENGTH 50,
            num      TYPE i,
          END OF ty_status_num.
    TYPES:BEGIN OF ty_payment,
            orderid                      TYPE zticec_payments-orderid,
            paystopdate(10)              TYPE c,
            paystoptime(10)              TYPE c,
            paymentmethodtypeid(100)     TYPE c,
            paymentmethodtypeiddesc(100) TYPE c,
            shipfee                      TYPE zticec_payments-shipfee,
            goldcoinamount               TYPE zticec_payments-goldcoinamount,
            couponamount                 TYPE zticec_payments-couponamount,
            flowdiscountamount           TYPE zticec_payments-flowdiscountamount,
            payonlinediscountamount      TYPE zticec_payments-payonlinediscountamount,
            actualcurrencyamount         TYPE zticec_payments-actualcurrencyamount,
            cassdiscountamount           TYPE zticec_payments-cassdiscountamount,
          END OF ty_payment.
    TYPES:BEGIN OF ty_follow,
            orderid          TYPE zticec_order_h-orderid,
            followsourcedesc TYPE string,
            followtypedesc   TYPE string,
            followremark     TYPE string,
            followname       TYPE string,
          END OF ty_follow.

    DATA:lv_couponamount TYPE zde_intamount.
    DATA:lv_orderamount TYPE zde_intamount.
    DATA: lv_goldcoinamount TYPE zde_intamount.
    DATA: lv_flowdiscountamount TYPE zde_intamount.
    DATA: lv_payonlinediscountamount TYPE zde_intamount.
    DATA: lv_cassdiscountamount TYPE zde_intamount.
    DATA: lv_discountamount TYPE zde_intamount.
    DATA: lv_tmsfee TYPE zde_intamount.
    DATA: ls_status_num TYPE ty_status_num,
          lt_status_num TYPE STANDARD TABLE OF ty_status_num.
*    DATA: lr_exprot TYPE /iwbep/t_cod_select_options.
*    DATA: lv_export_flag TYPE c.
*    DATA:lt_cassintorderhomeset  TYPE STANDARD TABLE OF zcl_zgs_icerp_cassint_mpc_ext=>ts_order_adj.
    DATA:ls_data_item  TYPE zcl_zgs_icerp_cassint_mpc_ext=>ts_order_adj,
         ls_adjustment TYPE zsint_order_items_adjustment.
    DATA:ls_export TYPE zord_s_ord_excel,
         lt_export TYPE zord_t_ord_excel.
    DATA:lt_payments TYPE STANDARD TABLE OF ty_payment,
         ls_payments TYPE ty_payment.
    DATA:l_tabix TYPE i.
*
    DATA:
      lt_trail TYPE STANDARD TABLE OF ty_follow,
      ls_trail TYPE ty_follow.
    DATA:lv_from      TYPE int4,
         lv_to        TYPE int4,
         lv_total     TYPE int4,
         lv_pagetotal TYPE int4,
         lv_mod       TYPE   int4,
         lv_page      TYPE int4,
         lv_size      TYPE int4.
    DATA:lt_data TYPE tt_order.
    DATA(lo_order) =  NEW zcl_icec_order_api( ).

    er_deep_entity-totalnum =  lines( it_order )."所有订单
    CONDENSE er_deep_entity-totalnum.

    ""统计各个状态数据
    LOOP AT it_order ASSIGNING FIELD-SYMBOL(<lfs_order>).
      IF <lfs_order>-statusid = 'ORDER_GROUP_BUYING' OR <lfs_order>-statusid = 'GROUP_BUYING_FAIL'.
        IF <lfs_order>-originalsource = 'PRESELL_ORDER'."预售订单
          <lfs_order>-statusid = |PRE{ <lfs_order>-statusid }|.
        ENDIF.
      ENDIF.
*****状态汇总
      ls_status_num-statusid = <lfs_order>-statusid.
      ls_status_num-num = 1.
      COLLECT ls_status_num INTO lt_status_num.
      CLEAR ls_status_num.
******订单总额的获取没有使用payment上的值，使用的是order_h表中的值
      IF <lfs_order>-statusid IN so_statusid.
        lv_orderamount =  lv_orderamount +  <lfs_order>-actualcurrencyamount."订单总额
      ENDIF.
    ENDLOOP.

    "统计完了剔除状态数据
    IF so_statusid IS NOT INITIAL.
      DELETE it_order WHERE statusid NOT IN so_statusid.
    ENDIF.

***相应类型的支付信息
    IF it_order IS NOT INITIAL.
      SELECT orderid,paymentid,paymentmethodtypeid,paymentmethodtypedesc,
      shipfee,goldcoinamount,couponamount,flowdiscountamount,
      payonlinediscountamount,actualcurrencyamount,cassdiscountamount,paystoptime
      FROM zticec_payments INTO TABLE @DATA(lt_payments_tmp)
            FOR ALL ENTRIES IN @it_order
            WHERE paymentmethodtypeid IN @so_paymentmethodtypeid
            AND orderid = @it_order-orderid.
      SORT lt_payments_tmp BY orderid.
      LOOP AT lt_payments_tmp INTO DATA(ls_payments_tmp).
        ls_payments-orderid = ls_payments_tmp-orderid.
        IF ls_payments_tmp-paystoptime IS NOT INITIAL.
          ls_payments-paystopdate = ls_payments_tmp-paystoptime(10).
          ls_payments-paystoptime = ls_payments_tmp-paystoptime+11(8).
        ENDIF.
        ls_payments-shipfee = ls_payments-shipfee + ls_payments_tmp-shipfee.
        ls_payments-goldcoinamount = ls_payments-goldcoinamount +  ls_payments_tmp-goldcoinamount.
        ls_payments-couponamount            =  ls_payments-couponamount + ls_payments_tmp-couponamount.
        ls_payments-flowdiscountamount      = ls_payments-flowdiscountamount + ls_payments_tmp-flowdiscountamount.
        ls_payments-payonlinediscountamount =  ls_payments-payonlinediscountamount + ls_payments_tmp-payonlinediscountamount.
        ls_payments-actualcurrencyamount    =  ls_payments-actualcurrencyamount + ls_payments_tmp-actualcurrencyamount.
        ls_payments-cassdiscountamount      = ls_payments-cassdiscountamount + ls_payments_tmp-cassdiscountamount.
        ls_payments-paymentmethodtypeid = COND #( WHEN  ls_payments-paymentmethodtypeid IS INITIAL THEN ls_payments_tmp-paymentmethodtypeid
        ELSE |{  ls_payments-paymentmethodtypeid }-{ ls_payments_tmp-paymentmethodtypeid }| ).
        ls_payments-paymentmethodtypeiddesc = COND #( WHEN  ls_payments-paymentmethodtypeiddesc IS INITIAL THEN ls_payments_tmp-paymentmethodtypedesc
        ELSE |{  ls_payments-paymentmethodtypeiddesc }-{ ls_payments_tmp-paymentmethodtypedesc }| ).

        AT END OF orderid.
          APPEND ls_payments TO lt_payments.
          CLEAR:ls_payments_tmp,ls_payments.
        ENDAT.

        "算总的金额数据
        lv_tmsfee = lv_tmsfee + ls_payments_tmp-shipfee."运费汇总
        lv_goldcoinamount = lv_goldcoinamount + ls_payments_tmp-goldcoinamount. "金币汇总
        lv_couponamount = lv_couponamount + ls_payments_tmp-couponamount. "优惠券汇总
        lv_flowdiscountamount = lv_flowdiscountamount + ls_payments_tmp-flowdiscountamount. "流量调节总额
        lv_payonlinediscountamount = lv_payonlinediscountamount + ls_payments_tmp-payonlinediscountamount."现付优惠总额
      ENDLOOP.



* 跟进类型F4 跟进来源F4 "订单来源F4
      SELECT fnam,val_low,text INTO TABLE @DATA(lt_f4config) FROM ztbc_f4_config
            WHERE fnam = 'ZICERP_MT_ORIGINALSOURCE'
            OR fnam = 'ZICERP_CASSINT_FOLLOWSOURCE'
            OR fnam = 'ZICERP_CASSINT_FOLLOWTYPE'.
      SORT lt_f4config BY fnam val_low .

* 跟进信息
      SELECT billno,followdate,followtime,partsname,followremark,followtype,followsource,followname
      FROM ztint_follow_inf INTO TABLE @DATA(lt_followinf)
            FOR ALL ENTRIES IN @it_order WHERE billno = @it_order-billno.

      SELECT billno,followdate,followtime, remark AS followremark, followname
      FROM ztint_followlist APPENDING CORRESPONDING FIELDS OF TABLE @lt_followinf
      FOR ALL ENTRIES IN @it_order WHERE billno = @it_order-billno.

      IF lt_followinf IS NOT INITIAL.
        SORT lt_followinf BY billno followdate  DESCENDING followtime DESCENDING .
        LOOP AT lt_followinf INTO DATA(ls_followinf).
          IF ls_followinf-followremark IS NOT INITIAL.
            ls_followinf-followremark = zcl_cassint_formatter=>filter_emoji_string( EXACT string( ls_followinf-followremark ) ).
            IF ls_trail-followremark IS INITIAL.
              ls_trail-followremark = |{ ls_followinf-partsname }({ ls_followinf-followremark })|.
            ELSE.
              ls_trail-followremark = |{ ls_trail-followremark };{ ls_followinf-partsname }({ ls_followinf-followremark })|.
            ENDIF.
          ENDIF.

          IF ls_followinf-followtype IS NOT INITIAL.
            READ TABLE lt_f4config INTO DATA(ls_f4config) WITH KEY fnam = 'ZICERP_CASSINT_FOLLOWTYPE'
                  val_low = ls_followinf-followtype
                  BINARY SEARCH .
            IF sy-subrc EQ 0.
              IF ls_trail-followtypedesc IS INITIAL.
                ls_trail-followtypedesc = |{ ls_f4config-text }|.
              ELSE.
                ls_trail-followtypedesc = |{ ls_trail-followtypedesc };{ ls_f4config-text }|.
              ENDIF.
              CLEAR ls_f4config.
            ENDIF.
          ENDIF.

          IF ls_followinf-followsource IS NOT INITIAL.
            READ TABLE lt_f4config INTO ls_f4config WITH KEY fnam = 'ZICERP_CASSINT_FOLLOWSOURCE'
            val_low = ls_followinf-followsource
            BINARY SEARCH .
            IF sy-subrc EQ 0.
              IF ls_trail-followsourcedesc IS INITIAL.
                ls_trail-followsourcedesc = |{ ls_f4config-text }|.
              ELSE.
                ls_trail-followsourcedesc = |{ ls_trail-followsourcedesc };{ ls_f4config-text }|.
              ENDIF.
              CLEAR ls_f4config.
            ENDIF.
          ENDIF.
          ls_trail-followname = ls_followinf-followname.
          AT END OF billno.
            READ TABLE it_order ASSIGNING <lfs_order> WITH KEY orderid = ls_followinf-billno BINARY SEARCH.
            IF sy-subrc EQ 0.
              <lfs_order>-followremark = ls_trail-followremark.
              <lfs_order>-followsourcedesc = ls_trail-followsourcedesc.
              <lfs_order>-followtypedesc = ls_trail-followtypedesc.
              <lfs_order>-followname = ls_trail-followname.
            ENDIF.
            CLEAR ls_trail.
          ENDAT.
        ENDLOOP.
      ENDIF.
    ENDIF.
    "排序
    DATA(lv_orderby) = VALUE #( so_orderby[ 1 ]-low OPTIONAL ).
    CASE lv_orderby.
      WHEN 'ASCCANCELLED'.
        SORT it_order BY canceldate canceltime.
      WHEN 'DESCANCELLED'.
        SORT it_order BY canceldate DESCENDING canceltime DESCENDING.
      WHEN 'ASCFOLLOWTYPEDESC'.
        SORT it_order BY followtypedesc.
      WHEN 'DESFOLLOWTYPEDESC'.
        SORT it_order BY followtypedesc DESCENDING.
      WHEN OTHERS.
        SORT it_order BY createdate DESCENDING  createtime DESCENDING.
    ENDCASE.

    IF iv_export IS INITIAL.
      "分页
      IF iv_page IS INITIAL . "没有这显示第一页
        lv_page = 1.
      ELSE.
        lv_page = iv_page.
      ENDIF.

      IF iv_size IS INITIAL. "没有则默认50条
        lv_size = 20.
      ELSE.
        lv_size = iv_size.
      ENDIF.

      lv_total = lines( it_order ). "总条数
      lv_mod = lv_total MOD lv_size.
      lv_pagetotal = lv_total DIV lv_size. "总页数
      IF lv_mod NE 0.
        lv_pagetotal = lv_pagetotal + 1.
      ENDIF.

      IF lv_page <= lv_pagetotal. "当前页数不能大于总页数

        lv_from = ( lv_page - 1 ) * lv_size + 1."条数开始
        lv_to = lv_page * lv_size."条数结束
        APPEND LINES OF it_order FROM lv_from TO lv_to TO lt_data.

      ENDIF.

    ELSE.
      lv_from = 1.
      APPEND LINES OF it_order TO lt_data.
    ENDIF.

    CLEAR er_deep_entity-cassintorderhomeset.
    IF lt_data IS NOT INITIAL.
      DATA(lt_tmp) = lt_data.
      SORT lt_tmp BY custcompanyid.
      DELETE ADJACENT DUPLICATES FROM lt_tmp COMPARING custcompanyid.
      IF lt_tmp IS NOT INITIAL.
        IF iv_isdelete NE 'X'.
          SELECT u~cusid,u~userid,i~username
          INTO TABLE @DATA(lt_cususer)
                FROM ztint_cus_user AS u
                INNER JOIN ztint_cus_inf AS c ON u~cusid = c~cusid
                INNER JOIN ztint_user_inf AS i ON u~userid = i~userid
                FOR ALL ENTRIES IN @lt_tmp
                WHERE companyid = @lt_tmp-custcompanyid
                AND u~isdelete = ''
                AND usertype = '1'.
        ELSE.
          SELECT u~cusid,u~userid,i~username
          INTO CORRESPONDING FIELDS OF TABLE @lt_cususer
          FROM ztint_cus_user AS u
          INNER JOIN ztint_cus_inf AS c ON u~cusid = c~cusid
          INNER JOIN ztint_user_inf AS i ON u~userid = i~userid
          FOR ALL ENTRIES IN @lt_tmp
          WHERE companyid = @lt_tmp-custcompanyid
          AND ispre = 'X'
          AND usertype = '1'.
        ENDIF.
        SORT lt_cususer BY cusid.

        SELECT companyid,regionid,cityid,regionname,cityname
        INTO TABLE @DATA(lt_zone)
              FROM ztint_cus_inf AS i INNER JOIN ztint_area_city AS c
              ON i~provincegeoid = c~provincegeoid AND i~citygeoid = c~citygeoid
              AND i~countygeoid = c~countygeoid AND i~villagegeoid = c~villageoid
              FOR ALL ENTRIES IN @lt_tmp
              WHERE companyid = @lt_tmp-custcompanyid.
        SORT lt_zone BY companyid.
      ENDIF.
      CLEAR lt_tmp.

      SELECT * FROM ztint_order_sta INTO TABLE @DATA(lt_ordsta).
      SORT lt_ordsta BY orderstate.

*  供应商拓展人员
      lt_tmp = it_order.
      SORT lt_tmp BY productstoreid.
      DELETE ADJACENT DUPLICATES FROM lt_tmp COMPARING productstoreid.
      IF lt_tmp IS NOT INITIAL.
        SELECT i~productstoreid,v~userid,u~username
        FROM ztint_ven_user AS v
        INNER JOIN ztint_ven_inf AS i ON v~venid = i~venid
        INNER JOIN ztint_user_inf AS u ON v~userid = u~userid
        INTO TABLE @DATA(lt_venuser)
              FOR ALL ENTRIES IN @lt_tmp
              WHERE productstoreid = @lt_tmp-productstoreid
              AND usertype = '1'
              AND isdelete = ''.
        SORT lt_venuser BY productstoreid.
      ENDIF.
      CLEAR lt_tmp.


      SELECT DISTINCT a~orderid,a~ordertypeid,a~originalorderid,a~originalsource,a~isproxy,a~operator,a~operatoruserloginid,a~originalsourcedesc,a~ordername,
      a~shoppinglistid,a~inquirytype,a~carbrandid,a~carbrandname,a~skunum,a~custcompanyid,c~companycode,c~zoneid,c~provincegeoid,
      c~provincegeoname,c~citygeoid,c~citygeoname,c~countygeoid,c~countygeoname,a~countryname,c~address,a~createdby,a~customerid,
      a~productstoreid,a~productstorename, a~productstorecompany,a~orderdate,a~createdate,a~createtime,a~contactnumber,a~contacttel,
      a~cusname,a~licpl,a~internalcode,a~toname,a~vhvin,a~vkorg,a~waydetail,a~statusid,a~statusiddesc,a~invoicetype,a~createdname,a~customername,
      a~actualcurrencyamount,a~oilamt,a~tyreamt,a~canceldate,a~canceltime,a~cancelreason,a~lastlevelreason,c~cusid,c~displayname,a~whetherproductset,
      a~fulfillstoreid,a~fulfillstorename,a~noteinfo,a~ksbsorder,a~yunorder,a~hdsorder,a~hasservicefee
      INTO TABLE @DATA(lt_order) FROM zticec_order_h AS a
            INNER JOIN ztint_cus_inf AS c ON a~custcompanyid = c~companyid
            FOR ALL ENTRIES IN @lt_data
            WHERE a~orderid = @lt_data-orderid.

      "获取订单对应的售后申请
      SELECT asid,orderid,orderitemseqid FROM zticec_af_order INTO TABLE @DATA(lt_as)
            FOR ALL ENTRIES IN @lt_data WHERE orderid = @lt_data-orderid(35).
      IF sy-subrc EQ 0.
        SORT lt_as BY orderid.
        IF lt_as IS NOT INITIAL.
          SELECT id,asid,asstatusid,lastupdatedstamp FROM zticec_af_status INTO TABLE @DATA(lt_asstatus)
                FOR ALL ENTRIES IN @lt_as WHERE asid = @lt_as-asid.
          "有多个售后退货的，剔除CLOSE的
          LOOP AT lt_asstatus INTO DATA(ls_closeas) WHERE asstatusid = 'RETURN_CLOSED'.
            DELETE lt_asstatus WHERE asid = ls_closeas-asid.
            DELETE lt_as  WHERE asid = ls_closeas-asid.
          ENDLOOP.

          SORT lt_asstatus BY asid lastupdatedstamp DESCENDING.
          DELETE ADJACENT DUPLICATES FROM lt_asstatus COMPARING asid.
        ENDIF.
      ENDIF.
    ENDIF.
    "主机直供商家
    SELECT val_low AS storeid INTO TABLE @DATA(lt_shipstore)
      FROM ztbc_f4_config WHERE fnam = 'FLGSHIPSTORE'.

    SORT it_order BY orderid.
    SORT lt_order BY orderid.
    SORT lt_shipstore BY storeid.

    LOOP AT lt_data INTO DATA(ls_data).
      READ TABLE lt_order INTO DATA(ls_order) WITH KEY orderid = ls_data-orderid BINARY SEARCH.
      IF sy-subrc EQ 0.
*订单状态--所有的单都应该有订单状态
        ls_data_item-statusid = ls_order-statusid."状态ID
        ls_data_item-noteinfo = ls_order-noteinfo."订单备注
        ls_data_item-whetherproductset = COND #( WHEN ls_order-whetherproductset IS NOT INITIAL THEN 'X' ELSE '' ).
        ls_data_item-ksbsorder = COND #( WHEN ls_order-ksbsorder IS NOT INITIAL THEN 'X' ELSE '' ).
        ls_data_item-yunflg = COND #( WHEN ls_order-yunorder IS NOT INITIAL THEN 'X' ELSE '' ).
        ls_data_item-hdsflg = COND #( WHEN ls_order-hdsorder IS NOT INITIAL THEN 'X' ELSE '' ).
        READ TABLE lt_ordsta INTO DATA(ls_ordsta) WITH KEY orderstate = ls_order-statusid BINARY SEARCH.
        IF sy-subrc EQ 0.
          ls_data_item-statusiddesc = ls_ordsta-orderstatedesc.

          "l特别的团购订单和预售订单预售中或者拼团中状态ID为=ORDER_GROUP_BUYING,失败状态为=GROUP_BUYING_FAIL
          IF ls_order-statusid = 'ORDER_GROUP_BUYING' OR ls_order-statusid = 'GROUP_BUYING_FAIL'.
            IF ls_order-originalsource = 'PRESELL_ORDER'."预售订单
              ls_data_item-statusid = |PRE{ ls_order-statusid }|.
              ls_data_item-statusiddesc = COND #( WHEN ls_order-statusid EQ 'ORDER_GROUP_BUYING' THEN '预售中'
              WHEN ls_order-statusid EQ 'GROUP_BUYING_FAIL' THEN '预售失败' ).
            ELSEIF ls_order-originalsource = 'GROUP_BUYING'.
              ls_data_item-statusiddesc = COND #( WHEN ls_order-statusid EQ 'ORDER_GROUP_BUYING' THEN '拼团中'
              WHEN ls_order-statusid EQ 'GROUP_BUYING_FAIL' THEN '拼团失败' ).
            ENDIF.
          ENDIF.
        ENDIF.

        IF ls_data_item-statusid = 'ORDER_CANCELLED' AND ( ls_order-canceldate IS NOT INITIAL OR ls_order-canceltime IS NOT INITIAL ).
          ls_data_item-cancelleddate = | { ls_order-canceldate DATE = ISO } { ls_order-canceltime TIME = ISO }|."取消时间
          IF ls_order-cancelreason IS NOT INITIAL OR ls_order-lastlevelreason IS NOT INITIAL.
            ls_data_item-changdesc = COND #( WHEN ls_order-cancelreason IS INITIAL THEN ls_order-lastlevelreason
            WHEN ls_order-lastlevelreason IS INITIAL THEN ls_order-cancelreason
            ELSE |{ ls_order-lastlevelreason },{ ls_order-cancelreason }| )."取消原因
            ls_data_item-cancelreason = ls_order-cancelreason.
            ls_data_item-lastlevelreason = ls_order-lastlevelreason.
          ENDIF.
        ENDIF.

***支付方式及订单金额判断。
        READ TABLE lt_payments INTO ls_payments WITH KEY orderid = ls_order-orderid BINARY SEARCH.
        IF sy-subrc EQ 0.
          ls_data_item-paymentmethodtypeid = ls_payments-paymentmethodtypeid.
          ls_data_item-paymentmethodtypedesc = ls_payments-paymentmethodtypeiddesc.
          ls_data_item-paystopdate = ls_payments-paystopdate.
          ls_data_item-paystoptime = ls_payments-paystoptime.
          ls_data_item-tmsfee = ls_data_item-tmsfee + ls_payments-shipfee.
          "优惠信息
          IF ls_payments-goldcoinamount IS NOT INITIAL.
            ls_adjustment-adjustmenttypedesc = '金币抵扣:'.
            ls_adjustment-buyyeradjustment = currency_formatter( EXACT string( ls_payments-goldcoinamount ) ).
            APPEND ls_adjustment TO ls_data_item-orderdetailitemsadjustmentset.
            CLEAR ls_adjustment.
          ENDIF.

          IF ls_payments-couponamount IS NOT INITIAL.
            ls_adjustment-adjustmenttypedesc = '开思优惠:'.
            ls_adjustment-buyyeradjustment = currency_formatter( EXACT string( ls_payments-couponamount ) ).
            APPEND ls_adjustment  TO ls_data_item-orderdetailitemsadjustmentset.
            CLEAR ls_adjustment.
          ENDIF.
          IF ls_payments-flowdiscountamount IS NOT INITIAL.
            ls_adjustment-adjustmenttypedesc = '开思立减:'.
            ls_adjustment-buyyeradjustment = currency_formatter( EXACT string( ls_payments-flowdiscountamount ) ).
            APPEND ls_adjustment  TO ls_data_item-orderdetailitemsadjustmentset.
            CLEAR ls_adjustment.
          ENDIF.
          IF ls_payments-payonlinediscountamount IS NOT INITIAL.
            ls_adjustment-adjustmenttypedesc = '现付优惠:'.
            ls_adjustment-buyyeradjustment = currency_formatter( EXACT string( ls_payments-payonlinediscountamount ) ).
            APPEND ls_adjustment  TO ls_data_item-orderdetailitemsadjustmentset.
            CLEAR ls_adjustment.
          ENDIF.
          ls_data_item-actualcurrencyamountdec = ls_payments-actualcurrencyamount .
          ls_data_item-actualcurrencyamount = currency_formatter( EXACT string( ls_payments-actualcurrencyamount ) )."订单金额
          ls_data_item-cassdiscountamount = ls_data_item-cassdiscountamount + ls_payments-cassdiscountamount."开思券金额
          CLEAR ls_payments.


          CONDENSE ls_data_item-tmsfee NO-GAPS.
          IF ls_data_item-tmsfee EQ '0.00'.
            ls_data_item-tmsfee = ''.
          ENDIF.

        ENDIF.

        ls_data_item-orderid  = ls_order-orderid."订单ID
        ls_data_item-ordertypeid  = ls_order-ordertypeid."订单类型
        ls_data_item-originalorderid  = ls_order-originalorderid."原订单id
        ls_data_item-originalsourcedesc  = ls_order-originalsourcedesc."订单源名称

        IF ls_order-isproxy = '1'."有代客下单权限的才是代下单人
          ls_data_item-isproxy = '是'. "操作人是否有代客下单权限
          ls_data_item-operator = ls_order-operator."代下单人
          ls_data_item-operatoruserloginid = ls_order-operatoruserloginid."代下单人userloginid
        ELSEIF ls_order-isproxy = '0'.
          ls_data_item-isproxy = '否'. "操作人是否有代客下单权限
        ENDIF.

        "有代客下单权限并且待付款的有去支付按钮
        IF ls_order-statusid = 'ORDER_WAIT_PAYED' AND
          ( ls_order-isproxy = '1' OR  ls_order-originalsource EQ 'DIRECTIONAL' ).
          ls_data_item-actionid = 'GOTO_PAY'.
          ls_data_item-actiondesc = '去支付'.
        ENDIF.

        ls_data_item-ordername  = ls_order-ordername."订单描述
        ls_data_item-shoppinglistid   = ls_order-shoppinglistid."询价单号
        ls_data_item-inquirytype  = ls_order-inquirytype."询价类型
        ls_data_item-carbrandid  = ls_order-carbrandid."车型品牌
        ls_data_item-carbrandname  = ls_order-carbrandname."车型品牌描述
        ls_data_item-needcount = ls_order-skunum."SKU数量
        ls_data_item-custcompanyid  = ls_order-custcompanyid."EC客户ID
        ls_data_item-custcompanyname  = ls_order-displayname."EC客户名称
        ls_data_item-companycode  = ls_order-companycode."公司code
        ls_data_item-zoneid = ls_order-zoneid."  战区ID
        ls_data_item-provincename = ls_order-provincegeoname. "省
        ls_data_item-citygeoid  = ls_order-citygeoid."市编码
        ls_data_item-cityname = ls_order-citygeoname."城市
        ls_data_item-countygeoid = ls_order-countygeoid."区县编码
        ls_data_item-countygeoname = ls_order-countygeoname."区县名称
        ls_data_item-countryname  = ls_order-countryname."区
        ls_data_item-address = ls_order-address."地址
        ls_data_item-createdby  = ls_order-createdby."下单人ID
        ls_data_item-customerid  = ls_order-customerid."下单人ID
        ls_data_item-createdname  = ls_order-createdname."下单人名称
        ls_data_item-customername  = ls_order-customername."下单人名称
        ls_data_item-productstoreid  = ls_order-productstoreid."EC店铺ID
        ls_data_item-productstorename  = ls_order-productstorename."店铺名称
        ls_data_item-productstorecompany  = ls_order-productstorecompany."店铺公司名称
        ls_data_item-fulfillstoreid  = ls_order-fulfillstoreid."履约店铺id
        ls_data_item-fulfillstorename  = ls_order-fulfillstorename."履约店铺名称（服务商名称）
        ls_data_item-orderdate  = ls_order-orderdate."下单日期
        ls_data_item-createdate  = ls_order-createdate."订单创建日期
        ls_data_item-createtime  = ls_order-createtime."订单创建时间
        ls_data_item-contactnumber  = ls_order-contactnumber."手机
        ls_data_item-contacttel  = ls_order-contacttel."电话
        ls_data_item-cusname  = ls_order-cusname."收货名称
        ls_data_item-licpl  = ls_order-licpl."车牌号
        ls_data_item-internalcode   = ls_order-internalcode."排除订单
        ls_data_item-toname   = ls_order-toname."收货人
        ls_data_item-vhvin   = ls_order-vhvin."车辆标识号
        ls_data_item-vkorg   = ls_order-vkorg."销售组织
        ls_data_item-waydetail   = ls_order-waydetail."配送方式

        READ TABLE lt_shipstore TRANSPORTING NO FIELDS WITH KEY storeid = ls_order-productstoreid BINARY SEARCH.
        IF sy-subrc EQ 0.
          ls_data_item-shipflg = 'X'.
        ENDIF.

        "战区名称--连队网格名称
        READ TABLE lt_zone INTO DATA(ls_custzone) WITH KEY companyid = ls_order-custcompanyid BINARY SEARCH.
        IF sy-subrc EQ 0.
          ls_data_item-zonename = |{ ls_custzone-regionname }-{ ls_custzone-cityname }|.
          CLEAR ls_custzone.
        ENDIF.

        "是否开票
        IF ls_order-invoicetype = 'A'.
          ls_data_item-invoicetype = '是'.
        ELSEIF ls_order-invoicetype = 'B'.
          ls_data_item-invoicetype = '否'.
        ENDIF.
        "客户经理
        READ TABLE lt_cususer INTO DATA(ls_cususer) WITH KEY cusid = ls_order-cusid BINARY SEARCH.
        IF sy-subrc EQ 0.
          ls_data_item-userid = ls_cususer-userid."客户经理ID
          ls_data_item-cuname  = ls_cususer-username."客户经理
          CLEAR ls_cususer.
        ENDIF.
        "供应商拓展
        READ TABLE lt_venuser INTO DATA(ls_venuser) WITH  KEY productstoreid = ls_order-productstoreid BINARY SEARCH.
        IF sy-subrc = 0.
          ls_data_item-vuname = ls_venuser-username.
          CLEAR ls_venuser.
        ENDIF.
        "订单来源描述
        ls_data_item-originalsource = ls_order-originalsource."  订单源
        TRANSLATE ls_order-originalsource TO UPPER CASE.
        READ TABLE  lt_f4config INTO ls_f4config WITH KEY fnam = 'ZICERP_MT_ORIGINALSOURCE' val_low = ls_order-originalsource
        BINARY SEARCH .
        IF sy-subrc EQ 0.
          ls_data_item-originalsourcedesc = ls_f4config-text.
          CLEAR ls_f4config.
        ENDIF.

        "订单跟进信息开始
        READ TABLE it_order INTO DATA(ls_orderfollow) WITH KEY orderid = ls_order-orderid BINARY SEARCH .
        IF sy-subrc EQ 0.
          ls_data_item-followremark  = ls_orderfollow-followremark.
          ls_data_item-followtypedesc =  ls_orderfollow-followtypedesc.
          ls_data_item-followsourcedesc = ls_orderfollow-followsourcedesc.
          ls_data_item-followname = ls_orderfollow-followname."最新跟进人
          CLEAR ls_orderfollow.
        ENDIF.

        ls_data_item-sno = l_tabix + lv_from.
        CONDENSE ls_data_item-sno.

        READ TABLE lt_as INTO DATA(ls_as) WITH KEY orderid = ls_order-orderid BINARY SEARCH.
        IF sy-subrc EQ 0.
          READ TABLE lt_asstatus INTO DATA(ls_asstatus) WITH KEY asid = ls_as-asid BINARY SEARCH.
          IF sy-subrc EQ 0 AND ls_asstatus-asstatusid NE 'RETURN_CLOSED'.
            ls_data_item-statusiddesc = |{ ls_order-statusiddesc }(有退货)|.
          ENDIF.
        ENDIF.
      ELSE.
        ls_data_item-orderid = ls_data-orderid.
      ENDIF.

      l_tabix = l_tabix + 1.
      APPEND ls_data_item TO er_deep_entity-cassintorderhomeset.
      IF iv_export IS NOT INITIAL.
        ls_data_item-actualcurrencyamount = un_currency_formatter( EXACT string( ls_data_item-actualcurrencyamount ) ).
        MOVE-CORRESPONDING ls_data_item TO ls_export.
        "单据标签
        "开思严选
        IF ls_data_item-ksbsorder IS NOT INITIAL.
          ls_export-orderlabel = COND #( WHEN ls_export-orderlabel IS INITIAL THEN '开思严选;' ELSE  |{ ls_export-orderlabel }开思严选;| ).
        ENDIF.
        "业务分类：A004-轮胎/A009-油品
        IF ls_data-bizcatid = 'A009'.
          ls_export-orderlabel = COND #( WHEN ls_export-orderlabel IS INITIAL THEN '油品;' ELSE  |{ ls_export-orderlabel }油品;| ).
        ELSEIF ls_data-bizcatid = 'A004'.
          ls_export-orderlabel = COND #( WHEN ls_export-orderlabel IS INITIAL THEN '轮胎;' ELSE  |{ ls_export-orderlabel }轮胎;| ).
        ENDIF.

        "新能源
        IF ls_data-carenergytype = 1.
          ls_export-orderlabel = COND #( WHEN ls_export-orderlabel IS INITIAL THEN '新能源;' ELSE  |{ ls_export-orderlabel }新能源;| ).
        ENDIF.
        "共享仓
        IF ls_data_item-yunflg IS NOT INITIAL."共享仓
          ls_export-orderlabel = COND #( WHEN ls_export-orderlabel IS INITIAL THEN '共享仓;' ELSE  |{ ls_export-orderlabel }共享仓;| ).
        ENDIF.
        "海德森
        IF ls_data_item-hdsflg IS NOT INITIAL."共享仓
          ls_export-orderlabel = COND #( WHEN ls_export-orderlabel IS INITIAL THEN '海德森;' ELSE  |{ ls_export-orderlabel }海德森;| ).
        ENDIF.
        "共享仓
        IF ls_data_item-shipflg IS NOT INITIAL."共享仓
          ls_export-orderlabel = COND #( WHEN ls_export-orderlabel IS INITIAL THEN '主机直供;' ELSE  |{ ls_export-orderlabel }主机直供;| ).
        ENDIF.
        "质保服务费
        IF ls_order-hasservicefee IS NOT INITIAL."质保服务费
          ls_export-orderlabel = COND #( WHEN ls_export-orderlabel IS INITIAL THEN '质保服务费;' ELSE  |{ ls_export-orderlabel }质保服务费;| ).
        ENDIF.

        IF ls_data_item-vhvin IS NOT INITIAL. "vin码
          ls_export-vhvin = ls_data_item-vhvin.
        ENDIF.
        APPEND ls_export TO lt_export.
      ENDIF.
      CLEAR:ls_export,ls_data_item.
    ENDLOOP.

    IF iv_export = 'X'.
* 保存日志
      DATA:l_keyvaule1 TYPE zde_key_value,
           l_keyvaule2 TYPE zde_key_value.
      l_keyvaule1 = mv_userid.
      l_keyvaule2 = mv_username.

      CALL FUNCTION 'Z_FMINT_LOG_SAVE'
        EXPORTING
          iv_event_id   = 'ORDERHOMEEXPORT'
          iv_event_desc = '开思助手订单导出！'
          iv_status     = 'S'
          iv_key_value1 = l_keyvaule1
          iv_key_value2 = l_keyvaule2
          iv_zcrt_bdate = sy-datum
          iv_zcrt_btime = sy-uzeit.

      CHECK is_excellist-filename IS NOT INITIAL.
      create_order_excel( it_order = lt_export is_excellist = is_excellist ).

    ELSE.
      SORT lt_status_num BY statusid.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_CREATED' BINARY SEARCH ."等待商家确认数量
      er_deep_entity-waitvendorconfirmnum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_WAIT_PAYED' BINARY SEARCH ."等待买家付款数量
      er_deep_entity-waitcuspaynum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_APPROVED' BINARY SEARCH ."待发货数量
      er_deep_entity-waitdelivernum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_SENT' BINARY SEARCH ."已发货数量
      er_deep_entity-deliverdnum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_RETURN_APPROVE' BINARY SEARCH ."退货审核中数量
      er_deep_entity-returnchecknum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_CANCELLING' BINARY SEARCH ."取消中数量
      er_deep_entity-cancellingnum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_CANCELLED' BINARY SEARCH ."已取消数量
      er_deep_entity-cancelednum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_GROUP_BUYING' BINARY SEARCH ."拼团中数量
      er_deep_entity-groupbuyingnum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'GROUP_BUYING_FAIL' BINARY SEARCH ."拼团失败数量
      er_deep_entity-groupfailnum = ls_status_num-num.
      CLEAR ls_status_num.
      READ TABLE lt_status_num INTO ls_status_num WITH KEY statusid = 'ORDER_COMPLETED' BINARY SEARCH ."已完成数量
      er_deep_entity-completenum = ls_status_num-num.
      CONDENSE er_deep_entity-waitvendorconfirmnum .
      CONDENSE er_deep_entity-waitcuspaynum .
      CONDENSE er_deep_entity-waitdelivernum .
      CONDENSE er_deep_entity-deliverdnum .
      CONDENSE er_deep_entity-returnchecknum .
      CONDENSE er_deep_entity-cancellingnum .
      CONDENSE er_deep_entity-cancelednum .
      CONDENSE er_deep_entity-completenum .

*******各状态下的金额
      lv_cassdiscountamount = lv_goldcoinamount + lv_couponamount + lv_flowdiscountamount + lv_payonlinediscountamount."开思券汇总
      WRITE lv_cassdiscountamount TO er_deep_entity-cassdiscountamout."开思券总额
      WRITE lv_goldcoinamount TO er_deep_entity-goldcoinamount."金币总额
      WRITE lv_couponamount TO  er_deep_entity-couponamount."优惠总额
      WRITE lv_flowdiscountamount TO er_deep_entity-flowdiscountamount."流量调节总额
      WRITE lv_payonlinediscountamount TO er_deep_entity-payonlinediscountamount."现付优惠总额
      WRITE lv_orderamount TO   er_deep_entity-orderamount ."订单总额
      WRITE lv_tmsfee TO er_deep_entity-tmsfee."运费汇总

      er_deep_entity-statustotalnum = lines( it_order ).

      er_deep_entity-pagetotal = lv_pagetotal."总页数
      CONDENSE er_deep_entity-pagetotal.
      CONDENSE er_deep_entity-statustotalnum.
    ENDIF.

  ENDMETHOD.


  METHOD set_order_processinfo.
    DATA:ls_detailinfo LIKE LINE OF cs_entity-orderdetaildealinfset.
    DATA:lv_date TYPE sy-datum,
         lv_time TYPE sy-uzeit.
    DATA:lv_linkreg TYPE string.
    DATA:lt_result TYPE TABLE OF string,
         sub1      TYPE string,
         moff      TYPE i,
         mlen      TYPE i.
    CLEAR cs_entity-orderdetaildealinfset.
    lv_linkreg = |<a[^>]*>([^<]*)</a>|.
    LOOP AT it_processinfo INTO DATA(ls_process).
      ls_detailinfo-dealinfo = ls_process-record.
****判断是否有超链接<a></a>
      IF count( val = ls_detailinfo-dealinfo regex = lv_linkreg ) > 0.
        CLEAR:lt_result,moff,mlen,sub1.
        lt_result = VALUE #( ( EXACT string( ls_detailinfo-dealinfo ) ) ).
        FIND REGEX lv_linkreg IN TABLE lt_result IGNORING CASE
                        SUBMATCHES sub1.
        IF sy-subrc EQ 0.
          ls_detailinfo-ylink = 'A'."售后标识
          ls_detailinfo-linkkey = sub1."售后申请单
        ENDIF.
****剔除掉超链接
        FIND REGEX lv_linkreg IN ls_detailinfo-dealinfo MATCH OFFSET moff MATCH LENGTH mlen.
        IF sy-subrc EQ 0.
          ls_detailinfo-dealinfo+moff(mlen) = sub1.
          CONDENSE ls_detailinfo-dealinfo NO-GAPS.
        ENDIF.
        IF count( val = ls_detailinfo-dealinfo regex = '售后申请' ) > 0.
          ls_detailinfo-dealinfo = |您已发起售后申请，可通过申请单号{ sub1 }跟进售后|.
        ENDIF.
      ENDIF.
      CALL FUNCTION 'Z_FMICCRM_TIMESTAMP_TO_ABAP'
        EXPORTING
          iv_timestamp = ls_process-createdstamp
        IMPORTING
          ev_date      = lv_date
          ev_time      = lv_time.

      ls_detailinfo-dealtime = |{ lv_date DATE = ISO } { lv_time TIME = ISO }|.
      ls_detailinfo-operatorid = ls_process-userloginid.
      ls_detailinfo-operatorname = ls_process-username.
      APPEND ls_detailinfo TO cs_entity-orderdetaildealinfset.
      CLEAR ls_detailinfo.
    ENDLOOP.
  ENDMETHOD.


  METHOD set_order_shipment.
    DATA:ls_shipment       LIKE LINE OF cs_entity-orderdetailshipmentsheaderset,
         ls_shipment_item  LIKE LINE OF ls_shipment-orderdetailshipmentsset,
         ls_shipment_logis LIKE LINE OF ls_shipment-orderdetaillogisset,
         lv_lastday        TYPE sy-datum,
         lv_amount         TYPE zde_intamount.
    CLEAR:cs_entity-orderdetailshipmentsheaderset,lv_amount.
    LOOP AT it_shipment INTO DATA(ls_ordershipment).
      ls_shipment-address = ls_ordershipment-address.
      ls_shipment-deliverytype = COND #( WHEN ls_ordershipment-deliverytype = 'PICKED_INSTORE' THEN '客户自提'
                                         WHEN ls_ordershipment-deliverytype = 'SJZS' THEN '商家自送'
                                         WHEN ls_ordershipment-deliverytype = 'SJTJ' THEN '商家推荐'
                                         WHEN ls_ordershipment-deliverytype = 'LOGISTICS_DELIVERY' THEN '物流配送' ).
      IF  ls_ordershipment-remarks IS NOT INITIAL.
        SORT ls_ordershipment-remarks BY createdstamp.
        LOOP AT ls_ordershipment-remarks INTO DATA(ls_remark).
          IF sy-tabix = 1.
            ls_shipment-changedesc = ls_remark-remark.
          ENDIF.
          IF ls_remark-createdstamp IS NOT INITIAL.
            zcl_cassint_formatter=>convert_java_timestamp_to_abap(
              EXPORTING iv_timestamp = ls_remark-createdstamp
              IMPORTING ev_date = DATA(lv_date) ev_time = DATA(lv_time) ).
            ls_shipment_logis-dealdate = |{ lv_date DATE = ISO }|.
            ls_shipment_logis-dealtime = |{ lv_time TIME = ISO }|.
          ENDIF.
          ls_shipment_logis-dealinfo = ls_remark-remark.
          APPEND ls_shipment_logis TO ls_shipment-orderdetaillogisset.
          CLEAR:lv_lastday,lv_date,lv_time,ls_shipment_logis.
        ENDLOOP.
*        READ TABLE ls_ordershipment-remarks INTO DATA(ls_remark) INDEX lines( ls_ordershipment-remarks )  .
*        IF sy-subrc EQ 0.
*          ls_shipment-changedesc = ls_remark-remark.
*        ENDIF.
      ENDIF.
* ls_shipment-OrderDetailShipmentsSet = ls_ordershipment-

      ls_shipment-shipgroupseqid = ls_ordershipment-shipgroupname.
      ls_shipment-shipmentname = ls_ordershipment-logisticscompany.
      ls_shipment-shipmentnumber = ls_ordershipment-shipmentnum.
      ls_shipment-shipmentid = ls_ordershipment-shipmentid.
      ls_shipment-shipmentsendnum = ls_ordershipment-shipmentsendnum.
      ls_shipment-statusdesc = ls_ordershipment-shipmentstatus.

      "小狮已发货订单根据运单号获取对应距离和预计送达时间
      IF ls_shipment-shipmentnumber IS NOT INITIAL AND ls_shipment-statusdesc  = '已发货'.
        DATA(lo_order_api)  = NEW zcl_icec_order_api( ).

        lo_order_api->get_order_shipments_location(
            EXPORTING
              iv_shipmentnumber = EXACT string( ls_shipment-shipmentnumber )
*          iv_showsource = 'PLATFORM'
            IMPORTING
              et_out = DATA(et_location)
              ev_msg = ev_msg
          ).

        CLEAR:lv_date,lv_time.
        IF et_location-expecteddeliverytime IS NOT INITIAL.
          zcl_cassint_formatter=>convert_java_timestamp_to_abap(
            EXPORTING iv_timestamp = et_location-expecteddeliverytime
            IMPORTING ev_date = lv_date ev_time = lv_time ).
          ls_shipment-expecteddeliverytime = |{ lv_date DATE = ISO } { lv_time TIME = ISO }|.
        ENDIF.
        ls_shipment-distance = zcl_cassint_formatter=>remove_zero_formatter( et_location-currentlocation-distance ).

      ENDIF.
      LOOP AT ls_ordershipment-items INTO DATA(ls_orderitem).
        CONDENSE:ls_orderitem-orderitempayment-buyeractualprice,ls_orderitem-quantity.
        lv_amount = ls_orderitem-orderitempayment-buyeractualprice * ls_orderitem-quantity .
        ls_shipment_item-acturalamount = nosign_currency_formatter( EXACT string( lv_amount ) ).
        ls_shipment_item-acturalprice = nosign_currency_formatter( ls_orderitem-orderitempayment-buyeractualprice ).
        ls_shipment_item-brandname = ls_orderitem-brandname.
        ls_shipment_item-internalnum = ls_orderitem-internalnum.
        ls_shipment_item-orderitemseqid = ls_orderitem-orderitemseqid.
        ls_shipment_item-orderquantity = quantity_formatter( ls_orderitem-quantity ).
        ls_shipment_item-orderquantity = zcl_cassint_formatter=>remove_zero_formatter( ls_orderitem-quantity ).
        ls_shipment_item-partsname = ls_orderitem-productname."ls_orderitem-partsname.
        ls_shipment_item-unitprice = nosign_currency_formatter( ls_orderitem-orderitempayment-sellerprice ).
        ls_shipment_item-qualityname = ls_orderitem-qualityname.
        APPEND ls_shipment_item TO ls_shipment-orderdetailshipmentsset.
        CLEAR:ls_shipment_item,lv_amount.
      ENDLOOP.
      APPEND ls_shipment TO cs_entity-orderdetailshipmentsheaderset.
      CLEAR ls_shipment.
    ENDLOOP.



  ENDMETHOD.


  METHOD timestamp_formatter.
    CHECK iv_timestamp IS NOT INITIAL.
    CALL FUNCTION 'Z_FMICCRM_TIMESTAMP_TO_ABAP'
      EXPORTING
        iv_timestamp = iv_timestamp
      IMPORTING
        ev_date      = ev_date
        ev_time      = ev_time.
    ev_string = |{ ev_date DATE = ISO } { ev_time TIME = ISO }|.
  ENDMETHOD.


  METHOD un_currency_formatter.
    DATA:lv_amount TYPE zde_intamount.
    REPLACE ALL OCCURRENCES OF  ',' IN iv_input WITH ''.
    REPLACE ALL OCCURRENCES OF '￥' IN iv_input WITH ''.
    TRY.
        rv_output = iv_input.
      CATCH cx_root INTO DATA(lcx_root).
    ENDTRY.
  ENDMETHOD.


  METHOD un_quantity_formatter_dcm.
    REPLACE ALL OCCURRENCES OF ',' IN iv_input WITH ''.
    TRY.
        rv_output = iv_input.
      CATCH cx_root INTO DATA(lcx_root).
    ENDTRY.
  ENDMETHOD.


  METHOD update_customerservice_note.
    DATA lv_body TYPE string.
    SELECT SINGLE userloginid INTO @DATA(lv_userloginid) FROM ztint_ec_userid AS u
      INNER JOIN ztint_user_inf AS i ON u~userid = i~userid
     WHERE i~dinguserid = @data-dinguserid.
    DATA(lv_loginid) = COND string( WHEN lv_userloginid IS INITIAL THEN 'cassintsystem' ELSE lv_userloginid ).

    lv_body = '{' &&
              |"noteId":"{ data-customerservicenoteid }",| &&
              |"orderId":"{ data-orderid }",| &&
              |"orderRole":"PLATFORM",| &&
              |"userLoginId":"{ lv_loginid }",| &&
              |"note":"{ zcl_cassint_formatter=>escape_for_json( EXACT string( data-customerservicenote ) ) }"| &&
              '}'.

    msg = NEW zcl_icec_order_api( )->update_order_note( lv_body ).
  ENDMETHOD.
ENDCLASS.
