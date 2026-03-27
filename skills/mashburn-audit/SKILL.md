---
name: mashburn-audit
description: Deep-dive audit of a specific best-practice category, or "full" for a complete environment audit across all categories.
argument-hint: "<category|full> [scope]"
version: 0.1.0
---

# mashburn:audit — Deep Category Audit

You are performing a thorough audit of the user's Claude Code environment against mashburn best practices.

## Arguments

- `category` (required): The category to audit (`cli-tools`, `plugins`, `statusline`, `settings`, `workflows`, `hooks`, `mcp-servers`), OR `full` for a complete audit across ALL categories.
- `scope` (optional): `system`, `user`, `project`, or omitted for all. Filters practices by their `scope` frontmatter field.

Examples: `/mashburn-audit plugins`, `/mashburn-audit cli-tools system`, `/mashburn-audit full`

## Instructions for category audit

When a specific category is given:

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

5. If Michael is present and finds something worth capturing, suggest running `/mashburn-capture`.

## Instructions for `full` audit

When the argument is `full`, run a complete environment audit:

1. **Load ALL practice files** from `${CLAUDE_PLUGIN_ROOT}/practices/` across all category subdirectories.

2. **For each practice**, run the check described in its `check` frontmatter field and record the result.

3. **Present a structured report** with this exact format:

```
# mashburn full audit report

**Date:** YYYY-MM-DD
**mashburn version:** (read from ${CLAUDE_PLUGIN_ROOT}/.claude-plugin/plugin.json)
**Practices checked:** X total

## Summary

| Category | Practices | Met | Partial | Missing | Score |
|----------|-----------|-----|---------|---------|-------|
| cli-tools | X | X | X | X | X% |
| plugins | X | X | X | X | X% |
| statusline | X | X | X | X | X% |
| workflows | X | X | X | X | X% |
| mcp-servers | X | X | X | X | X% |
| **Total** | **X** | **X** | **X** | **X** | **X%** |

## CLI Tools

### essential-cli-toolkit
[For each tool in the toolkit, show individual status]

| Tool | Status | Path / Fix |
|------|--------|------------|
| git | OK | /opt/homebrew/bin/git |
| bat | MISSING | `brew install bat` |

### gh-cli
- Status: MET / PARTIAL / NOT MET
- Version: X.X.X
- Auth: authenticated as <user> / NOT authenticated
- [If PARTIAL/NOT MET: what's missing and how to fix]

### nano-banana
- Status: MET / PARTIAL / NOT MET
- GEMINI_API_KEY: configured / NOT configured
- [If PARTIAL/NOT MET: what's missing and how to fix]

## Plugins

### context-mode
- Status: MET / NOT MET
- Version: X.X.X
- Hooks: X registered
- [If NOT MET: install steps]

### superpowers
- Status: MET / NOT MET
- Version: X.X.X

### skill-creator
- Status: MET / NOT MET

## Statusline

### claude-hud
- Status: MET / NOT MET
- [If MET: show current config summary]
- [If NOT MET: install steps]

## Workflows

### user-claude-md
- Status: MET / NOT MET
- [If MET: show which sections are present]
- [If NOT MET: guide to create it]

### project-claude-md
- Status: MET / NOT MET
- [If in a project directory: check for CLAUDE.md]
- [If Next.js project: check for agents-md marker]
- [If NOT MET: guide to create it]

## MCP Servers

### pal-mcp-server
- Status: MET / NOT MET
- [If MET: check API key availability]
- [If NOT MET: install steps]

## Quick Fix

[List all NOT MET and PARTIAL items with one-liner fix commands, grouped for easy copy-paste]
```

4. **Important rules for the full audit:**
   - Run ALL checks, don't skip categories
   - For each practice, use the `check.command` from its frontmatter first, then add deeper analysis
   - Show concrete fix commands — the user should be able to copy-paste to resolve issues
   - The "Quick Fix" section at the end must list every actionable item
   - Do NOT analyze things beyond the practices (no recommendations about plugins the user has that mashburn doesn't cover — that's for a future feature)
   - Keep findings factual: installed or not, configured or not, version X or missing
