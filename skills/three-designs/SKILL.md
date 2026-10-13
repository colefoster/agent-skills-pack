---
name: three-designs
description: Spawn 3 parallel sub-agents to produce 3 radically different design solutions to a problem, each using a distinct mental model or design strategy. Use when user wants prototype variants, design options, "give me three", "show me different takes", or has a vague creative brief (new tab, new page, new feature, new layout, new API shape) and wants to see range before committing.
---

# Three Designs

User has a design problem. Generate **3 radically different solutions in parallel**, each anchored to a different mental model. Pick-the-best beats iterate-from-one.

## Workflow

### 1. Pin down the brief (fast)

One short message back to the user with whatever is genuinely ambiguous. Do **not** interrogate — the whole point is speed and range. If the brief is "new tab for a website, surprise me," that's enough; just confirm:

- What/where the artifact lives (web page, component, API, doc, etc.)
- Audience / vibe if not obvious
- Any hard constraints (existing stack, must-have content, must-not-do)

If the user already gave enough, skip the question and go.

### 2. Pick 3 distinct mental models

Choose 3 lenses that will actually pull the designs apart. Examples (pick whichever fit; mix and match):

**Strategy lenses**
- Minimalist / "what's the least that could work"
- Maximalist / "what if we went all-in"
- Opinionated-default / one obvious primary action
- Exploratory / browsing-first, multiple entry points
- Content-first / let the material drive the shape
- Tool-first / let the interaction drive the shape

**Mental-model lenses**
- "Treat it like a magazine"
- "Treat it like a terminal"
- "Treat it like a museum exhibit"
- "Treat it like a social feed"
- "Treat it like a dashboard"
- "Treat it like a single landing page"
- "Borrow the shape of [Stripe / Linear / Craigslist / Are.na / iOS Notes / etc.]"

**Constraint lenses**
- "One screen, no scroll"
- "Zero JS"
- "Mobile-only thinking"
- "What if the user only had 10 seconds"

State the 3 chosen lenses to the user in one line before spawning, so they see the spread. Make them genuinely different — three flavors of minimalism is a failure mode.

### 3. Spawn 3 sub-agents in parallel

Single message, 3 `Agent` tool calls (general-purpose unless task is clearly code-heavy). Each prompt includes:

- The brief verbatim
- That sub-agent's assigned lens and **why** it's distinct
- Hard rule: do not hedge toward the "safe" version — commit to the lens
- Output contract (below)
- Tell each agent it is one of three and to **not** try to be the universal best — its job is to be the best version of *its* lens

**Output contract for each agent:**

1. **Name** of the design (2–4 words, evocative)
2. **One-sentence pitch** — what this is, in plain words
3. **Key moves** — 3–6 bullets, the load-bearing decisions
4. **Sketch** — for UI: ASCII wireframe or structured markup. For API/code: signature + usage example. For docs/copy: short excerpt.
5. **What it's great at** — 1–2 bullets
6. **What it sacrifices** — 1–2 bullets (every design has a cost; if an agent says "no downsides," push back)

Cap each agent at ~250 words of report — the user is going to skim.

### 4. Present all 3 side-by-side

Render them as 3 clearly-labeled sections in one response. Lead with a one-line summary of each so the user can skim before drilling in:

```
1. **Magazine** — long-scroll editorial, hero image, big type
2. **Terminal** — keyboard-driven index, monospace, dense
3. **Museum** — one item per screen, lots of whitespace, slow reveal
```

Then the full reports below.

### 5. Recommend, but lightly

End with **one short paragraph**: which one you'd pick and why, plus the most interesting cross-pollination ("the X from #2 inside #1's shell would be strong"). Don't lobby — the user is the taste-maker.

## Anti-patterns

- **Three shades of the same thing.** If two designs converge, your lenses were too close. Pick again.
- **Hedging sub-agents.** Each one must commit. A sub-agent producing "a balanced approach" defeats the skill.
- **Over-questioning up front.** Max one clarifying message. If the brief is "surprise me," surprise them.
- **Walls of prose.** The user will skim — use the output contract, keep bullets tight, bold the load-bearing words.
- **Implementing.** This is prototypes / sketches, not finished code. Don't write the real thing unless asked.
