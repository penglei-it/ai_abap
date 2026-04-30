class ZCL_ICEC_ADDRESS_API definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF ty_zonelist,
            id              TYPE string,
            zonename        TYPE string,
            zonecode        TYPE string,
            geoids          TYPE string,
            aggregategeoids TYPE string,
            geonames        TYPE string,
            createdstamp    TYPE string,
            createby        TYPE string,
          END OF ty_zonelist .
  types:
    tt_zonelist TYPE STANDARD TABLE OF ty_zonelist .
  types:
    BEGIN OF ty_geoslist,
        geocode         TYPE string,
        geoid           TYPE string,
        geoname         TYPE string,
        geotype         TYPE string,
        parentgeoid     TYPE string,
        countylevelcity TYPE string,
        longitude       TYPE string,
        latitude        TYPE string,
        regionid        TYPE string,
        regionname      TYPE string,
        regiontype      TYPE string,
        enabled         TYPE string,
      END OF ty_geoslist .
  types:
    tt_geoslist TYPE STANDARD TABLE OF ty_geoslist WITH DEFAULT KEY .

  methods GET_GEOSLIST_BYIDS
    importing
      value(IV_BODY) type STRING
    exporting
      value(EV_MSG) type BAPIRET2
      value(ET_GEOSLIST) type TT_GEOSLIST .
  methods GET_GEOS
    importing
      value(GEOID) type STRING default 'CHN'
      value(DEPTH) type STRING default '1'
      value(TYPE) type STRING default 'SEARCH_DOWN'
      value(SAVE_DATA) type CHAR01 optional
    exporting
      !ES_MSG type BAPIRET2
      !ET_GEOLIST type TT_GEOSLIST .
  methods GET_ZONE_LIST
    exporting
      value(ET_ZONELIST) type TT_ZONELIST
      value(ES_MSG) type BAPIRET2 .
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



CLASS ZCL_ICEC_ADDRESS_API IMPLEMENTATION.


  METHOD get_geos.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'ADDRESS' AND method = 'GET_GEOS'.

    lv_uri = ls_ztint_icec_api-url.

    REPLACE '{geoId}' IN lv_uri WITH geoid.
    REPLACE '{depth}' IN lv_uri WITH depth.
    REPLACE '{type}' IN lv_uri WITH type.


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
        ev_msg          = es_msg.
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_geolist
  ).
          DATA:ls_geolist LIKE LINE OF et_geolist.
          ls_geolist-geoid = 'CHN'.
          ls_geolist-geoname = '全国'.
          ls_geolist-enabled = 'X'.
          INSERT ls_geolist INTO et_geolist INDEX 1.

          IF save_data IS NOT INITIAL.
            DATA:lt_geo TYPE STANDARD TABLE OF ztint_geo.
            lt_geo = VALUE #( FOR wa IN et_geolist ( geoid = wa-geoid
                              geoname = wa-geoname parentgeoid = wa-parentgeoid geocode = wa-geocode
                              geotype = wa-geotype
                              countylevelcity = COND #( WHEN wa-countylevelcity EQ 'true' OR wa-countylevelcity EQ 'X' THEN 'X' ELSE '' )
                              longitude = wa-longitude latitude = wa-latitude regionid = wa-regionid
                              zcrt_bdate = sy-datum zcrt_btime = sy-uzeit
                              regionname = wa-regionname regiontype = wa-regiontype
                              enabled = COND #( WHEN wa-enabled EQ 'true' OR wa-enabled EQ 'X' THEN 'X' ELSE '' ) ) ).
            MODIFY ztint_geo FROM TABLE lt_geo.
            COMMIT WORK AND WAIT.
          ENDIF.

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


  METHOD get_geoslist_byids.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'ADDRESS'
      AND method = 'GET_GEOSLIST_BYIDS'.

    lv_uri = ls_ztint_icec_api-url.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.


    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    DATA: lv_body TYPE string.
    DATA:lv_title TYPE string.
    lv_body = iv_body.
    lv_title = '批量查询行政区域(ZCL_ICEC_ADDRESS_API->GET_GEOSLIST_BYIDS)'.

    CALL METHOD lo_api->post_data
      EXPORTING
        iv_rfcdest      = 'PLATFORM'
        iv_uri          = lv_uri
        is_content_type = ls_content_type
        iv_title        = lv_title
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
                         data = et_geoslist  ).

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


  METHOD get_zone_list.
    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.
    "取url
    SELECT SINGLE * FROM ztint_icec_api INTO @DATA(ls_ztint_icec_api)
      WHERE service = 'ADDRESS' AND method = 'GET_ZONE_LIST'.

    lv_uri = ls_ztint_icec_api-url.
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
        ev_msg          = es_msg.
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.
          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = et_zonelist  ).
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


  METHOD save_api_log.
    DATA:ls_apilog TYPE zticec_api_log.
    EXIT.
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
ENDCLASS.
