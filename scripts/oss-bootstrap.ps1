<#
.SYNOPSIS
  一键部署“开源优先”的 ABAP 开发工具栈（Cursor/VS Code）。

.DESCRIPTION
  目标：尽可能用开源工具替代 SAP GUI 日常开发动作。
  本脚本会：
  1) 安装推荐扩展（含 Marketplace-only）
  2) 安装 ABAP FS 扩展（murbani.vscode-abap-remote-fs）
  3) 检查 erpl-adt 是否可用，不可用则尝试 pip 安装

.PARAMETER SkipExtensionInstall
  跳过扩展安装。

.PARAMETER SkipErplInstall
  跳过 erpl-adt 检查/安装。
#>
param(
  [switch]$SkipExtensionInstall,
  [switch]$SkipErplInstall
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

function Test-CommandAvailable {
  param([Parameter(Mandatory=$true)][string]$Name)
  $cmd = Get-Command $Name -ErrorAction SilentlyContinue
  return ($null -ne $cmd)
}

if (-not $SkipExtensionInstall) {
  Write-Host "[1/3] Install recommended extensions..."
  & (Join-Path $scriptDir "install-vscode-extensions.ps1") -IncludeMarketplaceOnly
  if ($LASTEXITCODE -ne 0) { throw "install-vscode-extensions.ps1 failed." }

  Write-Host "[2/3] Install ABAP FS (open-source VS Code extension)..."
  & (Join-Path $scriptDir "install-marketplace-vsix.ps1") -ExtensionIds @("murbani.vscode-abap-remote-fs") -Force
  if ($LASTEXITCODE -ne 0) { throw "Failed to install ABAP FS extension." }
}

if (-not $SkipErplInstall) {
  Write-Host "[3/3] Check erpl-adt..."
  $erpl = Get-Command erpl-adt -ErrorAction SilentlyContinue
  if (-not $erpl) {
    Write-Host "erpl-adt not found in PATH, trying: pip install erpl-adt"
    if (-not (Test-CommandAvailable -Name "pip")) { throw "Missing command: pip" }
    & pip install erpl-adt
    if ($LASTEXITCODE -ne 0) { throw "pip install erpl-adt failed." }
  } else {
    Write-Host ("erpl-adt found: " + $erpl.Source)
  }
}

Write-Host "OSS bootstrap completed. Restart Cursor/VS Code to ensure extensions are loaded."

