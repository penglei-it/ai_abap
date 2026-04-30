# VS Code + ADT 通用流程与踩坑手册

**适用范围：** 任何使用 ADT 修改 SAP ABAP 对象（类、程序、接口等）的团队流程。
**文档目标：** 仅描述通用流程与排障方法，不包含业务细节与具体代码实现。

---

## 1. 基本原则

- 在本地 IDE（VS Code/Cursor）改 ABAP，本质是通过 ADT API 对 SAP 后端对象读写与激活。
- 只有“写回成功 + 激活成功 + 远端回读一致”才算真正完成。
- 本地文件不是最终事实，SAP 远端对象状态才是最终事实。

---

## 2. 环境基线检查

## 2.1 本地工具
- 操作系统可稳定访问 SAP 网络。
- 终端环境建议统一（例如 PowerShell 7+）。
- Python/CLI 工具版本在团队内统一，避免“我能跑你不能跑”。

## 2.2 SAP 侧前提
- ADT 服务可访问（通常是 `/sap/bc/adt`）。
- 账号具备对象修改、激活、传输请求写入权限。
- 目标对象当前未被其他会话/请求锁定。

## 2.3 流程规范
- 同一需求尽量使用同一传输请求。
- 每次变更都保留可复核记录（日志或报告）。

---

## 3. 标准执行流程（通用）

## 3.1 连接与只读验证
先做只读请求，验证：
- 能读取目标对象源码
- 返回内容完整
- 无认证/权限/网络错误

未通过时不要进入写入步骤，先排查连接问题。

## 3.2 变更前扫描
针对目标对象集合，先做自动化扫描：
- 是否有目标调用点
- 是否有注释代码需要恢复
- 是否已有守卫逻辑（避免重复添加）
- 是否存在潜在不稳定查询/匹配条件

## 3.3 本地修改
执行脚本化或人工修改时，要求：
- 变更规则可重复执行（幂等）
- 已满足条件的代码不重复改
- 注释恢复和守卫添加遵循统一模板

## 3.4 小批次写回
先单对象或小批次写回，不建议直接全量：
- 先验证链路可用
- 再扩大范围
- 每批次结束都记录成功/失败对象

## 3.5 激活
写回后执行激活，并记录结果：
- 成功对象列表
- 失败对象列表及错误码

## 3.6 远端回读闭环
激活后必须回读远端对象核对：
- 变更内容是否落地
- 注释代码是否已恢复（若属于改动目标）
- 守卫逻辑是否存在且不重复

---

## 4. 常见坑位与处理策略

## 4.1 锁冲突（典型：423）
**现象：** 写入或激活被拒绝，返回锁相关错误。
**处理：**
- 在传输管理中确认对象归属与锁持有者
- 释放冲突会话/任务
- 统一对象归属后重试

**补充（类对象常见）：**
- 若报错出现 `invalid lock handle`，通常是“方法级锁”与“类源码写入锁”不匹配。
- 使用类源码接口写入（`CLAS source/main`）时，需要类级锁；仅有方法条目锁可能仍会失败。
- 建议先在 SE24 获取类级编辑锁后再重试。
- 当前脚本已内置“CLAS 423 自动重试”策略：首次失败后会显式尝试类锁，再带会话重试写入。

## 4.2 版本兼容问题
**现象：** 脚本语法报错、同脚本在不同机器表现不一致。
**处理：**
- 固定团队运行时版本（终端、Python、CLI）
- 脚本避免使用低版本不支持语法
- CI 或预检先跑语法检查

## 4.3 本地与远端不一致
**现象：** 本地显示已修改，远端仍是旧代码。
**处理：**
- 以远端回读结果为准
- 重新确认写入/激活状态与错误码
- 排查锁、权限、请求归属

## 4.4 传输请求碎片化
**现象：** 同一需求分散在多个请求，易冲突且难追踪。
**处理：**
- 同需求尽量单请求
- 变更前先确认请求策略

## 4.5 一次性全量修改风险
**现象：** 问题定位困难，回滚和复盘成本高。
**处理：**
- 先小样本验证
- 分批推进
- 每批有清单与验收结果

---

## 5. 错误码通用速查

