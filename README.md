# agent-skills-pack

Three small, general-purpose [Claude Code](https://claude.com/claude-code) skills for the part of the work that happens *before* you build: zooming out, getting a second opinion, and seeing options.

## What's inside

| Skill | Invoke | Why it's here |
|---|---|---|
| `step-back` | `/step-back [area]` | Reads the git history of an area for signs of ad-hoc drift, then gives you an honest "is this shape still right?" instead of another patch. Works in any repo. |
| `two-claudes` | `/two-claudes` | Your session grills the plan with full codebase access while a separate, codebase-blind `claude -p` expert answers each question. The disagreement is where the blind spots show up. |
| `three-designs` | `/three-designs <brief>` | Three parallel sub-agents, three deliberately different design lenses, one side-by-side readout. Pick-the-best beats iterate-from-one. |

All three are plain `SKILL.md` files with no dependencies beyond Claude Code itself (`two-claudes` shells out to the `claude` CLI).

## Install

**Manual**

```sh
cp -R skills/* ~/.claude/skills/
```

**install.sh** (won't overwrite existing skills unless `--force`)

```sh
./install.sh                    # -> $CLAUDE_SKILLS_DIR, else ~/.claude/skills
./install.sh ./.claude/skills   # project-local
./install.sh --link             # symlink instead of copy
./install.sh --force            # replace existing dirs of the same name
```

Restart Claude Code (or start a new session) and the skills show up as slash commands.

## License

MIT, see `LICENSE`.
