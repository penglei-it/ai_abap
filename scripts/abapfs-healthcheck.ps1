<#
.SYNOPSIS
  检查 ABAP FS 扩展与基础命令可用性（Cursor/VS Code）。
#>
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$required = @(
  "murbani.vscode-abap-remote-fs",
  "larshp.vscode-abaplint"
)

$list = & code --list-extensions
if ($LASTEXITCODE -ne 0) {
  Write-Error "Failed to list VS Code extensions via code CLI."
  exit 1
}

$missing = @()
foreach ($id in $required) {
  if (-not ($list -contains $id)) { $missing += $id }
}

if ($missing.Count -gt 0) {
  Write-Host "Missing extensions:"
  $missing | ForEach-Object { Write-Host ("- " + $_) }
  exit 1
}

Write-Host "ABAPFS_HEALTHCHECK_PASS"
exit 0

