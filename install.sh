#!/usr/bin/env bash
# Copy the skills in ./skills into a Claude Code skills directory.
# Usage: ./install.sh [--force] [--link] [target-dir]
# Target defaults to $CLAUDE_SKILLS_DIR, then ~/.claude/skills.
set -euo pipefail

force=0; link=0; target=""
for a in "$@"; do
  case "$a" in
    --force) force=1 ;;
    --link) link=1 ;;
    -h|--help) sed -n '2,4p' "$0"; exit 0 ;;
    *) target="$a" ;;
  esac
done
target="${target:-${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}}"
src="$(cd "$(dirname "$0")" && pwd)/skills"

mkdir -p "$target"
for dir in "$src"/*/; do
  name="$(basename "$dir")"
  dest="$target/$name"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    if [ "$force" -ne 1 ]; then
      echo "skip  $name (exists; use --force to overwrite)"
      continue
    fi
    rm -rf "$dest"
  fi
  if [ "$link" -eq 1 ]; then ln -s "${dir%/}" "$dest"; echo "link  $name"
  else cp -R "${dir%/}" "$dest"; echo "copy  $name"; fi
done
echo "done -> $target"
