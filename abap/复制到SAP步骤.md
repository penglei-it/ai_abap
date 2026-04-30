# ZTMP 报表 — 在 SAP 里怎么建、怎么贴

## 方式一：一键推送（推荐，可自动建对象）

1. 在 Cursor 里用「**SAP ADT: 连接环境**」登录当前集团。
2. `Ctrl+Shift+P` → 输入 **「推送 ZTMP」** → 执行 **「SAP: 推送 ZTMP 到 SAP（无需粘贴）」**。
3. 扩展会按顺序处理 ZTMP_TOP、ZTMP_F01、ZTMP：
   - **若对象已存在**：直接写入源码。
   - **若对象不存在（404）**：先尝试**自动创建**再写入。自动创建需要满足其一：
     - 已安装 **erpl-adt**（`pip install erpl-adt` 或 `uvx erpl-adt`），或
     - 当前 SAP 系统支持 ADT 创建接口。
4. 若自动创建失败，请安装 erpl-adt 或在 SE80 中先建 3 个空对象（ZTMP、ZTMP_TOP、ZTMP_F01）后再执行推送。

---

## 方式二：手动粘贴

按下面顺序在 **SE80** 或 **ADT** 里建 3 个对象，再把对应代码整段复制进去即可。

---

## 1. 建 INCLUDE：ZTMP_TOP

- 事务 **SE80**：右键包/对象列表 → 创建 → 程序 → 类型选 **INCLUDE**，名称 **ZTMP_TOP**。  
  或 **ADT**：右键包 → New → ABAP Program → 类型 **Include**，名称 **ZTMP_TOP**。
- 打开 ZTMP_TOP，**整段替换**为下面代码并保存、激活：

```abap
*&---------------------------------------------------------------------*
*& Include ZTMP_TOP - 数据定义与选择屏幕
*&---------------------------------------------------------------------*

* 查询结果内表（与 ztint_market_req 字段对应，便于 ALV 展示）
DATA: gt_data TYPE TABLE OF ztint_market_req,
      gs_data TYPE ztint_market_req,
      tit     TYPE string.  " 选择屏幕块标题

* 选择屏幕：按创建日期筛选
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE tit.
PARAMETERS: p_date TYPE dats DEFAULT sy-datum.  " 创建日期，默认当天
SELECTION-SCREEN END OF BLOCK b1.
```

---

## 2. 建 INCLUDE：ZTMP_F01

- 再建一个 **INCLUDE**，名称 **ZTMP_F01**。
- 打开 ZTMP_F01，**整段替换**为下面代码并保存、激活：

```abap
*&---------------------------------------------------------------------*
*& Include ZTMP_F01 - 子程序：取数、报表展示
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*& Form INIT_DEFAULTS - 初始化默认值
*&---------------------------------------------------------------------*
FORM init_defaults.
  IF p_date IS INITIAL.
    p_date = sy-datum.
  ENDIF.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form GET_DATA - 从表 ztint_market_req 查询数据
*&---------------------------------------------------------------------*
FORM get_data.
  SELECT guid, reqreason, instanceid, zcrt_bdate
    INTO TABLE @gt_data
    FROM ztint_market_req
    WHERE zcrt_bdate = @p_date.

  IF sy-subrc <> 0.
    MESSAGE i000(00) WITH '未查到符合条件的数据' p_date. " 无数据提示
    RETURN.
  ENDIF.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form DISPLAY_REPORT - 以 ALV 网格展示报表
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
```

---

## 3. 建主程序：ZTMP

- 建 **可执行程序**，名称 **ZTMP**。
- 打开 ZTMP，**整段替换**为下面代码并保存、激活：

```abap
*&---------------------------------------------------------------------*
*& Report ZTMP
*& 从表 ztint_market_req 查询数据并以 ALV 报表展示（含 INCLUDE 模块化）
*&---------------------------------------------------------------------*
REPORT ztmp MESSAGE-ID 00.

* 数据定义与选择屏幕
INCLUDE ztmp_top.

* 子程序：取数、报表展示
INCLUDE ztmp_f01.

*&---------------------------------------------------------------------*
*& 初始化（可选：默认日期）
*&---------------------------------------------------------------------*
INITIALIZATION.
  tit = '选择条件'.
  PERFORM init_defaults.

*&---------------------------------------------------------------------*
*& 主逻辑：取数并展示
*&---------------------------------------------------------------------*
START-OF-SELECTION.
  PERFORM get_data.
  PERFORM display_report.
```

---

## 4. 运行

- 事务 **SA38**（或 SE80 里对 ZTMP 选“执行”）：程序名输入 **ZTMP**，执行。
- 选择屏幕输入日期（默认当天），回车后显示 ALV 报表。

---

**说明**：表 `ztint_market_req` 需存在，且含字段 `guid`, `reqreason`, `instanceid`, `zcrt_bdate`（或系统里实际日期字段名）。若报“未找到数据”，先检查该日期下是否有数据。
