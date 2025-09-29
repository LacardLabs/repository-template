#!/usr/bin/env bash
set -euo pipefail
# Strip trailing whitespace and ensure newline at EOF for all given files.
# Only modifies text files.
for f in "$@"; do
  [ -f "$f" ] || continue
  # Skip binary files
  if file "$f" | grep -qi "text"; then
    # strip trailing spaces
    sed -i.bak -E 's/[[:space:]]+$//' "$f" && rm -f "$f.bak"
    # ensure newline at EOF
    tail -c1 "$f" | read -r _ || echo >> "$f"
  fi
done
