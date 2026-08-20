# AGENTS.md

This repo is the user's personal agent harness; files here are the product.
Craft matters more than speed.

## What lives where

- `instructions/AGENTS.md` - the global contract. Hard budget: ~80 lines.
  Every rule must trace to a journal entry or a plain user statement. No
  trace, no rule.
- `skills/*/SKILL.md` - lazy-loaded procedures. Frontmatter `description`
  decides whether the skill ever gets seen; write it with trigger phrases.
  `skills/unslop/` is inspired by cursor's pstack unslop skill
  (https://github.com/cursor/plugins/blob/main/pstack/skills/unslop/SKILL.md),
  edited by me.
- `config/` - per-tool configs. Enforcement, not advice.
- `journal.md` - append-only corrections log. Never rewrite old entries.
- `install.sh` / `uninstall.sh` - the only files that touch anything outside
  this repo, and only when the user runs them.

## Editing rules

- Match the established voice: plain, terse, no emojis, no em dashes.
- Comments in config files explain the why, one line each.
- When the user corrects you about a preference, propose a journal entry or
  an edit to `instructions/AGENTS.md`. That loop is the point of this repo.
- Never run `install.sh` or `uninstall.sh` yourself. Present changes and let
  the user run them.
- No git commits unless the user explicitly asks.
