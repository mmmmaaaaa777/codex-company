param(
    [Parameter(Mandatory=$true)]
    [string]$ProjectPath
)

if (!(Test-Path $ProjectPath)) {
    Write-Host "対象フォルダが存在しません: $ProjectPath"
    exit 1
}

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$TemplateDir = Join-Path $ScriptDir "templates"

if (!(Test-Path $TemplateDir)) {
    Write-Host "templates フォルダが見つかりません: $TemplateDir"
    exit 1
}

Get-ChildItem -Path $TemplateDir -Recurse -File -Force | ForEach-Object {
    $relative = $_.FullName.Substring($TemplateDir.Length + 1)
    $dest = Join-Path $ProjectPath $relative
    $destDir = Split-Path -Parent $dest

    if (!(Test-Path $destDir)) {
        New-Item -ItemType Directory -Force -Path $destDir | Out-Null
    }

    if (Test-Path $dest) {
        Write-Host "スキップ: 既に存在します: $dest"
    } else {
        Copy-Item $_.FullName $dest
        Write-Host "作成: $dest"
    }
}

Write-Host ""
Write-Host "セットアップ完了"
Write-Host ""
Write-Host "次のコマンドで起動できます:"
Write-Host "  cd `"$ProjectPath`""
Write-Host "  ./bin/codex-company `"通知機能を作りたい`""
Write-Host ""
Write-Host "注意: 6分割起動とレート表示はWSL / macOS / Linux側のtmux上で動かしてください。"
