#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""将 ORDER_API 中按 URL 查 nolog 改为按 service+method 查。"""

from __future__ import annotations

import re
import argparse
from pathlib import Path


METHOD_BLOCK_RE = re.compile(
    r"(^\s*METHOD\s+[a-zA-Z0-9_]+\.\s*$)(.*?)(^\s*ENDMETHOD\.\s*$)",
    re.IGNORECASE | re.MULTILINE | re.DOTALL,
)
GET_PATH_RE = re.compile(
    (
        r"get_path\(\s*EXPORTING\s+iv_service\s*=\s*'([^']+)'\s+"
        r"iv_method\s*=\s*'([^']+)'\s*\)"
    ),
    re.IGNORECASE | re.DOTALL,
)
NOLOG_BY_URL_RE = re.compile(
    (
        r"SELECT SINGLE nolog FROM ztint_icec_api INTO "
        r"@DATA\(lv_nolog_1\)\s+WHERE url = @lv_uri\."
    ),
    re.IGNORECASE,
)


def replace_method(match: re.Match[str]) -> str:
    header = match.group(1)
    body = match.group(2)
    footer = match.group(3)

    m = GET_PATH_RE.search(body)
    if not m:
        return match.group(0)
    service, method = m.group(1), m.group(2)

    repl = (
        "SELECT SINGLE nolog FROM ztint_icec_api INTO @DATA(lv_nolog_1) "
        f"WHERE service = '{service}' AND method = '{method}'."
    )
    new_body = NOLOG_BY_URL_RE.sub(repl, body)
    return f"{header}{new_body}{footer}"


def main() -> int:
    parser = argparse.ArgumentParser(
        description="将按 URL 查询 nolog 改为按 service+method 查询"
    )
    parser.add_argument("--file", required=True, help="目标 ABAP 文件路径")
    args = parser.parse_args()

    file_path = Path(args.file)
    text = file_path.read_text(encoding="utf-8", errors="ignore")
    new_text = METHOD_BLOCK_RE.sub(replace_method, text)
    file_path.write_text(new_text, encoding="utf-8")
    print("patched")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
