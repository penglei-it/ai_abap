<#
.SYNOPSIS
    基于开源 erpl-adt 激活 ABAP 对象。
#>
param(
    [Parameter(Mandatory = $true)]
    [string]$ObjectName,
    [string]$ObjectType = "PROG",
    [string]$BaseUrl = "",
    [string]$Username = "",
    [string]$Password = "",
    [string]$Client = ""
    ,[switch]$AllowSelfSigned
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
$args = @($conn.Args + @("activate", $ObjectName))
$res = Invoke-ErplAdt -ErplExe $erplExe -Args $args
if ($res.ExitCode -ne 0) { Write-Error $res.Output.Trim(); exit $res.ExitCode }
Write-Host ("Activated (erpl-adt OSS): " + $ObjectName)
