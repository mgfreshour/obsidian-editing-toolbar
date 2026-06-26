#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <vault-directory>"
  exit 1
fi

VAULT_DIR="$1"
PLUGIN_DIR="$VAULT_DIR/.obsidian/plugins/editing-toolbar"

if [ ! -d "$VAULT_DIR/.obsidian" ]; then
  echo "Error: '$VAULT_DIR' does not appear to be an Obsidian vault (no .obsidian directory)"
  exit 1
fi

cd "$(dirname "$0")"

npm install --silent
npm run build --silent

mkdir -p "$PLUGIN_DIR"
cp main.js manifest.json styles.css "$PLUGIN_DIR/"

echo "Installed to $PLUGIN_DIR"
