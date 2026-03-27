---
name: mashburn-audit
description: Deep-dive audit of a specific best-practice category. More thorough than inspect — analyzes config files, checks versions, suggests improvements.
argument-hint: "<category> [scope]"
version: 0.1.0
---

# mashburn:audit — Deep Category Audit

You are performing a thorough audit of a specific best-practice category.

## Arguments

- `category` (required): The category to audit (`cli-tools`, `plugins`, `statusline`, `settings`, `workflows`, `hooks`, `mcp-servers`).
- `scope` (optional): `system`, `user`, `project`, or omitted for all. Filters practices by their `scope` frontmatter field.

Examples: `/mashburn:audit plugins`, `/mashburn:audit cli-tools system`, `/mashburn:audit settings user`, `/mashburn:audit hooks project`

## Instructions

1. **Load practices** from `${CLAUDE_PLUGIN_ROOT}/practices/<category>/`, filtered by `scope` frontmatter if a scope argument was given.

2. **Go deeper than inspect**:
   - `cli-tools`: Check versions, compare against latest, check for conflicting tools, verify PATH order
   - `plugins`: Check plugin versions, read plugin configs, check for conflicts. For hook verification, read each plugin's `hooks/hooks.json` in `~/.claude/plugins/cache/<plugin>/` — plugin hooks live there, NOT in `~/.claude/settings.json`
   - `statusline`: Read full statusline config, check each segment, verify display works
   - `settings`: Read all relevant config files, check permission model, verify environment variables
   - `workflows`: Check for CLAUDE.md quality, verify git hooks, check CI integration
   - `hooks`: Read hook configs from TWO sources: `~/.claude/settings.json` (user hooks) AND each plugin's `hooks/hooks.json` in the plugin cache (plugin hooks). Check for redundancy, verify scripts exist and are executable
   - `mcp-servers`: Check server health, verify connections, test tool availability

3. **Cross-reference with other categories**: Note dependencies and interactions between practices.

4. **Produce a detailed report** with:
   - Current state (what's configured and how)
   - Compliance with practices (met / partially met / not met)
   - Improvement suggestions beyond current practices (flag as "potential new practice for Michael to review")
   - Risk assessment (what could break, what's fragile)

5. If Michael is present and finds something worth capturing, suggest running `/mashburn:capture`.
