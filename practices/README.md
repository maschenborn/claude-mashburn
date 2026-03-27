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

Empty category directories (with `.gitkeep`) are placeholders for planned practices.

## Practice File Format

Each `.md` file in a category directory is one practice. See `/mashburn-capture` for the full template.

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

## Check Command Patterns

Use consistent patterns for verification:

| Type | Pattern | Example |
|------|---------|---------|
| CLI tool | `which <tool>` | `which gh && echo 'installed' \|\| echo 'not installed'` |
| Plugin (standalone) | `test -d ~/.claude/plugins/cache/<plugin>` | `test -d ~/.claude/plugins/cache/context-mode` |
| Plugin (marketplace) | `test -d ~/.claude/plugins/cache/<marketplace>/<plugin>` | `test -d ~/.claude/plugins/cache/claude-plugins-official/superpowers` |
| File exists | `test -f <path>` | `test -f ~/.claude/CLAUDE.md` |
| Custom | Shell script in `check.command` | Multi-tool check with loop |

Plugin cache paths differ based on install source — standalone plugins use `cache/<name>`, marketplace plugins use `cache/<marketplace>/<name>`.

## Adding Practices

Use `/mashburn-capture` — it guides you through the process interactively.
