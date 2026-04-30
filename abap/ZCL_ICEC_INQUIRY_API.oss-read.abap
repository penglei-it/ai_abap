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

        requestid  TYPE string, "鎶ヤ环缁撴灉ID

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

        causekey    TYPE string, "鍙嶉鍘熷洜key",

        causetype   TYPE string, "鍙嶉绫诲瀷",

        title       TYPE string, "鍙嶉鍐呭",

        useradddesc TYPE string, "鍏朵粬鏃跺唴瀹?
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

        createdby        TYPE string, ", // 鍒涘缓浜?
        createdstamp     TYPE string, ", // 鍒涘缓鏃堕棿

        lastupdatedstamp TYPE string, ", // 淇敼鏃堕棿

        orderid          TYPE string, ", // 璁㈠崟ID

        shoppinglistid   TYPE string, ", // 璇环鍗旾D

        statusid         TYPE string, ", // 鐘舵€?
        userneedsitemid  TYPE string, "// 鎶ヤ环缁撴灉ID

      END OF ts_neworder .

  types:

    BEGIN OF ts_newquotepinkagedto,

        pinkagetype   TYPE string, ", // 鍖呴偖绫诲瀷

        pinkagevalue  TYPE string, ": null, // 鍖呴偖鍊?
        subsidyamount TYPE string, ": null // 琛ヨ创閲戦

      END OF ts_newquotepinkagedto .

  types:

    BEGIN OF ts_newcashstepprice,

        btprice       TYPE string, ": null, // 涔板绋庡墠浠?
        maxnum        TYPE string, ", // 闃舵鏁伴噺鏈€澶у€?
        minnum        TYPE string, ", // 闃舵鏁伴噺鏈€灏忓€?
        price         TYPE string, ": null, // 涔板绋庡悗浠?
        sellerbtprice TYPE string, ": null, // 鍗栧绋庡墠浠?
        sellerprice   TYPE string, ": null, // 鍗栧绋庡悗浠?
        sortid        TYPE string, "// 鎺掑簭

      END OF ts_newcashstepprice .

  types:

    BEGIN OF ts_newstepprice,

        cashstepprice   TYPE ts_newcashstepprice,

        sortid          TYPE string, ", // 鎺掑簭

        userneedsitemid TYPE string, ", // 鎶ヤ环鏉＄洰ID

        minnum          TYPE string, ", // 闃舵鏁伴噺鏈€灏忓€?
        maxnum          TYPE string, ", // 闃舵鏁伴噺鏈€澶у€?
        price           TYPE string, ": null, // 涔板绋庡悗浠?
        btprice         TYPE string, ": null, // 涔板绋庡墠浠?
        sellerprice     TYPE string, ": null, // 鍗栧绋庡悗浠?
        sellerbtprice   TYPE string, ": null // 鍗栧绋庡墠浠?
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

        deliveryname        TYPE string, ", // 閰嶉€佸悕绉?
        deliverytime        TYPE string, ", // 閰嶉€佹椂闀?
        deliverytype        TYPE string, ", // 閰嶉€乀ype

        distance            TYPE string, ", // 閰嶉€佽窛绂?
        iswholion           TYPE string, ": false, // 鏄惁鏀寔灏忕嫯

        originfee           TYPE string, ": null, // 鏈姌鎵ｅ墠鐨勯噾棰?
        transporttime       TYPE string, ", // 杩愰€佹椂闀匡紝鍒嗛挓

        vehiclemode         TYPE string, ", // 杩愰€佽溅鍨?
        wholionlogisticsfee TYPE string, ": null // 灏忕嫯搴旀敹杩愯垂閲戦

      END OF ts_newwholionlogisticsdto .

  types:

    BEGIN OF ts_newquotedpriceresults,

        aftersalesnapshot            TYPE string, ", // 鍞悗蹇収

        aiscore                      TYPE string, ": null, // AI璇勫垎

        aiscoresortvalue             TYPE string, ", // AI璇勫垎鎺掑簭搴忓彿

        arrivaltime                  TYPE string, ", // 鏈€蹇埌璐ф椂闂?
        atboxfee                     TYPE string, ": null, // 鍚◣閽夌璐?
        atbuyerandboxfee             TYPE string, ": null, // 涔板鍚◣鎬昏垂鐢紙鎶ヤ环+閽夌璐癸級

        atsellerandboxfee            TYPE string, ": null, // 鍗栧鍚◣鎬昏垂鐢紙鎶ヤ环+閽夌璐癸級

        availablilitysale            TYPE string, ", // 鏈€鏂板彲鐢ㄩ浂浠跺彿

        biddingsortvalue             TYPE string, ", // 绔炰环鎺掑簭搴忓彿 - 鏆備笉鐢?
        boshauthorizationflag        TYPE string, ": false, // 鍗氫笘鎺堟潈缁忛攢鍟嗘爣璇?
        branddescription             TYPE string, ", // 鍝佺墝鎻忚堪Url

        brandid                      TYPE string, ", // 鍝佺墝ID

        brandname                    TYPE string, ", // 鍝佺墝鍚?
        btboxfee                     TYPE string, ": null, // 涓嶅惈绋庨拤绠辫垂

        btbuyerandboxfee             TYPE string, ": null, // 涔板鍚◣鎬昏垂鐢紙鎶ヤ环+閽夌璐癸級

        btprice                      TYPE string, ": null, // 鍏嶇◣浠锋牸

        btpricesortvalue             TYPE string, ", // 绋庡墠浠锋牸鎺掑簭搴忓彿

        btsellerandboxfee            TYPE string, ": null, // 鍗栧涓嶅惈绋庢€昏垂鐢紙鎶ヤ环+閽夌璐癸級

        cityid                       TYPE string, ", // 璇环鍩庡競

        combinedrecommenddescription TYPE string, ", // 缁勫悎閰嶄欢鎻忚堪

        combinedrecommendstatus      TYPE string, ", // 缁勫悎閰嶄欢鐘舵€?
        countrydistance              TYPE string, ": null, // 鎶ヤ环缁撴灉鍙戣揣鍦版墍鍦ㄥ尯鍒扮淮淇巶鎵€鍦ㄥ尯鐨勭洿绾胯窛绂?
        createdby                    TYPE string, ", // 鍒涘缓浜?
        createdstamp                 TYPE string, ", // 鍒涘缓鏃堕棿

        deliverytime                 TYPE string, ", // 棰勮鍙戣揣鏃堕棿

        deliverytimesortvalue        TYPE string, ", // 灏忕嫯鐗╂祦鏃舵晥鎺掑簭搴忓彿

        description                  TYPE string, ", // 鍟嗗搧鎻忚堪

        distancesortvalue            TYPE string, ", // 璺濈鎺掑簭搴忓彿

        distributesource             TYPE string, ", // 鐢ㄦ埛銆佺郴缁熸寚瀹?
        effective                    TYPE string, ", // 鏈夋晥

        exceptionwarningdescription  TYPE string, ", // 闂閰嶄欢闂鎻忚堪

        exceptionwarningstatus       TYPE string, ", // 闂閰嶄欢鐘舵€?
        exclusiveflag                TYPE string, ", // 涓撳睘渚涘簲鍟嗘爣璇?
        garagecompanyid              TYPE string, ", // 缁翠慨鍘傚叕鍙窱d

        garageopeninvoicetype        TYPE string, ", // 缁翠慨鍘傚紑绁ㄧ被鍨?
        hotsale                      TYPE string, "// 鏄惁涓轰績閿€鍟嗗搧

        id                           TYPE string, ", // 鎶ヤ环鏉＄洰userNeedsItemId

        inquirycreatedby             TYPE string, ", // 璇环鍗曞垱寤轰汉ID

        inquiryid                    TYPE string, ", // 璇环鍗旾D

        invoicetype                  TYPE string, ", // VAT:澧炲€肩◣涓撶エ锛汵ORMAL:鏅エ;BOTH:閮藉彲浠?
        iteminvoiceflag              TYPE string, ", // 鑳藉惁寮€瀵归」鍙戠エ

        itemorder                    TYPE string, ", // 绔炰环鎺掑悕搴忓彿

        lastupdatedstamp             TYPE string, ", // 淇敼鏃堕棿

        location                     TYPE string, ", // 鍙戣揣鍦?
        locationname                 TYPE string, ", // 鍙戣揣鍦板悕绉?
        needpackage                  TYPE string, ", // 鏄惁闇€瑕佹墦鍖?
        notcommonsupplier            TYPE string, ", // 涓嶅睘浜庡父鐢ㄤ緵搴斿晢:0鍚?鍗冲睘浜?1鏄?鍗充笉灞炰簬

        oldpartsnum                  TYPE string, ", // 璇戠爜缁撴灉闆朵欢鍙?
        openinvoicetype              TYPE string, ", // YES:寮€绁紱NO:涓嶅紑绁?BOTH:閮藉彲浠?
        orders                       TYPE STANDARD TABLE OF ts_neworder WITH DEFAULT KEY, ": [ // 涓嬪崟鏃ュ織

        originoenumber               TYPE string, ", // 璇戠爜缁撴灉

        originalassort               TYPE string, ", // 鍘熷巶閰嶅鏍囪瘑锛?鍚︼紝1鏄?
        originalsortvalue            TYPE string, ", // 鍘熷巶浼樺厛鎺掑簭搴忓彿

        parttype                     TYPE string, ", // 闆朵欢绫诲瀷

        partsbrandquality            TYPE string, ", // 闆朵欢鍝佺墝鍝佽川

        partsbrandqualitytype        TYPE string, ", // 闆朵欢鍝佺墝鍝佽川绫诲瀷;鍘熷巶浠躲€佸搧鐗屼欢銆佹媶杞︿欢銆佸師鍘傚啀鍒堕€犮€佸叾浠?
        partsname                    TYPE string, ", // 闆朵欢鍚?
        partsnum                     TYPE string, ", // 闆朵欢鍙?
        price                        TYPE string, ": null, // 閿€鍞环

        priceadjustmentrulesid       TYPE string, ", // 娴侀噺璋冭妭瑙勫垯ID

        pricesortvalue               TYPE string, ", // 绋庡悗浠锋牸鎺掑簭搴忓彿

        productid                    TYPE string, ", // 鍟嗗搧ID

        productpicturelist           TYPE string, ", // 鍟嗗搧鍥剧墖

        producttype                  TYPE string, ", // 鍟嗗搧绫诲瀷锛氱幇璐r璋冭揣

        productsetcode               TYPE string, ", // 濂椾欢缂栫爜

        productsetid                 TYPE string, ", // 濂椾欢ID

        qualitychannel               TYPE string, ", // 鍝佽川娓犻亾

        qualitylayer                 TYPE string, ", // 鍝佽川鍒嗗眰

        qualitysortvalue             TYPE string, ", // 鍝佽川鎺掑簭搴忓彿

        quantity                     TYPE string, ", // 鏁伴噺

        quotepinkagedto              TYPE ts_newquotepinkagedto, ": { // 鍖呴偖淇℃伅

        quoteuser                    TYPE string, ", // 鎶ヤ环鍛?
        quoteditemnewestflag         TYPE string, ", // 渚涘簲鍟嗘渶鏂版姤浠锋爣璇?
        quotedpriceitemid            TYPE string, ", // 鎶ヤ环鏉＄洰ID

        recommend                    TYPE string, ", // 鍟嗗鍔涜崘鏍囪瘑锛?鍚︼紝1鏄?
        remark                       TYPE string, ", // 澶囨敞

        resolveresultid              TYPE string, ", // 璇戠爜缁撴灉ID

        resolveresultname            TYPE string, ", // 璇戠爜缁撴灉鍚嶇О

        ruleid                       TYPE string, ", // 绔炰环鎺掑悕瑙勫垯绫诲瀷

        sellstatus                   TYPE string, ", // 閿€鍞姸鎬乁serNeedsItemSellStatusEnum

        sellstatusname               TYPE string, ", // 閿€鍞姸鎬佸悕绉癠serNeedsItemSellStatusEnum

        selltype                     TYPE string, ", // 閿€鍞被鍨?
        sellerbtprice                TYPE string, ": null, // 鍗栧绋庡墠浠?
        sellerprice                  TYPE string, ": null, // 鍗栧绋庡悗浠?
        showboschintegration         TYPE string, ": false, // 鍗氫笘鏄撲匠鍒嗘爣璇?
        showreplacementparts         TYPE string, ": false, // 鏇挎崲浠舵爣璇?
        showed                       TYPE string, ": false, // 榛樿false锛屼笉灞曠ず銆?
        source                       TYPE string, ", // 鎶ヤ环绫诲瀷UserNeedsItemSourceEnum

        stepprices                   TYPE STANDARD TABLE OF ts_newstepprice WITH DEFAULT KEY, ":  // 闃舵浠?
        storeflag                    TYPE string, ", // 渚涘簲鍟嗘爣璇?
        storeid                      TYPE string, ", // 搴楅摵ID

        storename                    TYPE string, ", // 搴楅摵鍚嶇О

        storepackageinfo             TYPE string, ", // 鍟嗗鍖呴偖淇℃伅, 鍏蜂綋璇存槑锛?-1: 涓嶆樉绀? 0: 鍙樉绀哄寘閭爣璇? 澶т簬0: 鏄剧ず鍏蜂綋鐨勯噾棰濆寘閭爣璇?
        storeservicearea             TYPE string, ", // 搴楅摵鏈嶅姟鑼冨洿

        storeweekday                 TYPE ts_newstoreweekday, ": { // 渚涘簲鍟嗕紤鎭棩鐩稿叧

        supplierbasearea             TYPE string, ", // 鐩稿浣嶇疆锛屽鐪併€佸悓鐪併€佸悓甯?
        suppliercompanyid            TYPE string, ", // 渚涘簲鍟嗗叕鍙窱D

        supplierscore                TYPE string, ": null, // 鍟嗗璇勫垎

        supplierscoresortvalue       TYPE string, ", // 鍟嗗璇勫垎鎺掑簭搴忓彿

        taxrate                      TYPE string, ": null, // 绋庣巼

        timesortvalue                TYPE string, ", // 鏃堕棿鎺掑簭搴忓彿

        top                          TYPE string, ": false, // 鏄惁缃《

        transporttimeforsort         TYPE string, ": null, // 灏忕嫯閰嶉€侀厤閫佹椂闀?
        unsaleableremark             TYPE string, ", // 绂佸敭鍘熷洜

        unsaleablestatus             TYPE string, ", // 绂佸敭涓庝笉寤鸿璐拱鐨勬爣蹇?
        whetherproductset            TYPE string, ", // 鏄惁濂椾欢,Y:鏄?N:鍚?
        wholionlogisticsdto          TYPE ts_newwholionlogisticsdto , ":  // 灏忕嫯閰嶉€佺墿娴佷俊鎭?
      END OF ts_newquotedpriceresults .

  types:

    BEGIN OF ts_newresolveresult,

        resolveid          TYPE string, ", // 璇戠爜鍗旾D

        selected           TYPE string, ": false, // 鏄惁閫変腑

        selltype           TYPE string, ", // 閿€鍞被鍨?
        source             TYPE string, ", // 鎶ヤ环绫诲瀷UserNeedsSourceEnum

        decodesource       TYPE string, ", // 璇戠爜鏉ユ簮

        hasorder           TYPE string, ": false, // 鏄惁宸蹭笅鍗?
        hidden             TYPE string, ": false, // 鏄惁闅愯棌

        id                 TYPE string, ", // 璇戠爜缁撴灉ID

        inquiryid          TYPE string, ", // 璇环鍗旾D

        inquiryitemid      TYPE string, ", // 闇€姹侷D

        issuggest          TYPE string, ", // 鏄惁鎺ㄨ崘

        needpackage        TYPE string, ", // 鏄惁闇€瑕佹墦鍖?
        competitiveprice   TYPE string,

        quotedpriceresults TYPE STANDARD TABLE OF ts_newquotedpriceresults WITH DEFAULT KEY,

        partsname          TYPE string, ", // 鏍囧噯鍚嶇О

        partsnum           TYPE string, ", // 闆朵欢鍙?
        quantity           TYPE string, ", // 鏁伴噺

        recommendamount    TYPE string, ", // 鎺ㄨ崘璐拱鏁伴噺

        referenceitemid    TYPE string, ", // 鎶ヤ环鏉＄洰

        referenceprice     TYPE string, ": null, // 鍙傝€冧环鏍?
        remark             TYPE string, ", // 璇戠爜澶囨敞

        standardname       TYPE string, ", // 鏃ф爣鍚?
        standardnamecode   TYPE string, ", // 鏍囧悕code

        status4skey        TYPE string, ", // 4S绾犻敊|琛ュ厖鐘舵€丼tatus4sEnum

        status4svalue      TYPE string, ", // 4S绾犻敊|琛ュ厖鐘舵€佸悕绉癝tatus4sEnum

        statusid           TYPE string, ", // 鐘舵€両D

        statusname         TYPE string, "// 鐘舵€佸悕绉?
      END OF ts_newresolveresult .

  types:

    BEGIN OF ts_newinquiryitem,

        id              TYPE string, ", // 闇€姹侷D

        inquiryid       TYPE string, ", // 璇环鍗旾D

        needsname       TYPE string, "

        remark          TYPE string, "闇€姹傚娉?
        quotestatusid   TYPE string, "

        quotestatusname TYPE string, "

        quantity        TYPE string,

        hasorder        TYPE string, "// 鏄惁宸蹭笅鍗?
        resolveresults  TYPE STANDARD TABLE OF ts_newresolveresult WITH DEFAULT KEY, ": // 璇戠爜缁撴灉

        source          TYPE string, ", // 鏉ユ簮UserNeedsSourceEnum

        statusid        TYPE string, ", // 鐘舵€両D

        statusname      TYPE string, "// 鐘舵€佸悕绉?
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

        createdby        TYPE string, ", // 鍒涘缓浜?
        createdstamp     TYPE string, ", // 鍒涘缓鏃堕棿

        lastupdatedstamp TYPE string, ", // 淇敼鏃堕棿

        mimetypeid       TYPE string, ": "", // 闄勪欢绫诲瀷MimeTypeEnum

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

        type  TYPE string, ": "", // 鎻忚堪绫诲瀷

        value TYPE string, ": "" // 鎻忚堪鍊?
      END OF  ts_quoteresourcedesc .

  types:

    BEGIN OF ts_quoteresourceinfo,

        businesstype     TYPE string, ": "", // 涓氬姟绫诲瀷

        id               TYPE string, ": "", // 涓婚敭Id

        mimetype         TYPE string, ": "", // 璧勬簮绫诲瀷,瑙嗛鍥剧墖

        photodescription TYPE string, ": "", // 鍥剧墖鎻忚堪鐨勮祫婧愬湴鍧€

        resourcesize     TYPE string, ": "", // 璧勬簮鐨勬枃浠跺ぇ灏?鍗曚綅KB

        resourcevalue    TYPE string, ": "", // 璧勬簮鍦板潃

        textdescription  TYPE string, ": "" // 鏂囧瓧鎻忚堪

      END OF ts_quoteresourceinfo .

  types:

    BEGIN OF ts_quoteresource,

        descriptions       TYPE STANDARD TABLE OF ts_quoteresourcedesc WITH DEFAULT KEY, " 鎶ヤ环鎻忚堪淇℃伅

        inquiryid          TYPE string, ": "", // 璇环鍗旾d

        quotationproductid TYPE string, ": "", // 鎶ヤ环缁撴灉Id

        resources          TYPE STANDARD TABLE OF ts_quoteresourceinfo WITH DEFAULT KEY, ": [ // 鎶ヤ环璧勬簮淇℃伅 鍥剧墖/瑙嗛

        storeid            TYPE string, ": "" // 搴楅摵Id

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

        locationname TYPE string, ": "杩涘彛璺檸",

        seriesid     TYPE string, ": "8-2",

        serieszh     TYPE string, ": "鎻借儨鏄熻剦",

        seriesen     TYPE string, ": "鎻借儨鏄熻剦",

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

        brandname              TYPE string, ": "璺檸",

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

        needsname               TYPE string, ": "鏈烘补鏍?,

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

        inquiryid        TYPE string, "璇环鍗旾D

        inquiryitemid    TYPE string, "闇€姹侷D

        id               TYPE string, "璇戠爜缁撴灉ID

        partsname        TYPE string, "鏍囧噯鍚嶇О

        partsnum         TYPE string, "闆朵欢鍙?
        quantity         TYPE string, "鏁伴噺

        source           TYPE string, "鎶ヤ环绫诲瀷UserNeedsSourceEnum

        selltype         TYPE string, "閿€鍞被鍨?
        remark           TYPE string, "澶囨敞

        standardname     TYPE string, "鏍囧悕

        standardnamecode TYPE string, "鏂版爣鍚峜ode

        statusid         TYPE string, "鐘舵€両D

        statusname       TYPE string, "鐘舵€佸悕绉?
        competitiveprice TYPE string, "4S搴椾环鏍?
        categorycode     TYPE string, "鍝佺被

      END OF ts_decode .

  types:

    tt_decode TYPE STANDARD TABLE OF ts_decode WITH DEFAULT KEY .

  types:

    BEGIN OF ts_pinkagelabel,

        activityid     TYPE string, "鍙傚姞鐨勬椿鍔╥d锛堝尮閰嶄笂娲诲姩鏃朵笉涓虹┖锛?
        activitysource TYPE string, "娲诲姩鏉ユ簮:搴楅摵鍖呴偖娲诲姩store,骞冲彴鍖呴偖娲诲姩platform

        pinkagelabel   TYPE string, "鍖呴偖娲诲姩鏍囩灞曠ず鏂囨锛堝尮閰嶄笂娲诲姩鏃朵笉涓虹┖锛?
        productid      TYPE string, "鍟嗗搧鍞竴鏍囪瘑,鍜屽叆鍙備竴涓€瀵瑰簲杩斿洖

      END OF ts_pinkagelabel .

  types:

    tt_pinkagelabel TYPE STANDARD TABLE OF ts_pinkagelabel WITH DEFAULT KEY .

  types:

      "閰嶅鑺辩汗鎶ヤ环id

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

        storeid    TYPE string, "浠撳簱id

        facilityid TYPE string, "搴楅摵id

      END OF ty_storeandfacilities .

  types:

    BEGIN OF ty_storeandfacilities1,

        storeid     TYPE string, "浠撳簱id

        facilityids TYPE STANDARD TABLE OF  ty_facility WITH DEFAULT KEY, "搴楅摵id

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

      "鍟嗗閰嶉€佹椂鏁堝嚭鍙?
    BEGIN OF ty_storedeliveryitem,

        destinationgeoid     TYPE string, "閫佽揪鍖哄煙geoId

        duration             TYPE string, "鏃舵晥锛堝崟浣嶅皬鏃?
        durationdescription  TYPE string, "鏃舵晥鎻忚堪

        durationdescriptions TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "鏃舵晥鎻忚堪

        facilityid           TYPE string, "浠撳簱id

        storeid              TYPE string, "搴楅摵id

      END OF ty_storedeliveryitem .

  types:

    tt_storedelivery TYPE STANDARD TABLE OF ty_storedeliveryitem WITH NON-UNIQUE SORTED KEY store COMPONENTS storeid facilityid .

  types:

    BEGIN OF ty_price,   "鎶ヤ环缁撴灉浠锋牸

        price     TYPE p LENGTH 13 DECIMALS 2,

        pricetype TYPE string,

      END OF ty_price .

  types:

    BEGIN OF ty_attribute,   "鎶ヤ环缁撴灉灞炴€?
        sourceid       TYPE string,

        sourcetype     TYPE string,

        attributetype  TYPE string,

        attributevalue TYPE string,

      END OF ty_attribute .

  types:

    BEGIN OF ty_resource,   "鎶ヤ环缁撴灉璧勬簮

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

    BEGIN OF ty_quoproduct,    "鎶ヤ环缁撴灉

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

        mediatype         TYPE string, "璧勬簮绫诲瀷

        typedescription   TYPE string,

        typeid            TYPE string, "涓氬姟绫诲瀷

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

        addressid       TYPE  string, "鍦板潃ID

        countygeoid     TYPE  string, "鍖篒d

        countygeoname   TYPE  string, "鍖哄悕绉?
        geocityid       TYPE  string, "甯侷D'

        geocityname     TYPE  string, "甯傚悕绉?

        geoprovinceid   TYPE  string, "鐪佷唤ID

        geoprovincename TYPE  string, "鐪佸悕绉?

        villagegeoid    TYPE  string, "琛楅亾Id

        villagegeoname  TYPE  string, "琛楅亾鍚嶅瓧

      END OF ts_addressinfos .

  types:

    BEGIN OF ts_inquirybaseinfos,

        appendinquiryqualities    TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "璇环鍗曡拷鍔犲搧璐ㄩ渶姹?
        inquiryqualities          TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "璇环鍗曞搧璐ㄩ渶姹?
        cloudbase                 TYPE  string, "浜戜粨

        createdby                 TYPE  string, " 鍒涘缓浜?
        createdstamp              TYPE  string, " 鍒涘缓鏃堕棿

        customerserviceid         TYPE  string, " 鏄惁琚鍙?
        customerserviceqq         TYPE  string, " 鍙戝竷婧?
        expiredstamp              TYPE  string, " 杩囨湡鏃堕棿

        inquiryamount             TYPE  string, "璇环鍗曟€婚噾棰?
        inquiryid                 TYPE  string, " 璇环鍗昳d

        inquirytype               TYPE  string , "璇环鍗曠被鍨婭nquiryTypeEnum

        insurancecompanycode      TYPE  string, "淇濋櫓鍏徃缂栫爜

        insurancecompanyshortname TYPE  string, "淇濋櫓鍏徃绠€绉?
        insurancedirect           TYPE  string, "鏄惁淇濋櫓鐩翠緵

        internalcode              TYPE  string, "鏈夋棤鍐呴儴缂栫爜

        invoicetype               TYPE  string, " 鍙戠エ绫诲瀷

        isaccident                TYPE  string, "鏄惁涓杞︿簨鏁呭崟

        isanonymous               TYPE  string , "鏄惁鍖垮悕; 0 : 瀹炲悕 ; 1 : 鍖垮悕

        ismarkinquiry             TYPE  int4, "1涓烘柊璇环鍗曪紝0涓烘棫璇环鍗?
        isneedwholeprice          TYPE  int4, " 0涓嶉渶瑕佸埌搴椾环锛?闇€瑕佸埌搴椾环

        isnewinquiry              TYPE  string, " 鏄惁涓烘柊瀹㈣浠峰崟

        isrequireiteminvoice      TYPE  int4, " 0涓轰笉闇€瑕佸椤瑰彂绁紝1涓洪渶瑕佸椤瑰彂绁?
        isskipdecode              TYPE  int4, " SkipDecodeEnum 1宸茶烦杩囪瘧鐮佺殑

        lastupdatedstamp          TYPE  string, " 淇敼鏃堕棿

        needcount                 TYPE  int4, " 闇€姹傛暟閲?
        newversion                TYPE  string, " 鏂扮増鏈?鏄細Y,鍚︼細鍏朵粬

        noreplacement             TYPE  string, " 鏄惁闇€瑕佹浛鎹欢

        openinvoicetype           TYPE  string, " YES:寮€绁紱NO:涓嶅紑

        quality                   TYPE  string, " 鍝佽川

        resolvebegindate          TYPE  string, "寮€濮嬭瘧鐮佹椂闂?
        resolveenddate            TYPE  string, "璇戠爜缁撴潫鏃堕棿

        resolvestatus             TYPE  string, " 瑙ｆ瀽鐘舵€?Y宸茶В鏋怤鏈В鏋怌缁х画瑙ｆ瀽'

        resolveusername           TYPE  string, " 璇戠爜鍛樺悕瀛?
        shoppinglisttypeid        TYPE  string, " 璇环鍗曠被鍨婭D

        sourceid                  TYPE  string, " 璇戠爜鍗旾D

        statusid                  TYPE  string, " 鐘舵€両D

        username                  TYPE  string, " 鑱旂郴浜?
      END OF ts_inquirybaseinfos .

  types:

    BEGIN OF ty_inquirycarinfos,

        carbrandid     TYPE  string, "姹借溅鍝佺墝

        carbrandname   TYPE  string, "杞﹀搧鐗屽悕绉?
        carmodelid     TYPE  string, "杞﹀瀷ID

        carmodelname   TYPE  string, "杞﹀瀷鍚嶇О

        chassisid      TYPE  string, "搴曠洏鍙?
        enginetype     TYPE  string, "閿€鍞溅鍨嬪悕绉?

        epcmodelcode   TYPE  string , "epc杞﹀瀷id

        epcmodelname   TYPE  string, "epc杞﹀瀷鍚嶇О

        inquiryid      TYPE  string, "璇环鍗昳d

        licenseplate   TYPE  string, "杞︾墝

        locationid     TYPE  string, "涓绘満鍘侷D

        locationname   TYPE  string, "涓绘満鍘傚悕绉?
        productiondate TYPE  string, "鍑哄巶鏃ユ湡

        seriesen       TYPE  string, "杞︾郴鑻辨枃鍚嶇О

        seriesid       TYPE  string, "杞︾郴ID

        serieszh       TYPE  string, "杞︾郴涓枃鍚嶇О

        vehicletype    TYPE  string, "'閿€鍞溅鍨婭D'

        vin            TYPE  string, "vin鐮?
      END OF ty_inquirycarinfos .

  types:

    BEGIN OF ty_inquirytaginfos,

        id        TYPE  int4, "id

        inquiryid TYPE  string, "璇环鍗曞彿ID-->shoppingListId

        tagtype   TYPE  string, "鏍囩绫诲瀷

        tagvalue  TYPE  string, "鏍囩鍊?
      END OF ty_inquirytaginfos .

  types:

    BEGIN OF ts_inquiryuserinfos,

        contactnumber     TYPE  string, "'鏈哄彿鐮?
        corporateid       TYPE  string, "涓昏处鍙稩D

        corporatename     TYPE  string, "涓昏处鍙峰悕绉?
        garagecompanyid   TYPE  string, "鍏徃璐﹀彿ID

        garagecompanyname TYPE  string, "鍏徃鍚嶇О

        groupuserid       TYPE  string, "'闆嗗洟鐢ㄦ埛ID'

        groupusername     TYPE  string, "'闆嗗洟鐢ㄦ埛鍚嶇О'

        username          TYPE  string, "'鑱旂郴浜?

      END OF ts_inquiryuserinfos .

  types:

    BEGIN OF ts_inquiryhead,

        addressinfos     TYPE  ts_addressinfos, "鍦板潃淇℃伅

        address          TYPE  ts_addressinfos, "鍦板潃淇℃伅

        inquirybaseinfos TYPE  ts_inquirybaseinfos, "璇环鍗曡嚜甯︿俊鎭?
        inquirycarinfos  TYPE ty_inquirycarinfos, "杞﹁締淇℃伅

        inquirytaginfos  TYPE STANDARD TABLE OF ty_inquirytaginfos WITH DEFAULT KEY, "璇环鏍囩淇℃伅

        inquiryuserinfos TYPE ts_inquiryuserinfos, "璇环鏍囩淇℃伅

      END OF ts_inquiryhead .

  types:

