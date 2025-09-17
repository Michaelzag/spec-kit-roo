#!/usr/bin/env bash
# Update AI agent context files based on the latest plan.md for the active feature branch.
# Supports CLAUDE.md, GEMINI.md, .github/copilot-instructions.md, Cursor rules, and Roo Code AGENTS.md.

set -euo pipefail

REPO_ROOT=$(git rev-parse --show-toplevel)
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
FEATURE_DIR="$REPO_ROOT/specs/$CURRENT_BRANCH"
NEW_PLAN="$FEATURE_DIR/plan.md"

CLAUDE_FILE="$REPO_ROOT/CLAUDE.md"
GEMINI_FILE="$REPO_ROOT/GEMINI.md"
COPILOT_FILE="$REPO_ROOT/.github/copilot-instructions.md"
CURSOR_FILE="$REPO_ROOT/.cursor/rules/specify-rules.mdc"
ROO_FILE="$REPO_ROOT/AGENTS.md"

AGENT_TYPE="${1:-}"

if [[ ! -f "$NEW_PLAN" ]]; then
    echo "ERROR: No plan.md found at $NEW_PLAN" >&2
    exit 1
fi

echo "=== Updating agent context files for feature $CURRENT_BRANCH ==="

NEW_LANG=$(grep "^**Language/Version**: " "$NEW_PLAN" 2>/dev/null | head -1 | sed 's/^**Language\/Version**: //' | grep -v "NEEDS CLARIFICATION" || echo "")
NEW_FRAMEWORK=$(grep "^**Primary Dependencies**: " "$NEW_PLAN" 2>/dev/null | head -1 | sed 's/^**Primary Dependencies**: //' | grep -v "NEEDS CLARIFICATION" || echo "")
NEW_TESTING=$(grep "^**Testing**: " "$NEW_PLAN" 2>/dev/null | head -1 | sed 's/^**Testing**: //' | grep -v "NEEDS CLARIFICATION" || echo "")
NEW_DB=$(grep "^**Storage**: " "$NEW_PLAN" 2>/dev/null | head -1 | sed 's/^**Storage**: //' | grep -v "N/A" | grep -v "NEEDS CLARIFICATION" || echo "")
NEW_PROJECT_TYPE=$(grep "^**Project Type**: " "$NEW_PLAN" 2>/dev/null | head -1 | sed 's/^**Project Type**: //' || echo "")

TEMPLATE_FILE="$REPO_ROOT/templates/agent-file-template.md"

