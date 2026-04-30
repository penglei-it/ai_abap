<#
.SYNOPSIS
    基于开源 erpl-adt 写回 SAP ADT 对象源码。
#>
param(
    [Parameter(Mandatory = $true)]
    [string]$ObjectName,
    [string]$ObjectType = "PROG",
    [string]$SourceFile = "",
    [string]$Source = "",
    [switch]$IsInclude,
    [bool]$Activate = $true,
    [string]$ErplAdtPath = "",
    [string]$BaseUrl = "",
    [string]$Username = "",
    [string]$Password = "",
    [string]$Client = "",
    [string]$Transport = ""
)

if (-not $BaseUrl -or -not $Username -or -not $Password) {
    Write-Error "Required: -BaseUrl, -Username, -Password, -Client. Use extension or pass explicitly."
    exit 1
}
if (-not $Client) { $Client = "200" }

function Resolve-Transport {
    param(
        [string]$CurrentTransport
    )
    if ($CurrentTransport) { return $CurrentTransport.Trim() }

    $transportScript = Join-Path $scriptDir "sap-adt-transport.ps1"
    $list = @()
    try {
        $raw = & $transportScript -Action list -BaseUrl $BaseUrl -Username $Username -Password $Password -Client $Client 2>$null
        if ($LASTEXITCODE -eq 0 -and $raw) {
            $parsed = $raw | ConvertFrom-Json
            if ($parsed -is [System.Array]) { $list = $parsed }
            elseif ($parsed) { $list = @($parsed) }
        }
    } catch {
        $list = @()
    }

    Write-Host "No transport provided for write operation." -ForegroundColor Yellow
    if ($list.Count -gt 0) {
        Write-Host "Select a transport by number, or input M for manual entry:" -ForegroundColor Yellow
        for ($i = 0; $i -lt $list.Count; $i++) {
            $item = $list[$i]
            $num = if ($item.trkorr) { $item.trkorr } elseif ($item.number) { $item.number } elseif ($item.id) { $item.id } else { "" }
            $desc = if ($item.as4text) { $item.as4text } elseif ($item.description) { $item.description } else { "" }
            if ($num) { Write-Host ("[{0}] {1} {2}" -f ($i + 1), $num, $desc) }
        }
        $choice = Read-Host "Choice (1..$($list.Count) or M)"
        if ($choice -and $choice.Trim().ToUpperInvariant() -ne "M") {
            $idx = 0
            if ([int]::TryParse($choice, [ref]$idx) -and $idx -ge 1 -and $idx -le $list.Count) {
                $selected = $list[$idx - 1]
                $selectedNum = if ($selected.trkorr) { $selected.trkorr } elseif ($selected.number) { $selected.number } elseif ($selected.id) { $selected.id } else { "" }
                if ($selectedNum) { return ([string]$selectedNum).Trim() }
            }
        }
    }

    $inputTransport = Read-Host "Transport (example: DV2K9xxxxxx)"
    if (-not $inputTransport -or -not $inputTransport.Trim()) {
        Write-Error "Transport is required for write operation."
        exit 1
    }
    return $inputTransport.Trim()
}

function Find-ErplExe {
    param([string]$ExplicitPath)
    if ($ExplicitPath -and (Test-Path -LiteralPath $ExplicitPath)) { return $ExplicitPath }
    $defaultPath = Join-Path $env:LOCALAPPDATA "Python\pythoncore-3.14-64\Scripts\erpl-adt.exe"
    if (Test-Path $defaultPath) { return $defaultPath }
    $pyBase = Join-Path $env:LOCALAPPDATA "Python"
    if (Test-Path $pyBase) {
        $found = Get-ChildItem -Path $pyBase -Filter "erpl-adt.exe" -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($found) { return $found.FullName }
    }
    return $null
}

Set-StrictMode -Version Latest
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
. (Join-Path $scriptDir "lib\\erpl-adt.ps1")

$uriMap = @{
    "PROG" = "/sap/bc/adt/programs/programs/$ObjectName/source/main"
    "CLAS" = "/sap/bc/adt/oo/classes/$ObjectName/source/main"
    "INTF" = "/sap/bc/adt/oo/interfaces/$ObjectName/source/main"
    "FUGR" = "/sap/bc/adt/functions/groups/$ObjectName/source/main"
    "TABL" = "/sap/bc/adt/ddic/tables/$ObjectName/source/main"
    "STRU" = "/sap/bc/adt/ddic/structures/$ObjectName/source/main"
    "DTEL" = "/sap/bc/adt/ddic/dataelements/$ObjectName/source/main"
    "DOMA" = "/sap/bc/adt/ddic/domains/$ObjectName/source/main"
    "VIEW" = "/sap/bc/adt/ddic/views/$ObjectName/source/main"
    "TTYP" = "/sap/bc/adt/ddic/types/tabletypes/$ObjectName/source/main"
}
$objTypeUpper = $ObjectType.ToUpper()
$path = $uriMap[$objTypeUpper]
if (-not $path) { $path = "/sap/bc/adt/programs/programs/$ObjectName/source/main" }
if ($objTypeUpper -eq "PROG" -and $IsInclude) { $path = "/sap/bc/adt/programs/includes/$ObjectName/source/main" }

$base = $BaseUrl.TrimEnd('/')
$cred = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("${Username}:${Password}"))

if (-not $SourceFile -and -not $Source) {
    Write-Error "Specify -SourceFile or -Source"
    exit 1
}
$Transport = Resolve-Transport -CurrentTransport $Transport

$erplExe = if ($ErplAdtPath -and (Test-Path -LiteralPath $ErplAdtPath)) { $ErplAdtPath } else { Get-ErplAdtExePath }
if ($erplExe) {
    $uriObj = [System.Uri]$BaseUrl
    $useHttps = ($uriObj.Scheme -eq "https")
    $conn = Get-ErplConnectionArgs -BaseUrl $BaseUrl -Username $Username -Password $Password -Client $Client -AllowSelfSigned:([switch]($useHttps))
    $connArgs = $conn.Args

    $writeFilePath = $SourceFile
    $cleanupWriteFile = $null
    if (-not $writeFilePath -and $Source) {
        $tmpPath = Join-Path $env:TEMP ("adt-src-" + $ObjectName + "-" + [guid]::NewGuid().ToString("N") + ".abap")
        [System.IO.File]::WriteAllText($tmpPath, $Source, [System.Text.UTF8Encoding]::new($false))
        $writeFilePath = $tmpPath
        $cleanupWriteFile = $tmpPath
    }

    $writeArgs = @($connArgs + @("source", "write", $path, "--file", $writeFilePath))
    if ($Transport) { $writeArgs += @("--transport", $Transport) }
    if ($Activate) { $writeArgs += "--activate" }
    if ($useHttps) { $writeArgs += @("--https", "--insecure") }
    $res = Invoke-ErplAdt -ErplExe $erplExe -Args $writeArgs
    $rc = $res.ExitCode
    if ($cleanupWriteFile) { Remove-Item -LiteralPath $cleanupWriteFile -Force -ErrorAction SilentlyContinue }
    if ($rc -ne 0) {
        Write-Error ($res.Output.Trim())
        exit $rc
    }
    Write-Host ("Written (erpl-adt OSS): " + $ObjectName)
    exit 0
}

Write-Error "erpl-adt not found. Install open-source CLI: pip install erpl-adt"
exit 1
