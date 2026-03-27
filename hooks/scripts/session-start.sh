#!/bin/bash
# mashburn SessionStart hook — shows practice count on startup

PRACTICES_DIR="${CLAUDE_PLUGIN_ROOT}/practices"
count=0

if [ -d "$PRACTICES_DIR" ]; then
  count=$(find "$PRACTICES_DIR" -name "*.md" ! -name "README.md" -type f 2>/dev/null | wc -l | tr -d ' ')
fi

echo "🔥 mashburn active — ${count} practices loaded"
