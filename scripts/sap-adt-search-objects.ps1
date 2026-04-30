<#
.SYNOPSIS
    基于开源 erpl-adt 搜索 ABAP 对象。
#>
param(
    [Parameter(Mandatory = $true)]
    [string]$Query,
    [string]$ObjectType = "PROG",
    [int]$MaxResults = 50,
    [string]$BaseUrl = "",
    [string]$Username = "",
    [string]$Password = "",
    [string]$Client = ""
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

$conn = Get-ErplConnectionArgs -BaseUrl $BaseUrl -Username $Username -Password $Password -Client $Client
$connArgs = $conn.Args
$args = @($connArgs + @("search", $Query, "--type", $ObjectType.ToUpper(), "--max", [string]$MaxResults, "--json"))
$res = Invoke-ErplAdt -ErplExe $erplExe -Args $args
if ($res.ExitCode -ne 0) { Write-Error $res.Output.Trim(); exit $res.ExitCode }
Write-Output $res.Output
