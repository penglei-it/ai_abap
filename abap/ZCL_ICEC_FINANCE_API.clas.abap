CLASS zcl_icec_finance_api DEFINITION
PUBLIC
FINAL
CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
      BEGIN OF ts_synresult,
        code    TYPE string,
        message TYPE string,
        desc    TYPE string,
      END OF ts_synresult .
    TYPES:
      BEGIN OF ty_creditavailable,
        allowstatus   TYPE string, "("是否准入;0 不准入 1准入")
        allowreason   TYPE string, "("不用准入理由")
        custla        TYPE string, "("总授信额度,元为单位,保留两位小数")
        custlao       TYPE string, "("总可用额度,元为单位,保留两位小数")
        lat           TYPE string, "("授信固定额度,元为单位,保留两位小数")
        latemp        TYPE string, "("授信临时额度,元为单位,保留两位小数")
        latempenddate TYPE string, "("临时额度结束日,yyyy-MM-dd")
        laused        TYPE string, "("当前总的已使用额度,元为单位,保留两位小数")
        latempused    TYPE string, "("当前总的已使用临额,元为单位,保留两位小数")
        custlaoshow   TYPE string, "("总可用额度界面展示金额")
        productname   TYPE string, "("产品名称")
        productcode   TYPE string, "("产品编码")
        loanlimitamt  TYPE string, "("支用单笔限额,元为单位,保留两位小数，-1代表不限额")
        servicetype   TYPE string, ": "CASSLOAN""可用额度类型
      END OF ty_creditavailable .
    TYPES ts_creditavailable TYPE ty_creditavailable .

    TYPES: BEGIN OF ty_creditlimitlist,
             creditlimit TYPE string, "临时额度
             creditavai  TYPE string, "剩余额度
             enddate     TYPE string, "有效期至
           END OF ty_creditlimitlist.
    TYPES: ts_creditlimitlist TYPE ty_creditlimitlist.
    TYPES:
      BEGIN OF ty_creditall,
        balance            TYPE string, "金币余额
        commonlimit        TYPE string, "常设额度
        companyid          TYPE string, "公司ID
        servicetype        TYPE string, "可用额度类型
        usedlimit          TYPE string, "已用额度
        availablesumcredit TYPE string, "当前可用额度
        servicetypedesc    TYPE string, "可用额度类型描述
        totallimit         TYPE string, "总额度
        Creditlimitsum     TYPE string, "总临时额度
        Creditfreezen      TYPE string, "冻结额度
        creditlimitlist    TYPE STANDARD TABLE OF ty_creditlimitlist WITH DEFAULT KEY, "临时额度
      END OF ty_creditall .
    TYPES ts_creditall TYPE ty_creditall .

    METHODS get_customer_creditavailable
      IMPORTING
        VALUE(iv_companyid)   TYPE string OPTIONAL
        VALUE(iv_companycode) TYPE string OPTIONAL
      EXPORTING
        VALUE(es_msg)         TYPE bapiret2
        VALUE(ev_result)      TYPE ts_creditavailable .
    METHODS get_customer_grayrelease
      IMPORTING
        VALUE(iv_companyid) TYPE string OPTIONAL
      EXPORTING
        VALUE(es_msg)       TYPE bapiret2
        VALUE(ev_result)    TYPE string .
    METHODS get_customer_credit_bytype
      IMPORTING
        VALUE(iv_companyid)   TYPE string
        VALUE(iv_companycode) TYPE string
      EXPORTING
        VALUE(es_data)        TYPE ts_creditall .
    METHODS tempcredit_approval_syn
      IMPORTING
        VALUE(is_ztint_tempcredit) TYPE ztint_tempcredit
        VALUE(is_detail)           TYPE zscrm_process_instance OPTIONAL
        VALUE(iv_type)             TYPE string
        VALUE(is_detail_qywx)      TYPE zcl_corpweixin_approval_api=>ts_approvaldetail OPTIONAL
        VALUE(iv_qywx)             TYPE char01 OPTIONAL
      EXPORTING
        VALUE(es_res)              TYPE ts_synresult .
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



