<#
.SYNOPSIS
  批量清理历史 E2E Demo 对象（先预览，后执行删除）。

.DESCRIPTION
  默认仅列出候选对象（安全模式，不删除）。
  传入 -Execute 后执行删除，覆盖以下前缀：
  - ZCL_DEMO_E2E_
  - ZDEMO_E2E_
  - ZIF_DEMO_E2E_
  - ZFG_E2E_
#>
param(
  [string]$EnvironmentName = "CT-DV2-200",
  [string]$Package = "ZICERP01",
  [string]$Transport = "",
  [switch]$Execute,
  [switch]$AllowExecuteWithoutTransport
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectRoot = Split-Path -Parent $scriptDir

function Get-ConnFromSettings {
  param([string]$EnvName)
  $settingsPath = Join-Path $projectRoot ".vscode\settings.json"
  if (-not (Test-Path -LiteralPath $settingsPath)) {
    throw "Missing settings file: $settingsPath"
  }
  $j = Get-Content -Raw -LiteralPath $settingsPath | ConvertFrom-Json
  $baseUrl = $j.'sapAdt.environments'.$EnvName.url
  $client = $j.'sapAdt.environments'.$EnvName.client
  $username = $j.'abapfs.remote'.$EnvName.username
  $password = $j.'abapfs.remote'.$EnvName.password
  if (-not $baseUrl -or -not $client -or -not $username -or -not $password) {
    throw "Missing connection settings for environment: $EnvName"
  }
  return @{
    BaseUrl = $baseUrl
    Client = $client
    Username = $username
    Password = $password
  }
}

function Invoke-ErplStep {
  param(
    [Parameter(Mandatory = $true)][string]$Name,
    [Parameter(Mandatory = $true)][scriptblock]$Action,
    [switch]$HideOutput
  )
  Write-Host ("== " + $Name + " ==")
  try {
    $out = & $Action 2>&1
    $code = $LASTEXITCODE
  } catch {
    $out = @($_.Exception.Message)
    $code = 1
  }
  if ($code -eq 0) { Write-Host "RESULT: PASS" } else { Write-Host ("RESULT: FAIL (" + $code + ")") }
  if ((-not $HideOutput) -and $out) { $out | Select-Object -Last 30 | ForEach-Object { Write-Host $_ } }
  Write-Host ""
  return @{
    code = $code
    output = $out
  }
}

$conn = Get-ConnFromSettings -EnvName $EnvironmentName
$baseUri = [uri]$conn.BaseUrl
$hostName = $baseUri.Host
$port = $baseUri.Port

$candidates = New-Object System.Collections.Generic.List[object]
$tree = Invoke-ErplStep -Name ("package tree " + $Package) -Action {
  & erpl-adt package tree $Package `
    --json `
    --host $hostName `
    --port $port `
    --user $conn.Username `
    --password $conn.Password `
    --client $conn.Client
} -HideOutput
if ($tree.code -ne 0) {
  throw "package tree failed, cannot build cleanup candidates"
}
try {
  $items = ($tree.output -join "`n") | ConvertFrom-Json
  foreach ($it in $items) {
    $name = $it.object_name
    $type = $it.object_type
    $uri = $it.object_uri
    if (-not $name -or -not $type -or -not $uri) { continue }
    # 严格限定：仅清理符合 E2E 命名约定且带 10 位时间戳的 demo 对象，避免误删业务对象
    $isStrictDemoName = (
      $name -match "^ZCL_DEMO_E2E_\d{10}$" -or
      $name -match "^ZDEMO_E2E_\d{10}$" -or
      $name -match "^ZIF_DEMO_E2E_\d{10}$" -or
      $name -match "^ZFG_E2E_\d{10}$"
    )
    if ($isStrictDemoName) {
      if ($type -eq "CLAS/OC" -or $type -eq "PROG/P" -or $type -eq "INTF/OI" -or $type -eq "FUGR/F") {
        $candidates.Add([pscustomobject]@{
          name = $name
          type = $type
          uri = $uri
          package = $Package
        })
      }
    }
  }
} catch {
  throw "Parse package tree result failed: $($_.Exception.Message)"
}

$unique = @($candidates | Sort-Object uri -Unique)
Write-Host "===== DEMO CLEANUP CANDIDATES ====="
if ($unique.Count -eq 0) {
  Write-Host "No demo objects found."
  exit 0
}
$unique | Format-Table -AutoSize | Out-Host

if (-not $Execute) {
  Write-Host ""
  Write-Host "Preview only. Use -Execute to delete all above objects."
  Write-Host "Safety: -Execute requires -Transport unless -AllowExecuteWithoutTransport is explicitly set."
  exit 0
}

if (-not $Transport -and -not $AllowExecuteWithoutTransport) {
  throw "Safety guard: -Execute requires -Transport. If you really need unrestricted delete, pass -AllowExecuteWithoutTransport explicitly."
}

Write-Host ""
Write-Host "===== EXECUTE DEMO CLEANUP ====="
$deleteOk = 0
$deleteFail = 0
foreach ($obj in $unique) {
  $del = Invoke-ErplStep -Name ("delete " + $obj.type + " " + $obj.name) -Action {
    $cmdArgs = @(
      "object", "delete", $obj.uri,
      "--host", $hostName,
      "--port", $port,
      "--user", $conn.Username,
      "--password", $conn.Password,
      "--client", $conn.Client
    )
    if ($Transport) {
      $cmdArgs += @("--transport", $Transport)
    }
    & erpl-adt @cmdArgs
  }
  if ($del.code -eq 0) { $deleteOk++ } else { $deleteFail++ }
}

Write-Host ("delete_success=" + $deleteOk)
Write-Host ("delete_failed=" + $deleteFail)
Write-Host "Cleanup finished."
