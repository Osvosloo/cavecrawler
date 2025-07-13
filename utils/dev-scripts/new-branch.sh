#!/bin/bash

# Usage mac: ./new-branch.sh my-feature-name
# Usage on windows: 'bash ./new-branch.sh my-feature-name'

if [ -z "$1" ]; then
  echo "❌ Please provide a branch name."
  echo "Usage: ./new-branch.sh <branch-name>"
  exit 1
fi

BRANCH_NAME="$1"

echo "✅ Switching to 'main'..."
git checkout main || exit 1

echo "📥 Pulling latest changes..."
git pull origin main || exit 1

echo "🌱 Creating new branch '$BRANCH_NAME'..."
git checkout -b "$BRANCH_NAME" || exit 1

echo "✅ Done. Now on branch '$BRANCH_NAME'."
