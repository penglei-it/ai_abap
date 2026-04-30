<#
.SYNOPSIS
  在当前机器上安装本仓库推荐的 VS Code/Cursor 扩展。

.DESCRIPTION
  通过 `code --install-extension <publisher.name>` 安装扩展。
  适用于 VS Code / Cursor（只要存在 `code` CLI）。

.PARAMETER Minimal
  仅安装和 ABAP/ADT 脚本工作流强相关的扩展（默认）。

.PARAMETER All
  安装完整推荐集合（目前与 Minimal 相同，预留扩展）。
#>

param(
  [switch]$Minimal,
  [switch]$All,
  [switch]$IncludeMarketplaceOnly
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Require-CodeCli {
  $cmd = Get-Command code -ErrorAction SilentlyContinue
  if (-not $cmd) { throw "code CLI not found. Ensure VS Code/Cursor is installed and 'code' is on PATH." }
}

function Install-Ext {
  param([Parameter(Mandatory=$true)][string]$Id)
  Write-Host ("Installing: " + $Id)
  & code --install-extension $Id
  if ($LASTEXITCODE -ne 0) { throw ("Failed to install: " + $Id) }
}

Require-CodeCli

$set = @(
  # ABAP quality / lint / navigation
  "larshp.vscode-abaplint",

  # CDS language support
  "sapse.vscode-cds",

  # Repo scripts are PowerShell-heavy
  "ms-vscode.PowerShell",

  # Common config/docs
  "redhat.vscode-yaml",

  # ADT REST debugging / quick HTTP probes
  "humao.rest-client",

  # Git ergonomics
  "eamodio.gitlens",

  # EditorConfig support (consistent formatting)
  "EditorConfig.EditorConfig"
)

foreach ($id in $set) {
  try {
    Install-Ext -Id $id
  } catch {
    Write-Warning $_.Exception.Message
  }
}

Write-Host ""
Write-Host "Marketplace-only (may not be available in Cursor/Open VSX):"
$marketplaceOnly = @(
  "SAPSE.sap-ux-fiori-tools-extension-pack",
  "saposs.sap-ux-sap-systems-ext"
)
Write-Host ("- " + ($marketplaceOnly -join "`n- "))
Write-Host "If you pass -IncludeMarketplaceOnly, the installer will fetch VSIX from Marketplace and install."

if ($IncludeMarketplaceOnly) {
  $scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
  $mpInstaller = Join-Path $scriptDir "install-marketplace-vsix.ps1"
  if (-not (Test-Path -LiteralPath $mpInstaller)) {
    throw ("Missing script: " + $mpInstaller)
  }
  & $mpInstaller -ExtensionIds $marketplaceOnly -Force
  if ($LASTEXITCODE -ne 0) { throw "Marketplace-only extension install failed." }
}

Write-Host "Done. Restart VS Code/Cursor to load extensions."

