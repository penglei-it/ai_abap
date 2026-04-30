<#
.SYNOPSIS
  对 SE24 类执行“无害修改 → 写回并激活 → 回读验证 → 回滚并激活 → 回读验证”的闭环，并确保解锁。

.DESCRIPTION
  目标是验证 ADT 写回不是“Written 就算成功”，而是必须能从 SAP 回读验证确实落地。
  本脚本使用开源 erpl-adt，并采用 object lock 返回的 handle 完成写回与解锁，避免残留锁导致 403。

.PARAMETER ObjectName
  类名（例如：ZCL_DEMO）。

.PARAMETER MethodAnchor
  用于插入 marker 的锚点字符串（默认：METHOD add_inquiry_quotearea.）。

.PARAMETER MarkerLine
  要插入的无害 marker（默认：    " SIDEFX_PROBE_OK）。

.PARAMETER Transport
  传输请求号（建议传“变更请求”而不是 task；例如：DV2K925273）。

.PARAMETER BaseUrl
  ADT 基础地址（例如：http://192.168.71.50:8001）。

.PARAMETER Username
  SAP 用户名。

.PARAMETER Password
  SAP 密码（仅用于通过进程环境变量传给 erpl-adt；不会写入文件）。

.PARAMETER Client
  Client（例如：200）。

.PARAMETER WorkDir
  生成中间文件的目录（默认：C:\Ai_Abap\abap）。

.EXAMPLE
  .\scripts\sap-adt-sidefx-class-cycle.ps1 -ObjectName ZCL_DEMO -Transport <TR> -BaseUrl <BASE_URL> -Username <USER> -Password <PASS> -Client <CLIENT>
#>

