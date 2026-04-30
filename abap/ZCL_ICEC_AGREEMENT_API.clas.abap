class ZCL_ICEC_AGREEMENT_API definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF ty_lastagreement ,
        id                      TYPE string,
        companyid               TYPE string,
        companyname             TYPE string,
        companycategory         TYPE string,
        agreementtype           TYPE string,
        type                    TYPE string,
        agreementstatus         TYPE string,
        enabled                 TYPE string,
        lastcontractid          TYPE string,
        senddate                TYPE string,
        contractlastupdateddate TYPE string,
        signcount               TYPE string,
        createddate             TYPE string,
        lastupdateddate         TYPE string,
        agreementtypeinfo       TYPE string,
        agreementstatusinfo     TYPE string,
      END OF  ty_lastagreement .
  types:
    BEGIN OF ty_companyprofiles,
        companyid	                    TYPE string,
        companycode	                  TYPE string,
        companyname	                  TYPE string,
        businessaddress	              TYPE string,
        legalperson	                  TYPE string,
        legalpersonidcard	            TYPE string,
        legalpersonmobile	            TYPE string,
        signprofilestatus	            TYPE string,
        contactperson	                TYPE string,
        contactnumber	                TYPE string,
        regcode	                      TYPE string,
        taxcode	                      TYPE string,
        orgcode	                      TYPE string,
        businesslicensecertificate    TYPE string,
        accountopencertificate        TYPE string,
        legalpersonidcardpositive	    TYPE string,
        legalpersonidcardopposite	    TYPE string,
        signauthorization	            TYPE string,
        signature	                    TYPE string,
        authenticationcreatedby	      TYPE string,
        signuserloginid	              TYPE string,
        signusername                  TYPE string,
        signcontactnumber	            TYPE string,
        feeprofilestatus              TYPE string,
        companytype	                  TYPE string,
        isagent	                      TYPE string,
        walletpaymentbankaccount      TYPE string,
        walletpaymentbankprovinceid	  TYPE string,
        walletpaymentbankprovincename	TYPE string,
        walletpaymentbankcityid	      TYPE string,
        walletpaymentbankcityname	    TYPE string,
        businesslicensename	          TYPE string,
        taxpayertype                  TYPE string,
        establishdate	                TYPE string,
        businessstarttime	            TYPE string,
        businessendtime	              TYPE string,
        registeramount                TYPE string,
        businessrange	                TYPE string,
        legalpersoncardtype	          TYPE string,
        clientpersoncardtype          TYPE string,
        certificatedate	              TYPE string,
        certificateenddate            TYPE string,
        personpaymentbankname	        TYPE string,
        personpaymentbankaccount      TYPE string,
        personpaymentbankid	          TYPE string,
        personpaymentbankprovinceid	  TYPE string,
        personpaymentbankprovincename	TYPE string,
        personpaymentbankcityid	      TYPE string,
        personpaymentbankcityname	    TYPE string,
        personpaymentbankaccountpictu TYPE string,
        companyinfopublicitynetscreen	TYPE string,
      END OF ty_companyprofiles .
  types:
    BEGIN OF ty_businessscopedtos,
        id                       TYPE string,
        companybusinessprofileid TYPE string,
        carbrand                 TYPE string,
        carbrandname             TYPE string,
        originalfactoryrate      TYPE string,
        brandrate                TYPE string,
        otherrate                TYPE string,
        inventoryamount          TYPE string,
        monthlysales             TYPE string,
      END OF ty_businessscopedtos .
  types:
    tt_businessscopedtos TYPE STANDARD TABLE OF ty_businessscopedtos WITH DEFAULT KEY .
  types:
    BEGIN OF ty_inventoryscaledtos,
        id                       TYPE string,
        companybusinessprofileid TYPE string,
        warehouseaddress         TYPE string,
        warehouseacreage         TYPE string,
        inventoryamount          TYPE string,
      END OF ty_inventoryscaledtos .
  types:
    tt_inventoryscaledtos TYPE STANDARD TABLE OF ty_inventoryscaledtos WITH DEFAULT KEY .
  types:
    BEGIN OF ty_companypfrofile,
        authenticated TYPE string,
        companycode   TYPE string,
        companyid     TYPE string,
        companyname   TYPE string,
        regcode       TYPE string,
      END OF ty_companypfrofile .
  types:
    tt_companypfrofile TYPE STANDARD TABLE OF ty_companypfrofile WITH DEFAULT KEY .
  types:
    BEGIN OF ty_businessprofile,
        companyid                  TYPE string,
        companycode                TYPE string,
        companyname                TYPE string,
        displayname                TYPE string,
        provincegeoid              TYPE string,
        provincegeoname            TYPE string,
        citygeoid                  TYPE string,
        citygeoname                TYPE string,
        countygeoid                TYPE string,
        countygeoname              TYPE string,
        detailaddress              TYPE string,
        officalwebsite             TYPE string,
        businessscopedtos          TYPE tt_businessscopedtos,
        servearea                  TYPE string,
        serveareaname              TYPE string,
        shopacreage                TYPE string,
        inventoryscaledtos         TYPE tt_inventoryscaledtos,
        unsalableinventoryrate     TYPE string,
        totalmonthlysales          TYPE string,
        quoternumber               TYPE string,
        financialstaffnumber       TYPE string,
        warehousestaffnumber       TYPE string,
        deliverycarnumber          TYPE string,
        deliverystaffnumber        TYPE string,
        monthlyinvoicenumber       TYPE string,
        singleinvoicemaximumamount TYPE string,
        iteminvoicerate            TYPE string,
        erptype                    TYPE string,
        othererptype               TYPE string,
        datatool                   TYPE string,
        otherdatatool              TYPE string,
        shopfacade                 TYPE string,
        quoteareapicture           TYPE string,
        deliveryareapicture        TYPE string,
        warehousepicture           TYPE string,
        shoppicture1               TYPE string,
        shoppicture2               TYPE string,
        status                     TYPE string,
        companypropaganda          TYPE string,
        id                         TYPE string,
      END OF ty_businessprofile .
  types:
      "签署中协议合同
    BEGIN OF ty_contractinfolist,
        ettcode      TYPE string, ": "FDINGKSiBL",
        protocolcode TYPE string, ": "TEMP_RELATIONSHIP_PROVE_AGREEMENT_LEFTSEAL_V3",
        protocolname TYPE string, ": "关联关系证明和保证（版本2）"
      END OF ty_contractinfolist .
  types:
    BEGIN OF ty_contractsignerinfolist,
        contractid    TYPE string,                          ": "4440",
        signertype    TYPE string, ": "1",
        signurl       TYPE string, ": "https://smlt.esign.cn/IDM1oKe",
        signeraccount TYPE string, ": "13761536381",
        signername    TYPE string, ": "孙雅祺",
        signerorgname TYPE string, ": "esigntest深圳开思时代科技有限公司PAAS"
      END OF ty_contractsignerinfolist .
  types:
    BEGIN OF ty_contractsigning,
        flowid                 TYPE string, ": "283e52417247473abbe0e72d167e6976",
        contractinfolist       TYPE STANDARD TABLE OF ty_contractinfolist WITH DEFAULT KEY,
        contractsignerinfolist TYPE STANDARD TABLE OF ty_contractsignerinfolist WITH DEFAULT KEY,
      END OF ty_contractsigning .
  types:
    tt_contractsigning TYPE STANDARD TABLE OF ty_contractsigning WITH DEFAULT KEY .
  types:
    "已签署协议合同
    BEGIN OF ty_contractsigned,
        protocolcode TYPE string, ": "TMP_LETTER_AUTHOR_V3",
        protocolname TYPE string, ": "个人信用咨询与管理服务协议（授权书）",
        urlhtml      TYPE string, ": "https://hwbeta-xm.casstime.com:8443/group1/M00/35/EC/Cgww7WaeKi6ETJ3YAAAAAMmXdNs382.pdf"
      END OF ty_contractsigned .
  types:
    tt_contractsigned TYPE STANDARD TABLE OF ty_contractsigned WITH DEFAULT KEY .

  methods GET_COMPANYPROFILES_TYC_INF
    importing
      value(IV_COMPANYNAME) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_TYCINFO) type ZAGRT_S_TYCINFO .
  methods GET_CREDITPROFILES_BYCOMPANYID
    importing
      value(IV_COMPANYID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_CREDITPROFILES) type ZAGRT_S_CREDITPROFILES .
  methods GET_COMPANYPROFILE_BYCOMPANYID
    importing
      value(IV_COMPANYID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_COMPANYDPROFILE) type ZAGRT_S_COMPANYPROFILES .
  methods CREATE_COMPANY_CREDITPROFILE
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_OUTPUT) type ZDT_ICEC_SAVE_CREDIT_PROFILE_R .
  methods GET_COMPANY_COMPANYPROFILE
    importing
      value(IV_BODY) type STRING
    exporting
      !ES_COMPANYPROFILE type TY_COMPANYPROFILES
      !EV_MSG type BAPIRET2 .
  methods GET_CUS_SIGNED_AGREEMENT
    importing
      value(IV_COMPANYCODE) type STRING
      value(IV_COMPANYID) type STRING
      value(IV_BUSINESSPHASE) type STRING
    exporting
      !ES_SIGNED type TT_CONTRACTSIGNED
      !EV_MSG type BAPIRET2 .
  methods GET_CUS_SIGNING_AGREEMENT
    importing
      value(IV_COMPANYID) type STRING
      value(IV_BUSINESSPHASE) type STRING
    exporting
      !ES_SIGNING type TT_CONTRACTSIGNING
      !EV_MSG type BAPIRET2 .
  methods UPDATE_COMPANY_CREDITPROFILE
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_OUTPUT) type ZDT_ICEC_UPDATE_CREDIT_PROFILE .
  methods GET_COMPANYPROFILES
    importing
      !IV_COMPANYID type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ES_COMPANYPROFILES type TY_COMPANYPROFILES .
  methods GET_COMPANYPROFILES_LIST
    importing
      value(IV_BODY) type STRING optional
    exporting
      !EV_MSG type BAPIRET2
      !ES_PROFILESLIST type ZAGRT_S_PROFILELIST .
  methods GET_BUSINESSPROFILE
    importing
      value(IV_COMPANYID) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_BUSINESSPROFILE) type TY_BUSINESSPROFILE .
  methods UPDATE_COMPANY_COMPANYPROFILE
    importing
      value(IV_BODY) type STRING
    exporting
      !OV_STATUS type STRING
      !EV_MSG type BAPIRET2 .
  methods GET_LASTAGREEMENT_INFO
    importing
      value(IV_COMPANY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ES_LASTAGREEMENT) type TY_LASTAGREEMENT .
  methods GET_VEN_INVOICE
    importing
      !IV_VENDORID type STRING
    exporting
      !EV_MSG type BAPIRET2
      !ES_INVOICEINFO type ZAGRT_S_INVOICEINFO .
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



