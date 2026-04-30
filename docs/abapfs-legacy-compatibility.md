# ABAP FS 旧系统兼容（abapfs_extensions）

当 SAP 系统较老（例如低于常见新版本基线）且出现“可读但写入/锁会话不稳定”时，可评估安装开源后端增强：

- 项目：[`marcellourbani/abapfs_extensions`](https://github.com/marcellourbani/abapfs_extensions)

## 适用场景

- ABAP FS 连接正常，但写入阶段经常出现锁会话异常
- 同样操作在新系统正常、老系统异常
- ADT 服务已开通，但 stateful session 行为不一致

## 建议流程

1. 先跑本仓库检查：
   - `scripts/sap-adt-healthcheck.ps1`
   - `scripts/sap-adt-sidefx-class-cycle.ps1`
2. 如果问题只出现在老系统，再评估导入 `abapfs_extensions`
3. 导入后重复执行上述脚本，确认改善

## 风险提示

- 该增强属于系统侧改动，必须走正式传输与变更审批流程
- 在生产系统导入前，先在开发/测试系统验证

