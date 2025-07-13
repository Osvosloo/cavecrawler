#!/bin/bash

# Usage: ./commit-and-push.sh "Your commit message" [branch-name]
# Usage on windows: 'bash ./commit-and-push.sh "Commit message" [branch-name]'

if [ -z "$1" ]; then
  echo "❌ Please provide a commit message."
  echo "Usage: ./commit-and-push.sh \"Commit message\" [branch-name]"
  exit 1
fi

COMMIT_MSG="$1"
BRANCH_NAME="${2:-$(git rev-parse --abbrev-ref HEAD)}"

echo "🔄 Rebasing onto origin/main..."
git fetch origin
git rebase origin/main || exit 1

echo "➕ Staging changes..."
git add .

echo "📝 Committing..."
git commit -m "$COMMIT_MSG" || exit 1

echo "🚀 Pushing to origin/$BRANCH_NAME..."
git push origin "$BRANCH_NAME"

echo "✅ Rebase and push complete."
