<#
.SYNOPSIS
  Shared helper for invoking open-source erpl-adt consistently.

.NOTES
  - Avoid passing passwords on the command line.
  - Use a per-process random env var and pass --password-env to erpl-adt.
#>

Set-StrictMode -Version Latest

function Get-ErplAdtExePath {
  $defaultPath = Join-Path $env:LOCALAPPDATA "Python\pythoncore-3.14-64\Scripts\erpl-adt.exe"
  if (Test-Path -LiteralPath $defaultPath) { return $defaultPath }

  $pyBase = Join-Path $env:LOCALAPPDATA "Python"
  if (Test-Path -LiteralPath $pyBase) {
    $found = Get-ChildItem -Path $pyBase -Filter "erpl-adt.exe" -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($found) { return $found.FullName }
  }

  try {
    $cmd = Get-Command erpl-adt -ErrorAction Stop
    return $cmd.Source
  } catch {
    return $null
  }
}

function New-ErplPasswordEnvVarName {
  return ("ERPL_ADT_PWD_" + ([guid]::NewGuid().ToString("N").Substring(0, 12)).ToUpperInvariant())
}

function Get-ErplConnectionArgs {
  param(
    [Parameter(Mandatory=$true)][string]$BaseUrl,
    [Parameter(Mandatory=$true)][string]$Username,
    [Parameter(Mandatory=$true)][string]$Password,
    [Parameter(Mandatory=$true)][string]$Client,
    [switch]$AllowSelfSigned
  )

  $u = [uri]$BaseUrl
  $portValue = if ($u.Port -gt 0) { $u.Port } elseif ($u.Scheme -eq "https") { 443 } else { 80 }

  $pwdVar = New-ErplPasswordEnvVarName
  [Environment]::SetEnvironmentVariable($pwdVar, $Password, "Process")

  $args = @(
    "--host", $u.Host,
    "--port", $portValue,
    "--user", $Username,
    "--password-env", $pwdVar,
    "--client", $Client
  )

  if ($u.Scheme -eq "https") {
    $args += "--https"
    if ($AllowSelfSigned) { $args += "--insecure" }
  }

  return @{
    UriObj = $u
    Args = $args
    PasswordEnvVar = $pwdVar
  }
}

function Invoke-ErplAdt {
  param(
    [Parameter(Mandatory=$true)][string]$ErplExe,
    [Parameter(Mandatory=$true)][string[]]$Args
  )
  # 重要：erpl-adt 出错时会把内容写到 stderr。
  # 在 $ErrorActionPreference='Stop' 的情况下，PowerShell 会把 native stderr 提升为 NativeCommandError（终止异常），
  # 这会破坏我们上层“按 ExitCode 做重试/分支”的逻辑。
  # 这里临时将错误策略降级，确保始终以 ExitCode + Output 的形式返回。
  # 注意：在 StrictMode 下，偏好变量在某些作用域里可能被当成“未初始化”，先给默认值避免 VariableIsUndefined。
  $prevEap = "Continue"
  if (Test-Path -LiteralPath variable:ErrorActionPreference) {
    $prevEap = $ErrorActionPreference
  }
  try {
    $ErrorActionPreference = "Continue"
    $out = & $ErplExe @Args 2>&1
    return @{
      ExitCode = $LASTEXITCODE
      Output = ($out | Out-String)
    }
  } finally {
    $ErrorActionPreference = $prevEap
  }
}

