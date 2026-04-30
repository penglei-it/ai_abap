# SAP 连接辅助脚本
# 1. 禁用冲突扩展 2. 提示使用快捷键连接

Write-Host "`n=== SAP 连接修复 ===" -ForegroundColor Cyan

# 禁用可能冲突的扩展
if (Get-Command cursor -ErrorAction SilentlyContinue) {
    Write-Host "禁用冲突扩展 useromega3098.vscode-abap-remote-fs ..." -ForegroundColor Yellow
    cursor --disable-extension useromega3098.vscode-abap-remote-fs 2>$null
    Write-Host "  完成" -ForegroundColor Green
}

Write-Host "`n已添加快捷键: Ctrl+Shift+Alt+S" -ForegroundColor Green
Write-Host "  在 Cursor 中按此组合键可直接触发连接" -ForegroundColor Gray
Write-Host "`n请重启 Cursor 后:" -ForegroundColor Yellow
Write-Host "  1. 按 Ctrl+Shift+Alt+S 连接 SAP" -ForegroundColor White
Write-Host "  2. 或 Ctrl+Shift+P 输入 'Connect to an ABAP'" -ForegroundColor White
Write-Host "  3. 选择环境，输入用户名和密码" -ForegroundColor White
Write-Host ""
