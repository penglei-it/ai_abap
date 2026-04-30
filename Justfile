set shell := ["powershell.exe", "-NoProfile", "-Command"]

# 显示可用任务
default:
    just --list

# ADT 健康检查（执行前基线）
healthcheck OBJECT OBJECT_TYPE BASE_URL USERNAME PASSWORD CLIENT:
    .\scripts\sap-adt-healthcheck.ps1 -ObjectName {{OBJECT}} -ObjectType {{OBJECT_TYPE}} -BaseUrl {{BASE_URL}} -Username {{USERNAME}} -Password {{PASSWORD}} -Client {{CLIENT}}

# 本地闭环第一步：只拉取并准备 work 文件
prepare OBJECT OBJECT_TYPE BASE_URL USERNAME PASSWORD CLIENT:
    .\scripts\sap-adt-local-cycle.ps1 -ObjectName {{OBJECT}} -ObjectType {{OBJECT_TYPE}} -BaseUrl {{BASE_URL}} -Username {{USERNAME}} -Password {{PASSWORD}} -Client {{CLIENT}} -PrepareOnly

# 本地闭环第二步：写回 + 激活 + 回读校验
cycle OBJECT OBJECT_TYPE BASE_URL USERNAME PASSWORD CLIENT TRANSPORT:
    .\scripts\sap-adt-local-cycle.ps1 -ObjectName {{OBJECT}} -ObjectType {{OBJECT_TYPE}} -BaseUrl {{BASE_URL}} -Username {{USERNAME}} -Password {{PASSWORD}} -Client {{CLIENT}} -Transport {{TRANSPORT}}

# 读取远端对象到本地快照
pull OBJECT OBJECT_TYPE BASE_URL USERNAME PASSWORD CLIENT OUTFILE:
    .\scripts\sap-adt-read-object.ps1 -ObjectName {{OBJECT}} -ObjectType {{OBJECT_TYPE}} -BaseUrl {{BASE_URL}} -Username {{USERNAME}} -Password {{PASSWORD}} -Client {{CLIENT}} -OutputFile {{OUTFILE}}

# 按本地文件推送对象（带传输请求）
push OBJECT OBJECT_TYPE SOURCE_FILE BASE_URL USERNAME PASSWORD CLIENT TRANSPORT:
    .\scripts\sap-adt-write-object.ps1 -ObjectName {{OBJECT}} -ObjectType {{OBJECT_TYPE}} -SourceFile {{SOURCE_FILE}} -Activate:$true -BaseUrl {{BASE_URL}} -Username {{USERNAME}} -Password {{PASSWORD}} -Client {{CLIENT}} -Transport {{TRANSPORT}}

# ABAP 静态检查（依赖本地安装 abaplint）
lint:
    npx --yes @abaplint/cli@latest -c abaplint.json

# 凭据泄漏扫描（依赖本地安装 gitleaks）
secrets:
    gitleaks detect --source . --config .gitleaks.toml --redact

# 安装 GUI 替代 CLI 工具（fzf/gum/jq/yq/delta/bat/act/duckdb/sqlite-utils）
tools-install:
    .\scripts\install-cli-tools.ps1

# 仅安装最小工具集（fzf/gum/jq/yq）
tools-install-minimal:
    .\scripts\install-cli-tools.ps1 -Minimal

# 本地安装 pre-commit hooks
hooks-install-precommit:
    python -m pip install --upgrade pre-commit
    pre-commit install

# 本地安装 lefthook hooks
hooks-install-lefthook:
    winget install --id evilmartians.lefthook --exact --accept-source-agreements --accept-package-agreements
    lefthook install

# 使用 act 本地执行 GitHub Actions（需先安装 Docker）
ci-local:
    act
