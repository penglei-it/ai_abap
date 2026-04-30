param(
  [Parameter(Mandatory = $true)][string]$ObjectName,
  [string]$ObjectType = "CLAS",
  [Parameter(Mandatory = $true)][string]$BaseUrl,
  [Parameter(Mandatory = $true)][string]$Username,
  [Parameter(Mandatory = $true)][string]$Password,
  [Parameter(Mandatory = $true)][string]$Client,
  [switch]$IgnoreLockProbe403Editing,
  [switch]$Json
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
. (Join-Path $scriptDir "lib\\erpl-adt.ps1")

function Get-LockHandleFromOutput {
  param([Parameter(Mandatory = $true)][string]$OutputText)
  if ($OutputText -match '"handle"\s*:\s*"([^"]+)"') { return $Matches[1] }
  return $null
}

$result = [ordered]@{
  objectName = $ObjectName
  objectType = $ObjectType.ToUpperInvariant()
  erplAdtFound = $false
  canReadActive = $false
  canReadInactive = $false
  lockAcquireOk = $false
  lockReleaseOk = $false
  activeInactiveDifferent = $null
  errors = @()
}

$erplExe = Get-ErplAdtExePath
if (-not $erplExe) {
  $result.errors += "erpl-adt not found. Install: pip install erpl-adt"
  if ($Json) { $result | ConvertTo-Json -Depth 5 } else { Write-Host "FAIL: erpl-adt not found." }
  exit 1
}
$result.erplAdtFound = $true

$conn = Get-ErplConnectionArgs -BaseUrl $BaseUrl -Username $Username -Password $Password -Client $Client
$connArgs = $conn.Args
$objType = $ObjectType.ToUpperInvariant()
$objUri = if ($objType -eq "INTF") { "/sap/bc/adt/oo/interfaces/$ObjectName" } elseif ($objType -eq "CLAS") { "/sap/bc/adt/oo/classes/$ObjectName" } else { "/sap/bc/adt/programs/programs/$ObjectName" }

$readActive = Invoke-ErplAdt -ErplExe $erplExe -Args ($connArgs + @("source", "read", $ObjectName, "--type", $objType, "--section", "main", "--version", "active", "--no-color"))
if ($readActive.ExitCode -eq 0) {
  $result.canReadActive = $true
} else {
  $result.errors += ("read active failed: " + $readActive.Output.Trim())
}

$readInactive = Invoke-ErplAdt -ErplExe $erplExe -Args ($connArgs + @("source", "read", $ObjectName, "--type", $objType, "--section", "main", "--version", "inactive", "--no-color"))
if ($readInactive.ExitCode -eq 0) {
  $result.canReadInactive = $true
} else {
  $result.errors += ("read inactive failed: " + $readInactive.Output.Trim())
}

if ($result.canReadActive -and $result.canReadInactive) {
  $result.activeInactiveDifferent = ($readActive.Output -ne $readInactive.Output)
}

$lockConflictIgnored = $false
if ($objType -eq "CLAS" -or $objType -eq "INTF") {
  $lockRes = Invoke-ErplAdt -ErplExe $erplExe -Args ($connArgs + @("--json", "object", "lock", $objUri))
  if ($lockRes.ExitCode -eq 0) {
    $handle = Get-LockHandleFromOutput -OutputText $lockRes.Output
    if ($handle) {
      $result.lockAcquireOk = $true
      $unlockRes = Invoke-ErplAdt -ErplExe $erplExe -Args ($connArgs + @("object", "unlock", $objUri, "--handle", $handle))
      if ($unlockRes.ExitCode -eq 0) {
        $result.lockReleaseOk = $true
      } else {
        $result.errors += ("unlock failed: " + $unlockRes.Output.Trim())
      }
    } else {
      $result.errors += "lock succeeded but handle parse failed"
    }
  } else {
    $is403 = ($lockRes.Output -match '403')
    $isEditingConflict = ($lockRes.Output -match 'currently editing')
    if ($IgnoreLockProbe403Editing -and $is403 -and $isEditingConflict) {
      $lockConflictIgnored = $true
      $result.errors += ("lock conflict ignored (403 currently editing): " + $lockRes.Output.Trim())
    } else {
      $result.errors += ("lock failed: " + $lockRes.Output.Trim())
    }
  }
}

if ($conn -and $conn.PasswordEnvVar) {
  [Environment]::SetEnvironmentVariable($conn.PasswordEnvVar, $null, "Process")
}

$ok = $result.erplAdtFound -and $result.canReadActive -and $result.canReadInactive
if ($objType -eq "CLAS" -or $objType -eq "INTF") {
  if (-not ($IgnoreLockProbe403Editing -and $lockConflictIgnored)) {
    $ok = $ok -and $result.lockAcquireOk -and $result.lockReleaseOk
  }
}

if ($Json) {
  $result | ConvertTo-Json -Depth 5
} else {
  Write-Host ("Object: " + $result.objectName + " (" + $result.objectType + ")")
  Write-Host ("erpl-adt found: " + $result.erplAdtFound)
  Write-Host ("read active: " + $result.canReadActive)
  Write-Host ("read inactive: " + $result.canReadInactive)
  Write-Host ("active/inactive different: " + $result.activeInactiveDifferent)
  Write-Host ("lock acquire: " + $result.lockAcquireOk)
  Write-Host ("lock release: " + $result.lockReleaseOk)
  if ($result.errors.Count -gt 0) {
    Write-Host "errors:"
    $result.errors | ForEach-Object { Write-Host ("- " + $_) }
  }
  Write-Host ("overall: " + ($(if ($ok) { "PASS" } else { "FAIL" })))
}

if ($ok) { exit 0 } else { exit 1 }