CLASS ZCL_ICEC_FINANCE_API IMPLEMENTATION.


  METHOD GET_CUSTOMER_CREDITAVAILABLE.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'FINANCE' AND method = 'GET_CUSTOMER_CREDITAVAILABLE'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{companyId}' IN lv_uri WITH iv_companyid.
    REPLACE '{companyCode}' IN lv_uri WITH iv_companyCode.

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
                         data =  ev_result ).
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


METHOD get_customer_credit_bytype.
*  custlao 总可用额度,元为单位,保留两位小数（当前可用额度availablesumcredit）
*  custla 总授信额度,元为单位,保留两位小数（总授信额度totallimit ）
*  lat  授信固定额度,元为单位,保留两位小数（其中固定额度commonlimit）
*  laused  当前总的已使用额度,元为单位,保留两位小数（已用额度usedlimit）
*  latemp  授信临时额度,元为单位,保留两位小数（临时额度creditlimit）
*  latemp（授信临时额度） - latempused  （当前总的已使用临额） = （ 剩余额度（元）creditavai）
*  latempenddate 临时额度结束日,yyyy-mm-dd （有效期至enddate）
  "先判定客户是否金融客户
  DATA(lo_coupon) = NEW zcl_icec_coupon_api( ).
  DATA(lo_partycredit) = NEW zcl_icec_partycredit_api( ).
  DATA:lv_creditavai TYPE zde_intamount.
  DATA:lv_commonlimit TYPE zde_intamount.
  DATA:lv_totallimit TYPE zde_intamount.
  DATA:lv_usedlimit TYPE zde_intamount.
  DATA:lv_availablesumcredit TYPE zde_intamount.
  DATA:lv_creditlimit TYPE zde_intamount.
  DATA:lv_creditlimitsum TYPE zde_intamount.
  DATA:lv_creditfreezen TYPE zde_intamount.
  DATA:ls_creditlimitlist TYPE ts_creditlimitlist.
  DATA:lt_creditlimitlist TYPE STANDARD TABLE OF ts_creditlimitlist.
  DATA:lv_dats TYPE dats.
  DATA:lv_tims TYPE tims.

  "获取是否为金融客户
  me->get_customer_grayrelease(
  EXPORTING
    iv_companyid = iv_companyid
  IMPORTING
  es_msg       = DATA(es_msg)
  ev_result    = DATA(es_result)
        ).

  "金币余额
  lo_coupon->get_company_goldcoin( EXPORTING iv_companyid = iv_companyid
  IMPORTING es_output = DATA(ls_goldcoin) ).

  IF es_result IS NOT INITIAL."金融客户
    me->get_customer_creditavailable(
    EXPORTING
      iv_companyid   = iv_companyid
      iv_companycode = iv_companycode
    IMPORTING
      es_msg         = es_msg
    ev_result      = DATA(es_result1)
          ).
    "金币余额
    es_data-balance = ls_goldcoin-balance.

    "（当前可用额度Availablesumcredit）custLao 总可用额度,元为单位,保留两位小数
    lv_availablesumcredit = zcl_cassint_formatter=>convert_e_to_number( es_result1-custlao ). "当前可用额度-元
    es_data-availablesumcredit = lv_availablesumcredit.

    " （总授信额度Totallimit ）custLa 总授信额度,元为单位,保留两位小数
    lv_totallimit = zcl_cassint_formatter=>convert_e_to_number( es_result1-custla ) / 10000."总额度--万元
    es_data-totallimit = lv_totallimit.

    "（其中固定额度Commonlimit）lat  授信固定额度,元为单位,保留两位小数
    lv_commonlimit =  zcl_cassint_formatter=>convert_e_to_number( es_result1-lat ) / 10000. "常设额度--万元
    es_data-commonlimit = lv_commonlimit.

    "laUsed  当前总的已使用额度,元为单位,保留两位小数（已用额度Usedlimit）
    es_data-usedlimit = zcl_cassint_formatter=>convert_e_to_number( es_result1-laused ).

    "可用额度类型
    es_data-servicetype = es_result1-servicetype.
    "总临时额度-万元
    lv_creditlimitsum = zcl_cassint_formatter=>convert_e_to_number( es_result1-latemp ) / 10000.
    es_data-creditlimitsum = lv_creditlimitsum.
    "冻结额度冻结额度 = lat（授信固定额度）+laTemp（临时额度）- custLa（总授信额度） 元
    lv_creditfreezen = zcl_cassint_formatter=>convert_e_to_number( es_result1-lat ) + zcl_cassint_formatter=>convert_e_to_number( es_result1-latemp ) - zcl_cassint_formatter=>convert_e_to_number( es_result1-custla ).
    es_data-creditfreezen = lv_creditfreezen.
    "可用额度类型描述
    IF es_result1-servicetype = 'CASSLOAN'.
      es_data-servicetypedesc = '单结'.
    ELSEIF es_result1-servicetype = 'COMPANY_ACCOUNT'.
      es_data-servicetypedesc = '挂账'.
    ENDIF.

    "公司ID
    es_data-companyid = iv_companyid.
    lo_partycredit->get_company_tempcredit(
    EXPORTING iv_companyid = iv_companyid
      iv_servicetype = es_result1-servicetype
    IMPORTING ev_msg = DATA(lv_tempmsg) et_tempcredit = DATA(lt_tempcredit)
          ).

    LOOP AT lt_tempcredit INTO DATA(ls_root).
      CLEAR ls_creditlimitlist.
      lv_creditavai = zcl_cassint_formatter=>convert_e_to_number( ls_root-creditavai ) / 100."剩余额度
      ls_creditlimitlist-creditavai = lv_creditavai.
      ls_creditlimitlist-creditlimit =  zcl_cassint_formatter=>convert_e_to_number( ls_root-creditlimit ) / 1000000 ."临时额度
      ls_creditlimitlist-creditlimit = ls_creditlimitlist-creditlimit && '万'.
      CONDENSE ls_creditlimitlist-creditlimit NO-GAPS.

      IF ls_root-enddate IS NOT INITIAL.
        CALL FUNCTION 'Z_FMICCRM_TIMESTAMP_TO_ABAP'
          EXPORTING
            iv_timestamp = ls_root-enddate
          IMPORTING
            ev_date      = lv_dats
            ev_time      = lv_tims.
        ls_creditlimitlist-enddate = lv_dats+0(4) && '-' && lv_dats+4(2) && '-'  && lv_dats+6(2) .  "有效期至
      ENDIF.
      APPEND ls_creditlimitlist TO lt_creditlimitlist.
      CLEAR:lv_creditavai , lv_dats,lv_tims,ls_creditlimitlist.
    ENDLOOP.
    SORT lt_creditlimitlist BY enddate  ASCENDING.
    APPEND LINES OF lt_creditlimitlist TO es_data-creditlimitlist.

  ELSE.


    lo_partycredit->get_compnay_partycredit(
    EXPORTING
      iv_companyid   = iv_companyid
    IMPORTING
    ev_msg         = DATA(ls_msg)
    es_partycredit = DATA(ls_partycredit)
          ).

    lo_partycredit->get_company_tempcredit(
    EXPORTING iv_companyid = iv_companyid
      iv_servicetype = ls_partycredit-servicetype
    IMPORTING ev_msg = lv_tempmsg et_tempcredit = lt_tempcredit
      ).
    "金币余额
    es_data-balance = ls_goldcoin-balance.
    "常设额度
    lv_commonlimit =  zcl_cassint_formatter=>convert_e_to_number( ls_partycredit-creditlimit ) / 1000000. "常设额度--万元
    es_data-commonlimit = lv_commonlimit.
    "公司ID
    es_data-companyid = iv_companyid.
    "可用额度类型
    es_data-servicetype = ls_partycredit-servicetype.
    "当前可用额度
    lv_availablesumcredit = zcl_cassint_formatter=>convert_e_to_number( ls_partycredit-availablesumcredit ) / 100. "当前可用额度-元
    es_data-availablesumcredit = lv_availablesumcredit.
    "可用额度类型描述
    IF ls_partycredit-servicetype = 'CASSLOAN'.
      es_data-servicetypedesc = '单结'.
    ELSEIF ls_partycredit-servicetype = 'COMPANY_ACCOUNT'.
      es_data-servicetypedesc = '挂账'.
    ENDIF.

    "总额度
    lv_totallimit = lv_commonlimit.
    LOOP AT lt_tempcredit INTO ls_root.
      lv_totallimit = zcl_cassint_formatter=>convert_e_to_number( ls_root-creditlimit ) / 1000000  +  lv_totallimit."总额度--万元
    ENDLOOP.
    es_data-totallimit = lv_totallimit.
    "已用额度 --元
    es_data-usedlimit = lv_totallimit * 10000 - lv_availablesumcredit.

    CLEAR: ls_root,lv_creditlimitsum.
    LOOP AT lt_tempcredit INTO ls_root.
      CLEAR ls_creditlimitlist.
      lv_creditavai = zcl_cassint_formatter=>convert_e_to_number( ls_root-creditavai ) / 100."剩余额度
      ls_creditlimitlist-creditavai = lv_creditavai.
      ls_creditlimitlist-creditlimit =  zcl_cassint_formatter=>convert_e_to_number( ls_root-creditlimit ) / 1000000 ."临时额度
      lv_creditlimitsum = lv_creditlimitsum + ls_creditlimitlist-creditlimit.
      ls_creditlimitlist-creditlimit = ls_creditlimitlist-creditlimit && '万'.
      CONDENSE ls_creditlimitlist-creditlimit NO-GAPS.

      IF ls_root-enddate IS NOT INITIAL.
        CALL FUNCTION 'Z_FMICCRM_TIMESTAMP_TO_ABAP'
          EXPORTING
            iv_timestamp = ls_root-enddate
          IMPORTING
            ev_date      = lv_dats
            ev_time      = lv_tims.
        ls_creditlimitlist-enddate = lv_dats+0(4) && '-' && lv_dats+4(2) && '-'  && lv_dats+6(2) .  "有效期至
      ENDIF.
      APPEND ls_creditlimitlist TO lt_creditlimitlist.
      CLEAR:lv_creditavai , lv_dats,lv_tims,ls_creditlimitlist.
    ENDLOOP.
    es_data-creditlimitsum = lv_creditlimitsum.
    SORT lt_creditlimitlist BY enddate  ASCENDING.
    APPEND LINES OF lt_creditlimitlist TO es_data-creditlimitlist.

  ENDIF.

