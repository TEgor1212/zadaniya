#!/usr/bin/env bash
set -euo pipefail

if [ "${1:-}" = "--mac" ]; then
  echo "=== macOS software update ==="
  sudo softwareupdate -ia
  echo "Done."
  exit 0
fi

# Default: Debian/Ubuntu-like
echo "=== Linux package update (apt) ==="
sudo apt list --upgradable -a || true
sudo apt update
sudo apt full-upgrade -y
echo "Done."
