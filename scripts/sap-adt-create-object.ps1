<#
.SYNOPSIS
    基于开源 erpl-adt 创建 SAP 对象（PROG、TABL、TTYP、DTEL、DOMA、CLAS、INTF 等）。
.PARAMETER ObjectName
    对象名称，如 ZTMP、ZTINT_PUSH_TODO、ZCL_MY_CLASS
.PARAMETER ObjectType
    对象类型: PROG, TABL, TTYP, DTEL, DOMA, CLAS, INTF, FUGR, VIEW
.PARAMETER IsInclude
    仅当 ObjectType=PROG 时有效；若为 $true 则创建为 INCLUDE
.PARAMETER Package
    包名，默认 $TMP
#>
param(
    [Parameter(Mandatory = $true)]
    [string]$ObjectName,
    [string]$ObjectType = "PROG",
    [switch]$IsInclude,
    [string]$Package = '$TMP',
    [string]$ErplAdtPath = "",
    [string]$BaseUrl = "",
    [string]$Username = "",
    [string]$Password = "",
    [string]$Client = ""
)

Set-StrictMode -Version Latest
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
. (Join-Path $scriptDir "lib\\erpl-adt.ps1")

if (-not $BaseUrl -or -not $Username -or -not $Password) {
    Write-Error "Required: -BaseUrl, -Username, -Password, -Client. Use extension or pass explicitly."
    exit 1
}
if (-not $Client) { $Client = "200" }

# erpl-adt 类型码映射（ObjectType -> ADT type code）
$typeMap = @{
    "PROG" = "PROG/P"
    "TABL" = "TABL/DT"
    "TTYP" = "TTYP/TT"
    "DTEL" = "DTEL/DE"
    "DOMA" = "DOMA/DT"
    "CLAS" = "CLAS/OC"
    "INTF" = "INTF/OI"
    "FUGR" = "FUGR/F"
    "VIEW" = "VIEW/VB"
}
$typeUpper = $ObjectType.ToUpper()
if ($typeUpper -eq "PROG" -and $IsInclude) { $typeArg = "PROG/I" }
else { $typeArg = $typeMap[$typeUpper] }
if (-not $typeArg) { $typeArg = "PROG/P" }

$erplExe = if ($ErplAdtPath -and (Test-Path -LiteralPath $ErplAdtPath)) { $ErplAdtPath } else { Get-ErplAdtExePath }

$conn = Get-ErplConnectionArgs -BaseUrl $BaseUrl -Username $Username -Password $Password -Client $Client
$createArgs = @($conn.Args + @(
  'object','create',
  '--type', $typeArg,
  '--name', $ObjectName,
  '--package', $Package,
  '--description', ("ABAP: " + $ObjectName)
))

# 仅使用开源 erpl-adt，不再回退原生 ADT POST
if ($erplExe) {
    $res = Invoke-ErplAdt -ErplExe $erplExe -Args $createArgs
    $outStr = $res.Output
    if ($res.ExitCode -eq 0 -or $outStr -match "already exists") {
        Write-Host ("Created/exists (erpl-adt OSS): " + $ObjectName + " [" + $typeArg + "]")
        exit 0
    }
    Write-Error ($outStr.Trim())
    exit $res.ExitCode
}

Write-Error "erpl-adt not found. Install open-source CLI: pip install erpl-adt"
exit 1
