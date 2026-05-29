#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-}"

if [ -z "$TARGET" ]; then
  echo "使い方: ./install.sh /path/to/target-project"
  exit 1
fi

if [ ! -d "$TARGET" ]; then
  echo "対象フォルダが存在しません: $TARGET"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$SCRIPT_DIR/templates"

if [ ! -d "$TEMPLATE_DIR" ]; then
  echo "templates フォルダが見つかりません: $TEMPLATE_DIR"
  exit 1
fi

copy_file() {
  local src="$1"
  local dest="$2"

  if [ -e "$dest" ]; then
    echo "スキップ: 既に存在します: $dest"
    return
  fi

  mkdir -p "$(dirname "$dest")"
  cp "$src" "$dest"
  echo "作成: $dest"
}

find "$TEMPLATE_DIR" -type f | while read -r src; do
  rel="${src#$TEMPLATE_DIR/}"
  copy_file "$src" "$TARGET/$rel"
done

chmod +x "$TARGET/bin/codex-company" 2>/dev/null || true
chmod +x "$TARGET/bin/codex-rate-status" 2>/dev/null || true

# Remove stale rate status cache so newly installed scripts are reflected immediately.
rm -f "${XDG_CACHE_HOME:-$HOME/.cache}/codex-company/codex-rate-status.json" 2>/dev/null || true


echo ""
echo "セットアップ完了"
echo ""
echo "次のコマンドで起動できます:"
echo "  cd \"$TARGET\""
echo "  ./bin/codex-company \"通知機能を作りたい\""
