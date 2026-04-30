# SAP ADT Fetch 功能操作指南

本文档说明各已实现功能的具体操作步骤。

---

## 0. 方案A：本地文件闭环（推荐）

**目标**：避免在 `adt://` 虚拟工作区直接编辑，统一改为本地 `file://` 文件编辑后再回写 SAP。

**步骤**：

1. 先拉取并准备本地可编辑文件（不写回）：

```powershell
.\scripts\sap-adt-local-cycle.ps1 `
  -ObjectName ZCL_DEMO `
  -ObjectType CLAS `
  -BaseUrl http://<sap-host>:<port> `
  -Username <user> `
  -Password <pass> `
  -Client 200 `
  -PrepareOnly
```

2. 编辑 `.\abap\ZCL_DEMO.work.abap`（本地文件，可用普通 LSP）
3. 完成后执行写回、激活与回读校验：

```powershell
.\scripts\sap-adt-local-cycle.ps1 `
  -ObjectName ZCL_DEMO `
  -ObjectType CLAS `
  -BaseUrl http://<sap-host>:<port> `
  -Username <user> `
  -Password <pass> `
  -Client 200 `
  -Transport <TR>
```

**验收口径**：命令最后输出 `Round-trip verify passed` 才算落地成功。

---

## 前置条件

1. **连接环境**：按 `Ctrl+Shift+Alt+L` 或执行「SAP ADT: 连接环境」，选择环境并输入账号密码
2. **多环境配置**：在设置中配置 `sapAdt.environments`，详见 `docs/sap-adt-multi-env.md`

---

## 1. 传输请求选择/创建

### 1.1 选择传输请求

**场景**：保存可传输对象前需指定传输请求。

**步骤**：

1. 按 `Ctrl+Shift+P` 打开命令面板
2. 输入「**SAP: 选择传输请求**」并执行
3. 在弹出列表中选中要使用的传输请求
4. 选择后，传输号会保存到工作区状态，供后续保存使用

**说明**：若列表为空，请确认已连接环境且系统支持 CTS API。

### 1.2 列出传输请求

**场景**：仅查看当前用户的传输请求列表。

**步骤**：

1. 按 `Ctrl+Shift+P` 打开命令面板
2. 输入「**SAP: 列出传输请求**」并执行
3. 结果会在新编辑器中以文本形式展示（传输号 | 描述 | 所有者 | 状态）

---

## 2. DDLS（CDS 视图）读取

**场景**：在 ABAP FS 中打开 CDS 视图或需通过 ADT 拉取 CDS 源码。

**步骤**：

1. **方式 A**：在 ABAP FS 中双击 CDS 视图文件（若显示 "This object type is not supported"）
2. 按 `Ctrl+Shift+Alt+F` 或执行「**SAP: Fetch Object via ADT API**」
3. 在对象类型中选择 **DDLS**（若弹出选择框）
4. 扩展会通过 ADT 拉取 CDS 源码并展示

**方式 B**：手动指定对象

1. 按 `Ctrl+Shift+Alt+F` 或执行「SAP: Fetch Object via ADT API」
2. 输入 CDS 视图名称（如 `Z_I_SALESORDER`）
3. 在对象类型中选择 **DDLS**

**说明**：不同 SAP 版本可能使用不同 ADT 路径，扩展会尝试备用路径。

---

## 3. 查找引用（Where-Used）

**场景**：查看某对象被哪些程序/类引用，并跳转到引用处。

**步骤**：

1. **方式 A**：打开包含该对象的 ABAP 文件，将光标放在对象名上（如类名、程序名）
2. 按 `Ctrl+Shift+P`，输入「**SAP: 查找引用 (Where-Used)**」并执行
3. 若无法从光标解析，会提示输入对象名和类型
4. 在弹出列表中选择要打开的引用对象
5. 扩展会拉取该对象源码并打开

**方式 B**：无打开文件时

1. 执行「SAP: 查找引用 (Where-Used)」
2. 输入对象名（如 `ZCL_MY_CLASS`）
3. 选择对象类型（PROG、CLAS、INTF 等）
4. 在结果列表中选择要打开的对象

**说明**：若系统不支持 references 接口，会回退为按名称搜索，结果可能不完全。

---

## 4. 仅激活对象

**场景**：已修改对象并保存到 SAP 后，仅执行激活（不重新写入源码）。

**步骤**：

1. 打开要激活的 ABAP 对象文件（类、程序、接口等）
2. 按 `Ctrl+Shift+P`，输入「**SAP: 激活对象**」并执行
3. 扩展会从当前文件路径或内容解析对象名和类型
4. 若无法解析，会提示输入对象名和类型
5. 执行后查看成功/失败提示

**说明**：若系统无独立激活接口，会退化为「保存并激活」（将当前编辑器内容 PUT 到 SAP）。

---

## 5. abaplint 集成

**场景**：在保存前或按需对 ABAP 代码进行本地静态检查。

### 5.1 安装 abaplint

```bash
npm install -g abaplint
```

### 5.2 手动运行检查

**步骤**：

1. 打开 ABAP 文件
2. 按 `Ctrl+Shift+P`，输入「**SAP: 运行 abaplint 检查**」并执行
3. 检查结果会显示在 **Problems** 面板

### 5.3 保存时自动运行

**步骤**：

1. 按 `Ctrl+,` 打开设置
2. 搜索 `sapAdt.abaplint.runOnSave`
3. 勾选启用

启用后，每次保存 ABAP 文件时会自动运行 abaplint。

### 5.4 配置项

| 配置项 | 说明 | 默认值 |
|--------|------|--------|
| `sapAdt.abaplint.enabled` | 是否启用 abaplint 集成 | `true` |
| `sapAdt.abaplint.runOnSave` | 保存时是否自动运行 | `false` |

**说明**：abaplint 通常需要 abapGit 序列化格式的目录结构；若工作区结构不同，可能无输出。详见 `docs/sap-adt-abaplint.md`。

---

## 6. ABAP 源码对比（与 SAP 版本）

**场景**：把当前编辑器中的 ABAP 源码与 SAP 服务器上的版本做差异对比，看清版本差异、减少误判。

**步骤**：

1. 打开要对比的 ABAP 对象文件（程序、类、接口等）
2. 按 `Ctrl+Shift+Alt+D` 或执行「**SAP: 与 SAP 版本对比（源码差异）**」
3. 若无法从路径或首行解析对象名/类型，会提示输入对象名并选择类型
4. 扩展会从 ADT 拉取服务器端源码，并打开 VS Code 内置对比视图
5. 左侧为当前文件，右侧为 SAP 服务器版本，标题为「对象名 (当前 vs SAP 服务器)」

**说明**：需已连接环境；若对象在服务器上不存在或拉取失败，会提示错误。

---

## 命令速查

| 命令 | 快捷键 | 说明 |
|------|--------|------|
| SAP: 选择传输请求 | - | 选择传输请求供保存使用 |
| SAP: 列出传输请求 | - | 列出传输请求 |
| SAP: Fetch Object via ADT API | `Ctrl+Shift+Alt+F` | 拉取不支持的对象（含 DDLS） |
| SAP: 查找引用 (Where-Used) | - | 查找对象引用并跳转 |
| SAP: 激活对象 | - | 激活当前对象 |
| SAP: 运行 abaplint 检查 | - | 对当前 ABAP 文件运行 abaplint |
| SAP: 与 SAP 版本对比（源码差异） | `Ctrl+Shift+Alt+D` | 当前文件与 SAP 服务器版本对比 |
| SAP ADT: 连接环境 | `Ctrl+Shift+Alt+L` | 选择环境并登录 |
