<#
.SYNOPSIS
  安装用于替代 GUI 的开源命令行工具。

.DESCRIPTION
  默认通过 winget 安装常用 CLI，并通过 pip 安装 sqlite-utils。
  若本机缺少 winget，会提示改为手工安装。

.PARAMETER Minimal
  仅安装核心工具（fzf/gum/jq/yq）。

.PARAMETER SkipPythonTools
  跳过 Python 工具（sqlite-utils）安装。
#>
param(
  [switch]$Minimal,
  [switch]$SkipPythonTools
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Test-Cmd {
  param([Parameter(Mandatory = $true)][string]$Name)
  return ($null -ne (Get-Command $Name -ErrorAction SilentlyContinue))
}

function Install-WingetPackage {
  param(
    [Parameter(Mandatory = $true)][string]$Id,
    [Parameter(Mandatory = $true)][string]$CheckCommand
  )
  if (Test-Cmd -Name $CheckCommand) {
    Write-Host ("Already installed: " + $CheckCommand)
    return
  }
  Write-Host ("Installing: " + $Id)
  & winget install --id $Id --exact --accept-source-agreements --accept-package-agreements
  if ($LASTEXITCODE -ne 0) {
    Write-Warning ("winget install failed: " + $Id)
  }
}

if (-not (Test-Cmd -Name "winget")) {
  throw "winget not found. Please install tools manually."
}

$toolList = @(
  @{ id = "junegunn.fzf"; cmd = "fzf" },
  @{ id = "Charmbracelet.Gum"; cmd = "gum" },
  @{ id = "jqlang.jq"; cmd = "jq" },
  @{ id = "mikefarah.yq"; cmd = "yq" }
)

if (-not $Minimal) {
  $toolList += @(
    @{ id = "dandavison.delta"; cmd = "delta" },
    @{ id = "sharkdp.bat"; cmd = "bat" },
    @{ id = "nektos.act"; cmd = "act" },
    @{ id = "duckdb.duckdb"; cmd = "duckdb" }
  )
}

foreach ($tool in $toolList) {
  Install-WingetPackage -Id $tool.id -CheckCommand $tool.cmd
}

if (-not $SkipPythonTools) {
  if (-not (Test-Cmd -Name "python")) {
    Write-Warning "python not found, skip sqlite-utils install."
  } else {
    Write-Host "Installing sqlite-utils by pip..."
    & python -m pip install --upgrade sqlite-utils
    if ($LASTEXITCODE -ne 0) { Write-Warning "pip install sqlite-utils failed." }
  }
}

Write-Host "CLI tools installation finished. Restart terminal to refresh PATH."