update_agent_file() {
    local target_file="$1"
    local agent_name="$2"

    echo "Updating $agent_name context file: $target_file"

    local temp_file
    temp_file=$(mktemp)

    if [[ ! -f "$target_file" ]]; then
        if [[ ! -f "$TEMPLATE_FILE" ]]; then
            echo "ERROR: Template not found at $TEMPLATE_FILE" >&2
            rm -f "$temp_file"
            return 1
        fi

        cp "$TEMPLATE_FILE" "$temp_file"
        sed -i.bak "s/\[PROJECT NAME\]/$(basename "$REPO_ROOT")/" "$temp_file"
        sed -i.bak "s/\[DATE\]/$(date +%Y-%m-%d)/" "$temp_file"
        sed -i.bak "s/\[EXTRACTED FROM ALL PLAN.MD FILES\]/- $NEW_LANG + $NEW_FRAMEWORK ($CURRENT_BRANCH)/" "$temp_file"

        if [[ "$NEW_PROJECT_TYPE" == *"web"* ]]; then
            sed -i.bak "s|\[ACTUAL STRUCTURE FROM PLANS\]|backend/\nfrontend/\ntests/|" "$temp_file"
        else
            sed -i.bak "s|\[ACTUAL STRUCTURE FROM PLANS\]|src/\ntests/|" "$temp_file"
        fi

        if [[ "$NEW_LANG" == *"Python"* ]]; then
            COMMANDS="cd src && pytest && ruff check ."
        elif [[ "$NEW_LANG" == *"Rust"* ]]; then
            COMMANDS="cargo test && cargo clippy"
        elif [[ "$NEW_LANG" == *"JavaScript"* ]] || [[ "$NEW_LANG" == *"TypeScript"* ]]; then
            COMMANDS="npm test && npm run lint"
        else
            COMMANDS="# Add commands for $NEW_LANG"
        fi
        sed -i.bak "s|\[ONLY COMMANDS FOR ACTIVE TECHNOLOGIES\]|$COMMANDS|" "$temp_file"

        if [[ -n "$NEW_TESTING" ]]; then
            sed -i.bak "s|\[LANGUAGE-SPECIFIC, ONLY FOR LANGUAGES IN USE\]|$NEW_LANG: $NEW_TESTING|" "$temp_file"
        else
            sed -i.bak "s|\[LANGUAGE-SPECIFIC, ONLY FOR LANGUAGES IN USE\]|$NEW_LANG: Follow standard conventions|" "$temp_file"
        fi

        sed -i.bak "s|\[LAST 3 FEATURES AND WHAT THEY ADDED\]|- $CURRENT_BRANCH: Added $NEW_LANG + $NEW_FRAMEWORK|" "$temp_file"
        rm -f "$temp_file.bak"
    else
        local manual_start manual_end
        manual_start=$(grep -n "<!-- MANUAL ADDITIONS START -->" "$target_file" | cut -d: -f1 || true)
        manual_end=$(grep -n "<!-- MANUAL ADDITIONS END -->" "$target_file" | cut -d: -f1 || true)

        if [[ -n "$manual_start" && -n "$manual_end" ]]; then
            sed -n "${manual_start},${manual_end}p" "$target_file" > /tmp/manual_additions.txt
        fi

        NEW_LANG_ENV="$NEW_LANG" \
        NEW_FRAMEWORK_ENV="$NEW_FRAMEWORK" \
        CURRENT_BRANCH_ENV="$CURRENT_BRANCH" \
        NEW_DB_ENV="$NEW_DB" \
        python3 - "$target_file" <<'PYTHON'
import os
import re
import sys
from datetime import datetime

target = sys.argv[1]
with open(target, "r", encoding="utf-8") as f:
    content = f.read()

NEW_LANG = os.environ.get("NEW_LANG_ENV", "")
NEW_FRAMEWORK = os.environ.get("NEW_FRAMEWORK_ENV", "")
CURRENT_BRANCH = os.environ.get("CURRENT_BRANCH_ENV", "")
NEW_DB = os.environ.get("NEW_DB_ENV", "")

section = re.search(r"## Active Technologies\\n(.*?)\\n\\n", content, re.DOTALL)
if section:
    existing = section.group(1)
    additions = []
    if NEW_LANG and NEW_LANG not in existing:
        additions.append(f"- {NEW_LANG} + {NEW_FRAMEWORK} ({CURRENT_BRANCH})")
    if NEW_DB and NEW_DB != "N/A" and NEW_DB not in existing:
        additions.append(f"- {NEW_DB} ({CURRENT_BRANCH})")
    if additions:
        new_block = existing + "\n" + "\n".join(additions)
        content = content.replace(section.group(0), f"## Active Technologies\n{new_block}\n\n")

recent = re.search(r"## Recent Changes\\n(.*?)(\\n\\n|$)", content, re.DOTALL)
if recent:
    lines = [line for line in recent.group(1).strip().split("\n") if line]
    lines.insert(0, f"- {CURRENT_BRANCH}: Added {NEW_LANG} + {NEW_FRAMEWORK}")
    content = re.sub(r"## Recent Changes\\n.*?(\\n\\n|$)", "## Recent Changes\n" + "\n".join(lines[:3]) + "\n\n", content, flags=re.DOTALL)

content = re.sub(r"Last updated: \\d{4}-\\d{2}-\\d{2}", "Last updated: " + datetime.now().strftime("%Y-%m-%d"), content)

with open(target + ".tmp", "w", encoding="utf-8") as f:
    f.write(content)
PYTHON

        mv "$target_file.tmp" "$temp_file"

        if [[ -f /tmp/manual_additions.txt ]]; then
            sed -i.bak '/<!-- MANUAL ADDITIONS START -->/,/<!-- MANUAL ADDITIONS END -->/d' "$temp_file"
            cat /tmp/manual_additions.txt >> "$temp_file"
            rm -f /tmp/manual_additions.txt "$temp_file.bak"
        fi
    fi

    mv "$temp_file" "$target_file"
    echo "✅ $agent_name context file updated successfully"
}

case "$AGENT_TYPE" in
    claude)
        update_agent_file "$CLAUDE_FILE" "Claude Code"
        ;;
    gemini)
        update_agent_file "$GEMINI_FILE" "Gemini CLI"
        ;;
    copilot)
        update_agent_file "$COPILOT_FILE" "GitHub Copilot"
        ;;
    cursor)
        update_agent_file "$CURSOR_FILE" "Cursor"
        ;;
    roo)
        update_agent_file "$ROO_FILE" "Roo Code"
        ;;
    "")
        [[ -f "$CLAUDE_FILE" ]] && update_agent_file "$CLAUDE_FILE" "Claude Code"
        [[ -f "$GEMINI_FILE" ]] && update_agent_file "$GEMINI_FILE" "Gemini CLI"
        [[ -f "$COPILOT_FILE" ]] && update_agent_file "$COPILOT_FILE" "GitHub Copilot"
        [[ -f "$CURSOR_FILE" ]] && update_agent_file "$CURSOR_FILE" "Cursor"
        [[ -f "$ROO_FILE" ]] && update_agent_file "$ROO_FILE" "Roo Code"

        if [[ ! -f "$CLAUDE_FILE" && ! -f "$GEMINI_FILE" && ! -f "$COPILOT_FILE" && ! -f "$CURSOR_FILE" && ! -f "$ROO_FILE" ]]; then
            echo "No existing agent context files found. Creating Roo Code AGENTS.md by default."
            update_agent_file "$ROO_FILE" "Roo Code"
        fi
        ;;
    *)
        echo "ERROR: Unknown agent type '$AGENT_TYPE'. Use: claude, gemini, copilot, cursor, or roo." >&2
        exit 1
        ;;
esac

echo
echo "Summary of changes:"
[[ -n "$NEW_LANG" ]] && echo "- Added language: $NEW_LANG"
[[ -n "$NEW_FRAMEWORK" ]] && echo "- Added framework: $NEW_FRAMEWORK"
[[ -n "$NEW_DB" && "$NEW_DB" != "N/A" ]] && echo "- Added database: $NEW_DB"
[[ -n "$NEW_TESTING" ]] && echo "- Testing updates: $NEW_TESTING"

echo
echo "Usage: $0 [claude|gemini|copilot|cursor|roo]"
