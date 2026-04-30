<#
.SYNOPSIS
    基于开源 erpl-adt 执行 ABAP 源码语法检查（不写入）。
#>
param(
    [Parameter(Mandatory = $true)]
    [string]$ObjectName,
    [string]$ObjectType = "",
    [string]$BaseUrl = "",
    [string]$Username = "",
    [string]$Password = "",
    [string]$Client = "",
    [switch]$AllowSelfSigned
)

Set-StrictMode -Version Latest
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
. (Join-Path $scriptDir "lib\\erpl-adt.ps1")

if (-not $BaseUrl -or -not $Username -or -not $Password) {
    Write-Error "Required: -BaseUrl, -Username, -Password, -Client."
    exit 1
}
if (-not $Client) { $Client = "200" }

$erplExe = Get-ErplAdtExePath
if (-not $erplExe) {
    Write-Error "erpl-adt not found. Install open-source CLI: pip install erpl-adt"
    exit 1
}

$conn = Get-ErplConnectionArgs -BaseUrl $BaseUrl -Username $Username -Password $Password -Client $Client -AllowSelfSigned:$AllowSelfSigned
$cmdArgs = @($conn.Args + @("source", "check", $ObjectName))
if ($ObjectType) {
    $cmdArgs += @("--type", $ObjectType.ToUpper())
}
$res = Invoke-ErplAdt -ErplExe $erplExe -Args $cmdArgs

if ($res.ExitCode -ne 0) {
    Write-Error $res.Output.Trim()
    exit $res.ExitCode
}

Write-Output $res.Output
exit 0

