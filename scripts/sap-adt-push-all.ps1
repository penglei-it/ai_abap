<#
.SYNOPSIS
    按 abap\objects.manifest.json 将本地对象（报表+类）推送到 SAP 并激活。
.DESCRIPTION
    连接信息从 docs\sap-connection-ct-dv2.json 读取。与 sap-adt-pull-from-manifest.ps1 配对使用：
    拉取 -> 本地编辑 -> 本脚本推送并激活。报表与类均支持。
#>
param(
    [string]$ConnectionProfile = "CT-DV2",
    [string]$ManifestPath = "",
    [string]$AbapDir = "",
    [string]$Transport = ""
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjectRoot = Split-Path -Parent $scriptDir
$connFile = Join-Path $ProjectRoot "docs\sap-connection-ct-dv2.json"
if (-not (Test-Path -LiteralPath $connFile)) {
    Write-Error "Not found: docs\sap-connection-ct-dv2.json"
    exit 1
}
$json = Get-Content $connFile -Raw | ConvertFrom-Json
$c = $json.'abapfs.remote'.$ConnectionProfile
if (-not $c -or -not $c.url) {
    Write-Error "Missing abapfs.remote.$ConnectionProfile"
    exit 1
}
if (-not $ManifestPath) { $ManifestPath = Join-Path $ProjectRoot "abap\objects.manifest.json" }
if (-not $AbapDir) { $AbapDir = Join-Path $ProjectRoot "abap" }

& (Join-Path $scriptDir "sap-adt-push-objects.ps1") `
    -ManifestPath $ManifestPath `
    -AbapDir $AbapDir `
    -BaseUrl $c.url `
    -Username $c.username `
    -Password $c.password `
    -Client $c.client `
    -Transport $Transport
