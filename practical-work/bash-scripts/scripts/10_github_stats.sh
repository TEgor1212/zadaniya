#!/bin/bash
# GitHub repo analyzer (uses python3 for JSON parsing)
if [ -z "${1:-}" ]; then echo "Usage: $0 owner/repo"; exit 1; fi
if ! command -v curl >/dev/null 2>&1; then echo "Error: curl is required"; exit 1; fi
REPO="$1"
API="https://api.github.com/repos/$REPO"
TMP=$(mktemp)
HTTP=$(curl -sS -w "%{http_code}" -o "$TMP" "$API") || { echo "Error: curl failed"; rm -f "$TMP"; exit 1; }
if [ "$HTTP" != "200" ]; then
  echo "API error: HTTP $HTTP for $REPO"
  echo "Response:"; head -c 400 "$TMP"; echo
  rm -f "$TMP"; exit 1
fi
readarray -t F < <(python3 - "$TMP" <<'PY'
import json,sys
p=sys.argv[1]
with open(p) as f: d=json.load(f)
print(d.get('full_name','N/A'))
print(d.get('stargazers_count','N/A'))
print(d.get('forks_count','N/A'))
print(d.get('open_issues_count','N/A'))
print(d.get('owner',{}).get('login','N/A'))
print(d.get('updated_at','N/A'))
PY
)
NAME="${F[0]}"; STARS="${F[1]}"; FORKS="${F[2]}"; ISSUES="${F[3]}"; OWNER="${F[4]}"; UPDATED="${F[5]}"
rm -f "$TMP"
Y='\033[33m'; G='\033[32m'; R='\033[31m'; N='\033[0m'
ISSUE_COLOR=$Y
if [[ "$ISSUES" =~ ^[0-9]+$ ]] && [ "$ISSUES" -gt 100 ]; then ISSUE_COLOR=$R; fi
echo "╔════════════════════════════════════════╗"
echo "║  🚀 GitHub Repository Analyzer         ║"
echo "╚════════════════════════════════════════╝"
echo "📦 Репозиторий: $NAME"
echo -e "⭐ Звёзды:       ${Y}${STARS}${N}"
echo -e "🔀 Форки:        ${G}${FORKS}${N}"
echo -e "🐛 Open Issues:  ${ISSUE_COLOR}${ISSUES}${N}"
echo "👤 Автор:        $OWNER"
echo "🕒 Обновлён:     $UPDATED"
