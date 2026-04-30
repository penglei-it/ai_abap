# SAP 传输请求创建与选择指南

保存可传输对象（如 SAPMZICERP_0001）时出现 "Error: Transport required"，需先创建或选择传输请求。

---

## 方式一：在连接配置中自动创建（已配置）

已在 `settings.json` 的 CT-DV2 连接中添加：

```json
"transportRequest": {
  "type": "new",
  "description": "ABAP FS development"
}
```

保存时若仍提示需传输，请尝试**重新连接** SAP（`Ctrl+Alt+A` 断开后重连）。

---

## 方式二：通过 Connection Manager 配置

1. 按 **`Ctrl+Shift+P`** → 输入 **`ABAP FS: Connection Manager`**
2. 选择 **CT-DV2** → 编辑
3. 在传输相关选项中：
   - 选择 **新建传输** 或 **使用现有传输**
   - 新建：填写描述（如 "ABAP FS development"）
   - 现有：填写传输号（如 `DV2K9123456`）

---

## 方式三：在 SAP GUI 中创建传输

1. 打开 **SAP GUI**，执行事务码 **SE09** 或 **SE10**
2. 选择 **创建**（或 Create）
3. 选择 **工作台请求**（Workbench Request）
4. 填写：
   - **简短描述**：如 "SAPMZICERP_0001 修改"
   - **目标**：选择目标系统（如 DV2）
5. 保存后记下传输号（格式如 `DV2K9xxxxxx`）
6. 在 Cursor 中：Connection Manager → 编辑 CT-DV2 → 选择「使用现有传输」→ 填入该传输号

---

## 方式四：Transports 视图

1. 左侧活动栏 → **ABAP FS** → **Transports**
2. 展开 **CT-DV2**，查看已有传输列表
3. 若有未释放的传输，可直接使用
4. 若需新建：在 SAP GUI 中创建（见方式三），再在 Transports 视图中点击 **Refresh** 刷新

---

## 方式五：保存时弹出的选择框

部分情况下，保存时会弹出传输请求选择框：

- 选择已有传输，或
- 点击 **Create** / **新建** 创建新传输

若未弹出，请检查 Connection Manager 或 `settings.json` 中的传输配置。
