<#
.SYNOPSIS
    基于开源 erpl-adt 读取 SAP ADT 对象源码。
#>
param(
    [Parameter(Mandatory=$true)][string]$ObjectName,
    [string]$ObjectType = "PROG",
    [switch]$IsInclude,
    [string]$BaseUrl = "",
    [string]$Username = "",
    [string]$Password = "",
    [string]$Client = "",
    [switch]$AllowSelfSigned,
    [ValidateSet("active","inactive")][string]$Version = "active",
    [string]$OutputFile = ""
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
$connArgs = $conn.Args

$objTypeUpper = $ObjectType.ToUpper()
$section = if ($objTypeUpper -eq "PROG" -and $IsInclude) { "main" } else { "main" }
$args = @($connArgs + @("source", "read", $ObjectName, "--type", $objTypeUpper, "--section", $section, "--version", $Version))
$res = Invoke-ErplAdt -ErplExe $erplExe -Args $args
if ($res.ExitCode -ne 0) { Write-Error $res.Output.Trim(); exit $res.ExitCode }
$text = $res.Output
if ($OutputFile) {
    [System.IO.File]::WriteAllText($OutputFile, $text, [System.Text.UTF8Encoding]::new($false))
    Write-Host ("Saved: " + $OutputFile)
} else {
    Write-Output $text
}
