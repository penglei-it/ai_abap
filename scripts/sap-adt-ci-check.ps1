<#
.SYNOPSIS
  开源优先 CI 质量门禁：healthcheck + syntax check + ATC + ABAP Unit。
#>
param(
  [Parameter(Mandatory = $true)][string]$ObjectName,
  [string]$ObjectType = "CLAS",
  [string]$AtcVariant = "DEFAULT",
  [switch]$SkipTest,
  [switch]$IgnoreLock403Editing,
  [string]$BaseUrl = "",
  [string]$Username = "",
  [string]$Password = "",
  [string]$Client = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

function Invoke-Step([string]$Name, [scriptblock]$Block) {
  Write-Host ("== " + $Name + " ==")
  & $Block
  if ($LASTEXITCODE -ne 0) { throw ("Step failed: " + $Name) }
}

$common = @{
  BaseUrl = $BaseUrl
  Username = $Username
  Password = $Password
  Client = $Client
}

Invoke-Step "healthcheck" {
  & (Join-Path $scriptDir "sap-adt-healthcheck.ps1") -ObjectName $ObjectName -ObjectType $ObjectType -IgnoreLockProbe403Editing:$IgnoreLock403Editing @common | Out-Host
}
Invoke-Step "syntax-check" {
  & (Join-Path $scriptDir "sap-adt-check.ps1") -ObjectName $ObjectName -ObjectType $ObjectType @common | Out-Host
}
Invoke-Step "atc" {
  & (Join-Path $scriptDir "sap-adt-atc.ps1") -ObjectName $ObjectName -Variant $AtcVariant @common | Out-Host
}
if (-not $SkipTest) {
  Invoke-Step "abap-unit" {
    & (Join-Path $scriptDir "sap-adt-test.ps1") -ObjectName $ObjectName @common | Out-Host
  }
}

Write-Host "CI_CHECK_PASS"
exit 0

