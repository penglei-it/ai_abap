<#
.SYNOPSIS
  Run a local-file ADT round-trip workflow.

.DESCRIPTION
  This script implements the "local edit + ADT writeback" workflow in one place:
  1) Optional healthcheck
  2) Read remote object into local snapshot
  3) Prepare/refresh local work file
  4) Optional writeback + activate
  5) Read back and verify remote content equals local work file

.PARAMETER ObjectName
  Target ABAP object name, for example ZCL_DEMO_CLASS.

.PARAMETER ObjectType
  ABAP object type, for example CLAS / PROG / INTF. Default is CLAS.

.PARAMETER BaseUrl
  ADT base URL, for example http://<sap-host>:<port>.

.PARAMETER Username
  SAP username used for ADT authentication.

.PARAMETER Password
  SAP password used for ADT authentication.

.PARAMETER Client
  SAP client, for example 200.

.PARAMETER Transport
  Transport request number used during writeback.

.PARAMETER WorkFile
  Local editable work file path. Default: .\abap\<ObjectName>.work.abap

.PARAMETER BeforeFile
  Local remote snapshot before writeback. Default: .\abap\<ObjectName>.before.abap

.PARAMETER AfterFile
  Local remote snapshot after writeback. Default: .\abap\<ObjectName>.after.abap

.PARAMETER SkipHealthcheck
  Skip pre-flight healthcheck step.

.PARAMETER PrepareOnly
  Only pull and prepare local file, do not write back.

.PARAMETER ForceRefreshWork
  Always overwrite work file from latest remote snapshot.

.PARAMETER AllowSelfSigned
  Allow self-signed certificates for read operations.
#>
param(
  [Parameter(Mandatory = $true)][string]$ObjectName,
  [string]$ObjectType = "CLAS",
  [Parameter(Mandatory = $true)][string]$BaseUrl,
  [Parameter(Mandatory = $true)][string]$Username,
  [Parameter(Mandatory = $true)][string]$Password,
  [Parameter(Mandatory = $true)][string]$Client,
  [string]$Transport = "",
  [string]$WorkFile = "",
  [string]$BeforeFile = "",
  [string]$AfterFile = "",
  [switch]$SkipHealthcheck,
  [switch]$PrepareOnly,
  [switch]$ForceRefreshWork,
  [switch]$AllowSelfSigned
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent $scriptDir

if (-not $BeforeFile) { $BeforeFile = Join-Path $repoRoot ("abap/" + $ObjectName + ".before.abap") }
if (-not $WorkFile)   { $WorkFile = Join-Path $repoRoot ("abap/" + $ObjectName + ".work.abap") }
if (-not $AfterFile)  { $AfterFile = Join-Path $repoRoot ("abap/" + $ObjectName + ".after.abap") }

foreach ($f in @($BeforeFile, $WorkFile, $AfterFile)) {
  $parent = Split-Path -Parent $f
  if ($parent -and -not (Test-Path -LiteralPath $parent)) {
    New-Item -ItemType Directory -Path $parent -Force | Out-Null
  }
}

function Invoke-Step {
  param(
    [Parameter(Mandatory = $true)][string]$Name,
    [Parameter(Mandatory = $true)][scriptblock]$Action
  )
  Write-Host ("==> " + $Name)
  & $Action
  if ($LASTEXITCODE -ne 0) {
    throw ("Step failed: " + $Name + ", exit code: " + $LASTEXITCODE)
  }
}

if (-not $SkipHealthcheck) {
  Invoke-Step -Name "Healthcheck" -Action {
    & (Join-Path $scriptDir "sap-adt-healthcheck.ps1") `
      -ObjectName $ObjectName `
      -ObjectType $ObjectType `
      -BaseUrl $BaseUrl `
      -Username $Username `
      -Password $Password `
      -Client $Client
  }
}

Invoke-Step -Name "Read remote -> before snapshot" -Action {
  & (Join-Path $scriptDir "sap-adt-read-object.ps1") `
    -ObjectName $ObjectName `
    -ObjectType $ObjectType `
    -BaseUrl $BaseUrl `
    -Username $Username `
    -Password $Password `
    -Client $Client `
    -AllowSelfSigned:$AllowSelfSigned `
    -OutputFile $BeforeFile
}

if ($ForceRefreshWork -or -not (Test-Path -LiteralPath $WorkFile)) {
  Copy-Item -LiteralPath $BeforeFile -Destination $WorkFile -Force
  Write-Host ("Prepared work file: " + $WorkFile)
} else {
  Write-Host ("Keep existing work file: " + $WorkFile)
}

if ($PrepareOnly) {
  Write-Host "PrepareOnly enabled: edit work file locally, then rerun without -PrepareOnly."
  exit 0
}

Invoke-Step -Name "Write back + activate" -Action {
  & (Join-Path $scriptDir "sap-adt-write-object.ps1") `
    -ObjectName $ObjectName `
    -ObjectType $ObjectType `
    -SourceFile $WorkFile `
    -Activate:$true `
    -BaseUrl $BaseUrl `
    -Username $Username `
    -Password $Password `
    -Client $Client `
    -Transport $Transport
}

Invoke-Step -Name "Read remote -> after snapshot" -Action {
  & (Join-Path $scriptDir "sap-adt-read-object.ps1") `
    -ObjectName $ObjectName `
    -ObjectType $ObjectType `
    -BaseUrl $BaseUrl `
    -Username $Username `
    -Password $Password `
    -Client $Client `
    -AllowSelfSigned:$AllowSelfSigned `
    -OutputFile $AfterFile
}

$workText = [System.IO.File]::ReadAllText($WorkFile, [System.Text.Encoding]::UTF8)
$afterText = [System.IO.File]::ReadAllText($AfterFile, [System.Text.Encoding]::UTF8)
if ($workText -ne $afterText) {
  Write-Error ("Readback mismatch: remote after snapshot differs from work file." +
    " Work: " + $WorkFile + " ; After: " + $AfterFile)
  exit 2
}

Write-Host "Round-trip verify passed: remote equals local work file."
Write-Host ("Work file: " + $WorkFile)
Write-Host ("Before snapshot: " + $BeforeFile)
Write-Host ("After snapshot: " + $AfterFile)
