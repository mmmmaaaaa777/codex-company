#!/usr/bin/env bash
set -euo pipefail

echo "== codex-company WSL setup =="

if ! grep -qi microsoft /proc/version 2>/dev/null; then
  echo "注意: WSL以外のLinuxでも動きますが、このスクリプトはUbuntu/WSL向けです。"
fi

echo ""
echo "[1/3] apt を更新します"
sudo apt update

echo ""
echo "[2/3] 必要ツールをインストールします"
sudo apt install -y git tmux

echo ""
echo "[3/3] バージョン確認"
git --version
tmux -V

if command -v codex >/dev/null 2>&1; then
  codex --version
else
  echo ""
  echo "Codex CLI が見つかりません。"
  echo "Codex CLI をWSL側にインストールして、ログイン後に再度確認してください。"
  echo "確認コマンド: codex --version"
fi

echo ""
echo "セットアップ確認が完了しました。"
echo "次に実行する例:"
echo "  bash ./install.sh \"$(pwd)\""
echo "  ./bin/codex-company \"このプロジェクトの構成を確認してください\""
