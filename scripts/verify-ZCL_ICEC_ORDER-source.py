#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Verify abap/ZCL_ICEC_ORDER.clas.abap is full class source (not pull error output).
Exit 0 if file is valid and can be patched; exit 1 with reason otherwise.
"""
import sys
from pathlib import Path

CLASS_FILE = Path(__file__).resolve().parent.parent / "abap" / "ZCL_ICEC_ORDER.clas.abap"
MIN_LINES = 5000  # 完整类约 12000+ 行
CLASS_DEF = "CLASS ZCL_ICEC_ORDER DEFINITION"
ENDCLASS = "ENDCLASS."


def main():
    if not CLASS_FILE.exists():
        print(f"FAIL: File not found: {CLASS_FILE}")
        return 1

    text = CLASS_FILE.read_text(encoding="utf-8", errors="replace")
    lines = text.splitlines()
    first = text.lstrip()[:200]
    last = text.strip()[-100:] if len(text) > 100 else text

    # 1) 行数过少 → 可能是错误输出
    if len(lines) < MIN_LINES:
        print(f"FAIL: File has only {len(lines)} lines (full class has ~12000+).")
        if "Write-Error" in text or "无法连接" in text or "ADT API failed" in text:
            print("Cause: File contains PowerShell/script error output, not class source.")
            print("Fix: Run scripts/sap-pull-ZCL_ICEC_ORDER.ps1 (with VPN/network) or paste full class from ADT.")
        return 1

    # 2) 首部不是 CLASS 定义
    if CLASS_DEF not in first and CLASS_DEF not in lines[0]:
        print("FAIL: File does not start with class definition (CLASS ZCL_ICEC_ORDER DEFINITION).")
        return 1

    # 3) 末尾没有 ENDCLASS
    if ENDCLASS not in last and ENDCLASS not in lines[-1]:
        print("FAIL: File does not end with ENDCLASS.")
        return 1

    print("OK: File looks like full class source; safe to apply patches.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