| 状态/现象 | 常见原因 | 建议处理 |
|---|---|---|
| 401 Unauthorized | 认证失败或会话失效 | 重新认证，核对账号参数 |
| 403 Forbidden | 权限不足 | 申请/核对对象与请求权限 |
| 404 Not Found | 对象不存在或路径不匹配 | 核对对象标识与 API 路径 |
| 405 Method Not Allowed | 系统不支持当前方法 | 改用兼容接口或降级方案 |
| 423 Locked | 对象锁冲突 | 释放锁并统一对象归属后重试 |
| 5xx Server Error | 服务端异常 | 缩小请求范围，必要时联系管理员 |
| 超时/连接失败 | 网络、VPN、端口问题 | 先做连通性与网络排查 |

---

## 6. AI/自动化执行最小输出模板

每轮执行后建议固定输出：
1. 读取对象总数 / 失败数
2. 目标规则命中数（改前）
3. 实际修改对象数（改后）
4. 写回成功/失败清单
5. 激活成功/失败清单（含错误码）
6. 远端回读一致性结果

---

## 7. 推荐实施节奏

1. 建立连接与权限基线
2. 先小批次试跑
3. 通过后分批扩展
4. 每批次都做回读验收
5. 全量完成后做一次总复核报告

---

## 8. 通用验收清单

- [ ] 目标对象均可读取
- [ ] 目标对象均已成功写回
- [ ] 目标对象均已成功激活
- [ ] 远端回读与预期一致
- [ ] 无新增冲突锁
- [ ] 变更记录可追踪、可复现

---

## 9. 安全与合规建议

- 连接凭据不要明文提交到共享仓库。
- 生产相关操作建议双人复核与审批。
- 以 SAP 远端状态与传输记录作为审计依据。

---

## 10. 可直接复制的命令模板（通用占位符版）

> 说明：以下命令以 PowerShell 为例，使用占位符参数，不绑定具体项目业务。

## 10.1 打开项目后的初始化

```powershell
cd <YOUR_PROJECT_ROOT>
```

```powershell
$BASE_URL = "http://<sap-host>:<port>"
$USER     = "<sap-user>"
$PASS     = "<sap-password>"
$CLIENT   = "<sap-client>"
$TR       = "<transport-id>"
$OBJ      = "<object-name>"
$TYPE     = "CLAS"
```

## 10.2 只读连通性验证（先读后写）

```powershell
.\scripts\sap-adt-read-object.ps1 `
  -ObjectName $OBJ `
  -ObjectType $TYPE `
  -BaseUrl $BASE_URL `
  -Username $USER `
  -Password $PASS `
  -Client $CLIENT `
  -AllowSelfSigned
```

## 10.3 先回读到本地快照（可选但推荐）

```powershell
.\scripts\sap-adt-read-object.ps1 `
  -ObjectName $OBJ `
  -ObjectType $TYPE `
  -BaseUrl $BASE_URL `
  -Username $USER `
  -Password $PASS `
  -Client $CLIENT `
  -AllowSelfSigned `
  -OutputFile ".\abap\$OBJ.before.abap"
```

## 10.4 写回对象（带传输请求）

```powershell
.\scripts\sap-adt-write-object.ps1 `
  -ObjectName $OBJ `
  -ObjectType $TYPE `
  -SourceFile ".\abap\$OBJ.clas.abap" `
  -Activate:$true `
  -BaseUrl $BASE_URL `
  -Username $USER `
  -Password $PASS `
  -Client $CLIENT `
  -Transport $TR
```

## 10.5 显式激活（推荐补跑一次）

```powershell
.\scripts\sap-adt-activate.ps1 `
  -ObjectName $OBJ `
  -ObjectType $TYPE `
  -SourceFile ".\abap\$OBJ.clas.abap" `
  -BaseUrl $BASE_URL `
  -Username $USER `
  -Password $PASS `
  -Client $CLIENT
```

## 10.6 激活后回读核验（闭环）

```powershell
.\scripts\sap-adt-read-object.ps1 `
  -ObjectName $OBJ `
  -ObjectType $TYPE `
  -BaseUrl $BASE_URL `
  -Username $USER `
  -Password $PASS `
  -Client $CLIENT `
  -AllowSelfSigned `
  -OutputFile ".\abap\$OBJ.after.abap"
```

```powershell
fc .\abap\$OBJ.clas.abap .\abap\$OBJ.after.abap
```

## 10.7 批量推送（单对象验证成功后再执行）

```powershell
.\scripts\sap-adt-push-objects.ps1 `
  -ManifestPath ".\abap\objects.manifest.json" `
  -AbapDir ".\abap" `
  -BaseUrl $BASE_URL `
  -Username $USER `
  -Password $PASS `
  -Client $CLIENT `
  -Transport $TR
```

## 10.8 快速故障分流（命令视角）

