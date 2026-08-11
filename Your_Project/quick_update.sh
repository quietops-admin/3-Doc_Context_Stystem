#!/bin/bash
set -e
DOCS_DIR="$(dirname "$0")/docs"
DATE=$(date +%Y-%m-%d_%H-%M)
mkdir -p "$DOCS_DIR/archives/$DATE"
cp "$DOCS_DIR"/*.md "$DOCS_DIR/archives/$DATE/" 2>/dev/null || true

echo "Paste the full AI output (with ===== markers), then press Ctrl+D"
echo "-----------------------------------------------------------"

if [ -n "$1" ]; then
  INPUT=$(cat "$1")
else
  INPUT=$(cat)
fi

echo "$INPUT" | awk '/^===== PROJECT_MEMORY.md =====/{flag=1; next} /^===== /{flag=0} flag' > "$DOCS_DIR/PROJECT_MEMORY.md"
echo "$INPUT" | awk '/^===== INSIGHTS_LOG.md =====/{flag=1; next} /^===== /{flag=0} flag' > "$DOCS_DIR/INSIGHTS_LOG.md"
echo "$INPUT" | awk '/^===== NEXT_ACTIONS.md =====/{flag=1; next} /^===== /{flag=0} flag' > "$DOCS_DIR/NEXT_ACTIONS.md"

echo ""
echo "Updated successfully"
echo "Backup saved to: docs/archives/$DATE/"
