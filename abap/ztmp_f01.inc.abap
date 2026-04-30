*&---------------------------------------------------------------------*
*& Include ZTMP_F01 - 子程序：取数、报表展示
*&---------------------------------------------------------------------*
*& 功能说明：
*&   包含 INIT_DEFAULTS、GET_DATA、DISPLAY_REPORT 等子程序。
*&   主程序：ZTMP
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*& Form INIT_DEFAULTS - 初始化默认值
*&---------------------------------------------------------------------*
*& 说明：若 p_date 为空，则默认当天日期
*& 使用变量：p_date（选择屏幕参数，来自 ZTMP_TOP）
*&---------------------------------------------------------------------*
FORM init_defaults.
  IF p_date IS INITIAL.
    p_date = sy-datum.
  ENDIF.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form GET_DATA - 从表 ztint_market_req 查询数据
*&---------------------------------------------------------------------*
*& 说明：按 p_date 筛选创建日期，将结果写入 gt_data
*& 使用变量：p_date（输入），gt_data（输出）
*&---------------------------------------------------------------------*
FORM get_data.
  SELECT guid, reqreason, instanceid, zcrt_bdate
    INTO TABLE @gt_data
    FROM ztint_market_req
    WHERE zcrt_bdate = @p_date.

  IF sy-subrc <> 0.
    MESSAGE i000(00) WITH '未查到符合条件的数据' p_date.
    RETURN.
  ENDIF.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form DISPLAY_REPORT - 以 ALV 网格展示报表
*&---------------------------------------------------------------------*
*& 说明：使用 CL_SALV_TABLE 创建 ALV 网格，展示 gt_data
*& 使用变量：gt_data（输入），p_date（选择屏幕参数，用于标题）
*&---------------------------------------------------------------------*
FORM display_report.
  DATA: lo_table TYPE REF TO cl_salv_table,
        lx_msg   TYPE REF TO cx_salv_msg.

  IF lines( gt_data ) = 0.
    RETURN.
  ENDIF.

  TRY.
      cl_salv_table=>factory(
        IMPORTING r_salv_table = lo_table
        CHANGING  t_table      = gt_data ).
      lo_table->get_functions( )->set_all( abap_true ).
      lo_table->get_columns( )->set_optimize( abap_true ).
      lo_table->get_display_settings( )->set_list_header( |ZTMP - 数据列表 (日期: { p_date })| ).
      lo_table->display( ).
    CATCH cx_salv_msg INTO lx_msg.
      MESSAGE lx_msg->get_text( ) TYPE 'E'.
  ENDTRY.
ENDFORM.
