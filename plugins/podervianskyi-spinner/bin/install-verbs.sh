#!/usr/bin/env bash
# Installs the Podervianskyi spinner verbs into the user's Claude Code settings.
# Makes a timestamped backup, then sets spinnerVerbs (mode: "replace").
set -euo pipefail

SETTINGS="${HOME}/.claude/settings.json"
VERBS="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "$0")/.." && pwd)}/assets/spinner-verbs.json"

if ! command -v jq >/dev/null 2>&1; then
  echo "Error: 'jq' is required but not found. Install it (e.g. 'brew install jq') and re-run." >&2
  exit 1
fi

if [ ! -f "$VERBS" ]; then
  echo "Error: verb list not found at: $VERBS" >&2
  exit 1
fi

mkdir -p "$(dirname "$SETTINGS")"
[ -f "$SETTINGS" ] || echo '{}' > "$SETTINGS"

BACKUP="${SETTINGS}.bak-$(date +%Y%m%d-%H%M%S)"
cp "$SETTINGS" "$BACKUP"

TMP="$(mktemp)"
jq --slurpfile v "$VERBS" '.spinnerVerbs = $v[0]' "$SETTINGS" > "$TMP"
jq empty "$TMP"                 # validate
mv "$TMP" "$SETTINGS"

COUNT="$(jq '.spinnerVerbs.verbs | length' "$SETTINGS")"
MODE="$(jq -r '.spinnerVerbs.mode' "$SETTINGS")"
echo "Installed ${COUNT} spinner verbs (mode: ${MODE})."
echo "Backup of previous settings: ${BACKUP}"
echo "Restart Claude Code to apply."
