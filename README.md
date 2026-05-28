# 🏢 codex-company

**codex-company** は、Codexを「小さな開発会社」のように使うためのスターターキットです。

1つの画面に複数のCodex CLIを並べて、役職ごとに作業を分けます。

```text
👤 社長                 → あなた
👔 部長PM               → 作業分解・指示出し・結果統合
🎨 デザイナー           → UI/UX・画面構成・見た目確認
🖥 フロントエンド       → 画面・CSS・JavaScriptなど
🗄 バックエンド         → API・DB・認証・業務ロジックなど
🧪 レビュアー・テスター → 品質確認・テスト・リスク確認
📊 Git監視              → 変更ファイル・差分確認
```

---

## ✨ できること

通常Codexを使うと、毎回このような指示を書く必要があります。

```text
PM役として作業を分解してください。
デザイナー、フロントエンド、バックエンド、レビュアーに分けてください。
勝手に関係ないファイルを変更しないでください。
```

codex-companyでは、このような役割分担や基本ルールをあらかじめ用意しておきます。

そのため、ユーザーは次のように入力するだけで、役職ごとのCodex画面を起動できます。

```bash
./bin/codex-company "通知機能を作りたい"
```

---

## 🖼 画面イメージ

```text
┌─ 👔 部長PM / 作業分解 ───────┬─ 🎨 デザイナー / UI・UX ───────┐
│ PM用Codex                    │ デザイナー用Codex              │
├─ 🖥 フロントエンド / 画面実装 ─┼─ 🗄 バックエンド / API・DB ─────┤
│ フロント用Codex              │ バックエンド用Codex            │
├─ 🧪 レビュアー・テスター ─────┼─ 📊 Git監視 / 差分確認 ─────────┤
│ レビュー用Codex              │ git status / diff              │
└─────────────────────────────┴─────────────────────────────┘
```

---

## ⚠️ 重要: WindowsではWSLで使います

`tmux` は Windows のコマンドプロンプトやPowerShellでは基本的に使えません。

Windowsユーザーは **WSL / Ubuntu の中でcloneして起動**してください。

```text
推奨:
  WSL / Ubuntu の中で git clone する

非推奨:
  Windows側でcloneしてからWSLで実行する
```

Windows側でcloneすると、環境によって `.sh` の改行がCRLFになり、次のようなエラーが出ることがあります。

```text
: invalid option name set: pipefail
```

そのため、基本はWSL内でcloneする手順を使ってください。

---

# 🚀 Windows + WSLでの最短セットアップ

ここでは、`codex-company` 自体を対象プロジェクトとして使う前提で説明します。

## 1. WSLを起動する

WindowsのコマンドプロンプトまたはPowerShellで実行します。

```bat
wsl
```

---

## 2. WSL側に最低限のツールを入れる

WSL / Ubuntuで実行します。

```bash
sudo apt update
sudo apt install -y git tmux
```

確認します。

```bash
git --version
tmux -V
```

`tmux -V` でバージョンが表示されればOKです。

---

## 3. WSLのホームにcloneする

WSL / Ubuntuで実行します。

```bash
cd ~
git clone https://github.com/mmmmaaaaa777/codex-company.git
cd codex-company
```

この方法なら、Windows側の改行コード設定に影響されにくくなります。

---

## 4. WSLセットアップ確認を実行する

```bash
bash ./setup-wsl.sh
```

このスクリプトは、以下を確認・インストールします。

```text
・git
・tmux
・Codex CLIの存在確認
```

Codex CLIが見つからない場合は、Codex CLIをWSL側にインストールしてから再実行してください。

確認コマンド:

```bash
codex --version
```

---

## 5. codex-company自身にテンプレートを入れる

今回は `codex-company` 自体を対象プロジェクトとして使うので、WSLで以下を実行します。

```bash
bash ./install.sh "$(pwd)"
```

これで、以下が `codex-company` 直下に入ります。

```text
AGENTS.md
.codex/
.agents/
bin/codex-company
```

---

## 6. 起動する

WSLで `codex-company` フォルダにいる状態で実行します。

```bash
./bin/codex-company "このプロジェクトの構成を確認してください。コード変更はしないでください"
```

6分割画面が出れば成功です。

---

## 7. 2回目以降に起動する

2回目以降は、`git clone` や `install.sh` は不要です。