*    "鍐峰簱璇环鍗曟姮澶?
*    TYPES:

*      BEGIN OF ts_inquirybaseinfos,

*        inquiryid            TYPE string, ": "B23020104747",

*        createdby            TYPE string, ": "61eb7715bd22310001d46d85",

*        createdstamp         TYPE string, ": 1675266354000,

*        username             TYPE string, ": "璁㈠崟鑷姩鍖?,

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

*        resolveusername      TYPE string, ": "绯荤粺",

*        openinvoicetype      TYPE string, ": "NO",

*        noreplacement        TYPE string, ": "N",

*        isanonymous          TYPE string, ": "0",

*        isskipdecode         TYPE string, ": 0,

*        ismarkinquiry        TYPE string, ": 1,

*        isrequireiteminvoice TYPE string, ": 0,

*        isneedwholeprice     TYPE string, ": 0,

*        inquiryamount        TYPE string, ": 0,

*      END OF ts_inquirybaseinfos.

*    "鍐峰簱璇环鍗曡鎯?
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

        sublayername      TYPE string, ": "瀹濋┈-鍘熷巶(闈炲浗鍐?S)",

        brandcode         TYPE string, ": "BMW",

        brandname         TYPE string, ": "瀹濋┈",

        qualitycode       TYPE string, ": "ORIGINAL_CURRENCY",

        qualityname       TYPE string, ": "鍘熷巶(闈炲浗鍐?S)",

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

        layername      TYPE string, ": "鍏朵粬",

        layerexpandnum TYPE string, ": 3,

        sublayers      TYPE STANDARD TABLE OF ts_sublayers1 WITH DEFAULT KEY, ":

      END OF ts_layers1 .

  types:

    BEGIN OF ts_quotationproducts1,

        quotationproductid     TYPE string, ": "653b6fcb11deb70001f97da1",

        remark                 TYPE string, ": "鏃犲簱瀛?,

        inquiryid              TYPE string, ": "B23102709253",

        resolveresultid        TYPE string, ": "653b6fba42bac500013c51d9",

        storeid                TYPE string, ": "GZATQ001",

        storename              TYPE string, ": "骞垮窞濂ュぉ濂囨苯閰?,

        storeservicearea       TYPE string, ": "NATION",

        productid              TYPE string, ": "20941166848559595520",

        producttype            TYPE string, ": "FINISHED_GOODS",

        partsnum               TYPE string, ": "37116796925",

        partsname              TYPE string, ": "鍑忛渿",

        parttype               TYPE string, ": "ORIGINAL_PARTS",

        brandid                TYPE string, ": "BMW",

        brandname              TYPE string, ": "瀹濋┈",

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

        locationname           TYPE string, ": "娣卞湷绂忕敯浠?,

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

        partsname             TYPE string, ": "鐏姳濉?,

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

        standardname          TYPE string, ": "鐏姳濉?,

        standardnamecode      TYPE string, ": "109210001",

        categorycode          TYPE string,                  ": "10921",

        layers                TYPE STANDARD TABLE OF ts_layers1 WITH DEFAULT KEY, ": [],

        quotationproducts     TYPE STANDARD TABLE OF ts_quotationproducts1 WITH DEFAULT KEY, ": []

      END OF ts_decoderesults .

  types:

    BEGIN OF ts_userneeds,

        needid                TYPE string, ": "1997115979542220800",

        inquiryid             TYPE string, ": "B23020104747",

        needsname             TYPE string, ": "鐏姳濉?,

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

        standardname          TYPE string, ": "鐏姳濉?,

        categorycode          TYPE string,                  ": "10921",

        dataresources         TYPE STANDARD TABLE OF ts_dataresources WITH DEFAULT KEY,

        decoderesults         TYPE STANDARD TABLE OF ts_decoderesults WITH DEFAULT KEY,  ":

      END OF ts_userneeds .

  types:

    BEGIN OF ts_decoderesultnavigation,

        userneedid        TYPE string, ": "1997115979542220800",

        decoderesultid    TYPE string, ": "63da8932fb022f0001d87922",

        partsnum          TYPE string, ": "17 11 7 802 662",

        partsname         TYPE string, ": "鐏姳濉?,

        showorderedflag   TYPE string, ": false,

        quotestatus       TYPE string, ": "宸叉姤浠?,

        quoteresultnumber TYPE string, ": 0

      END OF ts_decoderesultnavigation .

  types:

    BEGIN OF ts_userneedsnavigation,

        userneedsid            TYPE string, ": "1997115979542220800",

        needsname              TYPE string, ": "鐏姳濉?,

        source                 TYPE string, ": "MANUAL_ENTRY",

        decoderesultnavigation TYPE STANDARD TABLE OF ts_decoderesultnavigation WITH DEFAULT KEY, ": [

      END OF ts_userneedsnavigation .

  types:

    BEGIN OF ts_coldinquiry_detail,

        userneeds           TYPE STANDARD TABLE OF ts_userneeds WITH DEFAULT KEY,

        userneedsnavigation TYPE STANDARD TABLE OF ts_userneedsnavigation WITH DEFAULT KEY,

      END OF ts_coldinquiry_detail .

  types:

