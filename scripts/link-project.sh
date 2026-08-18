#!/usr/bin/env bash
set -euo pipefail
OWNER=$(gh api user -q .login)
REPO=$(basename "$(git rev-parse --show-toplevel)")
PNUM=$(gh api "repos/$OWNER/.github/contents/PROJECT.md" -q .content | base64 -d | grep -i 'Project number' | grep -o '[0-9]\+')
gh project link "$PNUM" --owner "$OWNER" --repo "$OWNER/$REPO"
echo "Linked $OWNER/$REPO to project $PNUM"
