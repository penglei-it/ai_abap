<#
.SYNOPSIS
  检查已整合的开源 GUI 替代增强组件状态。
#>
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Test-CmdAvailable([string]$Name) {
  $cmd = Get-Command $Name -ErrorAction SilentlyContinue
  return ($null -ne $cmd)
}

$extList = & code --list-extensions
if ($LASTEXITCODE -ne 0) {
  Write-Error "Failed to list extensions via code CLI."
  exit 1
}

$requiredExt = @(
  "murbani.vscode-abap-remote-fs",
  "larshp.vscode-abaplint",
  "sapse.sap-ux-fiori-tools-extension-pack",
  "saposs.sap-ux-sap-systems-ext"
)

Write-Host "=== Extension Status ==="
foreach ($id in $requiredExt) {
  $ok = ($extList -contains $id)
  Write-Host ("{0} : {1}" -f $id, $(if ($ok) { "OK" } else { "MISSING" }))
}

Write-Host "=== CLI Status ==="
$tools = @("erpl-adt", "npm", "npx")
foreach ($t in $tools) {
  Write-Host ("{0} : {1}" -f $t, $(if (Test-CmdAvailable $t) { "OK" } else { "MISSING" }))
}

Write-Host "=== Notes ==="
Write-Host "- abap-db-browser / DevEpos backend tools require SAP-side installation (abapGit import)."
Write-Host "- mcp-abap-adt requires local config (template in docs/mcp-abap-adt-config.example.json)."

exit 0

