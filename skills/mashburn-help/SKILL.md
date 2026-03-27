---
name: mashburn-help
description: Show a friendly overview of what mashburn is, what it does, and how to use it.
argument-hint: ""
version: 0.1.0
---

# mashburn:help — What is mashburn?

Present the following overview to the user in a clear, friendly way. Use the exact structure below but render it as formatted markdown (not inside a code block):

---

## What is mashburn?

**mashburn** is a curated collection of best practices for Claude Code, maintained by Michael Aschenborn. It helps you set up and maintain your Claude Code environment — the right CLI tools, plugins, statusline, settings, and workflows.

Think of it as a knowledgeable colleague who already figured out the optimal setup and shares it with you.

## What does it check?

mashburn organizes recommendations into categories:

- **cli-tools** — Essential command-line tools (git, jq, ripgrep, ffmpeg, nano-banana, gh, and more)
- **plugins** — Claude Code plugins that make a real difference (context-mode, superpowers, skill-creator)
- **statusline** — A proper HUD showing context usage, git state, and session info (claude-hud)
- **settings** — Claude Code configuration and permissions
- **workflows** — Working patterns, CLAUDE.md conventions, git habits
- **hooks** — Useful hook configurations
- **mcp-servers** — MCP server recommendations

## How to use it

| Command | What it does |
|---------|-------------|
| `/mashburn-init` | Walk you through setting up everything from scratch |
| `/mashburn-inspect` | Quick check — what's installed, what's missing |
| `/mashburn-audit <category>` | Deep dive into a specific category with version checks and config analysis |
| `/mashburn-whats-new` | See recently added or updated practices |
| `/mashburn-suggest` | Propose a new best practice for Michael to review |
| `/mashburn-share` | Get a copy-pasteable message to share mashburn with others |
| `/mashburn-help` | This overview |

## How it works

Each recommendation is a practice file with:
- A **check** command to verify if it's already in place
- An **apply** instruction to set it up
- A **priority** level (critical / recommended / nice-to-have)
- An explanation of **why** it matters

mashburn never changes anything without asking. It recommends — you decide.

## Who made this?

Michael Aschenborn ([@maschenborn](https://github.com/maschenborn)) — based on extensive Claude Code research and daily use. Contributions welcome via `/mashburn-suggest`.

---

After presenting this overview, ask the user if they'd like to run `/mashburn-inspect` to see how their environment looks.
