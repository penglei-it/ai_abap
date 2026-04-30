# 开源 GUI 替代增强整合清单

目标：在 Cursor/VS Code 中尽可能替代 SAP GUI 的日常开发操作。

## 已可本地落地（已整合）

1. **ABAP FS（VS Code 扩展）**
   - 扩展：`murbani.vscode-abap-remote-fs`
   - 覆盖场景：对象浏览、搜索、运行事务、单测/ATC、数据查询（依系统能力）

2. **erpl-adt（CLI + MCP）**
   - 覆盖场景：读写激活、锁、传输、语法检查、ATC、ABAP Unit、包浏览、DDIC/CDS

3. **mcp-abap-adt（客户端侧）**
   - 作用：给 MCP 客户端提供更丰富的 ADT 工具面（依客户端配置）
   - 安装脚本：`scripts/install-oss-addons.ps1 -InstallMcpAbapAdt`

## 需要 SAP 侧安装（无法仅本地安装）

1. **abap-db-browser**
   - 仓库：`DevEpos/abap-db-browser`
   - 价值：替代部分 SE16/SE11 查询场景
   - 落地方式：通过 abapGit 导入 SAP 系统

2. **abap-search-tools / abap-code-search-tools（DevEpos）**
   - 价值：增强 where-used、代码搜索、影响分析
   - 落地方式：导入 ABAP 后端并配置索引作业

## 本仓库新增脚本

- `scripts/install-oss-addons.ps1`
  - 安装 mcp-abap-adt（可选）
  - 生成 MCP 配置模板：`docs/mcp-abap-adt-config.example.json`

- `scripts/check-oss-addons.ps1`
  - 检查扩展与 CLI 就绪状态

## 执行命令

```powershell
.\scripts\install-oss-addons.ps1 -InstallMcpAbapAdt
.\scripts\check-oss-addons.ps1
```

## 验收标准（建议）

- 扩展状态全为 OK（ABAP FS、abaplint、Fiori tools、SAP systems manager）
- CLI 状态：`erpl-adt`、`npm`、`npx` 为 OK
- 关键链路可跑：`sap-adt-ci-check.ps1` 成功

