# ABAP 对象（报表 + 类）本地编辑与 ADT 同步

报表（PROG/INCLUDE）与类（CLAS）均可拉取到本地、直接编辑、再推送回 SAP 并激活，与 ADT 一致。

## 让助手直接改类文件（无需您参与）

若希望 Cursor 助手**直接修改** `ZCL_ICEC_ORDER.clas.abap`（加注释、应用补丁等），该文件必须是**完整类源码**（约 1.2 万行），不能是拉取失败时的错误输出。请**仅需做一次**：

- **能连 SAP 时**：在项目根执行 `.\scripts\sap-pull-ZCL_ICEC_ORDER.ps1`，成功后会写入完整类。
- **或**：从 ADT System Library 中复制 `ZCL_ICEC_ORDER` 完整源码，保存到 `abap\ZCL_ICEC_ORDER.clas.abap`。

完成后，之后所有对该类的修改都可交给助手在本地文件上直接完成，无需您再参与。

## 对象清单（objects.manifest.json）

| 类型   | 名称             | 本地文件                  | 说明           |
|--------|------------------|---------------------------|----------------|
| PROG   | ZTMP_TOP         | ztmp_top.inc.abap         | INCLUDE        |
| PROG   | ZTMP_F01         | ztmp_f01.inc.abap         | INCLUDE        |
| PROG   | ZTMP             | ztmp.prog.abap            | 可执行程序     |
| CLAS   | ZCL_ICEC_ORDER   | ZCL_ICEC_ORDER.clas.abap  | 类（完整源码） |

新增类或报表时：在 `abap/objects.manifest.json` 中增加一行，并执行一次**拉取**得到本地文件。

## 统一流程：拉取 → 编辑 → 推送激活

连接信息从 `docs/sap-connection-ct-dv2.json` 的 `abapfs.remote.CT-DV2` 读取。需能访问 SAP（VPN/内网）。

### 1. 拉取（从 SAP 到本地）

```powershell
cd C:\Ai_Abap
.\scripts\sap-adt-pull-from-manifest.ps1
```

- 按 `abap/objects.manifest.json` 从 SAP 读取每个对象，保存到 `abap/<file>`。
- 报表与类都会拉取，类为单文件 `ZCL_ICEC_ORDER.clas.abap`。

### 2. 本地编辑与查看

- 在 Cursor/VS Code 中直接打开、编辑 `abap/*.abap`。
- 类方法、报表逻辑修改与在 ADT 中编辑等价。

### 3. 推送并激活（从本地到 SAP）

```powershell
cd C:\Ai_Abap
.\scripts\sap-adt-push-all.ps1
```

- 按 `abap/objects.manifest.json` 将每个对象的本地文件写回 SAP 并激活。
- **报表和类都会执行写入与激活**，无需区分。

## 仅推送 ZTMP（可选）

若只想推送报表 ZTMP 及 INCLUDE，可使用原有 manifest：

```powershell
.\scripts\sap-adt-push-objects.ps1 -ManifestPath abap\ztmp.manifest.json -BaseUrl "..." -Username "..." -Password "..." -Client "200"
```

## 前置条件

- `docs/sap-connection-ct-dv2.json` 中已配置 `abapfs.remote.CT-DV2`（url、username、password、client）。
- 能访问对应 SAP 系统（网络/VPN）。
- 报表 ZTMP 依赖表 `ztint_market_req`；类 ZCL_ICEC_ORDER 依赖现有包与依赖项。

## 小结

| 操作     | 命令 / 说明                                      |
|----------|---------------------------------------------------|
| 拉取全部 | `.\scripts\sap-adt-pull-from-manifest.ps1`        |
| 推送全部 | `.\scripts\sap-adt-push-all.ps1`                 |
| 编辑     | 直接改 `abap\*.abap`，类与报表一致               |
| 激活     | 由 `sap-adt-push-all.ps1` 在推送时一并执行激活   |

这样**所有类与报表都可以在本地直接编辑、查看、修改，并通过 ADT 推送激活**。
