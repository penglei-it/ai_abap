<#
.SYNOPSIS
    Pull class source to local abap file.
.DESCRIPTION
    Reads connection from docs\sap-connection-ct-dv2.json, calls sap-adt-read-object.ps1.
    Requires VPN/network to SAP. Only overwrites file when response looks like full class source.
#>
param(
    [string]$ObjectName = "ZCL_DEMO",
    [string]$ConnectionProfile = "CT-DV2",
    [string]$OutputFile = ""
)

$ErrorActionPreference = "Stop"
$ProjectRoot = Split-Path -Parent $PSScriptRoot
if (-not (Test-Path "$ProjectRoot\docs\sap-connection-ct-dv2.json")) {
    Write-Error "Not found: docs\sap-connection-ct-dv2.json"
    exit 1
}
$json = Get-Content "$ProjectRoot\docs\sap-connection-ct-dv2.json" -Raw | ConvertFrom-Json
$c = $json.'abapfs.remote'.$ConnectionProfile
if (-not $c -or -not $c.url) {
    Write-Error "Missing abapfs.remote.$ConnectionProfile.url"
    exit 1
}
$outDir = "$ProjectRoot\abap"
if (-not (Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir -Force | Out-Null }
if (-not $OutputFile) { $OutputFile = "$outDir\$ObjectName.clas.abap" }
Write-Host "Pulling $ObjectName from $($c.url) ..." -ForegroundColor Cyan

$scriptParams = @{
    ObjectName = $ObjectName
    ObjectType  = 'CLAS'
    BaseUrl     = $c.url
    Username    = $c.username
    Password    = $c.password
    Client      = $c.client
    TimeoutSec  = 45
    RetryCount  = 2
}
if ($c.allowSelfSigned) { $scriptParams['AllowSelfSigned'] = $true }
$content = $null
try {
    $content = & "$ProjectRoot\scripts\sap-adt-read-object.ps1" @scriptParams
} catch {
    Write-Host "Pull failed: $_" -ForegroundColor Red
    Write-Host "File NOT modified." -ForegroundColor Yellow
    exit 1
}

$validClassSig = $false
if (-not [string]::IsNullOrWhiteSpace($content)) {
    $validClassSig = [regex]::IsMatch(
        $content,
        ('CLASS\s+' + [regex]::Escape($ObjectName) + '\s+DEFINITION'),
        [System.Text.RegularExpressions.RegexOptions]::IgnoreCase
    )
}
$valid = -not [string]::IsNullOrWhiteSpace($content) -and $content.Length -gt 10000 -and $validClassSig
if (-not $valid) {
    Write-Host "Response invalid (too short or not class source). File NOT overwritten." -ForegroundColor Yellow
    exit 1
}
[System.IO.File]::WriteAllText($OutputFile, $content, [System.Text.UTF8Encoding]::new($false))
Write-Host "Saved: $OutputFile" -ForegroundColor Green
