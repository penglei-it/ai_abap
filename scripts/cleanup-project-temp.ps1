<#
.SYNOPSIS
  清理项目中的临时文件与验证产物（安全范围限定在仓库目录内）。

.DESCRIPTION
  用于定期整理项目结构，移除调试/验证阶段产生的临时文件，避免仓库内容膨胀与噪音。

.PARAMETER WhatIf
  预览模式：仅显示将删除的文件，不执行删除。

.PARAMETER IncludeAbapSnapshots
  是否同时清理 `abap/` 下的 read/verify/sidefx 快照文件。
#>
param(
  [switch]$WhatIf,
  [switch]$IncludeAbapSnapshots
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $PSScriptRoot

$scanGroups = @(
  @{ Path = $projectRoot; Pattern = "tmp_*.log"; Recurse = $false },
  @{ Path = $projectRoot; Pattern = "tmp_*.txt"; Recurse = $false },
  @{ Path = $projectRoot; Pattern = "tmp_*.json"; Recurse = $false },
  @{ Path = (Join-Path $projectRoot "scripts\__pycache__"); Pattern = "*.pyc"; Recurse = $false }
)

if ($IncludeAbapSnapshots) {
  $abapDir = Join-Path $projectRoot "abap"
  $scanGroups += @(
    @{ Path = $abapDir; Pattern = "*.sidefx.*"; Recurse = $false },
    @{ Path = $abapDir; Pattern = "*.verify.*"; Recurse = $false },
    @{ Path = $abapDir; Pattern = "*.read.*"; Recurse = $false },
    @{ Path = $abapDir; Pattern = "*.remote.*"; Recurse = $false },
    @{ Path = $abapDir; Pattern = "*.active.*"; Recurse = $false },
    @{ Path = $abapDir; Pattern = "*.inactive.*"; Recurse = $false },
    @{ Path = $abapDir; Pattern = "*.before.*"; Recurse = $false },
    @{ Path = $abapDir; Pattern = "*.after.*"; Recurse = $false },
    @{ Path = $abapDir; Pattern = "*.fresh.*"; Recurse = $false },
    @{ Path = $abapDir; Pattern = "*.restored.*"; Recurse = $false },
    @{ Path = $abapDir; Pattern = "tmp_*.xml"; Recurse = $false }
  )
}

$allTargets = @()
foreach ($g in $scanGroups) {
  if (-not (Test-Path -LiteralPath $g.Path)) { continue }
  if ($g.Recurse) {
    $allTargets += Get-ChildItem -Path $g.Path -Recurse -File -Filter $g.Pattern -ErrorAction SilentlyContinue
  } else {
    $allTargets += Get-ChildItem -Path $g.Path -File -Filter $g.Pattern -ErrorAction SilentlyContinue
  }
}

$targets = $allTargets | Sort-Object -Property FullName -Unique

if (-not $targets -or $targets.Count -eq 0) {
  Write-Host "No temp files matched."
  exit 0
}

Write-Host ("Matched files: " + $targets.Count)
$targets | ForEach-Object { Write-Host ("- " + $_.FullName) }

if ($WhatIf) {
  Write-Host "WhatIf mode enabled, nothing deleted."
  exit 0
}

foreach ($f in $targets) {
  Remove-Item -LiteralPath $f.FullName -Force -ErrorAction SilentlyContinue
}

Write-Host "Cleanup done."