*------------   "鍐峰簱璇环鍗曡鎯?
    BEGIN OF ts_label,

        adids           TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "骞垮憡ID

        adlocationid    TYPE string, "骞垮憡浣嶇疆ID

        floatingcontent TYPE string, "鏍囩娴獥鏂囨

        labelid         TYPE string, "鏍囩ID

        labelname       TYPE string, "鏍囩鍚嶇О

        labeltype       TYPE string, "鏍囩绫诲瀷

        labeltypename   TYPE string, "鏍囩绫诲瀷鍚?
        url             TYPE string, "璺宠浆url

      END OF ts_label .

  types:

    BEGIN OF ts_labelad,

        labels      TYPE STANDARD TABLE OF ts_label WITH DEFAULT KEY, "骞垮憡鏍囩

        showadvflag TYPE string, "鏄惁灞曠ず骞垮憡鏍囪瘑

      END OF ts_labelad .

  types:

    BEGIN OF ts_sortad,

        adids        TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "骞垮憡id

        adlocationid TYPE string, "骞垮憡浣嶇疆ID

        locationrank TYPE string, "鎺ㄥ箍浣嶇疆

        showadvflag  TYPE string, "鏄惁灞曠ず骞垮憡鏍囪瘑

      END OF ts_sortad .

  types:

    BEGIN OF ts_quotationproducts,

        alwaysshow             TYPE string, "鏄惁涓€瀹氳灞曠ず

        arrivaltime            TYPE string, "鏈€蹇埌璐ф椂闂? xx澶?
        atboxfee               TYPE string, "绋庡悗閽夌璐?
        atbuyerandboxfee       TYPE string, "涔板鍚◣鎬昏垂鐢紙鍏嶇◣鎶ヤ环+鍏嶇◣閽夌璐癸級

        brandid                TYPE string, "鍝佺墝id

        brandname              TYPE string, "鍝佺墝鍚?
        brandpartsremark       TYPE string, "鍝佺墝浠惰鏍煎娉?
        brandpartsurls         TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "鍝佺墝浠惰鏍煎浘鐗?
        btboxfee               TYPE string, "绋庡墠閽夌璐?
        btbuyerandboxfee       TYPE string, "涔板鍚◣鎬昏垂鐢紙鍚◣鎶ヤ环+鍚◣閽夌璐癸級

        btprice                TYPE string, "鍏嶇◣浠锋牸

        createdby              TYPE string, "鍒涘缓浜?
        createdstamp           TYPE string, "鍒涘缓鏃堕棿

        description            TYPE string, "鍟嗗搧鎻忚堪

        distance               TYPE string, "璺濈

        garagecompanyid        TYPE string, "缁翠慨鍘傚叕鍙竔d

        hotsale                TYPE string, "鏄惁涓轰績閿€鍟嗗搧

        inquiryid              TYPE string, "璇环鍗曞彿

        isordered              TYPE string, "鏄惁宸查噰

        isquotationnoinventory TYPE string, "鏄惁绯荤粺鎶ヤ环鏃犲簱瀛?
        isreplacement          TYPE string, "鏄惁鏇挎崲浠?true 鏄浛鎹欢

        replacementtype        TYPE string, ": "PLATFORM_REPLACE","STORE_REPLACE","REPLACE_PART"

        isshowpartsnum         TYPE string, "鏄惁鏄剧ず闆朵欢鍙?
        labelad                TYPE ts_labelad, " 鏍囩骞垮憡

        lastupdatedstamp       TYPE string, "鏈€鍚庢洿鏂版椂闂?
        location               TYPE string, "鍙戣揣鍦癷d

        locationname           TYPE string, "鍙戣揣鍦板悕绉?
        originalassort         TYPE string, "鍘熷巶閰嶅鏍囪瘑.0鍚?鏄?
        parttype               TYPE string, "闆朵欢绫诲瀷

        partition              TYPE string, "鍒嗗尯

        partsbrandquality      TYPE string, "闆朵欢鍝佺墝鍝佽川

        partsname              TYPE string, "闆朵欢鍚?
        partsnum               TYPE string, "闆朵欢鍙?
        price                  TYPE string, "閿€鍞环

        priceadjustmentrulesid TYPE string, "浠锋牸璋冭妭ID

        productid              TYPE string, "鍟嗗搧id

        productsetcode         TYPE string, "濂椾欢缂栫爜

        productsetid           TYPE string, "濂椾欢id

        producttype            TYPE string, "鍟嗗搧绫诲瀷锛欶INISHED_GOODS or DISPATCH_GOODS

        quantity               TYPE string, "鏁伴噺

        quotationid            TYPE string, "鎶ヤ环鍗昳d

        quotationproductid     TYPE string, "鎶ヤ环缁撴灉id

        quotedtime             TYPE string, "鎶ュ嚭鏃堕棿

        remark                 TYPE string, "鍟嗗澶囨敞

        resolveresultid        TYPE string, "璇戠爜缁撴灉id

        sellstatus             TYPE string, "閿€鍞姸鎬?
        selltype               TYPE string, "閿€鍞被鍨?
        sellerbtprice          TYPE string, " 鍗栧鍏嶇◣浠锋牸

        sellerbtpriceandboxfee TYPE string, "鍗栧鍏嶇◣閿€鍞环锛堝厤绋庢姤浠?鍏嶇◣閽夌璐癸級

        sellerprice            TYPE string, "鍗栧鍚◣浠锋牸

        sellerpriceandboxfee   TYPE string, "鍗栧鍚◣閿€鍞环锛堝惈绋庢姤浠?鍚◣閽夌璐癸級

        showadvflag            TYPE string, "鏄惁灞曠ず骞垮憡鏍囪瘑

        sortad                 TYPE ts_sortad, "鎺掑簭骞垮憡

        source                 TYPE string, "鏉ユ簮

        storecategoryscore     TYPE string, "鎶ヤ环缁撴灉搴楅摵绫诲埆鍒嗘暟

        storeid                TYPE string, "搴楅摵id

        storename              TYPE string, " 搴楅摵鍚?
        storeservicearea       TYPE string, "搴楅摵鏈嶅姟鑼冨洿

        suppliercompanyid      TYPE string, "渚涘簲鍟唅d

        taxrate                TYPE string, "绋庣巼

        totalscore             TYPE string, "鎶ヤ环缁撴灉鎬诲垎

        whetherproductset      TYPE string, "鏄惁濂椾欢

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

        brandname                   TYPE string, ": "鍩冩．",

        ispartcategorycertification TYPE string, ": false,   //鏄惁鏈夐厤濂楄祫璐紝true涓洪厤濂楄祫璐紝false涓烘棤閰嶅璧勮川

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

        adjustmentproducttype TYPE string, ", // 璋冭妭鍟嗗搧绫诲瀷

        boxfee                TYPE string, " 閽夌璐?
        categorycode          TYPE string, "鍝佺被code

        competitiveprice      TYPE string, " 4s搴椾环鏍?
        competitiveversion    TYPE string, "4s浠锋牸鐗堟湰

        createdby             TYPE string, "鍒涘缓浜?
        dataresources         TYPE STANDARD TABLE OF ts_dataresources WITH DEFAULT KEY, ": [ // 璇戠爜璐村浘

        decoderesultid        TYPE string, "璇戠爜缁撴灉ID

        decodesource          TYPE string, "璇戠爜鏉ユ簮

        decoderid             TYPE string, "璇戠爜鍛榠d

        inquiryid             TYPE string, "璇环鍗旾D

        issuggest             TYPE string, "寤鸿"

        needpackage           TYPE string, "鏄惁闇€瑕佹墦鍖?
        orderid               TYPE string, "璁㈠崟id

        partsname             TYPE string, "闆朵欢鍚嶇О

        partsnum              TYPE string, "闆朵欢鍙?
        quality               TYPE string, "鍝佽川

        quantity              TYPE string, "鏁伴噺

        layers                TYPE STANDARD TABLE OF ts_layers WITH DEFAULT KEY,

        quotationproducts     TYPE STANDARD TABLE OF ts_quotationproducts WITH DEFAULT KEY,

        recommendamount       TYPE string, "鎺ㄨ崘璐拱鏁伴噺

        referenceitemid       TYPE string, "鎶ヤ环鏉＄洰

        referenceprice        TYPE string, "鍙傝€冧环鏍?
        remark                TYPE string, " 澶囨敞

        selltype              TYPE string, "閿€鍞被鍨?
        source                TYPE string, "鏉ユ簮

        standardname          TYPE string, "鏃ф爣鍑嗗悕绉?
        standardnamecode      TYPE string, "鏍囧噯鍚嶇Оcode

        status4skey           TYPE string, "4S绾犻敊鐘舵€乲ey

        status4svalue         TYPE string, "4S绾犻敊鐘舵€佹弿杩?
        statusid              TYPE string, "鐘舵€?
        userneedsid           TYPE string, "鍘熷闇€姹俰d

      END OF ts_decoderesult .

  types:

    BEGIN OF ts_inqquotabody_uneed,

        adjustmentproducttype TYPE string, ", // 璋冭妭鍟嗗搧绫诲瀷

        categorycode          TYPE string, ", // 鍝佺被code

        competitiveprice      TYPE string, ", // 4S搴椾环鏍?
        competitiveversion    TYPE string, ", // 4s浠锋牸鐗堟湰

        createdby             TYPE string, ", // 鍒涘缓浜?
        dataresources         TYPE STANDARD TABLE OF ts_dataresources WITH DEFAULT KEY,

        decoderesults         TYPE STANDARD TABLE OF ts_decoderesult WITH DEFAULT KEY,

        decodesource          TYPE string, ", // 璇戠爜鏉ユ簮

        description           TYPE string, ", // 鎻忚堪

        inquiryid             TYPE string, ", // 璇环鍗旾D

        issuggest             TYPE string, ", // null

        needid                TYPE string, ", // 闇€姹侷D

        needpackage           TYPE string, ", // 鏄惁闇€瑕佹墦鍖?
        needsname             TYPE string, ", // 瀹㈡埛闇€姹?閰嶄欢鍚嶇О)

        orderid               TYPE string, ", // 璁㈠崟ID

        pid                   TYPE string, ", // null

        quantity              TYPE string, ", // 鏁伴噺

        referenceprice        TYPE string, " // 鍙傝€冧环鏍?
        remark                TYPE string, ", // 澶囨敞

        selltype              TYPE string, ", // 閿€鍞被鍨?
        source                TYPE string, ", // null

        standardname          TYPE string, ", // 鏍囧噯鍚嶇О

        standardnamecode      TYPE string, ", // 鏍囧噯鍚嶇Оcode

        statusid              TYPE string, " // 鐘舵€?
        itemreturnflag        TYPE string, "//閫€鍥炴爣蹇?
      END OF ts_inqquotabody_uneed .

  types:

    BEGIN OF ts_inqquotabody,

        userneeds TYPE STANDARD TABLE OF ts_inqquotabody_uneed WITH DEFAULT KEY,

      END OF ts_inqquotabody .

  types:

    BEGIN OF ts_stepprice,

        btprice       TYPE string, "涔板绋庡墠浠?
        maxnum        TYPE string, "闃舵鏁伴噺鏈€澶у€?
        minnum        TYPE string, "闃舵鏁伴噺鏈€灏忓€?
        price         TYPE string, "涔板绋庡悗浠?
        sellerbtprice TYPE string, "鍗栧绋庡墠浠?
        sellerprice   TYPE string, "鍗栧绋庡悗浠?
        sortid        TYPE string, "鎺掑簭

      END OF ts_stepprice .

  types:

    BEGIN OF ts_storequoteitemresult,

        resolveresultid   TYPE string, "璇戠爜缁撴灉ID

        userneedsitemid   TYPE string, "鎶ヤ环鏉＄洰ID

        productid         TYPE string, "鍟嗗搧ID

        aftersalesnapshot TYPE string, "鍞悗蹇収

        "aftersalepoliciesinfos TYPE STANDARD TABLE OF ts_aftersalepoliciesinfo WITH DEFAULT KEY, "鍞悗

        stepprices        TYPE STANDARD TABLE OF ts_stepprice WITH DEFAULT KEY, "闃舵浠锋牸

      END OF ts_storequoteitemresult .

  types:

    BEGIN OF ts_storequoteitem,

        quotedpriceitemid     TYPE string, "鎶ヤ环鏉＄洰id

        resolveresultid       TYPE string, "璇戠爜缁撴灉ID

        source                TYPE string, "鍒嗛厤鐨勭被鍨嬶細绯荤粺鎶ヤ环銆佷汉宸ユ姤浠枫€佺郴缁熶汉宸ラ兘鏈?
        status                TYPE string, "姝よ瘧鐮佹潯鐩笅鐨勬姤浠风姸鎬侊紝宸叉姤浠凤紝鎶ヤ环涓紝鏈垎閰嶏紝鎶ョ己璐э紝閲嶆柊璇戠爜

        storeid               TYPE string, "搴楅摵ID

        storename             TYPE string, "搴楅摵鍚嶇О

        storequoteitemresults TYPE STANDARD TABLE OF ts_storequoteitemresult WITH DEFAULT KEY, "渚涘簲鍟嗘姤浠风粨鏋?
      END OF ts_storequoteitem .

  types:

    BEGIN OF ts_supquotadetail,

        storeid              TYPE string, "搴楅摵ID

        storename            TYPE string, "搴楅摵鍚嶇О

        wholeorderquote      TYPE string, "鏄惁鏁村崟鎶ュ嚭锛堝師濮嬮渶姹傜淮搴︼級

        unquoteresolveids    TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "鎶ヤ环涓殑璇戠爜缁撴灉id'

        outofstockresolveids TYPE STANDARD TABLE OF string WITH DEFAULT KEY, "鎶ョ己璐х殑璇戠爜缁撴灉id