param(
  [Parameter(Mandatory = $true)][string]$ObjectName,
  [string]$MethodAnchor = "METHOD add_inquiry_quotearea.",
  [string]$MarkerLine = "    "" SIDEFX_PROBE_OK",
  [Parameter(Mandatory = $true)][string]$Transport,
  [Parameter(Mandatory = $true)][string]$BaseUrl,
  [Parameter(Mandatory = $true)][string]$Username,
  [Parameter(Mandatory = $true)][string]$Password,
  [Parameter(Mandatory = $true)][string]$Client,
  [string]$WorkDir = "C:\\Ai_Abap\\abap",
  [string]$ErplAdtPath = "",
  [switch]$CleanupArtifacts
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
. (Join-Path $scriptDir "lib\\erpl-adt.ps1")

$erplExe = if ($ErplAdtPath -and (Test-Path -LiteralPath $ErplAdtPath)) { $ErplAdtPath } else { Get-ErplAdtExePath }
if (-not $erplExe) { throw "erpl-adt not found. Install open-source CLI: pip install erpl-adt" }

$conn = Get-ErplConnectionArgs -BaseUrl $BaseUrl -Username $Username -Password $Password -Client $Client
$connArgs = $conn.Args

$objUri = "/sap/bc/adt/oo/classes/$ObjectName"
$srcUri = "/sap/bc/adt/oo/classes/$ObjectName/source/main"

if (-not (Test-Path -LiteralPath $WorkDir)) { throw "WorkDir not found: $WorkDir" }

$stamp = Get-Date -Format "yyyyMMddHHmmss"
$orig = Join-Path $WorkDir "$ObjectName.sidefx.$stamp.orig.utf8.abap"
$work = Join-Path $WorkDir "$ObjectName.sidefx.$stamp.work.utf8.abap"
$after1 = Join-Path $WorkDir "$ObjectName.sidefx.$stamp.after1.utf8.abap"
$after2 = Join-Path $WorkDir "$ObjectName.sidefx.$stamp.after2.utf8.abap"

function Write-Utf8NoBomFile {
  param([Parameter(Mandatory = $true)][string]$Path, [Parameter(Mandatory = $true)][string]$Text)
  [System.IO.File]::WriteAllText($Path, $Text, [System.Text.UTF8Encoding]::new($false))
}

function Read-ActiveClassSourceToFile {
  param([Parameter(Mandatory = $true)][string]$OutFile)
  $res = Invoke-ErplAdt -ErplExe $erplExe -Args ($connArgs + @("source", "read", $ObjectName, "--type", "CLAS", "--section", "main", "--version", "active", "--no-color"))
  if ($res.ExitCode -ne 0) { throw ("READ_FAIL: " + $res.Output.Trim()) }
  Write-Utf8NoBomFile -Path $OutFile -Text $res.Output
  return $res.Output
}

function Ensure-NoMarkerLine {
  param([Parameter(Mandatory = $true)][string]$Text)
  $t = $Text.Replace($MarkerLine + "`r`n", "").Replace($MarkerLine + "`n", "")
  return $t
}

function Get-LockHandleFromOutput {
  param([Parameter(Mandatory = $true)][string]$OutputText)
  # ADT 返回的 --json 输出在某些系统里可能被 transport_text 的乱码破坏，导致 ConvertFrom-Json 失败。
  # 这里优先用正则从原始文本中提取 handle，避免“加锁成功但解析失败”造成残留锁。
  if ($OutputText -match '"handle"\s*:\s*"([^"]+)"') {
    return $Matches[1]
  }
  return $null
}

$handle = $null
$locked = $false
$succeeded = $false
try {
  # 1) lock (必须拿到 handle；若后续失败，不删除 session-file，方便人工解锁/排查)
  $maxLockRetries = 5
  $lockRes = $null
  for ($i = 1; $i -le $maxLockRetries; $i++) {
    # 不使用 session-file：避免某些系统/用户下出现“解锁后仍被视为编辑中”的异常状态。
    $lockRes = Invoke-ErplAdt -ErplExe $erplExe -Args ($connArgs + @("--json", "object", "lock", $objUri))
    if ($lockRes.ExitCode -eq 0) { break }

    # 403（编辑中）做短暂退避重试，避免刚释放锁的瞬态窗口。
    if ($lockRes.Output -match 'http_status"\s*:\s*403' -or $lockRes.Output -match 'currently editing') {
      Start-Sleep -Milliseconds (300 * $i)
      continue
    }

    break
  }
  if (-not $lockRes -or $lockRes.ExitCode -ne 0) { throw ("LOCK_FAIL: " + ($lockRes.Output.Trim())) }

  $handle = Get-LockHandleFromOutput -OutputText $lockRes.Output
  if (-not $handle) {
    try {
      $lockJson = $lockRes.Output | ConvertFrom-Json
      $handle = $lockJson.handle
    } catch {
      $handle = $null
    }
  }
  if (-not $handle) { throw "LOCK_FAIL: missing handle in lock response" }
  $locked = $true

  # 2) read active -> orig
  $origText = Read-ActiveClassSourceToFile -OutFile $orig

  # 3) create work with marker inserted after anchor line
  $cleanOrig = Ensure-NoMarkerLine -Text $origText
  $pos = $cleanOrig.IndexOf($MethodAnchor)
  if ($pos -lt 0) { throw "ANCHOR_NOT_FOUND: $MethodAnchor" }
  $insertAt = $pos + $MethodAnchor.Length
  $workText = $cleanOrig.Substring(0, $insertAt) + "`r`n" + $MarkerLine + $cleanOrig.Substring($insertAt)
  Write-Utf8NoBomFile -Path $work -Text $workText

  # 4) write+activate (use handle)
  $writeArgs = $connArgs + @("source", "write", $srcUri, "--file", $work, "--transport", $Transport, "--activate", "--handle", $handle)
  $writeRes = Invoke-ErplAdt -ErplExe $erplExe -Args $writeArgs
  if ($writeRes.ExitCode -ne 0) { throw ("WRITE_FAIL: " + $writeRes.Output.Trim()) }

  # 5) readback verify landed
  $afterText1 = Read-ActiveClassSourceToFile -OutFile $after1
  if ($afterText1 -notmatch "SIDEFX_PROBE_OK") { throw "VERIFY_FAIL: marker not found after write+activate (not landed)" }

  # 6) rollback original + activate (use handle)
  $rbArgs = $connArgs + @("source", "write", $srcUri, "--file", $orig, "--transport", $Transport, "--activate", "--handle", $handle)
  $rbRes = Invoke-ErplAdt -ErplExe $erplExe -Args $rbArgs
  if ($rbRes.ExitCode -ne 0) { throw ("ROLLBACK_FAIL: " + $rbRes.Output.Trim()) }

  # 7) readback verify rollback
  $afterText2 = Read-ActiveClassSourceToFile -OutFile $after2
  if ($afterText2 -match "SIDEFX_PROBE_OK") { throw "VERIFY_FAIL: marker still found after rollback (rollback not landed)" }

  Write-Host "SIDEFX_OK: landed and rolled back verified by readback."
  Write-Host ("Files: orig=" + $orig)
  Write-Host ("       work=" + $work)
  Write-Host ("       after1=" + $after1)
  Write-Host ("       after2=" + $after2)
  $succeeded = $true
} finally {
  if ($locked -and $handle) {
    $unlockRes = Invoke-ErplAdt -ErplExe $erplExe -Args ($connArgs + @("object", "unlock", $objUri, "--handle", $handle))
    if ($unlockRes.ExitCode -ne 0) {
      Write-Warning ("UNLOCK_FAIL: " + $unlockRes.Output.Trim())
      Write-Warning ("Handle (needed to unlock): " + $handle)
    }
  }

  if ($conn -and $conn.PasswordEnvVar) {
    # 清理敏感信息（进程级环境变量）
    [Environment]::SetEnvironmentVariable($conn.PasswordEnvVar, $null, "Process")
  }

  if ($CleanupArtifacts) {
    # 清理本次运行生成的文件，避免污染工作区（无论成功失败都尽量清理）。
    $paths = @($orig, $work, $after1, $after2)
    foreach ($p in $paths) {
      if ($p -and (Test-Path -LiteralPath $p)) {
        Remove-Item -LiteralPath $p -Force -ErrorAction SilentlyContinue
      }
    }
  }
}

