# SAP ADT Fetch - F12 跳转与对象获取

当 ABAP FS Language Server 不可用（如连接超时、崩溃）时，通过 ADT API 实现 **F12 跳转** 和对象获取。

## 关于 INCLUDE 与 MCP

**INCLUDE 不需要「通过 MCP 同步」**。主程序由 ABAP FS 通过 adt:// 打开，INCLUDE 语句已在主程序内。跳转时是**按需**通过 ADT API 获取 include 程序内容，与 MCP 无关。MCP 是给 AI 工具用的接口，不负责文件同步。

## 支持跳转（F12 / 右键）

| 语法 | 对象类型 |
|------|----------|
| `INCLUDE xxx.` | PROG（Include 程序） |
| `REPORT xxx.` / `PROGRAM xxx.` | PROG |
| `CLASS xxx DEFINITION` | CLAS |
| `INTERFACE xxx.` | INTF |

## 安装

1. 在 Cursor/VS Code 中：扩展 → 从文件夹安装
2. 选择 `sap_connect\sap-adt-fetch` 目录（或项目根目录下的 sap-adt-fetch）

或通过命令行：
```bash
code --install-extension c:\sap_connect\sap-adt-fetch
```

## 使用

### 平替方案（推荐，避免 ADT 500 错误）

1. **从工作区打开**：光标放在 `INCLUDE sapmzicerp_0001_f01.` 上 → `Ctrl+Shift+P` → **「SAP: 从工作区打开 Include」** 或右键选择
2. **左侧资源管理器**：展开「包含」→ 双击对应 `.prog.abap` 文件
3. **ABAP FS 搜索**：`Ctrl+Shift+P` → **「ABAP FS: Search for object」** → 输入 Include 名（如 `SAPMZICERP_0001_F01`）

### ADT API 方式（需连接正常）

4. **F12** 或 **右键** → **「SAP: Fetch Object via ADT API」** / `Ctrl+Shift+Alt+F`
5. **按名称/模式检索**：`Ctrl+Shift+P` → **「SAP: 检索对象（按名称/模式）」** → 输入对象名或模式（如 `ZTMP`、`Z*`）→ 选择类型（程序/类/接口等）→ 从结果列表选一个即可打开。若系统支持 ADT 检索接口则可用通配符；否则输入完整对象名会直接拉取并打开。

**注意**：需将 **sap_connect 项目**加入工作区（文件 → 将文件夹添加到工作区），否则扩展找不到 `scripts/sap-adt-read-object.ps1`。

## 前置条件

- 项目根目录包含 `scripts/sap-adt-read-object.ps1`
- SAP 连接：优先使用 `settings.json` 中的 `sapAdt.baseUrl` 或 `abapfs.remote` 配置

## 多环境与当前连接

- **状态栏**：右下角显示当前连接，例如 `SAP: CT-DV2-310 (PENGL)`；未连接时显示「SAP: 未连接」。**点击状态栏**可打开「连接/切换环境」。
- **单活动连接**：同一时刻只有一个环境处于活动（F12、获取对象等都用该环境）。可为多个环境保存账号，通过 `Ctrl+Shift+Alt+L` 或点击状态栏随时切换，无需重复输入密码（已保存时）。
- **配置**：在 `sapAdt.environments` 中配置多个环境（如 CT-DV2-200、CT-DV2-310），通过「SAP ADT: 连接环境」选择并登录，活动环境会写入 `sapAdt.activeEnvironment`。

## 连接配置

若出现 `ETIMEDOUT` 或连接失败，请检查：

1. **设置** → 搜索 `sapAdt.baseUrl`，确认与 ABAP FS 连接一致（如 `192.168.70.15:8000` 或 `https://host:44301`）
2. 或确保 `abapfs.remote` 中已正确配置

## 支持的对象类型

PROG, CLAS, INTF, TTYP, TABL, DTEL, DOMA, VIEW, FUGR 等