*        storequoteitems      TYPE TABLE OF ts_storequoteitem WITH DEFAULT KEY, " 渚涘簲鍟嗘姤浠锋潯鐩?
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

      "璇环鍗曢绠楁帴鍙?
    BEGIN OF ts_productitems,

        productid         TYPE string, ": "6752aa5f1aeb5400017e2fc9",鍟嗗搧ID锛岃浠峰満鏅槸鎶ヤ环缁撴灉ID 鍟嗗煄鍦烘櫙鏄晢鍝両D

        originalunitprice TYPE string,                  ": 1500,鍘熷鍩虹鍗曚环銆愬晢瀹舵姤浠枫€?
        baseunitprice     TYPE string,                  ": 1500,鏄剧ず鍩虹鍗曚环

        quantity          TYPE string, ": 1,鍟嗗搧鏁伴噺

        unitprice         TYPE string,                  ": 1455,鎴愪氦鍗曚环[浼樻儬鍚庣殑浠锋牸]-棰勪及浠?
        perdiscountamount TYPE string, ": 45,姣忎欢鍟嗗搧浼樻儬閲戦

        subdiscountamount TYPE string, ": 45,鍟嗗搧浼樻儬閲戦灏忚

        adjustments       TYPE string, ": null浠锋牸浼樻儬璋冭妭

      END OF ts_productitems .

  types:

    BEGIN OF ts_calculationlable,

        productid                TYPE string, ": "6752aa5f1aeb5400017e2fc9",鍟嗗搧ID锛岃浠峰満鏅槸鎶ヤ环缁撴灉ID 鍟嗗煄鍦烘櫙鏄晢鍝両D

        promotiontemplateid      TYPE string, ": "1",淇冮攢妯℃澘ID

        promotiontypeid          TYPE string, ": null,淇冮攢娲诲姩绫诲瀷

        promotionname            TYPE string, ": "鍥藉唴鍝佺墝浠?7鎶?,淇冮攢鍚嶇О

        promotiontypedisplayname TYPE string, ": "涓ラ€夋姌鎵ｅ崱",淇冮攢绫诲瀷鏄剧ず鍚嶇О

        displayname              TYPE string, ": "浜?.7鎶?,淇冮攢鏄剧ず鍚嶇О

        displaylocation          TYPE string, ": "LABEL",淇冮攢鏄剧ず鍚嶄綅缃紝label:鍟嗗搧鏉＄洰涓婃爣绛惧舰寮忥紝dropdownlist:鍟嗗娲诲姩涓轰笅鎷夋褰㈠紡鏄剧ず

        sort                     TYPE string, ": 1,鏄剧ず鎺掑簭锛屾姌鎵ｅ崱鏆傛棤鎺掑簭闇€姹?
        recommend                TYPE string, ": true,鏄惁涓烘帹鑽愪績閿€,true:琛ㄧず鎺ㄨ崘

        issueorganizationtype    TYPE string, ": "PLATFORM",褰掑睘缁勭粐 : 鍟嗗(SUPPLIER),骞冲彴(PLATFORM)

        issueorganizationid      TYPE string, ": "CASS"褰掑睘缁勭粐锛屽紑鎬?CASS)

      END OF ts_calculationlable .

  types:

    BEGIN OF ts_calculationdata,

        productitems TYPE STANDARD TABLE OF ts_productitems WITH DEFAULT KEY, ":淇冮攢浼樻儬鍚庣殑浠锋牸淇℃伅[浠呰繑鍥炴湁浼樻儬鐨勬暟鎹甝

        labels       TYPE STANDARD TABLE OF  ts_calculationlable WITH DEFAULT KEY, "淇冮攢浼樻儬鏄剧ず鐨勪績閿€浼樻儬淇℃伅[[2024.5鏈堜箣鍚庣殑鍟嗗淇冮攢娲诲姩]

