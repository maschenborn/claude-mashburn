---
name: claude-hud
description: Install claude-hud plugin for a rich, configurable statusline showing context usage, git state, tools, and more
category: statusline
scope: user
priority: recommended
added: 2026-03-27
updated: 2026-03-27
check:
  type: command
  command: "test -d ~/.claude/plugins/cache/claude-hud && echo 'installed' || echo 'not installed'"
  expected: "installed"
apply:
  type: manual
  manual: |
    1. Run: claude plugin marketplace add anthropics/claude-hud
    2. Run: claude plugin install claude-hud
    3. Restart Claude Code session
    4. Optionally configure via /claude-hud:configure or /claude-hud:setup
tags: [statusline, hud, context, monitoring, ux]
---

## Why

Claude Code's default statusline is minimal — just model name and context percentage. claude-hud replaces it with a rich, real-time dashboard showing everything you need at a glance:

- **Context usage** — percent, tokens, or remaining (configurable)
- **Project info** — git branch, repo name
- **Tool/agent counts** — how many MCP servers, agents, hooks are active
- **Memory/todo status** — active tasks and memory entries
- **Usage tracking** — token consumption per session

Without it, you're flying blind on context consumption — the #1 cause of degraded Claude performance in long sessions.

## Details

### How it works

claude-hud is a Claude Code plugin that registers a `statusLine` command in `settings.json`. It runs as a Bun script that reads Claude's internal state and renders a formatted statusline on every update.

### Configuration

claude-hud works well with defaults. For customization, use the built-in skills:

- `/claude-hud:setup` — Initial setup and configuration
- `/claude-hud:configure` — Change layout, elements, colors

Or create `~/.claude/claude-hud.local.md` with YAML frontmatter for manual overrides:

```yaml
---
layout: compact
contextValue: percent
elements:
  - project
  - context
  - usage
  - memory
  - tools
colors:
  context: cyan
  warning: yellow
  critical: red
---
```

### Available elements

`project`, `context`, `usage`, `memory`, `environment`, `tools`, `agents`, `todos`

### Color options

Named presets (`dim`, `red`, `green`, `yellow`, `magenta`, `cyan`, `brightBlue`, `brightMagenta`), 256-color index (0-255), or hex values (`#rrggbb`).

## References

- [GitHub: anthropics/claude-hud](https://github.com/anthropics/claude-hud)
