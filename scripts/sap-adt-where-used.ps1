<#
.SYNOPSIS
    基于开源 erpl-adt 的可用能力执行 where-used 近似查询（搜索兜底）。
.DESCRIPTION
    当前 erpl-adt 尚无独立 where-used 命令，先通过 search 做引用候选收集。
#>
param(
    [Parameter(Mandatory = $true)]
    [string]$Symbol,
    [string]$ObjectType = "",
    [int]$MaxResults = 200,
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
$cmdArgs = @($conn.Args + @("search", $Symbol, "--max", [string]$MaxResults, "--json"))
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

