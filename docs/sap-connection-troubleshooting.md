# SAP ADT 连接优化与排查

当拉取 ZCL_ICEC_ORDER 等对象失败（如「无法连接到远程服务器」）时，可按下面步骤优化和排查。

---

## 1. 问题关键

- **直接原因**：脚本连不上 SAP 系统（`docs\sap-connection-ct-dv2.json` 中的 `url`），导致拉取失败，本地 `abap\ZCL_ICEC_ORDER.clas.abap` 无法被写入完整类源码。
- **结果**：助手无法在本地类文件上直接加注释或改代码，只能提供补丁供在 ADT 中粘贴。

---

## 2. 已做的脚本优化

| 优化项 | 说明 |
|--------|------|
| **超时** | 默认由 15 秒改为 30 秒（`sap-adt-read-object.ps1`），拉取脚本传 45 秒，减少慢网络超时。 |
| **重试** | 每个 ADT 路径失败后自动重试 2 次、间隔 2 秒，应对短暂网络抖动。 |
| **自签名证书** | 配置中 `allowSelfSigned: true` 时，拉取会传 `-AllowSelfSigned`；PowerShell 5.x 下会临时信任自签名证书，避免 TLS 报错。 |
| **不覆盖** | 拉取脚本仅在返回内容像完整类源码时才写入文件，连接失败不会用错误输出覆盖本地文件。 |

配置示例（`docs\sap-connection-ct-dv2.json`）：

```json
"CT-DV2": {
  "url": "https://192.168.71.50:44301",
  "username": "...",
  "password": "...",
  "client": "200",
  "allowSelfSigned": true
}
```

---

## 3. 连接失败时排查清单

1. **网络与 VPN**
   - 本机能否访问 `url` 中的主机（如 `192.168.71.50`）？可在命令行执行：`ping 192.168.71.50`
   - 若 SAP 在内网，是否已连 VPN 或内网？

2. **端口**
   - 端口是否与 URL 一致（如 `44301`）？可尝试：`Test-NetConnection -ComputerName 192.168.71.50 -Port 44301`（PowerShell）

3. **URL 格式**
   - 使用 `https://`，不要带路径或尾斜杠，例如：`https://192.168.71.50:44301`

4. **防火墙**
   - 本机或公司防火墙是否放行到该主机端口的出站访问？

5. **SAP 服务**
   - 目标系统上 ADT/HTTP 服务是否已启动、端口是否监听？

---

## 4. 无需连接也能「直接改类」的办法

若一段时间内无法稳定连接 SAP，可**一次性**从 ADT 拿到完整类，之后即可在本地由助手直接改：

- 在 **ADT** 中打开 **System Library → ZICERP01 → 类 → ZCL_ICEC_ORDER**，打开 `ZCL_ICEC_ORDER.clas.abap`，全选复制。
- 在本地用该内容**完整覆盖** `abap\ZCL_ICEC_ORDER.clas.abap` 并保存。

完成后，助手即可在 `abap\ZCL_ICEC_ORDER.clas.abap` 上直接加注释、应用补丁，无需再在 ADT 里手工粘贴。