*            summaries": null,淇冮攢閲戦璁＄畻姹囨€?
*              storesummaries": null,搴楅摵淇冮攢姹囨€?
*              quotationpromotions": [],鎶ヤ环缁撴灉淇冮攢淇℃伅娲诲姩娓呭崟[2024.5鏈堜箣鍓嶇殑鍟嗗淇冮攢娲诲姩]

*              preferentialprices": [],鎶ヤ环缁撴灉淇冮攢棰勪及浠穂2024.5鏈堜箣鍓嶇殑鍟嗗淇冮攢棰勪及璁

*              recommend": null閫夋嫨鎶ヤ环鍟嗗淇冮攢鎺ㄨ崘+鍟嗗淇冮攢浼樻儬浠锋牸璁＄畻

      END OF ts_calculationdata .

  types:

    BEGIN OF ts_calculations,

        code         TYPE string, ": 200,

        errormessage TYPE string, ": null,

        data         TYPE ts_calculationdata, ": {

      END OF ts_calculations .

  types:

      "璇环鍗曞娉ㄥ紓甯稿師鍥犱笌澶勭疆鎺柦

    BEGIN OF ts_remarkrule,

        inquiryid             TYPE string, ": "B25022111952",     璇环鍗曞彿

        quotationproductid    TYPE string, ": "67b7d891b509010001c20a61",     璇环鍗曞彿

        productid             TYPE string, ": "22688295122636308790",     鍟嗗搧id

        quoteuserid           TYPE string, ": "system",     鎶ヤ环鍛?
        resolvepartsname      TYPE string, ": "姘寸",     璇戠爜闆朵欢鍚?
        resolvepartsnum       TYPE string, ": "LR152200",     璇戠爜闆朵欢鍙?
        storeid               TYPE string, ": "5100001554",     搴楅摵ID

        storename             TYPE string, ": "璺檸鎹疯惫鏃楄埌搴楋紙鍥涘窛锛?,     搴楅摵鍚嶇О

        quotetime             TYPE string, ": 1740101778000,     鎶ヤ环鏃堕棿

        controlmeasuretype    TYPE string, ": "COLLAPSE_QUOTATION_RESULTS",     澶勭疆鏂瑰紡ID

        quotetype             TYPE string, ": "AUTO",     鎶ヤ环鏂瑰紡

        carbrandid            TYPE string, ": "LANDROVER",     姹借溅鍝佺墝ID

        carbrandname          TYPE string, ": "璺檸",     姹借溅鍝佺墝

        partsbrandid          TYPE string, ": "LANDROVER",     閰嶄欢鍝佺墝ID

        partsbrandname        TYPE string, ": "璺檸",     閰嶄欢鍝佺墝

        partsbrandquality     TYPE string, ": "ORIGINAL_INLAND_4S",     閰嶄欢鍝佽川

        partsbrandqualityname TYPE string, ": "鍘熷巶(鍥藉唴4S)",     閰嶄欢鍝佽川鍚嶇О

        stockstatus           TYPE string, ": "FINISHED_GOODS",     澶囪揣鎯呭喌

        remark                TYPE string, ": "澶у簱璁㈣揣1-30澶╋紝涓嬪崟鍓嶈涓庡簵閾哄鏈嶆矡閫氱‘璁?,     澶囨敞

        rulesource            TYPE string, ": "MANUAL_CONFIGURATION",     绠℃帶鏉ユ簮

        ruletype              TYPE string, ": "MISMATCH_IN_STOCKING_TIME",     鍛戒腑瑙勫垯绫诲瀷

        ruletypename          TYPE string, ": "璋冭揣鎶ョ幇璐?,     鍛戒腑瑙勫垯绫诲瀷鍚嶇О

        rulename              TYPE string, ": "璋冭揣鎶ョ幇璐?,     瑙勫垯鍚嶇О

        ruleid                TYPE string, ": "GK2023110807480",     鍛戒腑瑙勫垯ID

        credibility           TYPE string, ": 100.00,     鍛戒腑淇″害

        identifyresult        TYPE string, ": "NONE",     璇嗗埆缁撴灉

        createdby             TYPE string, ": "system",     鍒涘缓浜?
        createddate           TYPE string, ": 1740101780000,     鍒涘缓鏃堕棿

        lastupdatedby         TYPE string, ": "system",     鏇存柊浜?
        lastupdateddate       TYPE string, ": 1740101780000     鏇存柊鏃堕棿

      END OF ts_remarkrule .

  types:

    tt_remarkrule TYPE STANDARD TABLE OF ts_remarkrule WITH DEFAULT KEY .

  types:

      "璇环鍗曢绠楁帴鍙ｅ叆鍙?
    BEGIN OF ts_productitem,

        storeid       TYPE string, ": "4400016109",搴楅摵ID

        inquiryid     TYPE string, ": "B24120609261",璇环鍗旾D锛岃浠峰崟鍦烘櫙,姝ゅ弬鏁板繀浼?
        baseunitprice TYPE string,                     ": 1500,璇曠畻鍩虹鍗曚环

        productid     TYPE string, ": "6752aa5f1aeb5400017e2fc9",鍟嗗搧ID锛岃浠峰満鏅槸鎶ヤ环缁撴灉ID 鍟嗗煄鍦烘櫙鏄晢鍝両D

        mallproductid TYPE string, ": "21850081355386920970",鍟嗗煄鍟嗗搧ID锛岃鎶ヤ环鍦烘櫙姝ゅ弬鏁板繀浼?
        quantity      TYPE string, ": 1鍟嗗搧鏁伴噺

      END OF ts_productitem .

  types:

    BEGIN OF ts_pricecalculateimport,

        businessgroup TYPE string, ": "INQUIRY",涓氬姟鍒嗙粍

        businessunit  TYPE string, ": "COMMON_INQUIRY",涓氬姟鍗曞厓

        channel       TYPE string, ": "B2B",娓犻亾

        client        TYPE string, ": "APP"瀹㈡埛绔煙

        companyid     TYPE string, ": "10431",缁翠慨鍘傚叕鍙窱D

        userloginid   TYPE string, ": "668ceb27ef868400011ea37c",褰撳墠鐧诲綍鐢ㄦ埛ID

        productitems  TYPE STANDARD TABLE OF ts_productitem WITH DEFAULT KEY, "鍖归厤淇冮攢娲诲姩鍟嗗搧鏉＄洰璇锋眰鍏ュ弬

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

  methods GET_INQUIRY_SUPPLIERQUOTES

    importing

      value(IV_INQUIRYID) type STRING

    exporting

      value(EV_MSG) type BAPIRET2

      value(ET_SUPPLIERQUOTES) type ZINQ_T_SUPPLIERQUOTES .

  methods GET_INQUIRY_ASSIGNSUPPLIER

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



    "鏍￠獙搴楅摵id涓嶈兘涓虹┖

    CHECK is_addquotearea-storeid IS NOT INITIAL.



    "鍙栫幇鍦ㄧ殑閰嶇疆鐨勬姤浠疯寖鍥?


    IF iv_online IS NOT  INITIAL. "涓婄嚎鐢宠鏃跺悓姝ョ粰璇㈡姤浠?


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



    ELSE.  "鍦ㄧ幇鏈夊熀纭€涓婃柊澧?






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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'BIND_INQUIRYVIRTUALTELNUM'.



    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{?inquiryId}' IN lv_uri WITH inquiryid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest )..

    lv_body = |"{ inquiryid }"|.

    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_telnum_inf ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'CHECK_BDFGOODS_ASSIGN_STORE'.



    lv_uri = ls_ztint_icec_api-url.

    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiry.

    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = ev_enable ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'CHECK_BDFGOODS_AUTH'.



    lv_uri = ls_ztint_icec_api-url.

    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiry.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = ev_enable ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'CHECK_FINDSTOCK_AUTH'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_fgoodsstatus ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY' AND method = 'CREATE_FGOODS'.



    lv_uri = ls_ztint_icec_api-url.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_ACCIDENT_QUOTA'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_quotearea  ).



          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

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



    "璋冪敤鎺ュ彛

    lv_title = '鑾峰彇鍞悗鏀跨瓥灞曠ず淇℃伅(ZCL_ICEC_INQUIRY_API->GET_AFTERSALEPOLICYS)'.

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



    IF lv_out IS NOT INITIAL ."瑙ｆ瀽json

      TRY.

          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data =  et_policydisplay ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

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

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_inquirydetail  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_COLDINQUIRY_HEADER'.



    lv_uri = ls_ztint_icec_api-url.

    lv_rfc = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'

                      ELSE ls_ztint_icec_api-rfcdest ).



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_inquiryhead ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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

    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY' AND method = 'GET_COLD_INQUIRY_CHECK'.

    lv_uri = ls_ztint_icec_api-url.

    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'

                         ELSE ls_ztint_icec_api-rfcdest ).



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    "璋冪敤鎺ュ彛

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



    IF lv_out IS NOT INITIAL ."瑙ｆ瀽json

      TRY.

          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data =  et_check ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY_NEW' AND method = 'NEW_GET_INQUIRY_HEAD'.

    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

    CALL METHOD lo_api->get_data(

      EXPORTING

        iv_rfcdest      = 'PLATFORM'

        iv_uri          = lv_uri

        is_content_type = ls_content_type

      IMPORTING

        json_out        = lv_out

        ev_msg          = ev_msg

                          ).

    IF lv_out IS NOT INITIAL ."瑙ｆ瀽json

      TRY.

          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_inqhead ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'SIMPLE-DEMAND' AND method = 'GET_DEMAND_ORIGINALITEM'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{demandId}' IN lv_uri WITH iv_inquiryid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

    CALL METHOD lo_api->get_data(

      EXPORTING

        iv_rfcdest      = 'PLATFORM'

        iv_uri          = lv_uri

        is_content_type = ls_content_type

      IMPORTING

        json_out        = lv_out

        ev_msg          = ev_msg

                          ).

    IF lv_out IS NOT INITIAL ."瑙ｆ瀽json

      TRY.

          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = ET_ORIGINALITEM ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'SIMPLE-DEMAND' AND method = 'GET_DEMAND_STANDARDITEM'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{demandId}' IN lv_uri WITH iv_inquiryid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

    CALL METHOD lo_api->get_data(

      EXPORTING

        iv_rfcdest      = 'PLATFORM'

        iv_uri          = lv_uri

        is_content_type = ls_content_type

      IMPORTING

        json_out        = lv_out

        ev_msg          = ev_msg

                          ).

    IF lv_out IS NOT INITIAL ."瑙ｆ瀽json

      TRY.

          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_standarditems ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_ETALABEL_SHOW'.



    lv_uri = ls_ztint_icec_api-url.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

    DATA: lv_body TYPE string.



    lv_body = iv_body.

    DATA:lv_title TYPE string.

    lv_title = '鑾峰彇ETA label璁剧疆(ZCL_ICEC_INQUIRY_API->GET_ETALABEL_SHOW)'.

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_data ) .



          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY' AND method = 'GET_FGOODS_ENABLE_SKU'.



    lv_uri = ls_ztint_icec_api-url.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_enablefgoods  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_HELP_QUOTEDRESULT'.



    lv_uri = ls_ztint_icec_api-url.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    lv_title = '鏍规嵁闇€姹傚崟id鏌ユ姤鍑鸿疆鑳庡睘鎬?ZCL_ICEC_INQUIRY_API->GET_HELP_QUOTEDRESULT)'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_help_quotedresult  ).



          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRYVIRTUALTELNUM'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH inquiryid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    ls_ztint_icec_api-rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_telnum_inf  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_SUPPLIERQUOTES'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_supplierquotes  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY_NEW' AND method = 'GET_INQUIRY_ATTRIBUTE'.



    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' INTO lv_uri WITH iv_inquiry.

    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_data ) .



          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_BASE_DETAIL'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{demandId}' IN lv_uri WITH iv_inquiryid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_inquirybasedetail  ).



          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_BRANDQUALITIES'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_brandqualities ) .





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_CALCULATIONS'.



    lv_uri = ls_ztint_icec_api-url.

    lv_rfc = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'

                      ELSE ls_ztint_icec_api-rfcdest ).



    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_calculations ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_CARBRAND'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{storeId}' IN lv_uri WITH iv_store.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = carbrand  ).

          ls_msg-type = 'S'.

          ls_msg-id = '200'.

          ls_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ls_msg-type = 'E'.

          ls_msg-id = '404'.

          ls_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ls_msg-type = 'E'.

          ls_msg-id = 404.

          ls_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_CUSTOMIZEREMARK'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_customizeremark  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY_NEW' AND method = 'GET_INQUIRY_DECODE'.



    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' INTO lv_uri WITH iv_inquiry.

    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

    DATA: lv_body TYPE string.



    DATA:lv_title TYPE string.

    lv_title = '鑾峰彇璇环鍗曠敤鎴烽渶姹?ZCL_ICEC_INQUIRY_API->GET_INQUIRY_USERNEEDS)'.

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_data ) .



          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_DETAIL'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_inquirydetail  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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

    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_DISCOUNT'.



    "璋冪敤鎺ュ彛

    DATA(lo_api) = NEW zcl_icec_api( ).

    lv_title = '鏌ヨ浼樻儬鍒哥粨鏋?ZCL_ICEC_INQUIRY_API->GET_INQUIRY_DISCOUNT)'.

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_discountlist ).



          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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

    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_DISCOUNT_STORE'.



    "璋冪敤鎺ュ彛

    DATA(lo_api) = NEW zcl_icec_api( ).

    lv_title = '鏌ヨ浼樻儬鍒哥粨鏋?ZCL_ICEC_INQUIRY_API->GET_INQUIRY_DISCOUNT)'.

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_discountlist ).



          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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

    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY_NEW'

      AND method = 'GET_INQUIRY_DISCOUNT_STORE'.



    "璋冪敤鎺ュ彛

    DATA(lo_api) = NEW zcl_icec_api( ).

    lv_title = '鏌ヨ浼樻儬鍒哥粨鏋?ZCL_ICEC_INQUIRY_API->GET_INQUIRY_DISCOUNT)'.

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_discountlist ).



          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_EXCELLENTQUOTED'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_excellentquoted  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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

    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_FEEDBACK'.



    lv_uri = ls_ztint_icec_api-url.

    lv_rfc = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'

                      ELSE ls_ztint_icec_api-rfcdest ).



    lv_body = iv_body.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_data ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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

    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'TYRE-INQUIRY'

      AND method = 'GET_INQUIRY_IDENTIFICATION'.



    lv_uri = ls_ztint_icec_api-url.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    "璋冪敤鎺ュ彛

    DATA(lo_api) = NEW zcl_icec_api( ).

    lv_title = '鏍规嵁闇€姹傚崟id鏌ユ槸閰嶅鑺辩汗鐨勬姤浠风粨鏋渋d(ZCL_ICEC_INQUIRY_API->GET_INQUIRY_IDENTIFICATION)'.

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

      "瑙ｆ瀽json

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

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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

    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_ISHOTSTORAGE'.



    lv_uri = ls_ztint_icec_api-url.

    lv_rfc = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'

                      ELSE ls_ztint_icec_api-rfcdest ).



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



