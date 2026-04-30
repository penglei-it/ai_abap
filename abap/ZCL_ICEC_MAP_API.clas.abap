CLASS zcl_icec_map_api DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
      BEGIN OF ts_addresscomponent,
        province TYPE string,
        city     TYPE string,
        district TYPE string,
        township TYPE string,
      END OF ts_addresscomponent .
    TYPES:
      BEGIN OF ts_regeocode,
        formatted_address TYPE string,
        addresscomponent  TYPE ts_addresscomponent,
      END OF ts_regeocode .
    TYPES:
      BEGIN OF ts_regeo ,
        status    TYPE string,
        info      TYPE string,
        infocode  TYPE string,
        regeocode TYPE ts_regeocode,
      END OF ts_regeo .


    TYPES:
      BEGIN OF ts_geocode,
        formatted_address TYPE string,
        location          TYPE string,
      END OF ts_geocode,
      BEGIN OF ts_geo,
        status   TYPE string,
        info     TYPE string,
        infocode TYPE string,
        geocodes TYPE ts_geocode,
      END OF ts_geo.

    DATA mv_key TYPE string READ-ONLY .
    CONSTANTS mc_rfcdest TYPE rfcdest VALUE 'GDMAP' ##NO_TEXT.

    METHODS constructor .
    METHODS get_regeo
      IMPORTING
        VALUE(iv_location) TYPE string
      RETURNING
        VALUE(es_regeo)    TYPE ts_regeo .
    METHODS get_geo
      IMPORTING
        VALUE(iv_address) TYPE string
      RETURNING
        VALUE(es_geo)     TYPE ts_geo.
protected section.
private section.
ENDCLASS.



CLASS ZCL_ICEC_MAP_API IMPLEMENTATION.


  METHOD constructor.
    "获取key
    SELECT SINGLE value FROM ztint_par INTO mv_key WHERE fname = 'GETADDREBYITUDE'.
  ENDMETHOD.


  METHOD get_geo.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = '/v3/geocode/geo?' && 'address=' && iv_address && '&output=JSON&key=' && mv_key.

    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = mc_rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = DATA(lv_msg)
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_geo ) .
        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).
        CATCH cx_root.
      ENDTRY.
    ENDIF.

  ENDMETHOD.


  METHOD get_regeo.

    DATA:lv_uri          TYPE string,
         ls_content_type TYPE zapi_s_contenttype.
    DATA: lv_out TYPE string.

    lv_uri = '/v3/geocode/regeo?key=' && mv_key &&  '&location=' && iv_location.


    ls_content_type-content_type = 'application/json;charset=UTF-8'.

    DATA(lo_api) = NEW zcl_icec_api( ).
    "调用接口
    CALL METHOD lo_api->get_data(
      EXPORTING
        iv_rfcdest      = mc_rfcdest
        iv_uri          = lv_uri
        is_content_type = ls_content_type
      IMPORTING
        json_out        = lv_out
        ev_msg          = DATA(lv_msg)
                          ).
    IF lv_out IS NOT INITIAL .
      "解析json
      TRY.

          /ui2/cl_json=>deserialize(
                      EXPORTING
                         json = lv_out
                      CHANGING
                         data = es_regeo ) .
        CATCH cx_json_illegal_syntax INTO DATA(lo_syntax).
        CATCH cx_root.
      ENDTRY.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
