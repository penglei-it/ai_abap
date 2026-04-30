# 开源 ADT 插件 / Tools / Skills 整合建议（面向本仓库）

本文件给出可直接在当前仓库落地的开源工具链方案，目标是：稳定、可验证、可排障。

## 已完成整合（本次已落地）

- 新增健康检查脚本：`scripts/sap-adt-healthcheck.ps1`
  - 检查 `erpl-adt` 可用性
  - 检查对象 `active` / `inactive` 可读性
  - 对类/接口执行锁获取与释放探测
  - 输出 `activeInactiveDifferent`，快速发现未激活残留
- 新增技能：`.cursor/skills/abap-oss-toolchain/SKILL.md`
  - 提供统一执行顺序：健康检查 -> 读写激活 -> sidefx 闭环
  - 明确“写后必须回读验证”的硬规则
- 修复脚本问题：`scripts/sap-adt-activate.ps1`
  - 修正 `erpl-adt` 可执行路径获取逻辑，避免调用未定义函数

## 推荐开源工具（优先级）

1. `erpl-adt`（已在用，核心）
   - 用途：ADT 读/写/激活/锁处理/运输
   - 价值：替代脆弱的手写 HTTP 调用，减少编码和 Header 细节问题

2. `abaplint`（建议启用）
   - 用途：静态质量检查、可在本地或 CI 执行
   - 价值：在推送前提前发现语法/风格/一致性问题

3. VS Code ABAP 生态（按需）
   - 用途：编辑体验、语法高亮、对象浏览
   - 价值：提升开发效率，但不替代“写后回读验证”

4. 终端 GUI 替代工具（已提供集成入口）
   - 用途：交互选择、配置处理、本地 CI、日志分析
   - 工具：`fzf` `gum` `jq` `yq` `delta` `bat` `act` `duckdb` `sqlite-utils`
   - 入口：`scripts/install-cli-tools.ps1`、`Justfile`、`docs/终端开源工具链扩展清单.md`

## 推荐执行命令

### 1) 连通与锁健康检查（先跑）

```powershell
.\scripts\sap-adt-healthcheck.ps1 `
  -ObjectName ZCL_DEMO `
  -ObjectType CLAS `
  -BaseUrl <BASE_URL> `
  -Username <USER> `
  -Password <PASS> `
  -Client <CLIENT>
```

### 2) sidefx 无害闭环（验证全流程能力）

```powershell
.\scripts\sap-adt-sidefx-class-cycle.ps1 `
  -ObjectName ZCL_DEMO `
  -Transport <TR> `
  -BaseUrl <BASE_URL> `
  -Username <USER> `
  -Password <PASS> `
  -Client <CLIENT> `
  -CleanupArtifacts
```

## 实战建议（避免反复踩坑）

- `CLAS` 的激活失败（403/423）优先判断 `SEOCLSENQ` 类锁，而不是先怀疑脚本。
- 遇到“写成功但激活失败”，务必同时回读：
  - `--version active`
  - `--version inactive`
- 如果 `inactive` 有改动、`active` 无改动，说明只是写入未激活；不要误判为已上线。
- 对外汇报成功前，必须给出回读证据（关键 marker/关键行存在性）。

## 可选：搬运开源 skills（不膨胀仓库）

为了避免把 1MB 级别的参考数据直接塞进 git，本仓库采用“技能落库 + 大文件按需下载”的方式整合了 `likweitan/abap-skills` 的两类高价值能力：

- `released-abap-classes`：ABAP Cloud / Released API 速查
- `sap-fiori-apps-reference`：Fiori Apps 列表检索 + FLP URL 生成

下载命令：

```powershell
.\scripts\fetch-abap-skills-assets.ps1
```

上游参考：[`likweitan/abap-skills`](https://github.com/likweitan/abap-skills)

