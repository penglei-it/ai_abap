<#
.SYNOPSIS
  下载/更新开源 abap-skills 的大体积 reference 数据到本仓库（避免直接入库导致膨胀）。

.DESCRIPTION
  当前会下载：
  - released-abap-classes: Released_ABAP_Classes.md
  - sap-fiori-apps-reference: AppList.json

.PARAMETER Force
  强制覆盖已存在的文件。
#>

param(
  [switch]$Force
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$root = "C:\\Ai_Abap"

$targets = @(
  @{
    Name = "released-abap-classes"
    Url  = "https://raw.githubusercontent.com/likweitan/abap-skills/main/skills/released-abap-classes/references/Released_ABAP_Classes.md"
    Path = Join-Path $root ".cursor\\skills\\released-abap-classes\\references\\Released_ABAP_Classes.md"
  },
  @{
    Name = "sap-fiori-apps-reference"
    Url  = "https://raw.githubusercontent.com/likweitan/abap-skills/main/skills/sap-fiori-apps-reference/references/AppList.json"
    Path = Join-Path $root ".cursor\\skills\\sap-fiori-apps-reference\\references\\AppList.json"
  }
)

foreach ($t in $targets) {
  $dir = Split-Path -Parent $t.Path
  if (-not (Test-Path -LiteralPath $dir)) { New-Item -ItemType Directory -Path $dir | Out-Null }

  if ((Test-Path -LiteralPath $t.Path) -and (-not $Force)) {
    Write-Host ("Skip (exists): " + $t.Name + " -> " + $t.Path)
    continue
  }

  Write-Host ("Download: " + $t.Name + " <- " + $t.Url)
  $res = Invoke-WebRequest -Uri $t.Url -UseBasicParsing

  # GitHub raw 内容是 UTF-8；这里显式写 UTF-8 无 BOM，避免后续被误判为 UTF-16。
  [System.IO.File]::WriteAllText($t.Path, $res.Content, [System.Text.UTF8Encoding]::new($false))
  Write-Host ("Saved: " + $t.Path)
}

