# Ai_Abap 项目导航

本仓库用于在 VS Code/Cursor 中进行 ABAP ADT 自动化开发、验证与排障，核心目标是：
- 可重复执行（脚本化）
- 可验证落地（写后回读）
- 可快速排障（锁/传输/编码/连接）

## 快速开始

1. 扩展与工具安装（含 Marketplace-only）

```powershell
.\scripts\install-vscode-extensions.ps1 -IncludeMarketplaceOnly
```

1.1 开源优先一键部署（推荐）

```powershell
.\scripts\oss-bootstrap.ps1
```

该命令会安装：
- ABAP FS（`murbani.vscode-abap-remote-fs`）
- 现有推荐扩展（含 Marketplace-only）
- `erpl-adt`（缺失时自动尝试安装）

1.2 开源增强组件（可选）

```powershell
.\scripts\install-oss-addons.ps1 -InstallMcpAbapAdt
.\scripts\check-oss-addons.ps1
```

1.2 安装 GUI 替代 CLI 工具（推荐）

```powershell
.\scripts\install-cli-tools.ps1
```

> 注意：`.vscode/settings.json` 中的 SAP 账号、密码应替换为你自己的登录信息。不要在仓库中提交真实凭证，建议使用 `<YOUR_SAP_USERNAME>` / `<YOUR_SAP_PASSWORD>` 占位符。

或使用 `just`：

```powershell
just tools-install
```

2. ADT 工具链健康检查

```powershell
.\scripts\sap-adt-healthcheck.ps1 `
  -ObjectName ZCL_DEMO `
  -ObjectType CLAS `
  -BaseUrl <BASE_URL> `
  -Username <USER> `
  -Password <PASS> `
  -Client <CLIENT>
```

3. 常用文档入口
- `docs/README.md`
- `docs/VSCode-ADT-全流程与踩坑手册.md`
- `docs/项目结构整理建议与约定.md`
- `docs/终端开源工具链扩展清单.md`

## 目录说明

- `abap/`：ABAP 源码与对象清单、补丁样本
- `scripts/`：ADT 自动化脚本（读/写/激活/批量推拉/健康检查/安装）
- `scripts/lib/`：共享库（`erpl-adt.ps1`）
- `docs/`：流程文档、排障手册、整合说明
- `.cursor/skills/`：项目级 AI skills 与参考资源
- `.vscode/`：工作区配置与扩展推荐

## 常用脚本入口

- 单对象：`sap-adt-read-object.ps1` / `sap-adt-write-object.ps1` / `sap-adt-activate.ps1`
- 检查测试：`sap-adt-check.ps1` / `sap-adt-test.ps1` / `sap-adt-atc.ps1`
- 包浏览：`sap-adt-package.ps1`
- DDIC/引用：`sap-adt-ddic.ps1` / `sap-adt-where-used.ps1`
- 批处理：`sap-adt-pull-from-manifest.ps1` / `sap-adt-push-objects.ps1` / `sap-adt-push-all.ps1`
- 验证：`sap-adt-healthcheck.ps1` / `sap-adt-sidefx-class-cycle.ps1`
- 本地闭环：`sap-adt-local-cycle.ps1`（本地编辑 + 写回激活 + 回读校验）
- 门禁：`sap-adt-ci-check.ps1`
- 统一入口：`sap-adt-run.ps1`
- 维护：`cleanup-project-temp.ps1` / `fetch-abap-skills-assets.ps1`

