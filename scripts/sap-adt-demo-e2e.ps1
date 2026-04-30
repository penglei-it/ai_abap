<#
.SYNOPSIS
  端到端 Demo 场景验证（多对象类型，单 TR 复用）。

.DESCRIPTION
  用于“零业务对象影响”的流程验收：
  - 自动创建 demo 对象（CLAS/PROG/INTF/FUGR）
  - 对支持源码写入的对象执行 write+activate，并回读比对 marker
  - 执行语法检查、ATC、搜索、where-used（近似）
  - 生成统一汇总，避免手工零散验证

  设计原则：
  - 仅创建前缀为 ZDEMO_* 的新对象，避免改动现有业务对象
  - 如使用非 $TMP 包，仅创建 1 个 TR 并在全流程复用
  - 对当前工具不支持的步骤明确标注 skipped/limitation
#>
param(
  [string]$EnvironmentName = "CT-DV2-200",
  [string]$Package = "ZICERP01",
  [switch]$UseTransport,
  [string]$Transport = "",
  [string]$AtcVariant = "DEFAULT",
  [string]$FunctionModuleName = "RFC_READ_TABLE",
  [switch]$RunAbapUnit,
  [int]$RetryCount = 2,
  [int]$RetryDelaySec = 1,
  [switch]$CleanupRemoteCreatedObjects,
  [switch]$CleanupLocalArtifacts
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

function New-SourceForType {
  param(
    [Parameter(Mandatory = $true)][string]$ObjectType,
    [Parameter(Mandatory = $true)][string]$ObjectName
  )

  $upperType = $ObjectType.ToUpperInvariant()
  switch ($upperType) {
    "CLAS" {
      return @"
CLASS $ObjectName DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS add
      IMPORTING iv_a TYPE i
                iv_b TYPE i
      RETURNING VALUE(rv_sum) TYPE i.
ENDCLASS.

CLASS $ObjectName IMPLEMENTATION.
  METHOD add.
    " E2E_DEMO_MARKER_CLAS
    rv_sum = iv_a + iv_b.
  ENDMETHOD.
ENDCLASS.
"@
    }
    "PROG" {
      return @"
REPORT $ObjectName.
WRITE: / 'E2E_DEMO_MARKER_PROG'.
"@
    }
    "INTF" {
      return @"
INTERFACE $ObjectName PUBLIC.
  " E2E_DEMO_MARKER_INTF
  METHODS add
    IMPORTING iv_a TYPE i
              iv_b TYPE i
    RETURNING VALUE(rv_sum) TYPE i.
ENDINTERFACE.
"@
    }
    default {
      return $null
    }
  }
}

function Get-ObjectUri {
  param(
    [Parameter(Mandatory = $true)][string]$ObjectType,
    [Parameter(Mandatory = $true)][string]$ObjectName
  )
  $upperType = $ObjectType.ToUpperInvariant()
  switch ($upperType) {
    "CLAS" { return "/sap/bc/adt/oo/classes/$ObjectName/source/main" }
    "INTF" { return "/sap/bc/adt/oo/interfaces/$ObjectName/source/main" }
    "PROG" { return "/sap/bc/adt/programs/programs/$ObjectName/source/main" }
    default { return $null }
  }
}

function Get-ObjectRootUri {
  param(
    [Parameter(Mandatory = $true)][string]$ObjectType,
    [Parameter(Mandatory = $true)][string]$ObjectName
  )
  $upperType = $ObjectType.ToUpperInvariant()
  switch ($upperType) {
    "CLAS" { return "/sap/bc/adt/oo/classes/$ObjectName" }
    "INTF" { return "/sap/bc/adt/oo/interfaces/$ObjectName" }
    "PROG" { return "/sap/bc/adt/programs/programs/$ObjectName" }
    "FUGR" { return "/sap/bc/adt/functions/groups/$ObjectName" }
    default { return $null }
  }
}

function Invoke-Step {
  param(
    [Parameter(Mandatory = $true)][string]$Name,
    [Parameter(Mandatory = $true)][scriptblock]$Action
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
  if ($out) { $out | Select-Object -Last 60 | ForEach-Object { Write-Host $_ } }
  Write-Host ""

  return @{
    code = $code
    output = $out
  }
}

function Resolve-FunctionModuleUri {
  param(
    [Parameter(Mandatory = $true)][string]$FmName,
    [Parameter(Mandatory = $true)][hashtable]$Conn,
    [Parameter(Mandatory = $true)][string]$HostName,
    [Parameter(Mandatory = $true)][int]$Port
  )

  $searchResult = & erpl-adt search $FmName `
    --max 20 `
    --json `
    --host $HostName `
    --port $Port `
    --user $Conn.Username `
    --password $Conn.Password `
    --client $Conn.Client 2>$null
  if ($LASTEXITCODE -ne 0) { return $null }

  try {
    $items = $searchResult | ConvertFrom-Json
    foreach ($item in $items) {
      if ($item.type -eq "FUGR/FF" -and $item.name -and $item.name.ToUpperInvariant() -eq $FmName.ToUpperInvariant()) {
        return $item.uri
      }
    }
  } catch {
    return $null
  }
  return $null
}

$conn = Get-ConnFromSettings -EnvName $EnvironmentName
$baseUri = [uri]$conn.BaseUrl
$hostName = $baseUri.Host
$port = $baseUri.Port
$abapDir = Join-Path $projectRoot "abap"
if (-not (Test-Path -LiteralPath $abapDir)) {
  New-Item -ItemType Directory -Path $abapDir | Out-Null
}

$stamp = Get-Date -Format "MMddHHmmss"
$names = @{
  CLAS = ("ZCL_DEMO_E2E_" + $stamp)
  PROG = ("ZDEMO_E2E_" + $stamp)
  INTF = ("ZIF_DEMO_E2E_" + $stamp)
  FUGR = ("ZFG_E2E_" + $stamp)
  FUNC = ("ZFM_E2E_" + $stamp)
}

# SAP 名称长度约束（保守处理）
if ($names.CLAS.Length -gt 30) { $names.CLAS = $names.CLAS.Substring(0, 30) }
if ($names.PROG.Length -gt 40) { $names.PROG = $names.PROG.Substring(0, 40) }
if ($names.INTF.Length -gt 30) { $names.INTF = $names.INTF.Substring(0, 30) }
if ($names.FUGR.Length -gt 26) { $names.FUGR = $names.FUGR.Substring(0, 26) }
if ($names.FUNC.Length -gt 30) { $names.FUNC = $names.FUNC.Substring(0, 30) }

$effectiveTransport = $Transport
if ($UseTransport -and -not $effectiveTransport) {
  $trStep = Invoke-Step -Name "transport create (single shared TR)" -Action {
    & erpl-adt transport create `
      --desc ("E2E demo " + $stamp) `
      --package $Package `
      --json `
      --host $hostName `
      --port $port `
      --user $conn.Username `
      --password $conn.Password `
      --client $conn.Client
  }
  if ($trStep.code -ne 0) { throw "transport create failed" }
  $trObj = ($trStep.output -join "`n") | ConvertFrom-Json
  if ($trObj.transport_number) { $effectiveTransport = $trObj.transport_number }
  elseif ($trObj.trkorr) { $effectiveTransport = $trObj.trkorr }
  elseif ($trObj.number) { $effectiveTransport = $trObj.number }
  if (-not $effectiveTransport) { throw "failed to parse transport number" }
}

$scenarioResults = @()
$localArtifacts = @()
$createdObjects = @()

$scenarios = @(
  @{ Type = "CLAS"; Name = $names.CLAS; WriteSupported = $true; CheckSupported = $true },
  @{ Type = "PROG"; Name = $names.PROG; WriteSupported = $true; CheckSupported = $true },
  @{ Type = "INTF"; Name = $names.INTF; WriteSupported = $true; CheckSupported = $true },
  @{ Type = "FUGR"; Name = $names.FUGR; WriteSupported = $false; CheckSupported = $false },
  @{ Type = "FUNC"; Name = $FunctionModuleName; WriteSupported = $false; CheckSupported = $true; ExistingOnly = $true }
)

foreach ($s in $scenarios) {
  $t = $s.Type
  $n = $s.Name
  $typeArg = "PROG/P"
  if ($t -eq "CLAS") { $typeArg = "CLAS/OC" }
  elseif ($t -eq "INTF") { $typeArg = "INTF/OI" }
  elseif ($t -eq "FUGR") { $typeArg = "FUGR/F" }
  $one = [ordered]@{
    object = $n
    type = $t
    create = "SKIP"
    write_activate = "SKIP"
    readback = "SKIP"
    syntax = "SKIP"
    atc = "SKIP"
    unit = "SKIP"
    search = "SKIP"
    where_used = "SKIP"
    notes = ""
  }

  if ($t -eq "FUNC") {
    # 形式参数说明：
    # - FmName：用于验证的函数模块名
    # - Conn/HostName/Port：连接参数
    $probe = Invoke-Step -Name ("probe FM create capability " + $names.FUNC) -Action {
      & erpl-adt object create `
        --type "FUNC/F" `
        --name $names.FUNC `
        --package $Package `
        --description ("E2E " + $names.FUNC) `
        --host $hostName `
        --port $port `
        --user $conn.Username `
        --password $conn.Password `
        --client $conn.Client `
        --json
    }
    if ($probe.code -eq 0) {
      $one.create = "PASS"
      $one.notes = "FUNC/F creation unexpectedly supported; please add dedicated FM create flow."
    } else {
      $one.create = "SKIP"
      $one.notes = "FM create not supported by current erpl-adt object create; using existing FM for verification."
    }

    $fmUri = Resolve-FunctionModuleUri -FmName $n -Conn $conn -HostName $hostName -Port $port
    if (-not $fmUri) {
      $one.readback = "FAIL"
      $one.syntax = "FAIL"
      $one.atc = "FAIL"
      $one.search = "FAIL"
      $one.where_used = "FAIL"
      $one.notes = "Function module not found: $n"
      $scenarioResults += [pscustomobject]$one
      continue
    }

    $fmSourceUri = $fmUri.TrimEnd("/") + "/source/main"
    $fmRead = Invoke-Step -Name ("readback active FUNC " + $n) -Action {
      & erpl-adt source read $fmSourceUri `
        --no-color `
        --host $hostName `
        --port $port `
        --user $conn.Username `
        --password $conn.Password `
        --client $conn.Client
    }
    $one.readback = $(if ($fmRead.code -eq 0) { "PASS" } else { "FAIL" })

    $fmSyntax = Invoke-Step -Name ("syntax check FUNC " + $n) -Action {
      & erpl-adt source check $fmSourceUri `
        --host $hostName `
        --port $port `
        --user $conn.Username `
        --password $conn.Password `
        --client $conn.Client
    }
    $one.syntax = $(if ($fmSyntax.code -eq 0) { "PASS" } else { "FAIL" })

    $fmAtc = Invoke-Step -Name ("ATC FUNC " + $n) -Action {
      & erpl-adt check check $fmUri `
        --variant $AtcVariant `
        --host $hostName `
        --port $port `
        --user $conn.Username `
        --password $conn.Password `
        --client $conn.Client
    }
    $one.atc = $(if ($fmAtc.code -eq 0) { "PASS" } else { "FAIL" })
    $one.unit = "SKIP"

    $fmSearch = Invoke-Step -Name ("search FUNC " + $n) -Action {
      & (Join-Path $scriptDir "sap-adt-search-objects.ps1") `
        -Query $n `
        -MaxResults 10 `
        -BaseUrl $conn.BaseUrl `
        -Username $conn.Username `
        -Password $conn.Password `
        -Client $conn.Client
    }
    $one.search = $(if ($fmSearch.code -eq 0) { "PASS" } else { "FAIL" })

    $fmWhere = Invoke-Step -Name ("where-used fallback FUNC " + $n) -Action {
      & (Join-Path $scriptDir "sap-adt-where-used.ps1") `
        -Symbol $n `
        -MaxResults 10 `
        -BaseUrl $conn.BaseUrl `
        -Username $conn.Username `
        -Password $conn.Password `
        -Client $conn.Client
    }
    $one.where_used = $(if ($fmWhere.code -eq 0) { "PASS" } else { "FAIL" })

    $scenarioResults += [pscustomobject]$one
    continue
  }

  $create = Invoke-Step -Name ("create " + $t + " " + $n) -Action {
    $cmdArgs = @(
      "object","create",
      "--type", $typeArg,
      "--name", $n,
      "--package", $Package,
      "--description", ("E2E " + $n),
      "--host", $hostName,
      "--port", $port,
      "--user", $conn.Username,
      "--password", $conn.Password,
      "--client", $conn.Client,
      "--json"
    )
    if ($effectiveTransport) {
      $cmdArgs += @("--transport", $effectiveTransport)
    }
    & erpl-adt @cmdArgs
  }
  if ($create.code -eq 0) { $one.create = "PASS" } else { $one.create = "FAIL" }
  if ($create.code -eq 0) {
    $rootUri = Get-ObjectRootUri -ObjectType $t -ObjectName $n
    if ($rootUri) {
      $createdObjects += [pscustomobject]@{
        type = $t
        name = $n
        uri = $rootUri
      }
    }
  }

  if ($s.WriteSupported -and $create.code -eq 0) {
    $source = New-SourceForType -ObjectType $t -ObjectName $n
    $sourcePath = Join-Path $abapDir ($n + ".e2e.abap")
    [System.IO.File]::WriteAllText($sourcePath, $source, [System.Text.UTF8Encoding]::new($false))
    $localArtifacts += $sourcePath

    $uri = Get-ObjectUri -ObjectType $t -ObjectName $n
    $write = Invoke-Step -Name ("write+activate " + $t + " " + $n) -Action {
      $cmdArgs = @(
        "source","write",$uri,
        "--file",$sourcePath,
        "--activate",
        "--host",$hostName,
        "--port",$port,
        "--user",$conn.Username,
        "--password",$conn.Password,
        "--client",$conn.Client
      )
      if ($effectiveTransport) {
        $cmdArgs += @("--transport", $effectiveTransport)
      }
      & erpl-adt @cmdArgs
    }
    if ($write.code -ne 0 -and (($write.output -join "`n") -match "HTTP 423") -and $RetryCount -gt 0) {
      for ($retry = 1; $retry -le $RetryCount -and $write.code -ne 0; $retry++) {
        Start-Sleep -Seconds $RetryDelaySec
        $write = Invoke-Step -Name ("write+activate retry " + $retry + "/" + $RetryCount + " after 423 " + $t + " " + $n) -Action {
          $retryCmdArgs = @(
            "source","write",$uri,
            "--file",$sourcePath,
            "--activate",
            "--host",$hostName,
            "--port",$port,
            "--user",$conn.Username,
            "--password",$conn.Password,
            "--client",$conn.Client
          )
          if ($effectiveTransport) {
            $retryCmdArgs += @("--transport", $effectiveTransport)
          }
          & erpl-adt @retryCmdArgs
        }
      }
    }
    if ($write.code -eq 0) { $one.write_activate = "PASS" } else { $one.write_activate = "FAIL" }

    $afterPath = Join-Path $abapDir ($n + ".e2e.after.abap")
    $localArtifacts += $afterPath
    $read = Invoke-Step -Name ("readback active " + $t + " " + $n) -Action {
      & erpl-adt source read $n `
        --type $t `
        --section main `
        --version active `
        --host $hostName `
        --port $port `
        --user $conn.Username `
        --password $conn.Password `
        --client $conn.Client `
        --no-color
    }
    if ($read.code -eq 0) {
      [System.IO.File]::WriteAllText($afterPath, ($read.output -join "`r`n"), [System.Text.UTF8Encoding]::new($false))
      $markerOk = (($read.output -join "`n") -match "E2E_DEMO_MARKER")
      $one.readback = $(if ($markerOk) { "PASS" } else { "FAIL" })
    } else {
      $one.readback = "FAIL"
    }
  }

  if ($s.CheckSupported -and $create.code -eq 0) {
    $syntax = Invoke-Step -Name ("syntax check " + $n) -Action {
      & (Join-Path $scriptDir "sap-adt-check.ps1") `
        -ObjectName $n `
        -ObjectType $t `
        -BaseUrl $conn.BaseUrl `
        -Username $conn.Username `
        -Password $conn.Password `
        -Client $conn.Client
    }
    $one.syntax = $(if ($syntax.code -eq 0) { "PASS" } else { "FAIL" })

    $atc = Invoke-Step -Name ("ATC " + $n) -Action {
      & (Join-Path $scriptDir "sap-adt-atc.ps1") `
        -ObjectName $n `
        -Variant $AtcVariant `
        -BaseUrl $conn.BaseUrl `
        -Username $conn.Username `
        -Password $conn.Password `
        -Client $conn.Client
    }
    $one.atc = $(if ($atc.code -eq 0) { "PASS" } else { "FAIL" })

    if ($RunAbapUnit) {
      $unit = Invoke-Step -Name ("ABAP Unit " + $n) -Action {
        & (Join-Path $scriptDir "sap-adt-test.ps1") `
          -ObjectName $n `
          -BaseUrl $conn.BaseUrl `
          -Username $conn.Username `
          -Password $conn.Password `
          -Client $conn.Client
      }
      $one.unit = $(if ($unit.code -eq 0) { "PASS" } else { "FAIL" })
    } else {
      $one.unit = "SKIP"
    }
  }

  $search = Invoke-Step -Name ("search " + $n) -Action {
    & (Join-Path $scriptDir "sap-adt-search-objects.ps1") `
      -Query $n `
      -ObjectType $t `
      -MaxResults 5 `
      -BaseUrl $conn.BaseUrl `
      -Username $conn.Username `
      -Password $conn.Password `
      -Client $conn.Client
  }
  $one.search = $(if ($search.code -eq 0) { "PASS" } else { "FAIL" })

  $whereUsed = Invoke-Step -Name ("where-used fallback " + $n) -Action {
    & (Join-Path $scriptDir "sap-adt-where-used.ps1") `
      -Symbol $n `
      -ObjectType $t `
      -MaxResults 10 `
      -BaseUrl $conn.BaseUrl `
      -Username $conn.Username `
      -Password $conn.Password `
      -Client $conn.Client
  }
  $one.where_used = $(if ($whereUsed.code -eq 0) { "PASS" } else { "FAIL" })

  $scenarioResults += [pscustomobject]$one
}

$pkgTree = Invoke-Step -Name ("package tree " + $Package) -Action {
  & (Join-Path $scriptDir "sap-adt-package.ps1") `
    -Action "tree" `
    -PackageName $Package `
    -ObjectType "CLAS" `
    -MaxDepth 1 `
    -BaseUrl $conn.BaseUrl `
    -Username $conn.Username `
    -Password $conn.Password `
    -Client $conn.Client
}

$transportList = Invoke-Step -Name "transport list" -Action {
  & (Join-Path $scriptDir "sap-adt-transport.ps1") `
    -Action "list" `
    -BaseUrl $conn.BaseUrl `
    -Username $conn.Username `
    -Password $conn.Password `
    -Client $conn.Client
}

Write-Host "===== E2E SUMMARY ====="
Write-Host ("environment=" + $EnvironmentName)
Write-Host ("package=" + $Package)
Write-Host ("transport=" + $(if ($effectiveTransport) { $effectiveTransport } else { "(none, probably \$TMP flow)" }))
$scenarioResults | Format-Table -AutoSize | Out-Host
Write-Host ("package_tree=" + $(if ($pkgTree.code -eq 0) { "PASS" } else { "FAIL" }))
Write-Host ("transport_list=" + $(if ($transportList.code -eq 0) { "PASS" } else { "FAIL" }))

if ($CleanupRemoteCreatedObjects -and $createdObjects.Count -gt 0) {
  Write-Host "===== REMOTE CLEANUP (CREATED OBJECTS IN THIS RUN) ====="
  foreach ($obj in $createdObjects) {
    [void](Invoke-Step -Name ("delete " + $obj.type + " " + $obj.name) -Action {
      $deleteCmdArgs = @(
        "object", "delete", $obj.uri,
        "--host", $hostName,
        "--port", $port,
        "--user", $conn.Username,
        "--password", $conn.Password,
        "--client", $conn.Client
      )
      if ($effectiveTransport) {
        $deleteCmdArgs += @("--transport", $effectiveTransport)
      }
      & erpl-adt @deleteCmdArgs
    })
  }
}

if ($CleanupLocalArtifacts) {
  foreach ($p in $localArtifacts) {
    if (Test-Path -LiteralPath $p) {
      Remove-Item -LiteralPath $p -Force -ErrorAction SilentlyContinue
    }
  }
}

$hasScenarioFail = $false
foreach ($row in $scenarioResults) {
  if ($row.create -eq "FAIL" -or $row.write_activate -eq "FAIL" -or $row.readback -eq "FAIL" -or $row.syntax -eq "FAIL" -or $row.atc -eq "FAIL" -or $row.unit -eq "FAIL" -or $row.search -eq "FAIL" -or $row.where_used -eq "FAIL") {
    $hasScenarioFail = $true
    break
  }
}
$overallPass = (-not $hasScenarioFail) -and ($pkgTree.code -eq 0) -and ($transportList.code -eq 0)
if ($overallPass) { exit 0 } else { exit 1 }
