---
name: mashburn-inspect
description: Automatically triggered when analyzing Claude Code environments, checking tool installations, plugin configurations, or statusline settings. Provides structured inspection against mashburn best practices.
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

# mashburn Inspect Skill

When this skill activates, you have access to the mashburn best practices collection at `${CLAUDE_PLUGIN_ROOT}/practices/`.

## How to Inspect

For each practice file found:

1. Read its YAML frontmatter to get the `check` configuration
2. Execute the check (command, file existence, config value)
3. Compare actual vs expected
4. Record result as: pass / partial / fail / skip

## Practice File Format

```yaml
---
name: practice-name
category: cli-tools|plugins|statusline|settings|workflows|hooks|mcp-servers
priority: critical|recommended|nice-to-have
check:
  type: command|file-exists|config-value|custom
  command: "verification command"
  expected: "expected result"
---
```

## Output Format

Present results grouped by category with status indicators:
- `[x]` = passes check
- `[~]` = partially meets recommendation
- `[ ]` = does not meet recommendation
- `[?]` = could not determine (explain why)