ENDMETHOD.


  METHOD get_customer_grayrelease.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'FINANCE' AND method = 'GET_CUSTOMER_GRAYRELEASE'.

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
        ev_msg          = es_msg
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data =  ev_result ).
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


  METHOD tempcredit_approval_syn.
    DATA:
      lv_title     TYPE string,
      lv_out       TYPE string,
      lv_url       TYPE string,
      lv_record    TYPE string,
      lv_record_t  TYPE string,
      lv_approvers TYPE string,
      lv_body      TYPE string.
    DATA:
      lv_unixsecs     TYPE p,
      ls_msg          TYPE bapiret2,
      ls_apilog       TYPE zticec_api_log,
      ls_content_type TYPE zapi_s_contenttype.

    CHECK is_ztint_tempcredit IS NOT INITIAL.
    "URL
    SELECT SINGLE *
      INTO @DATA(ls_api)
      FROM ztint_icec_api
    WHERE service EQ 'RULECALCULATE'
          AND method EQ 'TEMPCREDIT_APPROVAL_SYN'.

    lv_url = ls_api-url.
    "审批结果
    DATA(lv_res) = SWITCH string( iv_type WHEN 'agree'  THEN 'APRROVED'
                                          WHEN 'refuse'  THEN 'REJECTED'
                                          WHEN 'terminate' THEN 'CANCELLED'
                                 ).
    "审批记录处理
    IF iv_qywx IS INITIAL.
      IF is_detail-operation_records IS NOT INITIAL.
        LOOP AT is_detail-operation_records INTO DATA(ls_record).
          "操作类型描述处理
          DATA(lv_optypetxt) = SWITCH string( ls_record-operation_type
                                              WHEN 'EXECUTE_TASK_NORMAL' THEN '审批人'"正常执行任务
                                              WHEN 'EXECUTE_TASK_AGENT' THEN '代理审批人'"代理人执行任务
                                              WHEN 'APPEND_TASK_BEFORE' THEN '前加签任务'
                                              WHEN 'APPEND_TASK_AFTER' THEN '后加签任务'
                                              WHEN 'REDIRECT_TASK' THEN '转交任务'
                                              WHEN 'START_PROCESS_INSTANCE' THEN '提交申请'"发起流程实例
                                              WHEN 'TERMINATE_PROCESS_INSTANCE' THEN '终止（撤销）审批'"终止(撤销)流程实例
                                              WHEN 'FINISH_PROCESS_INSTANCE' THEN '结束流程实例'
                                              WHEN 'ADD_REMARK' THEN '添加评论'
                                              WHEN 'REDIRECT_PROCESS' THEN '审批退回'
                                              WHEN 'PROCESS_CC' THEN '抄送'
                                            ).
          DATA(lv_oprestxt) = SWITCH string( ls_record-operation_result
                                              WHEN 'AGREE' THEN '同意'
                                              WHEN 'REFUSE' THEN '拒绝'
                                              WHEN 'NONE' THEN '提交申请'
                                           ).
          "名字
          SELECT SINGLE username INTO @DATA(lv_username)
            FROM ztint_user_inf
          WHERE dinguserid = @ls_record-userid.

          lv_record_t = lv_username && '|'
                        && lv_optypetxt && '|' "操作类型
                        && ls_record-date && '|' "操作日期
                        && lv_oprestxt && '|' "操作结果
                        && ls_record-remark. "评论
          IF lv_record IS INITIAL.
            lv_record = lv_record_t.
          ELSE.
            lv_record = lv_record && ';' && lv_record_t.
          ENDIF.
          CLEAR:lv_record_t,ls_record,lv_username.
        ENDLOOP.
      ENDIF.
      "审批人处理
      IF is_detail-tasks IS NOT INITIAL.
        LOOP AT is_detail-tasks INTO DATA(ls_task) WHERE task_status EQ is_detail-status.
          SELECT SINGLE username INTO lv_username
            FROM ztint_user_inf
          WHERE dinguserid EQ ls_task-userid.
          IF lv_approvers IS INITIAL.
            lv_approvers = lv_username.
          ELSE.
            lv_approvers = lv_approvers && ';' && lv_username.
          ENDIF.
          CLEAR:ls_task,lv_username.
        ENDLOOP.
      ENDIF.
    ELSE.
      IF iv_type EQ 'terminate'.
        lv_record = '审批流已撤销'.
        SELECT SINGLE username INTO @lv_username FROM ztint_user_inf WHERE qywxuserid = @is_detail_qywx-info-applyer-userid.
        lv_approvers = lv_username.
      ELSE.
        LOOP AT is_detail_qywx-info-sp_record INTO DATA(ls_sprecord).
          "操作类型描述处理
          LOOP AT ls_sprecord-details INTO DATA(ls_spdetail) WHERE sptime NE 0.
            SELECT SINGLE username INTO @lv_username FROM ztint_user_inf WHERE qywxuserid = @ls_spdetail-approver-userid.
            lv_unixsecs = ls_spdetail-sptime.
            zcl_cassint_formatter=>convert_unix_timestamp_to_abap(
                EXPORTING unixsecs = lv_unixsecs
                IMPORTING ev_date = DATA(lv_convdate) ev_time = DATA(lv_convtime) ).
            lv_record_t = lv_username && '|' && '审批人' && '|' && |{ lv_convdate DATE = ISO } { lv_convtime TIME = ISO }| && '|' &&
                          COND #( WHEN ls_spdetail-sp_status EQ '1' THEN '审批中'
                                  WHEN ls_spdetail-sp_status EQ '2' THEN '已同意'
                                  WHEN ls_spdetail-sp_status EQ '3' THEN '已驳回'
                                  WHEN ls_spdetail-sp_status EQ '4' THEN '已转审'
                                  WHEN ls_spdetail-sp_status EQ '11' THEN '已退回' ) &&
                           COND #( WHEN ls_spdetail-speech IS NOT INITIAL THEN |-{ ls_spdetail-speech }| ).

            IF lv_record IS INITIAL.
              lv_record = lv_record_t.
            ELSE.
              lv_record = lv_record && ';' && lv_record_t.
            ENDIF.

            IF lv_approvers IS INITIAL.
              lv_approvers = lv_username.
            ELSE.
              lv_approvers = lv_approvers && ';' && lv_username.
            ENDIF.

            CLEAR:lv_record_t,ls_record,lv_username,lv_convdate,lv_unixsecs,lv_convtime.
          ENDLOOP.
        ENDLOOP.
      ENDIF.
    ENDIF.
    lv_body = |\{"applicationId":"{ is_ztint_tempcredit-instaceid }","operator":"{ lv_approvers }","approveResult":"{ lv_res }","approveRecord":"{ lv_record }"\}|.
    lv_title = |临额审批状态同步金融平台|.
    ls_content_type-content_type = |application/json;charset=UTF-8|.
    "调用接口
    DATA(lo_api) = NEW zcl_icec_api( ).
    CALL METHOD lo_api->post_data(
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_url
        iv_body         = lv_body
        iv_title        = lv_title
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = ls_msg ).
    IF lv_out IS NOT INITIAL.
      "解析Json
      TRY.
          /ui2/cl_json=>deserialize(
            EXPORTING
              json = lv_out
            CHANGING
              data = es_res ).

          ls_apilog-msgtype = 'S'.
          ls_apilog-msgid = '200'.
          ls_apilog-msg = 'JSON成功解析'.
        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).
          ls_apilog-msgtype = 'E'.
          ls_apilog-msgid = '404'.
          ls_apilog-msg = 'JSON解析异常，请检查系统传入参数'.
        CATCH cx_root.
          ls_apilog-msgtype = 'E'.
          ls_apilog-msgid = 404.
          ls_apilog-msg = 'JSON解析异常，请检查系统传入参数'.
      ENDTRY.
    ENDIF.
    "log
    TRY .
        ls_apilog-apiguid = cl_system_uuid=>if_system_uuid_static~create_uuid_c32( ).
      CATCH cx_uuid_error.
    ENDTRY.
    ls_apilog-keyvalue = lv_url.
    ls_apilog-zcrt_bdate = sy-datum.
    ls_apilog-zcrt_btime = sy-uzeit.
    ls_apilog-zcrt_uname = sy-uname.
    ls_apilog-requestbody = lv_body.
    ls_apilog-responsebody = lv_out.
    MODIFY zticec_api_log FROM ls_apilog.
  ENDMETHOD.
ENDCLASS.
