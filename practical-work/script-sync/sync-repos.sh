#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 <source-repo> <target-repo> [--push-target]"
  exit 1
}

[ $# -lt 2 ] && usage
SRC="$1"; DST="$2"; PUSH_TARGET="no"
if [ "${3:-}" = "--push-target" ]; then PUSH_TARGET="yes"; fi

[ -d "$SRC" ] || { echo "Source path not found: $SRC"; exit 1; }
[ -d "$SRC/.git" ] || { echo "Source is not a git repo: $SRC"; exit 1; }
[ -d "$DST" ] || { echo "Target path not found: $DST"; exit 1; }

echo "[1/3] git pull in source: $SRC"
git -C "$SRC" pull --ff-only

echo "[2/3] Copy source -> target (excluding .git)"
if command -v rsync >/dev/null 2>&1; then
  rsync -a --delete --exclude '.git/' "$SRC/" "$DST/"
else
  # Fallback without rsync: copy contents except .git
  tmp_excl=$(mktemp -d)
  trap 'rm -rf "$tmp_excl"' EXIT
  # remove all in dst except .git
  find "$DST" -mindepth 1 -maxdepth 1 ! -name '.git' -exec rm -rf {} +
  # copy from src except .git
  (cd "$SRC" && tar --exclude='.git' -cf - .) | (cd "$DST" && tar -xf -)
fi

if [ "$PUSH_TARGET" = "yes" ]; then
  echo "[3/3] Commit and push in target: $DST"
  git -C "$DST" add -A
  if ! git -C "$DST" diff --cached --quiet; then
    git -C "$DST" commit -m "Sync update $(date -Iseconds)"
    git -C "$DST" push
  else
    echo "No changes to commit in target."
  fi
else
  echo "[3/3] Push skipped."
fi

echo "Sync completed."
