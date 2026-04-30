<#
.SYNOPSIS
    基于开源 erpl-adt 列出或创建传输请求。
#>
param(
    [ValidateSet("list", "create", "release")]
    [string]$Action = "list",
    [string]$Description = "",
    [string]$Number = "",
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

$u = [uri]$BaseUrl
$conn = Get-ErplConnectionArgs -BaseUrl $BaseUrl -Username $Username -Password $Password -Client $Client
$cmdArgs = $conn.Args
if ($Action -eq "create") {
    if (-not $Description) {
        Write-Error "Description is required for -Action create."
        exit 1
    }
    $cmdArgs += @("transport", "create", "--desc", $Description, "--package", '$TMP', "--json")
} elseif ($Action -eq "release") {
    if (-not $Number) {
        Write-Error "Number is required for -Action release."
        exit 1
    }
    $cmdArgs += @("transport", "release", $Number, "--json")
} else {
    $cmdArgs += @("transport", "list", "--user", $Username, "--json")
}
if ($u.Scheme -eq "https") { $cmdArgs += @("--https","--insecure") }

$res = Invoke-ErplAdt -ErplExe $erplExe -Args $cmdArgs
if ($res.ExitCode -ne 0) {
    $outText = $res.Output
    if ($Action -eq "list" -and $outText -match "404|Not found|not_found") {
        Write-Output "[]"
        exit 0
    }
    Write-Error $outText.Trim()
    exit $res.ExitCode
}
Write-Output $res.Output
exit 0
