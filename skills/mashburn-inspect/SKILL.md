---
name: mashburn-inspect
description: Analyze the current Claude Code environment against mashburn best practices. Reports what's installed, configured, missing, or outdated.
argument-hint: "[scope] [category]"
version: 0.1.0
metadata:
  bashPattern:
    - "which|--version|brew list|npm list -g|pnpm list -g"
    - "claude.*settings|claude.*config|claude.*plugin"
  filePattern:
    - "**/.claude/settings*"
    - "**/.claude/plugins/**"
    - "**/CLAUDE.md"
---

# mashburn:inspect — Environment Audit

You are auditing the user's Claude Code environment against mashburn best practices.

## Arguments

- `scope` (optional): `system`, `user`, `project`, or omitted for all. **System-level** checks the machine (CLI tools, runtimes, OS packages). **User-level** checks `~/.claude/` (settings, plugins, statusline, global CLAUDE.md). **Project-level** checks the current repo (`.claude/`, `.mcp.json`, project CLAUDE.md, hooks).
- `category` (optional): Limit inspection to a specific category (e.g., `cli-tools`, `plugins`, `statusline`, `settings`, `workflows`, `hooks`, `mcp-servers`). If omitted, inspect all categories.

Examples: `/mashburn:inspect`, `/mashburn:inspect system`, `/mashburn:inspect user plugins`, `/mashburn:inspect project hooks`

## Instructions

1. **Load practice files** from `${CLAUDE_PLUGIN_ROOT}/practices/` (or just the specified category subdirectory). Filter by the `scope` frontmatter field: if a scope argument is given (`system`, `user`, or `project`), only load practices with that scope or `scope: all`. If omitted, load all practices.

2. **For each practice**, run the check described in its `check` frontmatter field:
   - `cli-tools`: Run `which <tool>` or `<tool> --version` to verify installation
   - `plugins`: Check `~/.claude/plugins/` and `~/.claude/settings.json` for plugin presence
   - `statusline`: Read statusline config and compare against recommended settings
   - `settings`: Read relevant config files and compare values
   - `workflows`: Check for presence of expected files/configs
   - `hooks`: Check hooks configuration in settings
   - `mcp-servers`: Check MCP server configuration

3. **Present results** as a structured report:

```
## mashburn inspect report (scope: system|user|project|all)

### CLI Tools
- [x] tool-name (v1.2.3) — installed and up to date
- [ ] other-tool — NOT INSTALLED (recommended: brew install other-tool)

### Plugins
- [x] plugin-name — active
- [ ] other-plugin — not installed

### Settings
- [x] setting-name — matches recommendation
- [~] other-setting — configured but differs from recommendation
- [ ] missing-setting — not configured
```

4. **Score the environment** (practices met / total practices) per category and overall.

5. If no practices exist yet, inform the user that the mashburn practices collection is empty and suggest they ask Michael to run `/mashburn:capture` to start building it.
