#!/bin/bash
# Helper script to import Raycast snippets from this dotfiles repo

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SNIPPETS_FILE="$SCRIPT_DIR/snippets.json"

if [ ! -f "$SNIPPETS_FILE" ]; then
    echo "Error: snippets.json not found at $SNIPPETS_FILE"
    echo "Please export your snippets first and place them in the raycast/ directory"
    exit 1
fi

echo "Opening Raycast Import Snippets command..."
echo "File location: $SNIPPETS_FILE"
echo ""
echo "In the file picker that opens, navigate to and select:"
echo "  $SNIPPETS_FILE"
echo ""

# Open Raycast Import Snippets command
open -g "raycast://extensions/raycast/snippets/import-snippets" 2>/dev/null || {
    echo "Note: Could not open deeplink. Please manually:"
    echo "1. Open Raycast"
    echo "2. Type: Import Snippets"
    echo "3. Select the file at: $SNIPPETS_FILE"
}

# Also reveal the file in Finder for easy access
sleep 1
open -R "$SNIPPETS_FILE"
