<#
.SYNOPSIS
    基于开源 erpl-adt 查询对象相关信息（近似 where-used：名称搜索）。
#>
param(
    [Parameter(Mandatory = $true)]
    [string]$ObjectName,
    [string]$ObjectType = "PROG",
    [string]$BaseUrl = "",
    [string]$Username = "",
    [string]$Password = "",
    [string]$Client = ""
)

if (-not $BaseUrl -or -not $Username -or -not $Password) {
    Write-Error "Required: -BaseUrl, -Username, -Password, -Client."
    exit 1
}
if (-not $Client) { $Client = "200" }
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$searchScript = Join-Path $scriptDir "sap-adt-search-objects.ps1"
if (-not (Test-Path -LiteralPath $searchScript)) {
    Write-Error "Missing script: sap-adt-search-objects.ps1"
    exit 1
}

# 用开源 search 包装输出近似 where-used（名称相关对象）
$output = & $searchScript -Query $ObjectName -ObjectType $ObjectType -MaxResults 50 -BaseUrl $BaseUrl -Username $Username -Password $Password -Client $Client 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Error (($output | Out-String).Trim())
    exit $LASTEXITCODE
}
Write-Output ($output | Out-String)
exit 0
