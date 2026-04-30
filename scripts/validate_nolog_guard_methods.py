#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
校验 ABAP 类方法中 nolog 守卫与查表变量的一致性。

规则：
1. 方法中若出现 IF ls_ztint_icec_api-nolog IS INITIAL.
2. 同方法中需存在 ls_ztint_icec_api 来源
   （例如 SELECT ... INTO @DATA(ls_ztint_icec_api)）。
"""

from __future__ import annotations

import re
from pathlib import Path
from typing import List, Tuple


METHOD_START = re.compile(r"^\s*METHOD\s+([a-zA-Z0-9_]+)\.\s*$", re.IGNORECASE)
METHOD_END = re.compile(r"^\s*ENDMETHOD\.\s*$", re.IGNORECASE)
GUARD_RE = re.compile(
    r"^\s*IF\s+ls_ztint_icec_api-nolog\s+IS\s+INITIAL\.\s*$",
    re.IGNORECASE,
)
SELECT_SINGLE_RE = re.compile(r"SELECT\s+SINGLE", re.IGNORECASE)
FROM_API_RE = re.compile(r"FROM\s+ztint_icec_api", re.IGNORECASE)
TARGET_VAR_RE = re.compile(r"\bls_ztint_icec_api\b", re.IGNORECASE)
DECL_RE = re.compile(
    r"DATA\s+ls_ztint_icec_api\s+TYPE\s+ztint_icec_api",
    re.IGNORECASE,
)


def split_methods(lines: List[str]) -> List[Tuple[str, int, int, List[str]]]:
    methods: List[Tuple[str, int, int, List[str]]] = []
    i = 0
    while i < len(lines):
        m = METHOD_START.match(lines[i])
        if not m:
            i += 1
            continue
        name = m.group(1)
        start = i
        j = i + 1
        while j < len(lines):
            if METHOD_END.match(lines[j]):
                break
            j += 1
        block = lines[start: j + 1] if j < len(lines) else lines[start:]
        methods.append((name, start + 1, min(j + 1, len(lines)), block))
        i = j + 1
    return methods


def check_file(path: Path) -> List[str]:
    text = path.read_text(encoding="utf-8", errors="ignore")
    lines = text.splitlines()
    issues: List[str] = []

    for name, start, _end, block in split_methods(lines):
        has_guard = any(GUARD_RE.match(x or "") for x in block)
        if not has_guard:
            continue
        method_text = "\n".join(block)
        has_select_source = (
            SELECT_SINGLE_RE.search(method_text) is not None
            and FROM_API_RE.search(method_text) is not None
            and TARGET_VAR_RE.search(method_text) is not None
        )
        has_decl_source = DECL_RE.search(method_text) is not None
        has_source = has_select_source or has_decl_source
        if not has_source:
            issues.append(
                (
                    f"{path.name}:{start}: method {name} has guard "
                    "but no ls_ztint_icec_api source"
                )
            )
    return issues


def main() -> int:
    root = Path(r"C:\Ai_Abap\abap")
    files = sorted(root.glob("ZCL_ICEC*.clas.abap"))
    all_issues: List[str] = []
    checked = 0
    for file_path in files:
        checked += 1
        all_issues.extend(check_file(file_path))

    print(f"[INFO] checked_files={checked}")
    if all_issues:
        print(f"[WARN] issues={len(all_issues)}")
        for issue in all_issues:
            print(issue)
    else:
        print("[INFO] issues=0")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
