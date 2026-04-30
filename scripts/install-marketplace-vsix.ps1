<#
.SYNOPSIS
  从 VS Code Marketplace 拉取扩展 VSIX 并安装（适用于 Cursor/Open VSX 搜不到的扩展）。

.DESCRIPTION
  Cursor 的 `code --install-extension publisher.ext` 往往走 Open VSX 源，导致部分只发布在 Marketplace 的扩展“not found”。
  本脚本通过 Marketplace 的 public Gallery API 查询最新版本并下载 VSIX，然后调用 `code --install-extension <path.vsix>` 安装。

.PARAMETER ExtensionIds
  扩展 ID 数组，例如：SAPSE.sap-ux-fiori-tools-extension-pack

.PARAMETER Force
  强制重装（传给 `code --install-extension` 的 `--force`）。
#>

param(
  [Parameter(Mandatory = $true)][string[]]$ExtensionIds,
  [switch]$Force
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Require-CodeCli {
  $cmd = Get-Command code -ErrorAction SilentlyContinue
  if (-not $cmd) { throw "code CLI not found. Ensure VS Code/Cursor is installed and 'code' is on PATH." }
}

function Split-ExtId {
  param([Parameter(Mandatory=$true)][string]$Id)
  # publisher.name（只需要一个点分隔即可；不要把 '.' 误转义成 '\\.'）
  if ($Id -notmatch '^[^.]+\.[^.]+$') { throw "Invalid extension id: $Id (expected publisher.name)" }
  $parts = $Id.Split('.', 2)
  return @{ Publisher = $parts[0]; Name = $parts[1] }
}

function Query-MarketplaceExtension {
  param(
    [Parameter(Mandatory=$true)][string]$Publisher,
    [Parameter(Mandatory=$true)][string]$Name
  )

  $uri = "https://marketplace.visualstudio.com/_apis/public/gallery/extensionquery"
  $body = @{
    filters = @(
      @{
        criteria = @(
          @{ filterType = 7; value = "$Publisher.$Name" } # ExtensionName
        )
        pageNumber = 1
        pageSize = 1
        sortBy = 0
        sortOrder = 0
      }
    )
    flags = 0x1 + 0x2 + 0x4 + 0x10 + 0x20 + 0x80 + 0x100 # include versions + files
  } | ConvertTo-Json -Depth 10

  $headers = @{
    "Accept" = "application/json;api-version=7.1-preview.1"
    "Content-Type" = "application/json"
  }

  return Invoke-RestMethod -Method Post -Uri $uri -Headers $headers -Body $body
}

function Get-LatestVsixAsset {
  param([Parameter(Mandatory=$true)]$ExtQueryResult)

  $ext = $ExtQueryResult.results[0].extensions[0]
  if (-not $ext) { return $null }
  $ver = $ext.versions | Select-Object -First 1
  if (-not $ver) { return $null }

  $file = $ver.files | Where-Object { $_.assetType -eq "Microsoft.VisualStudio.Services.VSIXPackage" } | Select-Object -First 1
  if (-not $file) { return $null }

  return @{
    ExtensionName = $ext.extensionName
    Publisher = $ext.publisher.publisherName
    Version = $ver.version
    VsixUri = $file.source
  }
}

function Download-FileUtf8Safe {
  param([Parameter(Mandatory=$true)][string]$Uri, [Parameter(Mandatory=$true)][string]$OutFile)
  # VSIX 是二进制；用 -OutFile 避免编码问题
  Invoke-WebRequest -Uri $Uri -OutFile $OutFile -UseBasicParsing
}

Require-CodeCli

$tempDir = Join-Path $env:TEMP ("vscode-vsix-" + [guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Path $tempDir | Out-Null

try {
  foreach ($id in $ExtensionIds) {
    Write-Host ("Resolve (Marketplace): " + $id)
    $p = Split-ExtId -Id $id
    $q = Query-MarketplaceExtension -Publisher $p.Publisher -Name $p.Name
    $asset = Get-LatestVsixAsset -ExtQueryResult $q
    if (-not $asset) { throw "Failed to resolve VSIX asset from Marketplace for: $id" }

    $vsixPath = Join-Path $tempDir ($id + "-" + $asset.Version + ".vsix")
    Write-Host ("Download VSIX: " + $asset.VsixUri)
    Download-FileUtf8Safe -Uri $asset.VsixUri -OutFile $vsixPath

    Write-Host ("Install VSIX: " + $vsixPath)
    if ($Force) {
      & code --install-extension $vsixPath --force
    } else {
      & code --install-extension $vsixPath
    }
    if ($LASTEXITCODE -ne 0) { throw "Failed to install VSIX for: $id" }
  }

  Write-Host "Marketplace VSIX install done. Restart VS Code/Cursor."
} finally {
  if (Test-Path -LiteralPath $tempDir) {
    Remove-Item -LiteralPath $tempDir -Recurse -Force -ErrorAction SilentlyContinue
  }
}

