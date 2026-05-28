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

## 🎯 このツールの目的

codex-companyの目的は、Codexをただの1人のAIとして使うのではなく、**開発チームのように役割分担して使いやすくすること**です。

```text
👔 PMが作業を分ける
🎨 デザイナーが見た目を見る
🖥 フロントエンドが画面側を担当する
🗄 バックエンドがサーバー側を担当する
🧪 レビュアーが品質を見る
📊 Git監視で差分を見る
```

これにより、1つの依頼を複数の視点から確認しやすくなります。

---

## 🧑‍💼 役職一覧

### 👤 社長

あなたです。

最終的な判断をします。

```text
・何を作るか決める
・提案を採用するか決める
・変更内容を確認する
・最後にマージするか決める
```

---

### 👔 部長PM

作業を分解する担当です。

```text
・やることを整理する
・必要な担当者を決める
・作業順序を考える
・各担当に渡す指示を作る
・最後に結果をまとめる
```

---

### 🎨 デザイナー

画面の見やすさや使いやすさを見る担当です。

```text
・画面構成
・ボタン配置
・余白
・文字サイズ
・色
・レスポンシブ
・ユーザー導線
```

---

### 🖥 フロントエンドエンジニア

画面側を作る担当です。

```text
・HTML
・CSS
・JavaScript
・Blade
・React
・Vue
・画面の見た目
・レスポンシブ対応
```

---

### 🗄 バックエンドエンジニア

サーバー側を作る担当です。

```text
・API
・DB
・認証
・権限
・バリデーション
・業務ロジック
・エラー処理
```

---

### 🧪 レビュアー・テスター

品質を確認する担当です。

```text
・バグ確認
・異常系確認
・権限確認
・セキュリティ確認
・テスト不足確認
・リリース前リスク確認
```

---

### 📊 Git監視

変更されたファイルや差分を常に表示します。

```text
・git status
・git diff --stat
```

---

## 🚀 使い方

### 1. codex-companyを取得する

```bash
git clone https://github.com/mmmmaaaaa777/codex-company.git
```

```bash
cd codex-company
```

---

### 2. 自分のプロジェクトにインストールする

Linux / WSL / macOSの場合:

```bash
bash ./install.sh /path/to/target-project
```

例:

```bash
bash ./install.sh ~/projects/my-app
```

Windows PowerShellの場合:

```powershell
.\install.ps1 -ProjectPath "C:\path\to\target-project"
```

---

### 3. 対象プロジェクトへ移動する

```bash
cd /path/to/target-project
```

---

### 4. 初回起動する

```bash
./bin/codex-company "通知機能を作りたい"
```

これで、役職ごとのCodex画面が起動します。

---

### 5. 2回目以降に起動する

2回目以降は、`git clone` や `install.sh` は不要です。

一度インストールした対象プロジェクトへ移動して、`./bin/codex-company` を実行するだけです。

```bash
cd /path/to/target-project
./bin/codex-company "今日やりたい作業内容を書く"
```

例:

```bash
cd ~/projects/my-app
./bin/codex-company "ログイン画面のデザインを見直したい"
```

前回のtmux画面から離れただけで、まだセッションが残っている場合は、起動時に表示されたセッション名で復帰できます。

```bash
tmux attach -t codex-company-20260528-120000
```

セッション名が分からない場合は、一覧を確認します。

```bash
tmux ls
```

新しく作業を始める場合は、通常どおりもう一度起動します。

```bash
./bin/codex-company "次にやりたい作業内容を書く"
```

---

## 🆕 新しいアプリを作るとき

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

`projects/` フォルダは、今のリポジトリに空フォルダとして置いておく必要はありません。  
GitHubは空フォルダを保持できないため、Codexが新しいアプリを作るタイミングで `projects/<アプリ名>/README.md` を作成します。

---

## 🖱 tmuxの基本操作

codex-companyは、画面分割のために `tmux` を使います。

| 操作 | 内容 |
|---|---|
| `Ctrl + b` → 矢印キー | 画面移動 |
| `Ctrl + b` → `z` | 選択中の画面を拡大 / 戻す |
| `Ctrl + b` → `d` | tmuxから一時的に離れる |
| `tmux attach -t セッション名` | 元の画面に戻る |

起動時にセッション名が表示されます。

例:

```bash
tmux attach -t codex-company-20260528-120000
```

---

## ⚠️ 注意

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

## 🧯 安全に使うコツ

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

## 🧪 まず試す内容

動作確認だけしたい場合は、対象プロジェクトで以下のように実行してください。

```bash
./bin/codex-company "このプロジェクトの構成を確認して、役職ごとに作業分担を提案してください。コード変更はしないでください"
```

Git監視ペインで差分が出ていないことを確認してください。

---

# 👨‍💻 エンジニア向け

