#!/usr/bin/env bash
# Backwards compatibility wrapper that forwards to the reorganized bash script.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec "$SCRIPT_DIR/bash/update-agent-context.sh" "$@"
