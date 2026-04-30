class ZCL_ICEC_MESSAGE_API definition
  public
  final
  create public .

public section.

  methods CALLBACK_MESSAGE_HANDLED
    importing
      !IT_MSGIDLIST type ZMSGS_T_MSGIDLIST
    exporting
      value(EV_MSG) type BAPIRET2 .
  methods REGISTER_MESSAGE_CALLBACK
    exporting
      value(EV_MSG) type STRING .
  methods ORDER_EVENT
    importing
      !IV_CONTENT type STRING optional .
  methods SEND_ICEC_MESSAGES
    importing
      value(IT_SENDMSGS) type ZSINT_SENDICECMSGS_TAB
      value(IV_FLAG) type CHAR1 optional
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_RESULT) type ZMSGS_T_SENDMSGRESULT .
  methods SPELL_ICEC_TOPIC
    importing
      value(IV_TOPIC) type STRING
    exporting
      value(EV_SPELLED) type STRING
      value(EV_MSG) type STRING .
  methods PREPARE_SEND_MESSAGE
    importing
      value(IT_SENDMSGS) type ZSINT_SENDICECMSGS_TAB
      value(IV_FLAG) type CHAR1 optional
    exporting
      value(ES_MSG) type BAPIRET2
      !ET_RESULT type ZMSGS_T_SENDMSGRESULT .
  methods REGISTER_MESSAGE_JMS
    exporting
      value(EV_MSG) type STRING .
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



CLASS ZCL_ICEC_MESSAGE_API IMPLEMENTATION.


  METHOD callback_message_handled.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    DATA:lv_ts   TYPE string. "新建java时戳
    "拼写消息body
    CHECK it_msgidlist IS NOT INITIAL.

    "时间转换
*--Change by JIEZW 18.01.2022 10:41:20 B02 Begin
*--时戳调整

*    cl_pco_utility=>convert_abap_timestamp_to_java(
*      EXPORTING
*        iv_date = sy-datum  "UTC日期
*        iv_time = sy-uzeit  "UTC时间
*        IMPORTING
*          ev_timestamp = lv_ts
*      ).

    CALL FUNCTION 'Z_FMICCRM_ABAP_TO_TIMESTAMP'
      EXPORTING
        iv_date      = sy-datum
        iv_time      = sy-uzeit
*       IV_DURATION  =
      IMPORTING
        ev_timestamp = lv_ts.

*--Change by JIEZW 18.01.2022 10:41:35 B02 end

    lv_body = '['.
    LOOP AT it_msgidlist INTO DATA(ls_id).
      IF sy-tabix = 1.
        lv_body = lv_body && '{"clientEndTime": "' && lv_ts && '",' && '"clientHandledCost": 0,"clientReceiveTime": "'  && lv_ts &&  '","id":"' && ls_id-id && '"}'.
      ELSE.
        lv_body = lv_body && ',{"clientEndTime": "' && lv_ts && '",' && '"clientHandledCost": 0,"clientReceiveTime": "'  && lv_ts &&  '","id":"' && ls_id-id && '"}'.
      ENDIF.
    ENDLOOP.
    lv_body = lv_body && ']'.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'MESSAGE'
      AND method = 'CALLBACK_MESSAGE_HANDLED'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    lv_title = '回调平台消息已消费(ZCL_ICEC_MESSAGE_API->CALLBACK_MESSAGE_HANDLED)'.


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

    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_requestbody = lv_body iv_responsebody = lv_out ).
    ENDIF.




  ENDMETHOD.


  method ORDER_EVENT.


    IF iv_content IS INITIAL.

    ENDIF.

  endmethod.


  METHOD prepare_send_message.

    DATA:lv_uuid TYPE string.

    DEFINE mcr_ping_content.
      DATA(lv_primarykey)  = COND string( WHEN <fs_send>-primarykey IS NOT INITIAL THEN |"{ <fs_send>-primarykey }"|).
      <fs_send>-content = '{' && |"jsonMessageType":"{ <fs_send>-type }","id":"{ <fs_send>-messageid }","usage":"{ <fs_send>-usage }",| &&
                                 |"service":"{ <fs_send>-service }","topic":"{ <fs_send>-topic }","timeStamp":"{ <fs_send>-createdat }",| &&
                                 |"primaryKey":{ COND string( WHEN <fs_send>-primarykey IS INITIAL THEN 'null' ELSE lv_primarykey ) },| && <fs_send>-busvalue  && '}' .
      REPLACE ALL OCCURRENCES OF '"' IN <fs_send>-content  WITH '\"' . "content 要求是json的字符串
      CLEAR:lv_primarykey .

    END-OF-DEFINITION.

    CHECK it_sendmsgs[] IS NOT INITIAL .

