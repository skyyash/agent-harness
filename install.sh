#!/usr/bin/env bash
# install.sh - symlink the harness into the places agent tools read.
#
# Idempotent. Backs up anything it would replace. Prints every action.
# Test safely without touching real configs:
#   TARGET_HOME=/path/to/fake/home ./install.sh

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_HOME="${TARGET_HOME:-$HOME}"
STAMP="$(date +%Y%m%d-%H%M%S)"

link() {
  local target="$1" source="$2"
  mkdir -p "$(dirname "$target")"

  if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
    echo "ok      $target (already linked)"
    return
  fi

  if [ -e "$target" ] || [ -L "$target" ]; then
    local backup="$target.bak-$STAMP"
    mv "$target" "$backup"
    echo "backup  $target -> $backup"
  fi

  ln -s "$source" "$target"
  echo "link    $target -> $source"
}

echo "Harness repo: $REPO_DIR"
echo "Target home:  $TARGET_HOME"
echo

link "$TARGET_HOME/.config/opencode/AGENTS.md"      "$REPO_DIR/instructions/AGENTS.md"
link "$TARGET_HOME/.claude/CLAUDE.md"               "$REPO_DIR/instructions/AGENTS.md"
link "$TARGET_HOME/.codex/AGENTS.md"                "$REPO_DIR/instructions/AGENTS.md"
link "$TARGET_HOME/.config/opencode/opencode.jsonc" "$REPO_DIR/config/opencode/opencode.jsonc"

# Per-skill: each tool reads the same SKILL.md format from a different path.
for skill_dir in "$REPO_DIR/skills"/*/; do
  skill_name="$(basename "$skill_dir")"
  link "$TARGET_HOME/.agents/skills/$skill_name" "$skill_dir"
  link "$TARGET_HOME/.claude/skills/$skill_name" "$skill_dir"
  link "$TARGET_HOME/.codex/skills/$skill_name"  "$skill_dir"
done

echo
echo "Done. Restart any running agent tools to pick up the changes."
echo "To undo everything: ./uninstall.sh"
echo "(Manual undo: delete the symlinks above, restore the .bak-$STAMP files.)"
