# Scripts 目录说明

## 核心 ADT 脚本

> 请先在 `.vscode/settings.json` 中填写你的 SAP 连接信息。用户名和密码必须替换为你自己的登录凭证，不要将真实账号密码写入仓库。

- `sap-adt-read-object.ps1`：读取对象源码
- `sap-adt-write-object.ps1`：写回对象源码（支持 activate）
- `sap-adt-activate.ps1`：激活对象
- `sap-adt-search-objects.ps1`：对象检索
- `sap-adt-check.ps1`：语法检查（不写入）
- `sap-adt-test.ps1`：运行 ABAP Unit
- `sap-adt-atc.ps1`：运行 ATC 检查
- `sap-adt-package.ps1`：浏览包内容（exists/list/tree）
- `sap-adt-ddic.ps1`：读取 DDIC 表/CDS 定义
- `sap-adt-where-used.ps1`：where-used 候选查询（搜索兜底）
- `sap-adt-transport.ps1`：传输相关操作（list/create/release）

## 批量作业

- `sap-adt-pull-from-manifest.ps1`：按 manifest 拉取
- `sap-adt-push-objects.ps1`：按 manifest 推送
- `sap-adt-push-all.ps1`：面向项目的一键推送入口
- `sap-adt-local-cycle.ps1`：本地编辑闭环（拉取/准备work/写回激活/回读校验）

## 验证与诊断

- `sap-adt-healthcheck.ps1`：连通、读写、锁、active/inactive 漂移检查
- `sap-adt-sidefx-class-cycle.ps1`：无害改动闭环（写入/激活/回读/回滚）
- `sap-adt-ci-check.ps1`：CI 质量门禁（healthcheck/check/ATC/test）
- `sap-adt-demo-e2e.ps1`：多对象 Demo 全场景验证（CLAS/PROG/INTF/FUGR，单 TR 复用，写入激活+回读比对+检查）
- `sap-adt-cleanup-demos.ps1`：批量清理历史 demo 对象（先预览，后执行删除）
- `abapfs-healthcheck.ps1`：ABAP FS 扩展安装健康检查
- `sap-connect-diagnose.ps1`：连接诊断

### 全场景验收（推荐）

```powershell
.\scripts\sap-adt-demo-e2e.ps1 -UseTransport
```

说明：
- 默认只创建 1 个 transport request，并在所有 demo 对象复用。
- 对 `HTTP 423`（短时锁冲突）自动重试，默认 `-RetryCount 2 -RetryDelaySec 1`。
- `FUGR` 当前验证范围是“创建+检索+where-used”。
- 已整合 `FM` 场景（默认 `RFC_READ_TABLE`）：read/syntax/ATC/search/where-used 全流程验证。
- 当前 `erpl-adt object create` 尚不支持 `FUNC/F` 创建；脚本会自动做 capability probe 并在汇总中给出说明。
- 可加 `-CleanupRemoteCreatedObjects`，自动删除“本轮刚创建”的 demo 远端对象。
- 可加 `-RunAbapUnit` 把 ABAP Unit 纳入同一汇总列。

批量清理历史 demo：

```powershell
# 仅预览（不删除）
.\scripts\sap-adt-cleanup-demos.ps1

# 按请求号执行删除（推荐，安全）
.\scripts\sap-adt-cleanup-demos.ps1 -Execute -Transport DV2K925314
```

安全说明：
- `-Execute` 默认**必须**传 `-Transport`，否则脚本拒绝执行。
- 仅匹配严格 demo 命名：`ZCL/ZIF/ZDEMO/ZFG + _DEMO_E2E_ + 10位时间戳`。
- 如确实要无请求号删除，需显式传 `-AllowExecuteWithoutTransport`（不推荐）。

## 方案A：本地文件闭环（替代 adt:// 编辑）

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

执行后编辑 `.\abap\ZCL_DEMO.work.abap`，再执行：

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

## 安装与资源

- `install-vscode-extensions.ps1`：安装推荐扩展（可选 Marketplace-only）
- `install-marketplace-vsix.ps1`：从 VS Marketplace 拉 VSIX 并安装
- `fetch-abap-skills-assets.ps1`：下载 skills 参考大文件
- `install-oss-addons.ps1`：安装开源 GUI 替代增强组件（含 mcp-abap-adt）
- `check-oss-addons.ps1`：检查开源增强组件状态

## 维护脚本

- `cleanup-project-temp.ps1`：清理临时文件与验证快照
- `sap-adt-run.ps1`：统一入口（check/test/atc/package/ddic/where-used/transport/healthcheck）

## 命令编排（just，开源）

在仓库根目录执行：

```powershell
just --list
```

常用任务：

```powershell
just prepare ZCL_DEMO CLAS http://<sap-host>:<port> <user> <pass> 200
just cycle ZCL_DEMO CLAS http://<sap-host>:<port> <user> <pass> 200 <TR>
just lint
just secrets
```

### 示例

```powershell
.\scripts\cleanup-project-temp.ps1 -WhatIf
.\scripts\cleanup-project-temp.ps1 -IncludeAbapSnapshots
```