*-获取topic的前缀,对应的环境（test demo prod）
    SELECT SINGLE value INTO @DATA(lv_value)
      FROM ztint_par
      WHERE fname = 'SENDICECMESSAGETOPICPRE'.

*-数据准备
    LOOP AT it_sendmsgs[] ASSIGNING FIELD-SYMBOL(<fs_send>).
*-消息创建时间CREATEDAT
*---日期需是 1508207244208 的形式
      CALL FUNCTION 'Z_FMICCRM_ABAP_TO_TIMESTAMP'
        EXPORTING
          iv_date      = sy-datum
          iv_time      = sy-uzeit
        IMPORTING
          ev_timestamp = <fs_send>-createdat.

*-modify by wuzy 20200715 消息ID不要这里面给值，否则和外面的业务数据关联不上
*-如果需要和外面的业务数据关联，请从外部给号messageID，最后会通过et_result传出去
*-如果不需要可以不从外部给值messageID，这里给值，保证发出去
*-消息ID  MESSAGEID 随机生成唯一码
      IF <fs_send>-messageid IS INITIAL.
        CALL FUNCTION 'GENERAL_GET_RANDOM_PWD'
          EXPORTING
            number_chars = 10
          IMPORTING
            random_pwd   = lv_uuid.
        <fs_send>-messageid = |{ sy-datum }{ sy-uzeit }{ lv_uuid }|.
      ENDIF.

*-消息TOPIC
      <fs_send>-topic = |{ lv_value }-{ <fs_send>-topic }|.

*-发送的内容CONTENT
      mcr_ping_content.
      CLEAR :lv_uuid .
    ENDLOOP.

