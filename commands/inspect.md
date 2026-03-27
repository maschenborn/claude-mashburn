---
name: inspect
description: Analyze the current Claude Code environment against mashburn best practices. Reports what's installed, configured, missing, or outdated.
args: "[category]"
---

# mashburn:inspect — Environment Audit

You are auditing the user's Claude Code environment against mashburn best practices.

## Arguments

- `category` (optional): Limit inspection to a specific category (e.g., `cli-tools`, `plugins`, `statusline`, `settings`, `workflows`, `hooks`, `mcp-servers`). If omitted, inspect all categories.

## Instructions

1. **Load all practice files** from `${CLAUDE_PLUGIN_ROOT}/practices/` (or just the specified category subdirectory).

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
## mashburn inspect report

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
