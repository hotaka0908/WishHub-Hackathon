#!/usr/bin/env bash
# 変更をコミットして GitHub に push するスクリプト。
# push すると Vercel が自動で本番デプロイします。
#
# 使い方:
#   ./update.sh                  # 自動メッセージでコミット＆push
#   ./update.sh "やったこと"      # メッセージを指定してコミット＆push
set -euo pipefail

cd "$(dirname "$0")"

# コミットメッセージ（引数があればそれを使う。なければ日時）
msg="${1:-update: $(date '+%Y-%m-%d %H:%M:%S')}"

# 変更がなければ何もしない
if [ -z "$(git status --porcelain)" ]; then
  echo "変更はありません。"
  exit 0
fi

git add -A
git commit -m "$msg"
git push origin main

echo ""
echo "✅ GitHub に push しました。Vercel が自動でデプロイします。"
echo "   公開URL: https://wish-hub-hackathon.vercel.app/"
echo "   ダッシュボード: https://vercel.com/hotakas-projects/wish-hub-hackathon"
