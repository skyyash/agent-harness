#!/usr/bin/env bash
# uninstall.sh - reverse install.sh: remove the harness symlinks and restore
# the backups install.sh made, returning each path to its prior state.
#
# Safe to re-run. Only ever deletes symlinks that point into this repo.
# Test safely without touching real configs:
#   TARGET_HOME=/path/to/fake/home ./uninstall.sh

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_HOME="${TARGET_HOME:-$HOME}"

unlink() {
  local target="$1"
  local dir name
  dir="$(dirname "$target")"
  name="$(basename "$target")"

  if [ -L "$target" ]; then
    case "$(readlink "$target")" in
      "$REPO_DIR"*)
        rm "$target"
        echo "unlink  $target"
        ;;
      *)
        echo "skip    $target (points somewhere else, not ours)"
        return
        ;;
    esac
  elif [ -e "$target" ]; then
    echo "skip    $target (a real file sits here, not a harness link)"
  else
    echo "ok      $target (nothing to remove)"
  fi

  # Restore the newest backup for this path, if any exist and the path is free.
  # -L check included: a backed-up symlink can be dangling, and -e follows links.
  local backups=( "$dir/$name".bak-* )
  if [ -e "${backups[0]}" ] || [ -L "${backups[0]}" ]; then
    if [ -e "$target" ] || [ -L "$target" ]; then
      echo "keep    $target exists; leaving its backups in place:"
      printf '          %s\n' "${backups[@]}"
    else
      local newest_index=$((${#backups[@]} - 1))
      mv "${backups[$newest_index]}" "$target"
      echo "restore $target (from ${backups[$newest_index]})"
      backups=( "$dir/$name".bak-* )
      if [ -e "${backups[0]}" ] || [ -L "${backups[0]}" ]; then
        echo "note    older backups kept, delete by hand if unwanted:"
        printf '          %s\n' "${backups[@]}"
      fi
    fi
  fi

  # install.sh created parent dirs; remove one if it is now empty.
  # rmdir only removes empty dirs, so this can never delete real content.
  if rmdir "$dir" 2>/dev/null; then
    echo "rmdir   $dir (was empty)"
  fi
}

echo "Harness repo: $REPO_DIR"
echo "Target home:  $TARGET_HOME"
echo

unlink "$TARGET_HOME/.config/opencode/AGENTS.md"
unlink "$TARGET_HOME/.claude/CLAUDE.md"
unlink "$TARGET_HOME/.codex/AGENTS.md"
unlink "$TARGET_HOME/.config/opencode/opencode.jsonc"
unlink "$TARGET_HOME/.agents/skills/grill"

echo
echo "Done. Any *.bak-* files listed above are yours to keep or delete."
