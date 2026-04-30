<#
.SYNOPSIS
  Generic push: create (optional) + write ABAP objects listed in a manifest JSON.

.MANIFEST FORMAT
  [
    { "name": "ZFOO", "type": "PROG", "file": "zfoo.prog.abap", "isInclude": false },
    { "name": "ZFOO_TOP", "type": "PROG", "file": "zfoo_top.inc.abap", "isInclude": true }
  ]
#>
param(
  [Parameter(Mandatory = $true)]
  [string]$ManifestPath,
  [string]$AbapDir = "",
  [string]$Package = '$TMP',
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

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
. (Join-Path $scriptDir "lib\\erpl-adt.ps1")
if (-not $AbapDir) { $AbapDir = Join-Path $scriptDir "..\abap" }
$AbapDir = $AbapDir.TrimEnd('\', '/')

function Resolve-Transport {
  param([string]$CurrentTransport)
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

  Write-Host "No transport provided for batch push." -ForegroundColor Yellow
  if ($list.Count -gt 0) {
    Write-Host "Select one transport for this batch, or input M for manual entry:" -ForegroundColor Yellow
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
    Write-Error "Transport is required for batch push."
    exit 1
  }
  return $inputTransport.Trim()
}

if (-not (Test-Path -LiteralPath $ManifestPath)) {
  Write-Error ("Manifest not found: " + $ManifestPath)
  exit 1
}

$writeScript  = Join-Path $scriptDir "sap-adt-write-object.ps1"
$createScript = Join-Path $scriptDir "sap-adt-create-object.ps1"

$erplAdtExe = Get-ErplAdtExePath

$items = Get-Content -LiteralPath $ManifestPath -Raw | ConvertFrom-Json
if (-not $items) { Write-Error "Empty manifest"; exit 1 }
$Transport = Resolve-Transport -CurrentTransport $Transport

$written = 0
$failed = @()

foreach ($it in $items) {
  $name = ""
  if ($null -ne $it.name) { $name = [string]$it.name }
  $name = $name.Trim()

  $type = "PROG"
  if ($null -ne $it.type -and ([string]$it.type).Trim()) { $type = ([string]$it.type).Trim() }
  $type = $type.ToUpper()

  $file = ""
  if ($null -ne $it.file) { $file = [string]$it.file }
  $file = $file.Trim()

  $isInclude = $false
  if ($null -ne $it.isInclude) { $isInclude = [bool]$it.isInclude }
  $activate = (-not $isInclude)
  if ($null -ne $it.activate) { $activate = [bool]$it.activate }

  if (-not $name -or -not $file) {
    $failed += "Invalid manifest item (missing name/file)"
    continue
  }

  $filePath = Join-Path $AbapDir $file
  if (-not (Test-Path -LiteralPath $filePath)) {
    $failed += ($name + ": file not found " + $filePath)
    continue
  }

  $connArgs = @{
    BaseUrl   = $BaseUrl
    Username  = $Username
    Password  = $Password
    Client    = $Client
    Transport = $Transport
  }
  if ($erplAdtExe) { $connArgs['ErplAdtPath'] = $erplAdtExe }

  $out = & $writeScript -ObjectName $name -ObjectType $type -SourceFile $filePath -IsInclude:([bool]$isInclude) -Activate:$activate @connArgs 2>&1
  if ($LASTEXITCODE -eq 0) { $written++; continue }

  $outStr = $out -join " "
  if ($outStr -match "404") {
    Write-Host ("  " + $name + " not found, creating...") -ForegroundColor Yellow
    $createArgs = @{ ObjectName = $name; ObjectType = $type; Package = $Package; BaseUrl = $BaseUrl; Username = $Username; Password = $Password; Client = $Client }
    if ($type -eq "PROG" -and $isInclude) { $createArgs['IsInclude'] = $true }
    if ($erplAdtExe) { $createArgs['ErplAdtPath'] = $erplAdtExe }
    & $createScript @createArgs 2>&1 | Out-Null
    Start-Sleep -Seconds 2
    & $writeScript -ObjectName $name -ObjectType $type -SourceFile $filePath -IsInclude:([bool]$isInclude) -Activate:$activate @connArgs 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) { $written++; continue }
    $failed += ($name + ": create or write failed")
    continue
  }

  $failed += ($name + ": " + $outStr)
}

Write-Host "---"
if ($failed.Count -gt 0) {
  Write-Host ("Failed: " + $failed.Count) -ForegroundColor Red
  $failed | ForEach-Object { Write-Host $_ -ForegroundColor Red }
}
Write-Host ("Written: " + $written + " / " + $items.Count) -ForegroundColor Green
if ($written -lt $items.Count) { exit 1 }