*          /ui2/cl_json=>deserialize(

*                      EXPORTING

*                         json = lv_out

*                      CHANGING

*                         data = es_data ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



  "鍙杣rl

  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

        WHERE service = 'INQUIRY'

        AND method = 'GET_INQUIRY_LOWESTPRICE'.



  lv_uri = ls_ztint_icec_api-url.

  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).



  REPLACE '{demandId}' IN lv_uri WITH iv_inquiryid.

  REPLACE '{storeIds}' IN lv_uri WITH iv_storeids.

  ls_content_type-content_type = 'application/json;charset=UTF-8'.



  DATA(lo_api) = NEW zcl_icec_api( ).

  "璋冪敤鎺ュ彛

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

    "瑙ｆ瀽json

    TRY.



        /ui2/cl_json=>deserialize(

        EXPORTING

          json = lv_out

        CHANGING

        data = et_quotelowest  ).





        ev_msg-type = 'S'.

        ev_msg-id = '200'.

        ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

      CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

        ev_msg-type = 'E'.

        ev_msg-id = '404'.

        ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

      CATCH cx_root.

        ev_msg-type = 'E'.

        ev_msg-id = 404.

        ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY' AND method = 'GET_INQUIRY_MISSINGSKU'.



    lv_uri = ls_ztint_icec_api-url.



    lv_body = |["{ inquiryid }"]|.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_miss  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_OUTOFSTOCKQUOTE'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_outofstockquote  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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

    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_PARTIMAGES'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{vinCode}' IN lv_uri WITH iv_vin.

    REPLACE '{originalPart}' IN lv_uri WITH iv_partsnum.

    CONDENSE lv_uri NO-GAPS.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = ls_partimage  ).

          et_partimage = ls_partimage-data.



          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_PARTSBRAND_COMMON'.



    lv_uri = ls_ztint_icec_api-url.





    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = partsbrand  ).





          ls_msg-type = 'S'.

          ls_msg-id = '200'.

          ls_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ls_msg-type = 'E'.

          ls_msg-id = '404'.

          ls_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ls_msg-type = 'E'.

          ls_msg-id = 404.

          ls_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_PARTSBRAND_INTER'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{storeId}' IN lv_uri WITH iv_store.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = partsbrand ).





          ls_msg-type = 'S'.

          ls_msg-id = '200'.

          ls_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ls_msg-type = 'E'.

          ls_msg-id = '404'.

          ls_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ls_msg-type = 'E'.

          ls_msg-id = 404.

          ls_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_QUALITY'.



    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_quality  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY_NEW' AND method = 'GET_INQUIRY_QUOTATIONDETAIL'.



    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).



    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.





    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_quotedetail  ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_QUOTEAREA'.



    lv_uri = ls_ztint_icec_api-url.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

    DATA: lv_body TYPE string.



    lv_body = iv_data.

    DATA:lv_title TYPE string.

    lv_title = '鑾峰彇鍟嗗鎶ヤ环鍖哄煙(ZCL_ICEC_INQUIRY_API->GET_INQUIRY_QUOTEAREA)'.

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_quotearea ) .





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY_NEW' AND method = 'GET_INQUIRY_QUOTEDETAIL_BYNEED'.



    lv_uri = ls_ztint_icec_api-url.

    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    lv_body = |\{"inquiryId": "{ iv_inquiryid }","platform": "PC","userNeedIds": [{ iv_userneeds }]\}|.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_inqbody  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_QUOTEFILLRATE'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_quotefillrate  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_QUOTEPRICE_EXTRA'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_quoteextra ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY' AND method = 'GET_INQUIRY_QUOTERESOURCE'.



    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

    DATA: lv_body TYPE string.

    DATA:lv_rfcdest TYPE rfcdest.

    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

    lv_body = iv_body.

    DATA:lv_title TYPE string.

    lv_title = '鑾峰彇璇环鍗曟媶杞︿欢鍥剧墖瑙嗛(ZCL_ICEC_INQUIRY_API->GET_INQUIRY_QUOTERESOURCE)'.

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_data ) .



          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_REMARK'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_remark  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_REMARKRULE'.



    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

    lv_rfc = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'

                      ELSE ls_ztint_icec_api-rfcdest ).



    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_remarkrule ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_RESOURCEFILE'.



    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_inqfile  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_SNAPSHOT'.



    lv_uri = ls_ztint_icec_api-url.

    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).



    REPLACE '{Inquiryid}' IN lv_uri WITH iv_inquiryid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_inqbody  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_STEP_PRICE'.



    lv_uri = ls_ztint_icec_api-url.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

    DATA: lv_body TYPE string.



    lv_body = iv_body.

    DATA:lv_title TYPE string.

    lv_title = '鑾峰彇璇环闃舵浠?ZCL_ICEC_INQUIRY_API->GET_INQUIRY_STEP_PRICE)'.

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_inquiry_price ) .



          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "浜屾鎶ヤ环浼戞伅鏃?
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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

             WHERE service = 'INQUIRY'

             "  AND method = 'GET_INQUIRY_STOREHOLIDAY'."

             AND method = 'GET_INQUIRY_STOREHOLIDAY_NEW'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.

    " REPLACE '{months}' IN lv_uri WITH iv_months.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = ls_data  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_STOREWEEKDAY'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_storyweekday  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_SUPPLIERQUOTES'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_supplierquotes  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_SUPPLIERQUOTE_STA'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH inquiryid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_status ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_TRACKRECORD'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_trackrecord  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY_NEW' AND method = 'GET_INQUIRY_USERNEEDS'.



    lv_uri = ls_ztint_icec_api-url.

    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

    DATA: lv_body TYPE string.



    lv_body = |["{ iv_inquiry }"]|.

    DATA:lv_title TYPE string.

    lv_title = '鑾峰彇璇环鍗曠敤鎴烽渶姹?ZCL_ICEC_INQUIRY_API->GET_INQUIRY_USERNEEDS)'.

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_data ) .



          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_INQUIRY_USERNEEDSITEMS'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_userneedsitems  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



  "鍙杣rl

  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

        WHERE service = 'INQUIRY'

        AND method = 'GET_INQ_PROXY_INF'.



  lv_uri = ls_ztint_icec_api-url.

  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).

  ls_content_type-content_type = 'application/json;charset=UTF-8'.



  lv_body = |\{"inquiryId": "{ iv_inquiryid }","statusId": "ALL"\}|.



  DATA(lo_api) = NEW zcl_icec_api( ).

  "璋冪敤鎺ュ彛

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

    "瑙ｆ瀽json

    TRY.



        /ui2/cl_json=>deserialize(

        EXPORTING

          json = lv_out

        CHANGING

        data = es_inqproxy ).



        ev_msg-type = 'S'.

        ev_msg-id = '200'.

        ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

      CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

        ev_msg-type = 'E'.

        ev_msg-id = '404'.

        ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

      CATCH cx_root.

        ev_msg-type = 'E'.

        ev_msg-id = 404.

        ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_PINKAGE_SHOW'.



    lv_uri = ls_ztint_icec_api-url.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

    DATA: lv_body TYPE string.



    lv_body = iv_body.

    DATA:lv_title TYPE string.

    lv_title = '鑾峰彇鍟嗗娲诲姩婊″噺鍖呴偖淇℃伅璁剧疆(ZCL_ICEC_INQUIRY_API->GET_PINKAGE_SHOW)'.

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_data ) .



          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'PROMOTION' AND method = 'GET_PROMOTION_INFO'.

    lv_uri = ls_ztint_icec_api-url.

    lv_rfcdest = ls_ztint_icec_api-rfcdest.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

    IF lv_out IS NOT INITIAL ."瑙ｆ瀽json

      TRY.

          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_prommotion ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_QUOTATIONSCHEME_DETAIL'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{headerId}' IN lv_uri WITH '1715799022749884416'.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_inquirydetail  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_QUOTA_CUS'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_quotacus ).



          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_QUOTA_ISUSERFORMAN'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{storeId}' IN lv_uri WITH iv_storeid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_userforman  ).



          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



  "鍙杣rl

  SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

        WHERE service = 'INQUIRY'

        AND method = 'GET_QUOTE_STORELIST'.



  lv_uri = ls_ztint_icec_api-url.

  lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).



  REPLACE '{demandId}' IN lv_uri WITH iv_demandid.



  ls_content_type-content_type = 'application/json;charset=UTF-8'.



  DATA(lo_api) = NEW zcl_icec_api( ).

  "璋冪敤鎺ュ彛

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

    "瑙ｆ瀽json

    TRY.



        /ui2/cl_json=>deserialize(

        EXPORTING

          json = lv_out

        CHANGING

        data = et_storelist  ).



        ev_msg-type = 'S'.

        ev_msg-id = '200'.

        ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

      CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

        ev_msg-type = 'E'.

        ev_msg-id = '404'.

        ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

      CATCH cx_root.

        ev_msg-type = 'E'.

        ev_msg-id = 404.

        ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'SIMPLE-DEMAND' AND method = 'GET_SIMPLEDEMAND_INFO'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{demandId}' IN lv_uri WITH iv_inquiryid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

    CALL METHOD lo_api->get_data(

      EXPORTING

        iv_rfcdest      = 'PLATFORM'

        iv_uri          = lv_uri

        is_content_type = ls_content_type

      IMPORTING

        json_out        = lv_out

        ev_msg          = ev_msg

                          ).

    IF lv_out IS NOT INITIAL ."瑙ｆ瀽json

      TRY.

          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_simpledemand ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_SIMPLEINQUIRY_BASICINFO'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_simpleinquiry  ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'SIMPLE-QUOTATION' AND method = 'GET_SIMPLEQUOTATION_ITEM'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

    lv_body = iv_body.

    lv_title = '鑾峰彇涓杞﹁浠锋姤浠锋潯鐩?ZCL_ICEC_INQUIRY_API->GET_SIMPLEQUOTATION_ITEM)'.

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



    IF lv_out IS NOT INITIAL ."瑙ｆ瀽json

      TRY.

          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data =  et_demanditem ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'SIMPLE-QUOTATION' AND method = 'GET_SIMPLEQUOTATION_LIST'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{demandId}' IN lv_uri WITH iv_inquiryid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

    lv_body = iv_body.

    lv_title = '鑾峰彇涓杞﹁浠锋姤浠峰崟淇℃伅(ZCL_ICEC_INQUIRY_API->GET_SIMPLEQUOTATION_LIST)'.

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

    IF lv_out IS NOT INITIAL ."瑙ｆ瀽json

      TRY.

          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_simplequotation ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'SIMPLE-QUOTATION' AND method = 'GET_SIMPLEQUOTATION_RESULTS'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{demandId}' IN lv_uri WITH iv_inquiryid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

    lv_body = iv_body.

    lv_title = '鑾峰彇涓杞﹁浠锋姤浠风粨鏋?ZCL_ICEC_INQUIRY_API->GET_SIMPLEQUOTATION_RESULTS)'.

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



    IF lv_out IS NOT INITIAL ."瑙ｆ瀽json

      TRY.

          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data =  et_quotationresults ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_SIMPLE_RESOURCE'.



    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_data ).



          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

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

        "璋冪敤鎺ュ彛

        lv_title = '鏍规嵁搴楅摵浠撳簱閫佽揪鍖哄煙鎵归噺鏌ヨ閰嶉€佹椂鏁堟帴鍙?ZCL_ICEC_INQUIRY_API->GET_STORE_DELIVERY)'.

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



        IF lv_out IS NOT INITIAL ."瑙ｆ瀽json

          TRY.

              /ui2/cl_json=>deserialize(

                          EXPORTING

                             json = lv_out

                          CHANGING

                             data =  lt_storeinf ).

              APPEND LINES OF lt_storeinf TO et_storeinf.

              ev_msg-type = 'S'.

              ev_msg-id = '200'.

              ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

            CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

              ev_msg-type = 'E'.

              ev_msg-id = '404'.

              ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

            CATCH cx_root.

              ev_msg-type = 'E'.

              ev_msg-id = 404.

              ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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

      "璋冪敤鎺ュ彛

      lv_title = '鏍规嵁搴楅摵浠撳簱閫佽揪鍖哄煙鎵归噺鏌ヨ閰嶉€佹椂鏁堟帴鍙?ZCL_ICEC_INQUIRY_API->GET_STORE_DELIVERY)'.

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



      IF lv_out IS NOT INITIAL ."瑙ｆ瀽json

        TRY.

            /ui2/cl_json=>deserialize(

                        EXPORTING

                           json = lv_out

                        CHANGING

                           data =  lt_storeinf ).

            APPEND LINES OF lt_storeinf TO et_storeinf.

            ev_msg-type = 'S'.

            ev_msg-id = '200'.

            ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

          CATCH cx_json_illegal_syntax INTO lo_syntax.

            ev_msg-type = 'E'.

            ev_msg-id = '404'.

            ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

          CATCH cx_root.

            ev_msg-type = 'E'.

            ev_msg-id = 404.

            ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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

    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_TIRE_INQUIRY_QUOTATION'.



    lv_uri = ls_ztint_icec_api-url.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    "璋冪敤鎺ュ彛

    DATA(lo_api) = NEW zcl_icec_api( ).

    lv_title = '鏍规嵁闇€姹傚崟id鏌ユ帓搴忓悗鎶ヤ环缁撴灉(ZCL_ICEC_INQUIRY_API->GET_TIRE_INQUIRY_QUOTATION)'.

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_quotation ).



          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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

    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_TRYE_INQUIRY_EXTENINFO'.



    lv_uri = ls_ztint_icec_api-url.

    lv_rfc = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM'

                      ELSE ls_ztint_icec_api-rfcdest ).



    REPLACE '{demandId}' IN lv_uri WITH iv_demandid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_data ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'GET_VEN_OPENEDQUOTE'.



    lv_uri = ls_ztint_icec_api-url.



    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

    DATA: lv_body TYPE string.



    lv_body = iv_body.

    DATA:lv_title TYPE string.

    lv_title = '鑾峰彇鍟嗗寮€鍚姤浠疯缃?ZCL_ICEC_INQUIRY_API->GET_VEN_OPENEDQUOTE)'.

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = et_openedquota ) .





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY_NEW' AND method = 'NEW_GET_INQUIRY_DECODE'.

    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH inquiry.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

    CALL METHOD lo_api->get_data(

      EXPORTING

        iv_rfcdest      = 'PLATFORM'

        iv_uri          = lv_uri

        is_content_type = ls_content_type

      IMPORTING

        json_out        = lv_out

        ev_msg          = ev_msg

                          ).

    IF lv_out IS NOT INITIAL ."瑙ｆ瀽json

      TRY.

          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_decode ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY_NEW' AND method = 'NEW_GET_INQUIRY_DETAIL'.

    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiry.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

    IF lv_out IS NOT INITIAL ."瑙ｆ瀽json

      TRY.

          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_detail ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY_NEW' AND method = 'NEW_GET_INQUIRY_HEAD'.

    lv_uri = ls_ztint_icec_api-url.



    REPLACE '{inquiryId}' IN lv_uri WITH iv_inquiryid.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

    CALL METHOD lo_api->get_data(

      EXPORTING

        iv_rfcdest      = 'PLATFORM'

        iv_uri          = lv_uri

        is_content_type = ls_content_type

      IMPORTING

        json_out        = lv_out

        ev_msg          = ev_msg

                          ).

    IF lv_out IS NOT INITIAL ."瑙ｆ瀽json

      TRY.

          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_inqhead ).

          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

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



    "鍙杣rl

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)

      WHERE service = 'INQUIRY'

      AND method = 'SAVE_BDFGOODS_ASSIGN_STORE'.



    lv_uri = ls_ztint_icec_api-url.

    lv_rfcdest = COND #( WHEN ls_ztint_icec_api-rfcdest IS INITIAL THEN 'PLATFORM' ELSE ls_ztint_icec_api-rfcdest ).





    ls_content_type-content_type = 'application/json;charset=UTF-8'.



    DATA(lo_api) = NEW zcl_icec_api( ).

    "璋冪敤鎺ュ彛

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

      "瑙ｆ瀽json

      TRY.



          /ui2/cl_json=>deserialize(

                      EXPORTING

                         json = lv_out

                      CHANGING

                         data = es_bsfgoodres ).





          ev_msg-type = 'S'.

          ev_msg-id = '200'.

          ev_msg-message = 'JSON鎴愬姛瑙ｆ瀽'.

        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).

          ev_msg-type = 'E'.

          ev_msg-id = '404'.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

        CATCH cx_root.

          ev_msg-type = 'E'.

          ev_msg-id = 404.

          ev_msg-message = 'JSON瑙ｆ瀽寮傚父锛岃妫€鏌ョ郴缁熶紶鍏ュ弬鏁?.

      ENDTRY.

    ENDIF.

    IF ls_ztint_icec_api-nolog IS INITIAL.

    save_api_log( EXPORTING iv_keyvalue = lv_uri iv_requestbody = iv_body iv_responsebody = lv_out ev_msg = ev_msg ).

    ENDIF.

  ENDMETHOD.

ENDCLASS.
