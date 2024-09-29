#!/bin/bash

# エラーが発生したら即座に終了
set -e

echo "AtCoder TypeScript環境セットアップを開始します..."

# Node.jsがインストールされているか確認
if ! command -v node &> /dev/null
then
    echo "[ERROR] Node.jsがインストールされていません。先にNode.jsをインストールしてください。"
    exit 1
fi

# Pythonがインストールされているか確認
if ! command -v python3 &> /dev/null
then
    echo "[ERROR] Pythonがインストールされていません。先にPython3をインストールしてください。"
    exit 1
fi

# 必要なnpmパッケージをグローバルにインストール
echo "TypeScriptとatcoder-cliをインストールしています..."
if ! command -v tsc &> /dev/null
then
    npm install -g typescript
    echo "typescriptをインストールしました。"
else
    echo "typescriptは既にインストールされています。"
fi

if ! command -v acc &> /dev/null
then
    npm install -g atcoder-cli
    echo "atcoder-cliをインストールしました。"
else
    echo "atcoder-cliは既にインストールされています。"
fi

# online-judge-toolsをインストール
echo "online-judge-toolsをインストールしています..."
if ! command -v oj &> /dev/null
then
    pip3 install online-judge-tools
    echo "online-judge-toolsをインストールしました。"
else
    echo "online-judge-toolsは既にインストールされています。"
fi

# 必要なパッケージをインストール
echo "必要なパッケージをインストールしています..."
npm ci

echo "atcoder-cliを設定しています..."
acc config
acc config default-template typescript
acc config default-task-choice all

config_dir=$(acc config-dir)
mkdir -p $config_dir/typescript
cp ./template.json $config_dir/typescript/

echo "AtCoder CLIとonline-judge-toolsでAtCoderにログインします..."
acc login
oj login https://atcoder.jp

echo "セットアップが完了しました！"
echo "使用方法:"
echo "  1. 'acc new [contest-id]' で新しいコンテストディレクトリを作成"
echo "  2. 問題ディレクトリに移動"
echo "  3. 'oj d [problem-url]' でテストケースをダウンロード"
echo "  4. 'npm run test' でテスト実行"
echo "  5. 'npm run submit' で提出"
