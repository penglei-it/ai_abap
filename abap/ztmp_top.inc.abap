*&---------------------------------------------------------------------*
*& Include ZTMP_TOP - 数据定义与选择屏幕
*&---------------------------------------------------------------------*
*& 功能说明：
*&   定义 ZTMP 报表使用的全局数据与选择屏幕。
*&   主程序：ZTMP
*&---------------------------------------------------------------------*

* 查询结果内表（与 ztint_market_req 字段对应，便于 ALV 展示）
DATA: gt_data TYPE TABLE OF ztint_market_req,  " 查询结果内表
      gs_data TYPE ztint_market_req,            " 单行工作区
      tit     TYPE string.                      " 选择屏幕块标题

* 选择屏幕：按创建日期筛选
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE tit.
PARAMETERS: p_date TYPE dats DEFAULT sy-datum.  " 创建日期，默认当天
SELECTION-SCREEN END OF BLOCK b1.