WSLを起動して、対象プロジェクトへ移動し、`./bin/codex-company` を実行するだけです。

```bash
wsl
cd ~/codex-company
./bin/codex-company "今日やりたい作業内容を書く"
```

PCをシャットダウン・再起動した後も、同じです。

```bash
wsl
cd ~/codex-company
./bin/codex-company "今日やりたい作業内容を書く"
```

このコマンドを実行すると、新しいtmuxセッションが作成され、また6分割画面で起動します。

---

## 8. 前回のtmux画面に戻る場合

PCをシャットダウンしていない、かつ前回のtmuxセッションが残っている場合だけ、復帰できます。

まず一覧を確認します。

```bash
tmux ls
```

セッションが表示されたら、復帰します。

```bash
tmux attach -t セッション名
```

例:

```bash
tmux attach -t codex-company-20260528-120000
```

`no sessions` と表示された場合、前回の画面は残っていません。

その場合は新しく起動します。

```bash
./bin/codex-company "今日やりたい作業内容を書く"
```

---

## 🧯 すでにWindows側にcloneしてしまった場合

すでに次のような場所にcloneしている場合です。

```text
C:\Users\user\codex-company
```

WSLでは次のように見えます。

```bash
/mnt/c/Users/user/codex-company
```

そのまま使う場合は、最初に改行コードを直してください。

```bash
cd /mnt/c/Users/user/codex-company

git pull

sed -i 's/\r$//' install.sh
sed -i 's/\r$//' setup-wsl.sh
sed -i 's/\r$//' templates/bin/codex-company

bash ./setup-wsl.sh
bash ./install.sh "$(pwd)"
./bin/codex-company "このプロジェクトの構成を確認してください。コード変更はしないでください"
```

ただし、今後はWSLのホーム側にcloneする方法を推奨します。

---

# 🧑‍💼 役職一覧

## 👤 社長

あなたです。何を作るか決め、提案を採用するか判断します。

## 👔 部長PM

作業を分解し、必要な担当者と作業順序を決めます。

## 🎨 デザイナー

画面構成、余白、文字サイズ、色、レスポンシブ、ユーザー導線を確認します。

## 🖥 フロントエンドエンジニア

HTML、CSS、JavaScript、Blade、React、Vueなど画面側を担当します。

## 🗄 バックエンドエンジニア

API、DB、認証、権限、バリデーション、業務ロジックを担当します。

## 🧪 レビュアー・テスター

バグ、異常系、権限、セキュリティ、テスト不足、リリース前リスクを確認します。

## 📊 Git監視

`git status` と `git diff --stat` を常時表示します。

---

# 🆕 新しいアプリを作るとき

新しいアプリや継続案件を作る場合、Codexには次のように依頼します。

```bash
./bin/codex-company "家計簿アプリを新しく作りたい。アプリ名は household-budget です"
```

このとき、Codexは最初に以下のファイルを作るルールです。

```text
projects/<アプリ名>/README.md
```

例:

```text
projects/household-budget/README.md
projects/receipt-fridge-ai/README.md
projects/gameapp/README.md
```

最初のREADME.mdには、以下を書く想定です。

```text
・アプリ概要
・作成目的
・想定ユーザー
・主な機能
・技術構成
・追加フォルダを作る場合の理由
```

`projects/` フォルダは、初期状態では空フォルダとして置きません。  
GitHubは空フォルダを保持できないため、Codexが新しいアプリを作るタイミングで `projects/<アプリ名>/README.md` を作成します。

---

# 🖱 tmuxの基本操作

| 操作 | 内容 |
|---|---|
| `Ctrl + b` → 矢印キー | 画面移動 |
| `Ctrl + b` → `z` | 選択中の画面を拡大 / 戻す |
| `Ctrl + b` → `d` | tmuxから一時的に離れる |
| `tmux ls` | 残っているtmuxセッションを確認する |
| `tmux attach -t セッション名` | 元の画面に戻る |

---

# ⚠️ 注意

このツールは、AIの内部思考そのものを表示するものではありません。

代わりに、以下を1画面で確認できるようにします。

```text
・どの役職が動いているか
・何を確認しているか
・どのファイルを触ろうとしているか
・どの差分が出ているか
・レビューで何が指摘されたか
・Git上で変更が出ているか
```

---

# 🧯 安全に使うコツ

