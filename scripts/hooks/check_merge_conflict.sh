#!/usr/bin/env bash
set -euo pipefail
# Fail if Git conflict markers are present.
grep -R --line-number --with-filename -E '^(<<<<<<<|=======|>>>>>>>)' -- "$@" && {
  echo "Error: merge conflict markers detected." >&2
  exit 1
} || exit 0
