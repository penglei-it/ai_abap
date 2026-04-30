<#
.SYNOPSIS
  安装可本地落地的开源增强组件（GUI 替代增强）。

.DESCRIPTION
  该脚本聚焦“本机即可安装”的能力：
  - ABAP FS（VS Code 扩展）已通过 oss-bootstrap 覆盖
  - mcp-abap-adt（Node 包，供外部 MCP 客户端使用）
  - 生成 mcp-abap-adt 配置模板（不含敏感信息）

.PARAMETER InstallMcpAbapAdt
  安装 mcp-abap-adt（npm 全局）。

.PARAMETER Force
  安装时使用强制模式（npm --force）。
#>
param(
  [switch]$InstallMcpAbapAdt,
  [switch]$Force
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectRoot = Split-Path -Parent $scriptDir

function Test-CommandAvailable {
  param([Parameter(Mandatory = $true)][string]$Name)
  $cmd = Get-Command $Name -ErrorAction SilentlyContinue
  return ($null -ne $cmd)
}

function Write-McpTemplate {
  $outPath = Join-Path $projectRoot "docs\mcp-abap-adt-config.example.json"
  $content = @'
{
  "mcpServers": {
    "mcp-abap-adt": {
      "command": "npx",
      "args": [
        "-y",
        "mcp-abap-adt"
      ],
      "env": {
        "ABAP_ADT_BASE_URL": "http://<host>:<port>",
        "ABAP_ADT_CLIENT": "200",
        "ABAP_ADT_USER": "<user>",
        "ABAP_ADT_PASSWORD": "<password>"
      }
    }
  }
}
'@
  [System.IO.File]::WriteAllText($outPath, $content, [System.Text.UTF8Encoding]::new($false))
  Write-Host ("Wrote MCP config template: " + $outPath)
}

if ($InstallMcpAbapAdt) {
  if (-not (Test-CommandAvailable -Name "npm")) {
    throw "npm not found. Please install Node.js first."
  }
  Write-Host "Installing mcp-abap-adt via npm..."
  if ($Force) {
    & npm install -g mcp-abap-adt --force
  } else {
    & npm install -g mcp-abap-adt
  }
  if ($LASTEXITCODE -ne 0) {
    throw "npm install -g mcp-abap-adt failed."
  }
}

Write-McpTemplate
Write-Host "OSS add-ons setup completed."