*-发送处理
    DATA(lo_ref) = NEW zcl_icec_message_api( ).
    CALL METHOD lo_ref->send_icec_messages
      EXPORTING
        it_sendmsgs = it_sendmsgs[]
        iv_flag     = iv_flag
      IMPORTING
        ev_msg      = es_msg
        et_result   = et_result.

  ENDMETHOD.


  METHOD register_message_callback.
    DATA: lv_body TYPE string.
    DATA: lv_type TYPE string.
    DATA: lv_topicgroup TYPE string.
    DATA: lv_first TYPE c.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA: lv_msg TYPE bapiret2.
    DATA:lv_title TYPE string.
    DATA: BEGIN OF ls_register,
            success TYPE string,
            reason  TYPE string,
          END OF ls_register.
    DATA: BEGIN OF ls_topicgroup,
            groupid TYPE zde_icecmsgroupid,
            topic   TYPE zde_icecmsgtopic,
            type    TYPE zde_icecmsgtype,
          END OF ls_topicgroup,
          lt_topicgroup LIKE STANDARD TABLE OF ls_topicgroup.
    "每个服务和对应的url是唯一的，消费者id topic type 可以多个

    "取配置的监听消息
    SELECT * FROM ztint_msg_conf INTO TABLE @DATA(lt_ztint_msg_conf).

    "先读服务名和url

    READ TABLE lt_ztint_msg_conf INTO DATA(ls_ztint_msg_conf) WITH  KEY fname = 'CALLBACKSERVICE' SEQ = 1 .
    IF ls_ztint_msg_conf-service IS INITIAL OR ls_ztint_msg_conf-url IS INITIAL.
      ev_msg = '请先配置服务名和对应的回调url'.
      EXIT.
    ENDIF.
    "整理消息体调用注册接口
    lv_body = '{"service":"' && ls_ztint_msg_conf-service && '","url":"' && ls_ztint_msg_conf-url && '","topicGroups":['.

    "整理topic
    CLEAR ls_ztint_msg_conf.
    LOOP AT  lt_ztint_msg_conf INTO ls_ztint_msg_conf WHERE fname = 'TOPICGROUPS'
                                                        AND ifjms  <> 'X'. "不走jms add by wuzy20211227
      CLEAR ls_topicgroup.
      ls_topicgroup-groupid = ls_ztint_msg_conf-groupid.
      ls_topicgroup-topic = ls_ztint_msg_conf-topic.
      ls_topicgroup-type = ls_ztint_msg_conf-types.
      APPEND ls_topicgroup TO lt_topicgroup.

      CLEAR ls_ztint_msg_conf.
    ENDLOOP.
    SORT lt_topicgroup BY groupid topic type.

    "校验配置topic
    IF lt_topicgroup IS INITIAL .
      ev_msg = '请先配置消费组和对应的topic.'.
      EXIT.
    ENDIF.

    "整理topic消息体
    CLEAR lv_type.
    LOOP AT lt_topicgroup ASSIGNING FIELD-SYMBOL(<fs_topicgroup>).
      IF lv_type IS INITIAL .
        lv_type = '"' && <fs_topicgroup>-type && '"'. "
      ELSE.
        lv_type = lv_type && ',"' && <fs_topicgroup>-type && '"'.
      ENDIF.

      AT END OF topic.
        CLEAR lv_topicgroup .
        IF lv_first IS INITIAL.
          lv_topicgroup = '{"groupId":"' && <fs_topicgroup>-groupid && '","topic":"' && <fs_topicgroup>-topic && '","types":[' && lv_type && ']} '.
        ELSE.
          lv_topicgroup = ',{"groupId":"' && <fs_topicgroup>-groupid && '","topic":"' && <fs_topicgroup>-topic && '","types":[' && lv_type && ']} '.
        ENDIF.
        lv_body = lv_body && lv_topicgroup .
        lv_first = 'X'.
        CLEAR lv_type.
      ENDAT.
    ENDLOOP.

    lv_body = lv_body && ']}'.


    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'MESSAGE'
        AND method = 'REGISTER_MESSAGE_CALLBACK'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    lv_title = '注册订阅平台消息(ZCL_ICEC_MESSAGE_API->REGISTER_MESSAGE_CALLBACK)'.


    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
        iv_title        = lv_title
      IMPORTING
        json_out        = lv_out
        ev_msg          = lv_msg.


    IF lv_out IS NOT INITIAL.

      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = ls_register ) .


          IF ls_register-success = 'X'.
            ev_msg = 'OK'.
          ENDIF.

        CATCH cx_root.

      ENDTRY.

    ENDIF.


    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = lv_msg iv_requestbody = lv_body iv_responsebody = lv_out ).
    ENDIF.



  ENDMETHOD.


  METHOD register_message_jms.

    DATA: lv_body TYPE string.
    DATA: lv_type TYPE string.
    DATA: lv_topicgroup TYPE string.
    DATA: lv_first TYPE c.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    DATA: lv_msg TYPE bapiret2.
    DATA:lv_title TYPE string.
    DATA: BEGIN OF ls_register,
            success TYPE string,
            reason  TYPE string,
          END OF ls_register.
    DATA: BEGIN OF ls_topicgroup,
            groupid TYPE zde_icecmsgroupid,
            topic   TYPE zde_icecmsgtopic,
            type    TYPE zde_icecmsgtype,
          END OF ls_topicgroup,
          lt_topicgroup LIKE STANDARD TABLE OF ls_topicgroup.

    "每个服务和对应的url是唯一的，消费者id topic type 可以多个
    "取配置的监听消息
    SELECT * FROM ztint_msg_conf INTO TABLE @DATA(lt_ztint_msg_conf).

    "先读服务名和url

    READ TABLE lt_ztint_msg_conf INTO DATA(ls_ztint_msg_conf) WITH  KEY fname = 'CALLBACKSERVICE' seq = 2 . "modify by wuzy 20220507
    IF ls_ztint_msg_conf-service IS INITIAL.
      ev_msg = '请先配置服务名'.
      EXIT.
    ENDIF.

    "整理消息体调用注册接口
    lv_body = '{"service":"' && ls_ztint_msg_conf-service && '","topicGroups":['.

    "整理topic
    CLEAR ls_ztint_msg_conf.
    LOOP AT  lt_ztint_msg_conf INTO ls_ztint_msg_conf WHERE fname = 'TOPICGROUPS'
                                                        AND ifjms  = 'X'. "注册走jms add by wuzy20211227
      CLEAR ls_topicgroup.
      ls_topicgroup-topic   = ls_ztint_msg_conf-topic.
      ls_topicgroup-type    = ls_ztint_msg_conf-types.
      APPEND ls_topicgroup TO lt_topicgroup.

      CLEAR ls_ztint_msg_conf.
    ENDLOOP.
    SORT lt_topicgroup BY groupid topic type.

    "校验配置topic
    IF lt_topicgroup IS INITIAL .
      ev_msg = '请先配置消费组和对应的topic.'.
      EXIT.
    ENDIF.

    "整理topic消息体
    CLEAR lv_type.
    LOOP AT lt_topicgroup ASSIGNING FIELD-SYMBOL(<fs_topicgroup>).
      IF lv_type IS INITIAL .
        lv_type = '"' && <fs_topicgroup>-type && '"'. "
      ELSE.
        lv_type = lv_type && ',"' && <fs_topicgroup>-type && '"'.
      ENDIF.

      AT END OF topic.
        CLEAR lv_topicgroup .
        IF lv_first IS INITIAL.
          lv_topicgroup = '{"topic":"' && <fs_topicgroup>-topic && '","types":[' && lv_type && ']} '.
        ELSE.
          lv_topicgroup = ',{"topic":"' && <fs_topicgroup>-topic && '","types":[' && lv_type && ']} '.
        ENDIF.
        lv_body = lv_body && lv_topicgroup .
        lv_first = 'X'.
        CLEAR lv_type.
      ENDAT.
    ENDLOOP.

    lv_body = lv_body && ']}'.

    CONDENSE lv_body NO-GAPS .

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
        WHERE service = 'MESSAGE'
        AND method = 'REGISTER_MESSAGE_JMS'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口

    lv_title = '注册订阅平台消息JMS(ZCL_ICEC_MESSAGE_API->REGISTER_MESSAGE_JMS)'.

    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM-JMS'  "modify by wuzy 20220507
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
        iv_title        = lv_title
      IMPORTING
        json_out        = lv_out
        ev_msg          = lv_msg.


    IF lv_out IS NOT INITIAL.
      "解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = ls_register ) .
          IF ls_register-success = 'X'.
            ev_msg = 'OK'.
          ENDIF.
        CATCH cx_root.
      ENDTRY.
    ENDIF.

    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = lv_msg iv_requestbody = lv_body iv_responsebody = lv_out ).
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


  METHOD send_icec_messages.

    DATA:lv_uri            TYPE string,
         ls_content_type   TYPE zapi_s_contenttype,
         lv_out            TYPE string,
         lv_body           TYPE string,
         lv_title          TYPE string,
         lt_ztint_icecmsgs TYPE STANDARD TABLE OF ztint_icecmsgs,
         ls_ztint_icecmsgs LIKE LINE OF lt_ztint_icecmsgs,
         lt_sendmsgresult  TYPE zmsgs_t_sendmsgresult.
    DATA:lv_rfc  TYPE rfcdest .

    "校验发送消息
    IF it_sendmsgs IS INITIAL.
      ev_msg-type = 'E'.
      ev_msg-message = '不能发送空消息'.
      EXIT.
    ENDIF.

    "拼写消息body
    lv_body = '['.

    LOOP AT it_sendmsgs INTO DATA(ls_msg).
      IF sy-tabix = 1.
        lv_body = lv_body && '{"content":"' && ls_msg-content && '","createdAt":"' && ls_msg-createdat && '","messageId":"'  && ls_msg-messageid &&  '"' .
        IF ls_msg-primarykey IS INITIAL.
          lv_body = lv_body && ',"primaryKey":null,"service":"'  &&  ls_msg-service && '","topic":"' && ls_msg-topic && '","type":"' && ls_msg-type && '","usage":"' && ls_msg-usage && '"}'.
        ELSE.
          lv_body = lv_body && ',"primaryKey":"' && ls_msg-primarykey && '","service":"'  &&  ls_msg-service && '","topic":"' && ls_msg-topic && '","type":"' && ls_msg-type && '","usage":"' && ls_msg-usage && '"}'.
        ENDIF.
      ELSE.
        lv_body = lv_body && ',' && '{"content":"' && ls_msg-content && '","createdAt":"' && ls_msg-createdat && '","messageId":"'  && ls_msg-messageid &&  '"' .
        IF ls_msg-primarykey IS INITIAL.
          lv_body = lv_body && ',"primaryKey":null,"service":"'  &&  ls_msg-service && '","topic":"' && ls_msg-topic && '","type":"' && ls_msg-type && '","usage":"' && ls_msg-usage && '"}'.
        ELSE.
          lv_body = lv_body && ',"primaryKey":"' && ls_msg-primarykey && '","service":"'  &&  ls_msg-service && '","topic":"' && ls_msg-topic && '","type":"' && ls_msg-type && '","usage":"' && ls_msg-usage && '"}'.
        ENDIF.
      ENDIF.

      "记录日志
      CLEAR ls_ztint_icecmsgs.
      ls_ztint_icecmsgs-guid        = ls_msg-messageid.
      ls_ztint_icecmsgs-id          = ls_msg-messageid.
      ls_ztint_icecmsgs-messageid   = ls_msg-messageid.      "add by wuzy 20200820
      ls_ztint_icecmsgs-topic       = ls_msg-topic.
      ls_ztint_icecmsgs-type        = ls_msg-type.
      ls_ztint_icecmsgs-fromservice = ls_msg-service.
      ls_ztint_icecmsgs-primarykey  = ls_msg-primarykey.
      ls_ztint_icecmsgs-content     = ls_msg-content.
      ls_ztint_icecmsgs-contentref  = ls_msg-content.   "发送信息参考
      ls_ztint_icecmsgs-createdat   = ls_msg-createdat.
      ls_ztint_icecmsgs-zusage      = ls_msg-usage.
      ls_ztint_icecmsgs-zcrt_uname  = sy-uname.
      ls_ztint_icecmsgs-zcrt_bdate  = sy-datum.
      ls_ztint_icecmsgs-zcrt_btime  = sy-uzeit.

      APPEND  ls_ztint_icecmsgs TO lt_ztint_icecmsgs.
      CLEAR ls_msg.
    ENDLOOP.

    lv_body = lv_body && ']'.

    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
         WHERE service = 'MESSAGE'
         AND method = 'SEND_ICEC_MESSAGES'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).

    "调用接口
    lv_title = '发送消息到平台(ZCL_ICEC_MESSAGE_API->SEND_ICEC_MESSAGES)'.

    IF iv_flag = 'X'.
      lv_rfc = 'KLPLATFORM'.
    ELSE.
      lv_rfc = 'PLATFORM'.
    ENDIF.

    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = lv_rfc "'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_body         = lv_body
        iv_title        = lv_title
      IMPORTING
        json_out        = lv_out
        ev_msg          = ev_msg.

    IF lv_out IS NOT INITIAL.
      "解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = lt_sendmsgresult ) .

          SORT lt_sendmsgresult BY messageid.
        CATCH cx_root.
      ENDTRY.
    ENDIF.

    "保存信息
    LOOP AT lt_ztint_icecmsgs ASSIGNING FIELD-SYMBOL(<fs_msg>).
      READ TABLE lt_sendmsgresult INTO DATA(ls_result) WITH  KEY messageid = <fs_msg>-guid BINARY SEARCH.
      <fs_msg>-status = ls_result-success.
      <fs_msg>-reason = ls_result-reason.
      CLEAR ls_result.
    ENDLOOP.

    IF lt_sendmsgresult IS NOT INITIAL .
      et_result = lt_sendmsgresult .     "把返回结果集传递出去 add bu wuzy 20200715
    ENDIF.
    IF lt_ztint_icecmsgs IS NOT INITIAL.
      MODIFY ztint_icecmsgs FROM TABLE lt_ztint_icecmsgs.
    ENDIF.
    IF ls_ztint_icec_api-nolog IS INITIAL.
    save_api_log( EXPORTING iv_keyvalue = lv_uri ev_msg = ev_msg iv_requestbody = lv_body iv_responsebody = lv_out ).
    ENDIF.

  ENDMETHOD.


  METHOD spell_icec_topic.

    IF iv_topic IS INITIAL.
      ev_msg = 'topic不能为空'.
      EXIT.
    ENDIF.


    SELECT SINGLE value INTO @DATA(lv_value)
      FROM ztint_par
      WHERE fname = 'SENDICECMESSAGETOPICPRE'.
    IF lv_value IS INITIAL.
      ev_msg = '请先配置消息环境前缀'.
      EXIT.
    ELSE.
      ev_spelled = lv_value && '-' && iv_topic .
    ENDIF.


  ENDMETHOD.
ENDCLASS.
