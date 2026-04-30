" ---------- 过滤与分页前移：插入到 get_as_data_new_v4 中 et_aftersale = CORRESPONDING 之前 ----------
" 若类中已存在 ty_asid 等可去掉重复 TYPES 定义
TYPES: BEGIN OF ty_asid,
         asid TYPE zticec_af_inf-asid,
       END OF ty_asid,
       BEGIN OF ty_companyid,
         companyid TYPE ztint_cus_inf-companyid,
       END OF ty_companyid,
       BEGIN OF ty_productstoreid,
         productstoreid TYPE ztint_ven_inf-productstoreid,
       END OF ty_productstoreid.

DATA: lt_del_idx         TYPE STANDARD TABLE OF i,
      lv_idx             TYPE i,
      lv_tabix           TYPE i,
      lv_mang            TYPE char1,
      lv_total           TYPE i,
      lv_from            TYPE i,
      lv_to              TYPE i,
      lv_page            TYPE i,
      lv_size            TYPE i,
      lv_match           TYPE abap_bool,
      lt_asid_final      TYPE TABLE OF ty_asid,
      lt_companyid       TYPE TABLE OF ty_companyid,
      lt_productstoreid  TYPE TABLE OF ty_productstoreid.

" 步骤 1：配件过滤
IF lt_zticec_af_order IS NOT INITIAL.
  DATA lt_asid_keep TYPE TABLE OF ty_asid.
  lt_asid_keep = VALUE #( FOR wa IN lt_zticec_af_order ( asid = wa-asid ) ).
  SORT lt_asid_keep BY asid.
  DELETE ADJACENT DUPLICATES FROM lt_asid_keep COMPARING asid.
  CLEAR lt_del_idx.
  LOOP AT lt_zticec_af_infuser ASSIGNING FIELD-SYMBOL(<inf>).
    lv_tabix = sy-tabix.
    READ TABLE lt_asid_keep WITH KEY asid = <inf>-asid BINARY SEARCH TRANSPORTING NO FIELDS.
    IF sy-subrc NE 0.
      APPEND lv_tabix TO lt_del_idx.
    ENDIF.
  ENDLOOP.
  SORT lt_del_idx DESCENDING.
  LOOP AT lt_del_idx INTO lv_idx.
    DELETE lt_zticec_af_infuser INDEX lv_idx.
  ENDLOOP.
ENDIF.

" 步骤 2：店铺经营状态过滤
IF so_mangstatus IS NOT INITIAL AND lt_zticec_af_infuser IS NOT INITIAL.
  SELECT productstoreid, offstatus FROM ztint_ven_offhea
    INTO TABLE @DATA(lt_venoff)
    FOR ALL ENTRIES IN @lt_zticec_af_infuser
    WHERE productstoreid = @lt_zticec_af_infuser-assupplierstoreid.
  SORT lt_venoff BY productstoreid.
  CLEAR lt_del_idx.
  LOOP AT lt_zticec_af_infuser ASSIGNING <inf>.
    lv_tabix = sy-tabix.
    READ TABLE lt_venoff INTO DATA(ls_off) WITH KEY productstoreid = <inf>-assupplierstoreid BINARY SEARCH.
    lv_mang = COND #( WHEN sy-subrc NE 0 THEN '3'
                      WHEN ls_off-offstatus = '7' THEN '1'
                      WHEN ls_off-offstatus = '8' THEN '2'
                      ELSE '3' ).
    IF lv_mang NOT IN so_mangstatus.
      APPEND lv_tabix TO lt_del_idx.
    ENDIF.
  ENDLOOP.
  SORT lt_del_idx DESCENDING.
  LOOP AT lt_del_idx INTO lv_idx.
    DELETE lt_zticec_af_infuser INDEX lv_idx.
  ENDLOOP.
ENDIF.

" 步骤 3：so_complex 过滤
IF so_complex IS NOT INITIAL AND lt_zticec_af_infuser IS NOT INITIAL.
  SORT lt_ztint_cus_inf BY companyid.
  SORT lt_zticec_af_order BY asid orderid.
  CLEAR lt_del_idx.
  LOOP AT lt_zticec_af_infuser ASSIGNING <inf>.
    lv_tabix = sy-tabix.
    lv_match = abap_false.
    IF <inf>-asrepaircompanyname IN so_complex OR <inf>-asid IN so_complex.
      lv_match = abap_true.
    ENDIF.
    IF lv_match = abap_false.
      READ TABLE lt_ztint_cus_inf INTO DATA(ls_cus) WITH KEY companyid = <inf>-asrepaircompanyid BINARY SEARCH.
      IF sy-subrc = 0 AND ls_cus-companycode IN so_complex.
        lv_match = abap_true.
      ENDIF.
    ENDIF.
    IF lv_match = abap_false.
      LOOP AT lt_zticec_af_order INTO DATA(ls_ord) WHERE asid = <inf>-asid.
        IF ls_ord-orderid IN so_complex.
          lv_match = abap_true.
          EXIT.
        ENDIF.
      ENDLOOP.
    ENDIF.
    IF lv_match = abap_false.
      APPEND lv_tabix TO lt_del_idx.
    ENDIF.
  ENDLOOP.
  SORT lt_del_idx DESCENDING.
  LOOP AT lt_del_idx INTO lv_idx.
    DELETE lt_zticec_af_infuser INDEX lv_idx.
  ENDLOOP.
