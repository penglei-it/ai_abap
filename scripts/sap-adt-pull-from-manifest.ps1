<#
.SYNOPSIS
    按 manifest 从 SAP 拉取对象源码到 abap\ 目录，便于本地编辑、再推送激活。
.DESCRIPTION
    与 sap-adt-push-objects.ps1 对应：拉取（pull）vs 推送（push）。
    连接信息从 docs\sap-connection-ct-dv2.json 的 abapfs.remote.CT-DV2 读取。
    需能访问 SAP（VPN/内网）。拉取后可在 abap\ 中直接编辑类/报表，再用 push 写回并激活。
.PARAMETER ManifestPath
    manifest JSON 路径，默认 abap\objects.manifest.json
.PARAMETER AbapDir
    保存目录，默认 abap\
#>
param(
    [string]$ManifestPath = "",
    [string]$AbapDir = "",
    [string]$ConnectionProfile = "CT-DV2"
)

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjectRoot = Split-Path -Parent $scriptDir
if (-not $AbapDir) { $AbapDir = Join-Path $ProjectRoot "abap" }
$AbapDir = $AbapDir.TrimEnd('\', '/')
if (-not $ManifestPath) { $ManifestPath = Join-Path $AbapDir "objects.manifest.json" }

$connFile = Join-Path $ProjectRoot "docs\sap-connection-ct-dv2.json"
if (-not (Test-Path -LiteralPath $connFile)) {
    Write-Error "Not found: docs\sap-connection-ct-dv2.json"
    exit 1
}
$json = Get-Content $connFile -Raw | ConvertFrom-Json
$c = $json.'abapfs.remote'.$ConnectionProfile
if (-not $c -or -not $c.url) {
    Write-Error "Missing abapfs.remote.$ConnectionProfile in docs\sap-connection-ct-dv2.json"
    exit 1
}

if (-not (Test-Path -LiteralPath $ManifestPath)) {
    Write-Error "Manifest not found: $ManifestPath"
    exit 1
}
$items = Get-Content -LiteralPath $ManifestPath -Raw | ConvertFrom-Json
if (-not $items) { Write-Error "Empty manifest"; exit 1 }

if (-not (Test-Path $AbapDir)) { New-Item -ItemType Directory -Path $AbapDir -Force | Out-Null }

$readScript = Join-Path $scriptDir "sap-adt-read-object.ps1"
$connArgs = @{ BaseUrl = $c.url; Username = $c.username; Password = $c.password; Client = $c.client }
$pulled = 0
$failed = @()

foreach ($it in $items) {
    $name = ""
    if ($null -ne $it.name) { $name = [string]$it.name }
    $name = $name.Trim()

    $type = "PROG"
    if ($null -ne $it.type -and ([string]$it.type).Trim()) { $type = ([string]$it.type).Trim() }
    $type = $type.ToUpper()

    $file = ""
    if ($null -ne $it.file) { $file = [string]$it.file }
    $file = $file.Trim()

    $isInclude = $false
    if ($null -ne $it.isInclude) { $isInclude = [bool]$it.isInclude }

    if (-not $name -or -not $file) {
        $failed += "Invalid item (missing name/file)"
        continue
    }
    $outFile = Join-Path $AbapDir $file
    Write-Host "Pull $name ($type) -> $file" -ForegroundColor Cyan
    try {
        $content = & $readScript -ObjectName $name -ObjectType $type -IsInclude:$isInclude @connArgs 2>&1
        if ($LASTEXITCODE -ne 0) {
            $failed += "$name : $content"
            continue
        }
        [System.IO.File]::WriteAllText($outFile, $content, [System.Text.UTF8Encoding]::new($false))
        $pulled++
    } catch {
        $failed += "$name : $_"
    }
}

Write-Host "---"
if ($failed.Count -gt 0) {
    Write-Host ("Failed: " + $failed.Count) -ForegroundColor Red
    $failed | ForEach-Object { Write-Host $_ -ForegroundColor Red }
}
Write-Host ("Pulled: " + $pulled + " / " + $items.Count) -ForegroundColor Green
if ($pulled -lt $items.Count) { exit 1 }
