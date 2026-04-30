import argparse
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser(description="替换 ABAP 注释文本")
    parser.add_argument("--file", required=True, help="目标 ABAP 文件路径")
    parser.add_argument(
        "--old",
        default='DV2K925273: 仅当 nolog 标志未设置时，才保存 API 日志。日志关闭时跳过 save_api_log。',
        help="旧注释文本",
    )
    parser.add_argument(
        "--new",
        default=(
            'DV2K925273: 如果 ls_ztint_icec_api-nolog IS INITIAL，则保存 API 日志；'
            'nolog = "X" 时表示关闭日志，不执行 save_api_log。'
        ),
        help="新注释文本",
    )
    args = parser.parse_args()

    target = Path(args.file)
    text = target.read_text(encoding="utf-8")
    count = text.count(args.old)
    if count == 0:
        raise SystemExit("Old comment text not found")
    target.write_text(text.replace(args.old, args.new), encoding="utf-8")
    print(f"Replaced {count} comment occurrences")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