ENDIF.

" 步骤 5：排序
IF iv_sortby = 'Createtimetx'.
  IF iv_sortorder = 'ASC'.
    SORT lt_zticec_af_infuser BY createdstampstr ASCENDING.
  ELSE.
    SORT lt_zticec_af_infuser BY createdstampstr DESCENDING.
  ENDIF.
ELSE.
  IF iv_sortorder = 'ASC'.
    SORT lt_zticec_af_infuser BY lastupdatedtxstampstr ASCENDING.
  ELSE.
    SORT lt_zticec_af_infuser BY lastupdatedtxstampstr DESCENDING.
  ENDIF.
ENDIF.

" 步骤 6：分页
lv_total = lines( lt_zticec_af_infuser ).
ev_totalsize = lv_total.
lv_page = iv_page.
lv_size = iv_size.
IF lv_page IS INITIAL.
  lv_page = 1.
ENDIF.
IF lv_size IS INITIAL.
  lv_size = 20.
ENDIF.
ev_totalpage = lv_total DIV lv_size.
IF lv_total MOD lv_size NE 0.
  ev_totalpage = ev_totalpage + 1.
ENDIF.
lv_from = ( lv_page - 1 ) * lv_size + 1.
lv_to = lv_page * lv_size.
IF lv_from > lv_total.
  CLEAR lt_zticec_af_infuser.
ELSE.
  IF lv_to > lv_total.
    lv_to = lv_total.
  ENDIF.
  IF lv_to < lv_total.
    DELETE lt_zticec_af_infuser FROM lv_to + 1.
  ENDIF.
  IF lv_from > 1.
    DELETE lt_zticec_af_infuser TO lv_from - 1.
  ENDIF.
ENDIF.

" 步骤 7：同步裁剪关联表
IF lt_zticec_af_infuser IS NOT INITIAL.
  lt_asid_final = VALUE #( FOR w IN lt_zticec_af_infuser ( asid = w-asid ) ).
  SORT lt_asid_final BY asid.
  DELETE ADJACENT DUPLICATES FROM lt_asid_final COMPARING asid.

  CLEAR lt_del_idx.
  LOOP AT lt_zticec_af_order ASSIGNING FIELD-SYMBOL(<ord>).
    lv_tabix = sy-tabix.
    READ TABLE lt_asid_final WITH KEY asid = <ord>-asid BINARY SEARCH TRANSPORTING NO FIELDS.
    IF sy-subrc NE 0.
      APPEND lv_tabix TO lt_del_idx.
    ENDIF.
  ENDLOOP.
  SORT lt_del_idx DESCENDING.
  LOOP AT lt_del_idx INTO lv_idx.
    DELETE lt_zticec_af_order INDEX lv_idx.
  ENDLOOP.

  IF lt_ztint_cus_inf IS NOT INITIAL.
    lt_companyid = VALUE #( FOR w IN lt_zticec_af_infuser ( companyid = w-asrepaircompanyid ) ).
    SORT lt_companyid BY companyid.
    DELETE ADJACENT DUPLICATES FROM lt_companyid COMPARING companyid.
    CLEAR lt_del_idx.
    LOOP AT lt_ztint_cus_inf ASSIGNING FIELD-SYMBOL(<cus>).
      lv_tabix = sy-tabix.
      READ TABLE lt_companyid WITH KEY companyid = <cus>-companyid BINARY SEARCH TRANSPORTING NO FIELDS.
      IF sy-subrc NE 0.
        APPEND lv_tabix TO lt_del_idx.
      ENDIF.
    ENDLOOP.
    SORT lt_del_idx DESCENDING.
    LOOP AT lt_del_idx INTO lv_idx.
      DELETE lt_ztint_cus_inf INDEX lv_idx.
    ENDLOOP.
  ENDIF.

  IF lt_ztint_ven_inf IS NOT INITIAL.
    lt_productstoreid = VALUE #( FOR w IN lt_zticec_af_infuser ( productstoreid = w-assupplierstoreid ) ).
    SORT lt_productstoreid BY productstoreid.
    DELETE ADJACENT DUPLICATES FROM lt_productstoreid COMPARING productstoreid.
    CLEAR lt_del_idx.
    LOOP AT lt_ztint_ven_inf ASSIGNING FIELD-SYMBOL(<ven>).
      lv_tabix = sy-tabix.
      READ TABLE lt_productstoreid WITH KEY productstoreid = <ven>-productstoreid BINARY SEARCH TRANSPORTING NO FIELDS.
      IF sy-subrc NE 0.
        APPEND lv_tabix TO lt_del_idx.
      ENDIF.
    ENDLOOP.
    SORT lt_del_idx DESCENDING.
    LOOP AT lt_del_idx INTO lv_idx.
      DELETE lt_ztint_ven_inf INDEX lv_idx.
    ENDLOOP.
  ENDIF.
ENDIF.
