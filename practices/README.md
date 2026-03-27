# Best Practices Collection

This directory contains mashburn's curated best practices, organized by category.

## Categories

- **cli-tools/** — Command-line tools that should be installed
- **plugins/** — Claude Code plugins to use and configure
- **statusline/** — Statusline/HUD configuration recommendations
- **settings/** — Claude Code settings, permissions, and environment
- **workflows/** — Working patterns, CLAUDE.md conventions, git workflows
- **hooks/** — Useful hook configurations
- **mcp-servers/** — MCP server recommendations

## Practice File Format

Each `.md` file in a category directory is one practice. See `/mashburn:capture` for the full template.

```yaml
---
name: practice-name
description: One-line summary
category: cli-tools
scope: system|user|project|all
priority: critical|recommended|nice-to-have
added: 2026-03-27
check:
  type: command
  command: "which tool-name"
  expected: "non-empty output"
apply:
  type: command
  command: "brew install tool-name"
tags: [tag1, tag2]
---

## Why
...

## Details
...
```

## Adding Practices

Use `/mashburn:capture` — it guides you through the process interactively.
