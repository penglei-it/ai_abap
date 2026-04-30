<#
.SYNOPSIS
    基于开源 erpl-adt 浏览 Package 内容（exists/list/tree）。
#>
param(
    [ValidateSet("exists", "list", "tree")]
    [string]$Action = "list",
    [Parameter(Mandatory = $true)]
    [string]$PackageName,
    [string]$ObjectType = "",
    [int]$MaxDepth = 50,
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
$cmdArgs = @($conn.Args + @("package", $Action, $PackageName))
if ($Action -eq "tree") {
    if ($ObjectType) { $cmdArgs += @("--type", $ObjectType.ToUpper()) }
    if ($MaxDepth -gt 0) { $cmdArgs += @("--max-depth", [string]$MaxDepth) }
}
$res = Invoke-ErplAdt -ErplExe $erplExe -Args $cmdArgs

if ($res.ExitCode -ne 0) {
    Write-Error $res.Output.Trim()
    exit $res.ExitCode
}

Write-Output $res.Output
exit 0

