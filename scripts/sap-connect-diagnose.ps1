# SAP 连接诊断脚本
param(
    [string]$BaseUrl = ""
)

Write-Host ""
Write-Host "=== SAP 连接诊断 ===" -ForegroundColor Cyan

Write-Host ""
Write-Host "[1] 已安装的 ABAP 相关扩展:" -ForegroundColor Yellow
$found = $false
if (Get-Command cursor -ErrorAction SilentlyContinue) {
    cursor --list-extensions 2>$null | Select-String -Pattern "abap|murbani"
    if ($LASTEXITCODE -eq 0) { $found = $true }
}
if (-not $found -and (Get-Command code -ErrorAction SilentlyContinue)) {
    code --list-extensions 2>$null | Select-String -Pattern "abap|murbani"
}

Write-Host ""
Write-Host "[2] SAP/ABAP 配置:" -ForegroundColor Yellow
$settingsPath = Join-Path $env:APPDATA "Cursor\User\settings.json"
$cfg = Get-Content $settingsPath -Raw -ErrorAction SilentlyContinue
if ($cfg -and ($cfg -match "abapfs\.remote")) {
    Write-Host "  abapfs.remote 已配置" -ForegroundColor Green
} else {
    Write-Host "  未找到 abapfs.remote" -ForegroundColor Gray
}
if ($cfg -and ($cfg -match "sapAdt\.environments")) {
    Write-Host "  sapAdt.environments 已配置" -ForegroundColor Green
} else {
    Write-Host "  未找到 sapAdt.environments" -ForegroundColor Gray
}

Write-Host ""
Write-Host "[3] SAP 服务连通性:" -ForegroundColor Yellow
if ($BaseUrl) {
    $testUri = ($BaseUrl.TrimEnd('/')) + "/sap/bc/adt"
    try {
        $params = @{
            Uri = $testUri
            Method = "GET"
            TimeoutSec = 5
            UseBasicParsing = $true
        }
        if ($PSVersionTable.PSVersion.Major -ge 6) { $params["SkipCertificateCheck"] = $true }
        $resp = Invoke-WebRequest @params
        Write-Host ("  可访问 " + $testUri + " (状态: " + $resp.StatusCode + ")") -ForegroundColor Green
    } catch {
        Write-Host ("  无法连接 " + $testUri + " : " + $_.Exception.Message) -ForegroundColor Red
    }
} else {
    Write-Host "  跳过（传入 -BaseUrl 可测试）" -ForegroundColor Gray
}

Write-Host ""
Write-Host "=== 手动连接步骤 ===" -ForegroundColor Cyan
Write-Host "1. 按 Ctrl+Shift+P 打开命令面板" -ForegroundColor White
Write-Host "2. 输入: Connect to an ABAP" -ForegroundColor White
Write-Host "3. 若仍无结果，输入: Developer: Show Running Extensions" -ForegroundColor White
Write-Host ""
