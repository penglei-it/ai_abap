<#
.SYNOPSIS
    基于开源 erpl-adt 读取程序源码（PROG）。
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$ObjectName,
    [ValidateSet("active","inactive")]
    [string]$Version = "active",
    [string]$OutputFile = "",
    [string]$BaseUrl = "",
    [string]$Username = "",
    [string]$Password = "",
    [string]$Client = ""
)

if (-not $BaseUrl -or -not $Username -or -not $Password) {
    Write-Error "Required: -BaseUrl, -Username, -Password, -Client. Use extension or pass explicitly."
    exit 1
}
if (-not $Client) { $Client = "200" }

Set-StrictMode -Version Latest
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
. (Join-Path $scriptDir "lib\\erpl-adt.ps1")

$erplExe = Get-ErplAdtExePath
if (-not $erplExe) {
    Write-Error "erpl-adt not found. Install open-source CLI: pip install erpl-adt"
    exit 1
}

$conn = Get-ErplConnectionArgs -BaseUrl $BaseUrl -Username $Username -Password $Password -Client $Client
$args = @($conn.Args + @("source", "read", $ObjectName, "--type", "PROG", "--section", "main", "--version", $Version))
$res = Invoke-ErplAdt -ErplExe $erplExe -Args $args
if ($res.ExitCode -ne 0) { Write-Error $res.Output.Trim(); exit $res.ExitCode }
$text = $res.Output
if ($OutputFile) {
    [System.IO.File]::WriteAllText($OutputFile, $text, [System.Text.UTF8Encoding]::new($false))
    Write-Host ("Saved: " + $OutputFile)
} else {
    Write-Output $text
}
