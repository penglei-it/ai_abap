<#
.SYNOPSIS
  统一入口：封装常用 sap-adt-* 脚本为一个命令。
#>
param(
  [Parameter(Mandatory = $true)]
  [ValidateSet("check", "test", "atc", "package", "ddic", "where-used", "transport", "healthcheck")]
  [string]$Action,

  [string]$ObjectName = "",
  [string]$ObjectType = "",
  [string]$PackageName = "",
  [string]$DdAction = "table",
  [string]$PackageAction = "list",
  [string]$TransportAction = "list",
  [string]$TransportDescription = "",
  [string]$TransportNumber = "",
  [string]$Variant = "DEFAULT",
  [int]$MaxResults = 200,
  [int]$MaxDepth = 50,
  [switch]$Json,
  [string]$BaseUrl = "",
  [string]$Username = "",
  [string]$Password = "",
  [string]$Client = ""
)

Set-StrictMode -Version Latest
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

function Test-RequiredParam([string]$Name, [string]$Value) {
  if (-not $Value) { throw ("Missing required parameter: -" + $Name) }
}

switch ($Action) {
  "check" {
    Test-RequiredParam "ObjectName" $ObjectName
    & (Join-Path $scriptDir "sap-adt-check.ps1") -ObjectName $ObjectName -ObjectType $ObjectType -BaseUrl $BaseUrl -Username $Username -Password $Password -Client $Client
    break
  }
  "test" {
    Test-RequiredParam "ObjectName" $ObjectName
    & (Join-Path $scriptDir "sap-adt-test.ps1") -ObjectName $ObjectName -BaseUrl $BaseUrl -Username $Username -Password $Password -Client $Client
    break
  }
  "atc" {
    Test-RequiredParam "ObjectName" $ObjectName
    & (Join-Path $scriptDir "sap-adt-atc.ps1") -ObjectName $ObjectName -Variant $Variant -BaseUrl $BaseUrl -Username $Username -Password $Password -Client $Client
    break
  }
  "package" {
    Test-RequiredParam "PackageName" $PackageName
    & (Join-Path $scriptDir "sap-adt-package.ps1") -Action $PackageAction -PackageName $PackageName -ObjectType $ObjectType -MaxDepth $MaxDepth -BaseUrl $BaseUrl -Username $Username -Password $Password -Client $Client
    break
  }
  "ddic" {
    Test-RequiredParam "ObjectName" $ObjectName
    & (Join-Path $scriptDir "sap-adt-ddic.ps1") -Action $DdAction -Name $ObjectName -BaseUrl $BaseUrl -Username $Username -Password $Password -Client $Client
    break
  }
  "where-used" {
    Test-RequiredParam "ObjectName" $ObjectName
    & (Join-Path $scriptDir "sap-adt-where-used.ps1") -Symbol $ObjectName -ObjectType $ObjectType -MaxResults $MaxResults -BaseUrl $BaseUrl -Username $Username -Password $Password -Client $Client
    break
  }
  "transport" {
    & (Join-Path $scriptDir "sap-adt-transport.ps1") -Action $TransportAction -Description $TransportDescription -Number $TransportNumber -BaseUrl $BaseUrl -Username $Username -Password $Password -Client $Client
    break
  }
  "healthcheck" {
    Test-RequiredParam "ObjectName" $ObjectName
    & (Join-Path $scriptDir "sap-adt-healthcheck.ps1") -ObjectName $ObjectName -ObjectType $ObjectType -BaseUrl $BaseUrl -Username $Username -Password $Password -Client $Client -Json:$Json
    break
  }
}

exit $LASTEXITCODE