CLASS ZCL_ICEC_AGREEMENT_API IMPLEMENTATION.


  METHOD create_company_creditprofile.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AGREEMENT' AND method = 'CREATE_COMPANY_CREDITPROFILE'.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    DATA:lv_title TYPE string.
    lv_title = '创建公司信用评级资料(ZCL_ICEC_AGREEMENT_API->CREATE_COMPANY_CREDITPROFILE)'.
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
    save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
    ENDIF.
  ENDMETHOD.


  METHOD get_businessprofile.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AGREEMENT'
          AND method = 'GET_BUSINESSPROFILE'.

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
          data = es_businessprofile ).


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


  METHOD get_companyprofiles.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AGREEMENT'
          AND method = 'GET_COMPANYPROFILES'.

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
          data = es_companyprofiles  ).


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


  METHOD get_companyprofiles_list.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AGREEMENT'
          AND method = 'GET_COMPANYPROFILES_LIST'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{param}' IN lv_uri WITH iv_body.
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
          data = es_profileslist ).


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


  METHOD get_companyprofiles_tyc_inf.


    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AGREEMENT'
          AND method = 'GET_COMPANYPROFILES_TYC_INF'.

    lv_uri = ls_ztint_icec_api-url.

    "urlencode


    CALL METHOD cl_http_utility=>escape_url
      EXPORTING
        unescaped = iv_companyname
      RECEIVING
        escaped   = iv_companyname.

    REPLACE '{companyName}' IN lv_uri WITH iv_companyname.



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
          data = es_tycinfo  ).


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

    IF ev_msg-type = 'S' AND lv_out IS INITIAL . "没报错但是返回结构是个空对象
      ev_msg-type = 'W'. " 此返回不判断
    ENDIF.
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_responsebody = lv_out ).
    ENDIF.



  ENDMETHOD.


  METHOD get_companyprofile_bycompanyid.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AGREEMENT'
          AND method = 'GET_COMPANYPROFILES_BYCOMPANYID'.

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
          data = es_companydprofile  ).


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


  METHOD get_company_companyprofile.
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AGREEMENT' AND method = 'GET_COMPANY_COMPANYPROFILE'.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    DATA:lv_title TYPE string.
    lv_title = '创建公司信用评级资料(ZCL_ICEC_AGREEMENT_API->GET_COMPANY_COMPANYPROFILE)'.
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
          data =  es_companyprofile ).
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


  METHOD get_creditprofiles_bycompanyid.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AGREEMENT'
          AND method = 'GET_CREDITPROFILES_BYCOMPANYID'.

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
          data = es_creditprofiles  ).


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


  METHOD get_cus_signed_agreement.
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AGREEMENT' AND method = 'GET_CUS_SIGNED_AGREEMENT'.

    DATA:lv_uri          TYPE string,
         iv_body         TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    iv_body = '{' && |"memCode": "{ iv_companycode }","businessPhase": "{ iv_businessphase }","companyId": "{ iv_companyid }"| && '}'.
    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    DATA:lv_title TYPE string.

    CALL METHOD lo_api->post_data
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
          data =  es_signed ).
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


  METHOD get_cus_signing_agreement.
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AGREEMENT' AND method = 'GET_CUS_SIGNING_AGREEMENT'.

    DATA:lv_uri          TYPE string,
         iv_body         TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    iv_body = '{' && |"companyId": "{ iv_companyid }","businessPhase": "{ iv_businessphase }"| && '}'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    CALL METHOD lo_api->post_data
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
          data =  es_signing ).
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


  METHOD get_lastagreement_info.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AGREEMENT'
          AND method = 'GET_LASTAGREEMENT_INFO'.

    lv_uri = ls_ztint_icec_api-url.
    REPLACE '{companyId}' IN lv_uri WITH iv_company.
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
          data = es_lastagreement ).
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


  METHOD get_ven_invoice.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AGREEMENT'
          AND method = 'GET_VEN_INVOICE'.

    lv_uri = ls_ztint_icec_api-url.


    REPLACE '{companyId}' IN lv_uri WITH iv_vendorid.



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
          data = es_invoiceinfo  ).


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

    IF ev_msg-type = 'S' AND lv_out IS INITIAL . "没报错但是返回结构是个空对象
      ev_msg-type = 'W'. " 此返回不判断
    ENDIF.
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_responsebody = lv_out ).
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


  METHOD update_company_companyprofile.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AGREEMENT' AND method = 'UPDATE_COMPANY_COMPANYPROFILE'.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = ls_ztint_icec_api-url.
    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    DATA:lv_title TYPE string.
    lv_title = '创建公司信用评级资料(ZCL_ICEC_AGREEMENT_API->UPDATE_COMPANY_COMPANYPROFILE)'.
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
          data =  ov_status ).
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


  METHOD update_company_creditprofile.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
          WHERE service = 'AGREEMENT' AND method = 'UPDATE_COMPANY_CREDITPROFILE'.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

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
    save_api_log( EXPORTING iv_keyvalue = lv_uri  iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