- `401/403`：先停止写入，回到只读命令验证账号与权限。
- `404`：核对 `$OBJ`、`$TYPE`、系统 ADT 路径能力。
- `423`：去传输管理解锁后再执行 10.4。
- `5xx`：先缩小到单对象重试，并保留原始错误输出。

---

## 11. 真实实例命令（SE24 类）

> 对象：`ZCL_DEMO`  
> 目标：给出“可直接复制执行”的真实命令行，按“取源 -> 改动 -> 回写 -> 回读”闭环执行。  
> 说明：当前脚本已升级为“写后强校验”，必须回读匹配才返回成功。

### 11.1 读取远端类源码到本地（UTF-8）

```powershell
cd C:\Ai_Abap

$BASE_URL = "http://<sap-host>:<port>"
$USER = "<sap-user>"
$PASS = "<sap-password>"
$CLIENT = "<sap-client>"

.\scripts\sap-adt-read-object.ps1 `
  -ObjectName 'ZCL_DEMO' `
  -ObjectType 'CLAS' `
  -BaseUrl $BASE_URL `
  -Username $USER `
  -Password $PASS `
  -Client $CLIENT `
  -OutputFile 'C:\Ai_Abap\abap\ZCL_DEMO.verifybase.abap'
```

### 11.2 本地最小改动（方法内现有注释增加探针）

```powershell
$f='C:\Ai_Abap\abap\ZCL_DEMO.verifybase.abap'
$txt=[System.IO.File]::ReadAllText($f,[System.Text.Encoding]::UTF8)

$old='    "校验店铺id不能为空'
$new='    "校验店铺id不能为空 PROBE_FINAL'

if($txt.Contains($new)){ $txt=$txt.Replace($new,$old) }
if(-not $txt.Contains($old)){ throw 'TARGET_COMMENT_NOT_FOUND' }

$txt=$txt.Replace($old,$new)
[System.IO.File]::WriteAllText($f,$txt,[System.Text.UTF8Encoding]::new($false))
```

### 11.3 写回并激活（带传输请求）

```powershell
$BASE_URL = "http://<sap-host>:<port>"
$USER = "<sap-user>"
$PASS = "<sap-password>"
$CLIENT = "<sap-client>"
$TR = "<transport-id>"

.\scripts\sap-adt-write-object.ps1 `
  -ObjectName 'ZCL_DEMO' `
  -ObjectType 'CLAS' `
  -SourceFile 'C:\Ai_Abap\abap\ZCL_DEMO.verifybase.abap' `
  -Activate:$true `
  -BaseUrl $BASE_URL `
  -Username $USER `
  -Password $PASS `
  -Client $CLIENT `
  -Transport $TR
```

### 11.4 回读核验

```powershell
$BASE_URL = "http://<sap-host>:<port>"
$USER = "<sap-user>"
$PASS = "<sap-password>"
$CLIENT = "<sap-client>"

.\scripts\sap-adt-read-object.ps1 `
  -ObjectName 'ZCL_DEMO' `
  -ObjectType 'CLAS' `
  -BaseUrl $BASE_URL `
  -Username $USER `
  -Password $PASS `
  -Client $CLIENT `
  -OutputFile 'C:\Ai_Abap\abap\ZCL_DEMO.verify.after.abap'

rg "PROBE_FINAL|校验店铺id不能为空" "C:\Ai_Abap\abap\ZCL_DEMO.verify.after.abap"
```

### 11.5 诊断命令（Verbose 直写）

```powershell
$BASE_URL = "http://<sap-host>:<port>"
$USER = "<sap-user>"
$PASS = "<sap-password>"
$CLIENT = "<sap-client>"
$TR = "<transport-id>"
$u = [uri]$BASE_URL
$env:SAP_PASSWORD = $PASS
$erpl = (Get-ChildItem "$env:LOCALAPPDATA\Python" -Filter 'erpl-adt.exe' -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1).FullName

& $erpl -vv --host $u.Host --port $u.Port --user $USER --client $CLIENT `
  source write '/sap/bc/adt/oo/classes/ZCL_DEMO/source/main' `
  --file 'C:\Ai_Abap\abap\ZCL_DEMO.verifybase.abap' `
  --transport $TR --activate
```

### 11.6 当前验收口径（务必遵循）

- 仅看到 `Written (erpl-adt)` 不算成功。
- `sap-adt-write-object.ps1` 现在会执行“写后回读强校验”；若内容不一致会直接失败退出。
- 最终必须满足：回读文件中可检索到预期改动（如 `PROBE_FINAL`）才算真实落地。
