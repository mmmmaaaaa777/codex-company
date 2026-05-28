#!/usr/bin/env bash
set -euo pipefail

echo "== codex-company macOS setup =="

echo ""
echo "[1/3] Homebrew を確認します"
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew が見つかりません。"
  echo "先にHomebrewをインストールしてください。"
  echo "公式サイト: https://brew.sh/"
  echo "インストール後、新しいターミナルで再度 bash ./setup-mac.sh を実行してください。"
  exit 1
fi

brew --version

echo ""
echo "[2/3] 必要ツールをインストールします"
brew install git tmux

echo ""
echo "[3/3] バージョン確認"
git --version
tmux -V

if command -v codex >/dev/null 2>&1; then
  codex --version
else
  echo ""
  echo "Codex CLI が見つかりません。"
  echo "Codex CLI をmacOS側にインストールして、ログイン後に再度確認してください。"
  echo "確認コマンド: codex --version"
fi

echo ""
echo "セットアップ確認が完了しました。"
echo "次に実行する例:"
echo "  bash ./install.sh \"$(pwd)\""
echo "  ./bin/codex-company \"このプロジェクトの構成を確認してください\""
