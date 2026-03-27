# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

**mashburn** is a Claude Code plugin that packages Michael Aschenborn's curated best practices for Claude Code setup. It provides slash commands, skills, and agents that help users inspect, onboard, and maintain their Claude Code environment.

## Plugin Architecture

```
mashburn/
├── .claude-plugin/plugin.json   — Plugin manifest (name: "mashburn")
├── commands/                    — Slash commands (/mashburn:*)
│   ├── init.md                  — Onboard environment using best practices
│   ├── inspect.md               — Audit current setup against practices
│   ├── whats-new.md             — Show recent practice additions/changes
│   ├── capture.md               — (Curator) Add new best practice interactively
│   ├── audit.md                 — Deep-dive audit of a category
│   └── suggest.md               — Submit a best-practice suggestion for Michael
├── agents/
│   └── inspector.md             — System inspector subagent
├── skills/                      — Auto-activating skills
│   ├── inspect/SKILL.md
│   ├── init/SKILL.md
│   ├── whats-new/SKILL.md
│   ├── capture/SKILL.md
│   └── audit/SKILL.md
├── hooks/hooks.json             — Event handlers (skeleton)
├── practices/                   — THE CONTENT: best practices organized by category
│   ├── cli-tools/
│   ├── plugins/
│   ├── statusline/
│   ├── settings/
│   ├── workflows/
│   ├── hooks/
│   └── mcp-servers/
├── suggestions/                 — Incoming suggestions from users (reviewed by Michael)
├── scripts/                     — Helper scripts for checks
└── references/                  — Supporting documentation
```

## Key Design Rules

- **Michael is the sole initiator of best practices.** Claude helps capture, structure, and challenge — but never invents practices autonomously.
- **Practice files use YAML frontmatter** with `name`, `category`, `scope`, `priority`, `check`, `apply`, `added`, `tags`.
- **Three scopes**: `system` (machine/OS/CLI), `user` (~/.claude/ config), `project` (per-repo .claude/). Use `all` if a practice applies everywhere.
- **`${CLAUDE_PLUGIN_ROOT}`** must be used for all intra-plugin path references — never hardcode paths.
- **Commands are consumer-facing** (`init`, `inspect`, `whats-new`, `audit`, `suggest`) except `capture` which is curator-only.
- **The `practices/` directory is the source of truth.** Commands and skills read from it; only `capture` writes to it.

## Practice File Format

```yaml
---
name: practice-name
description: One-line summary
category: cli-tools|plugins|statusline|settings|workflows|hooks|mcp-servers
scope: system|user|project|all
priority: critical|recommended|nice-to-have
added: YYYY-MM-DD
updated: YYYY-MM-DD
check:
  type: command|file-exists|config-value|custom
  command: "verification command"
  expected: "expected output or condition"
apply:
  type: command|manual
  command: "install/apply command"
  manual: "manual steps if not automatable"
tags: [relevant, tags]
---
```

## Developing This Plugin

- Test locally:
  1. `claude plugins marketplace add /Users/maschenborn/Dev/claude-mashburn`
  2. `claude plugins install mashburn`
- After changes to commands/skills/agents: restart Claude Code session to reload
- After changes to practice files: no restart needed (read at runtime)
- Validate structure: `ls .claude-plugin/plugin.json` must exist

## Conventions

- kebab-case for all file and directory names
- One practice per file, one category per directory
- Frontmatter dates are ISO 8601 (YYYY-MM-DD)
- Check commands must be non-destructive and read-only
- Apply commands should be idempotent where possible