ここから下は、開発者・メンテナ向けの説明です。

---

## 📦 フォルダ構成

```text
codex-company/
├─ README.md
├─ LICENSE
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

---

### `templates/.codex/config.toml`

Codexのプロジェクト設定です。

```text
・サブエージェント数
・委任の深さ
```

推奨内容:

```toml
[agents]
max_threads = 6
max_depth = 1
```

---

### `templates/.codex/agents/*.toml`

役職ごとのカスタムエージェント定義です。

```text
pm.toml
designer.toml
frontend.toml
backend.toml
reviewer-tester.toml
```

---

### `templates/.agents/skills/*/SKILL.md`

再利用する作業手順です。

```text
company-plan
company-design
company-frontend
company-backend
company-review-test
company-full
```

---

### `templates/bin/codex-company`

実行用スクリプトです。

tmuxで6分割画面を作り、それぞれのペインでCodexを起動します。

```text
PM
Designer
Frontend
Backend
Reviewer / Tester
Git Watch
```

---

### `install.sh`

Linux / WSL / macOS向けのインストーラーです。

`templates/` 配下のファイルを対象プロジェクトへコピーします。

既存ファイルがある場合は上書きせず、スキップします。

---

### `install.ps1`

Windows PowerShell向けのインストーラーです。

`templates/` 配下のファイルを対象プロジェクトへコピーします。

既存ファイルがある場合は上書きせず、スキップします。

---

## 🛠 開発手順

### 1. リポジトリを取得

```bash
git clone https://github.com/mmmmaaaaa777/codex-company.git
cd codex-company
```

---

### 2. 実行権限を付与

```bash
chmod +x install.sh
chmod +x templates/bin/codex-company
```

---

### 3. テスト用プロジェクトを作成

```bash
mkdir -p /tmp/codex-company-test-project
```

---

### 4. インストール確認

```bash
./install.sh /tmp/codex-company-test-project
```

---

### 5. ファイル確認

```bash
find /tmp/codex-company-test-project -maxdepth 5 -type f | sort
```

最低限、以下が表示されればOKです。

```text
/tmp/codex-company-test-project/AGENTS.md
/tmp/codex-company-test-project/.codex/config.toml
/tmp/codex-company-test-project/.codex/agents/pm.toml
/tmp/codex-company-test-project/.agents/skills/company-plan/SKILL.md
/tmp/codex-company-test-project/bin/codex-company
```

---

### 6. 起動確認

```bash
cd /tmp/codex-company-test-project
./bin/codex-company "このプロジェクトの構成を確認して、作業分担を提案してください。コード変更はしないでください"
```

tmuxで6分割画面が開けば成功です。

---

### 7. 2回目以降の起動確認

一度インストール済みなら、再インストールは不要です。

```bash
cd /tmp/codex-company-test-project
./bin/codex-company "2回目以降の起動テストです。コード変更はしないでください"
```

前回のtmuxセッションに戻りたい場合は、まず一覧を確認します。

```bash
tmux ls
```

残っているセッションに復帰します。

```bash
tmux attach -t セッション名
```

---

### 8. 新規アプリ作成ルールの確認

Codexに新しいアプリ作成を依頼した場合、最初に以下を作る運用です。

```text
projects/<アプリ名>/README.md
```

例:

```bash
./bin/codex-company "新しいメモアプリを作りたい。アプリ名は memo-app です。まずREADMEから作ってください"
```

期待される最初の作成ファイル:

```text
projects/memo-app/README.md
```

---

## 🔐 権限設計

役職ごとの権限は以下です。

| 役職 | sandbox |
|---|---|
| PM | `read-only` |
| デザイナー | `read-only` |
| フロントエンド | `workspace-write` |
| バックエンド | `workspace-write` |
| レビュアー・テスター | `read-only` |
| Git監視 | 読み取りのみ |

PM、デザイナー、レビュアーは原則コード変更しません。

フロントエンドとバックエンドのみ、必要に応じてファイル変更できます。

---

## 🧪 動作確認項目

### インストール確認

```bash
./install.sh /tmp/codex-company-test-project
```

確認:

```bash
ls -la /tmp/codex-company-test-project
ls -la /tmp/codex-company-test-project/.codex
ls -la /tmp/codex-company-test-project/.agents
ls -la /tmp/codex-company-test-project/bin
```

---

### 起動確認

```bash
cd /tmp/codex-company-test-project
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

### 新規アプリ作成ルール確認

```bash
cd /tmp/codex-company-test-project
./bin/codex-company "新しいテストアプリを作りたい。アプリ名は sample-app です。まずREADMEだけ作ってください"
```

期待される作成ファイル:

```text
projects/sample-app/README.md
```

この確認では、いきなり実装ファイルを作らず、README.mdから始まっていればOKです。

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
