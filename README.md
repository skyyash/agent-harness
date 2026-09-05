# agent-harness

My personal agent harness: the instructions, skills, and configs that sit
around any AI coding agent and shape how it works with me.

Models change constantly, so the durable investment is the harness.
This repo is mine: one source of truth, version-controlled, tool-agnostic,
symlinked into whichever tool I am using.

## Philosophy

- **Iteration over perfection.** A v0.1 that exists beats a flawless design
  that does not. This repo is built in small increments and refined forever.
- **The ratchet.** Rules get added when a real failure or correction happens,
  and every rule should trace to one. Rules without a reason get deleted.
- **Pilot's checklist, not style guide.** The global instructions file stays
  under roughly 80 lines. Every line competes for the model's attention.
- **Progressive disclosure.** The always-on file holds short rules. Depth
  lives in skills, loaded only when relevant.
- **Aware use, not over-reliance.** The harness is designed to make me
  understand more, not less: tutor disposition, drift call-outs, grilling.

## Layout

```
instructions/AGENTS.md   The global contract, symlinked into every tool
skills/grill/            Relentless questioning: stress-test, develop, check
skills/unslop/           Cut AI tells from any writing, add human voice
skills/lets-think/       Guided walk-through of general ideas, A to B
config/opencode/         OpenCode config (permissions as law)
journal.md               Log of corrections and preference discoveries
install.sh               Idempotent bootstrap with backups
uninstall.sh             Reverses install.sh, restores backups
AGENTS.md                Meta-instructions for agents editing this repo
```

## Per-tool setup

The installer wires the harness into three tools. Skill discovery paths differ:

| Tool       | Instructions         | Skills                          | Config                       |
|------------|----------------------|---------------------------------|------------------------------|
| OpenCode   | `~/.config/opencode/AGENTS.md` | `~/.agents/skills/`     | `~/.config/opencode/opencode.jsonc` |
| Claude Code | `~/.claude/CLAUDE.md` | `~/.claude/skills/`             | (no harness config needed)   |
| Codex      | `~/.codex/AGENTS.md`  | `~/.codex/skills/`              | (no harness config needed)   |

## Install

```
./install.sh
```

It prints every action, backs up replaced files to `*.bak-<timestamp>`, and
is safe to re-run. Test without touching real configs:

```
TARGET_HOME=/tmp/fake-home ./install.sh
```

Undo everything (removes the links, restores your backed-up files):

```
./uninstall.sh
```

## Evolving it

1. Annoyance is data. Correcting an agent twice on the same thing means a
   rule candidate. Agents are instructed to offer recording it.
2. Candidates land in `journal.md` first.
3. Promotion to `instructions/AGENTS.md` happens deliberately: short line,
   traceable reason.
4. Autonomy ratchets up, not down. Whitelist a command in
   `config/opencode/opencode.jsonc` only after its confirmation annoys twice.

## Roadmap

- Increment 1 (this): contract, grill, opencode config, installer.
- Increment 2: `distill` skill (harvest journal entries into proposed rule
  edits), Claude and Codex permission configs.
- Increment 3: `reviewer` subagent, `learn` skill for on-demand deep dives.
