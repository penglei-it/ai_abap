## 目标

在 Windows + Cursor/VS Code 下，把 ABAP/ADT 自动化（脚本 + `erpl-adt`）配套的编辑器能力补齐，并做到“能自动装的自动装，装不了的给离线方案”。

## 已支持一键安装（Cursor 可直接装）

运行：

```powershell
.\scripts\install-vscode-extensions.ps1
```

会安装：
- `larshp.vscode-abaplint`（ABAP lint + 跳转/引用，建议开启）
- `bruno.bruno`（开源 API 调试与用例集合，支持入库）
- `ms-vscode.PowerShell`（本仓库脚本大量是 PowerShell）
- `redhat.vscode-yaml`（配置文件体验）
- `humao.rest-client`（排查 ADT REST、快速发请求）
- `eamodio.gitlens`（git 历史/对比）
- `EditorConfig.EditorConfig`（格式一致性）

## 需要额外安装（Marketplace-only / Cursor 可能搜不到）

一些 SAP 官方扩展通常只发布在 VS Code Marketplace，未必同步到 Open VSX，因此在 Cursor 里可能无法通过 `code --install-extension` 安装。

### 1) SAP Fiori tools - Extension Pack

- Marketplace：`https://marketplace.visualstudio.com/items?itemName=sapse.sap-ux-fiori-tools-extension-pack`
- 用途：Fiori elements、Service Modeler、Guided Development、XML annotation、UI5 language assistant 等

安装方式（通用）：
- 在 VS Code 中从 Marketplace 安装；或
- 下载 `.vsix` 后使用 “Extensions: Install from VSIX...” 安装（Cursor/VS Code 均支持）

### 2) Connection Manager for SAP Systems（若你需要 SAP UX 系列工具）

- 这类扩展常用于 SAP UX/Fiori 工具链的系统连接管理。
- 若 Cursor 搜不到，请用 VSIX 离线安装流程。

## 关于 “ABAP Development Tools for VS Code”

SAP 官方的 “ABAP Development Tools for VS Code” 预计在 2026 年 Q2 附近发布，并且早期主要聚焦 ABAP Cloud / RAP 流程，功能会逐步追平 Eclipse ADT。

参考：
- SAP Community：`https://community.sap.com/t5/technology-blog-posts-by-sap/abap-development-tools-for-vs-code-everything-you-need-to-know/bc-p/14361281/highlight/true`

## 兼容性提醒（ADT 虚拟工作区）

- 当前若工作区根是 `adt://...`，部分语言服务仅支持 `file://`，可能初始化失败。
- 建议 ABAP 对象按“本地文件闭环”处理：先拉取到 `abap/*.work.abap`，再回写激活与回读校验。

