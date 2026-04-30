<#
.SYNOPSIS
    通过 ABAP FS MCP Server 读取 SAP 对象代码
.DESCRIPTION
    调用 localhost:4847 的 MCP 接口，使用 get_abap_object_lines 工具读取 ABAP 对象。
    前置条件：Cursor 已打开、已连接 SAP (Ctrl+Alt+A)、MCP Server 已启动（设置 abapfs.mcpServer.autoStart: true）
.PARAMETER ObjectName
    对象名称，如 ZTMP
.PARAMETER ObjectType
    对象类型，如 PROG（报表）、CLAS（类）
.PARAMETER ConnectionId
    SAP 连接 ID，默认 CT-DV2
.EXAMPLE
    .\sap-mcp-read-object.ps1 -ObjectName ZTMP -ObjectType PROG
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$ObjectName,
    [string]$ObjectType = "PROG",
    [string]$ConnectionId = "CT-DV2"
)

$mcpUrl = "http://localhost:4847/mcp"
$body = @{
    jsonrpc = "2.0"
    id = 1
    method = "tools/call"
    params = @{
        name = "get_abap_object_lines"
        arguments = @{
            objectName = $ObjectName
            objectType = $ObjectType
            connectionId = $ConnectionId
            lineCount = 500
        }
    }
} | ConvertTo-Json -Depth 10

try {
    $response = Invoke-RestMethod -Uri $mcpUrl -Method Post -Body $body -ContentType "application/json" -TimeoutSec 30
    if ($response.result) {
        $content = $response.result.content
        if ($content -is [array]) {
            foreach ($item in $content) {
                if ($item.text) { Write-Output $item.text }
            }
        }
    } elseif ($response.error) {
        Write-Error "MCP Error: $($response.error.message)"
    }
} catch {
    Write-Error "请求失败: $_"
    Write-Host "请确保: 1) Cursor 已打开 2) 已连接 SAP (Ctrl+Alt+A) 3) MCP Server 已启动 (端口 4847)"
}