いきなり全部の担当に実装させるより、最初はこの流れがおすすめです。

```text
1. 👔 PMに作業を分解させる
2. 🎨 デザイナーに画面方針を出させる
3. 🖥 フロントエンドに画面側を実装させる
4. 🗄 バックエンドにAPIやDB側を実装させる
5. 🧪 レビュアーに確認させる
6. 📊 Git監視で差分を見る
```

フロントエンドとバックエンドは、どちらもファイル変更ができます。

そのため、同時に大きな変更をさせると競合する可能性があります。

---

# 👨‍💻 エンジニア向け

## 📦 フォルダ構成

```text
codex-company/
├─ README.md
├─ LICENSE
├─ .gitattributes
├─ setup-wsl.sh
├─ install.sh
├─ install.ps1
├─ examples/
└─ templates/
   ├─ AGENTS.md
   ├─ .codex/
   │  ├─ config.toml
   │  └─ agents/
   │     ├─ pm.toml
   │     ├─ designer.toml
   │     ├─ frontend.toml
   │     ├─ backend.toml
   │     └─ reviewer-tester.toml
   ├─ .agents/
   │  └─ skills/
   │     ├─ company-plan/
   │     │  └─ SKILL.md
   │     ├─ company-design/
   │     │  └─ SKILL.md
   │     ├─ company-frontend/
   │     │  └─ SKILL.md
   │     ├─ company-backend/
   │     │  └─ SKILL.md
   │     ├─ company-review-test/
   │     │  └─ SKILL.md
   │     └─ company-full/
   │        └─ SKILL.md
   └─ bin/
      └─ codex-company
```

`projects/` は初期ファイルとしては置きません。  
新しいアプリ作成時に、Codexが `projects/<アプリ名>/README.md` を作成します。

---

## 🧩 各ファイルの役割

### `.gitattributes`

Windows clone時の改行コード事故を減らすため、`.sh` をLFに固定します。

### `templates/AGENTS.md`

Codex全体に読ませる共通ルールです。

```text
・役職定義
・作業方針
・新規アプリ作成ルール
・新規ファイル作成ルール
・変更禁止ルール
・出力ルール
```

### `templates/.codex/config.toml`

Codexのプロジェクト設定です。

```toml
[agents]
max_threads = 6
max_depth = 1
```

### `templates/.codex/agents/*.toml`

役職ごとのカスタムエージェント定義です。

### `templates/.agents/skills/*/SKILL.md`

再利用する作業手順です。

### `templates/bin/codex-company`

実行用スクリプトです。tmuxで6分割画面を作り、それぞれのペインでCodexを起動します。

### `setup-wsl.sh`

WSL / Ubuntu向けの環境確認スクリプトです。`git` と `tmux` をインストールし、Codex CLIの存在を確認します。

### `install.sh`

Linux / WSL / macOS向けのインストーラーです。`templates/` 配下のファイルを対象プロジェクトへコピーします。

### `install.ps1`

Windows PowerShell向けのインストーラーです。ただし、6分割起動はWSL側で行います。

---

## 🧪 動作確認

```bash
bash ./setup-wsl.sh
bash ./install.sh "$(pwd)"
./bin/codex-company "テスト起動。コード変更はしないでください"
```

確認項目:

```text
・tmuxが起動する
・6ペイン表示される
・各ペインの上部に役職名が表示される
・Git監視ペインが動いている
・Codexが各役職ごとのプロンプトで起動する
・コード変更しない指示の場合、差分が出ない
```

---

## 🧹 アンインストール

対象プロジェクトから削除する場合:

```bash
rm -rf .codex
rm -rf .agents
rm -rf .codex-company
rm -f AGENTS.md
rm -f bin/codex-company
```

`bin` フォルダ内に他のファイルがない場合のみ削除します。

```bash
rmdir bin
```

---

## 📝 今後追加したい機能

```text
・実装担当をread-onlyで起動する安全モード
・frontendだけ起動するモード
・backendだけ起動するモード
・reviewだけ起動するモード
・ログ保存機能の強化
・README生成機能
・PRレビュー用モード
・GitHub Actions連携
```

---

## 📌 ライセンス

MIT License

このプロジェクトはMITライセンスで公開しています。

自由に利用、改変、再配布できますが、著作権表示とライセンス文は残してください。
