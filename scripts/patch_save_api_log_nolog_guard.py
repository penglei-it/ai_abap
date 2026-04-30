#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
为 ABAP 类源码中的 save_api_log 调用统一补充 nolog 守卫。

处理规则：
1. 全量定位 save_api_log 调用（含被注释的调用）。
2. 若调用被注释，则先取消注释。
3. 若调用点未被 IF ls_ztint_icec_api-nolog IS INITIAL. 守卫，则补充守卫。
4. 已有守卫的调用不重复处理。
5. 输出核对结果，便于人工复查遗漏点。
"""

from __future__ import annotations

import argparse
import re
from dataclasses import dataclass
from pathlib import Path
from typing import List, Tuple


GUARD_IF = "IF ls_ztint_icec_api-nolog IS INITIAL."
GUARD_ENDIF = "ENDIF."
CALL_START_RE = re.compile(
    r"^\s*\*?\s*save_api_log\s*\(",
    re.IGNORECASE,
)


@dataclass
class CallBlock:
    start: int
    end: int
    lines: List[str]
    commented: bool


def _is_comment_line(line: str) -> bool:
    stripped = line.lstrip()
    return stripped.startswith("*")


def _contains_save_api_log(line: str) -> bool:
    return bool(CALL_START_RE.search(line))


def _collect_call_block(lines: List[str], start: int) -> Tuple[int, List[str]]:
    """
    从 start 开始收集 save_api_log 调用块，直到括号平衡结束。
    """
    block: List[str] = []
    depth = 0
    i = start
    started = False

    while i < len(lines):
        current = lines[i]
        block.append(current)

        # 对注释行也计数，避免“注释中的调用”无法正确闭合。
        for ch in current:
            if ch == "(":
                depth += 1
                started = True
            elif ch == ")":
                depth -= 1

        if started and depth <= 0:
            break
        i += 1

    return i, block


def _uncomment_block(block_lines: List[str]) -> List[str]:
    """
    仅取消调用块内“行首 * 注释”的注释，不改动行内双引号注释。
    """
    result: List[str] = []
    for raw in block_lines:
        if _is_comment_line(raw):
            # 保留原缩进，仅移除第一个注释星号及其后一个空格（若存在）
            prefix_len = len(raw) - len(raw.lstrip())
            stripped = raw.lstrip()
            # stripped 以 * 开头
            uncommented = stripped[1:]
            if uncommented.startswith(" "):
                uncommented = uncommented[1:]
            result.append(raw[:prefix_len] + uncommented)
        else:
            result.append(raw)
    return result


def _has_guard_before(lines: List[str], idx: int) -> bool:
    """
    向上扫描有限窗口，判断当前调用是否已经在 nolog IF 守卫内。
    """
    open_guard = 0
    # 限定窗口，避免跨方法误判
    window_start = max(0, idx - 80)
    for i in range(idx - 1, window_start - 1, -1):
        text = lines[i].strip()
        lower = text.lower()
        if not text or text.startswith("*"):
            continue
        if lower == GUARD_ENDIF.lower():
            open_guard += 1
            continue
        if lower == GUARD_IF.lower():
            if open_guard == 0:
                return True
            open_guard -= 1
            continue
        # 出现方法边界可提前停止，避免跨方法追溯
        if lower.startswith("method ") or lower.startswith("endmethod."):
            break
    return False


def _indent_of(line: str) -> str:
    return line[: len(line) - len(line.lstrip())]


def patch_file(path: Path, check_only: bool = False) -> int:
    source = path.read_text(
        encoding="utf-8",
        errors="ignore",
    ).splitlines(keepends=True)
    out: List[str] = []

    i = 0
    total_calls = 0
    uncommented_calls = 0
    newly_guarded_calls = 0
    already_guarded_calls = 0

    while i < len(source):
        line = source[i]
        if not _contains_save_api_log(line):
            out.append(line)
            i += 1
            continue

        # 抓取调用块（支持多行）
        end_idx, call_block = _collect_call_block(source, i)
        total_calls += 1

        was_commented = all(
            _is_comment_line(x) or not x.strip()
            for x in call_block
        )
        active_block = call_block
        if was_commented:
            active_block = _uncomment_block(call_block)
            uncommented_calls += 1

        # 基于“输出区”判断是否已有守卫，确保多次运行幂等
        call_start_in_out = len(out)
        guard_scan_pool = out + active_block + source[end_idx + 1:]
        if _has_guard_before(guard_scan_pool, call_start_in_out):
            out.extend(active_block)
            already_guarded_calls += 1
        else:
            indent = _indent_of(active_block[0]) if active_block else ""
            out.append(f"{indent}{GUARD_IF}\n")
            out.extend(active_block)
            out.append(f"{indent}{GUARD_ENDIF}\n")
            newly_guarded_calls += 1

        i = end_idx + 1

    result_text = "".join(out)
    original_text = "".join(source)
    changed = result_text != original_text

    print(f"[INFO] file={path}")
    print(f"[INFO] total_calls={total_calls}")
    print(f"[INFO] uncommented_calls={uncommented_calls}")
    print(f"[INFO] newly_guarded_calls={newly_guarded_calls}")
    print(f"[INFO] already_guarded_calls={already_guarded_calls}")
    print(f"[INFO] changed={changed}")

    # 二次核对：输出仍然未守卫的调用行号
    check_lines = result_text.splitlines()
    unresolved: List[int] = []
    for idx, content in enumerate(check_lines):
        if "save_api_log(" in content.lower():
            # 简化核对：向上 10 行内找守卫 IF
            low = max(0, idx - 10)
            window = "\n".join(check_lines[low:idx + 1]).lower()
            if GUARD_IF.lower() not in window:
                unresolved.append(idx + 1)

    if unresolved:
        print(f"[WARN] unresolved_calls={len(unresolved)} lines={unresolved}")
    else:
        print("[INFO] unresolved_calls=0")

    if not check_only and changed:
        path.write_text(result_text, encoding="utf-8")
        print("[INFO] file_updated=true")
    else:
        print("[INFO] file_updated=false")

    return 0


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Patch save_api_log with nolog guard.",
    )
    parser.add_argument(
        "--file",
        default=r"C:\Ai_Abap\abap\ZCL_ICEC_ORDER.clas.abap",
        help="ABAP class source file path",
    )
    parser.add_argument(
        "--check-only",
        action="store_true",
        help="Only check and print report, do not write file",
    )
    args = parser.parse_args()

    path = Path(args.file)
    if not path.exists():
        print(f"[ERROR] file_not_found={path}")
        return 2

    return patch_file(path=path, check_only=args.check_only)


if __name__ == "__main__":
    raise SystemExit(main())
