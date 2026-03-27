---
name: capture
description: (Curator only) Interactively capture a new best practice. Guides Michael through documenting a recommendation with proper metadata and check commands.
args: "[category]"
---

# mashburn:capture — Best Practice Capture

You are helping Michael (the curator) document a new best practice for the mashburn collection.

## Arguments

- `category` (optional): Pre-select the category. If omitted, ask Michael.

## Instructions

1. **Ask Michael what he wants to capture** if not already clear from context. Prompt for:
   - What's the recommendation?
   - Which category? (`cli-tools`, `plugins`, `statusline`, `settings`, `workflows`, `hooks`, `mcp-servers`)
   - Which scope? (`system` = machine/OS/CLI tools, `user` = ~/.claude/ config, `project` = per-repo config, `all` = applies everywhere)
   - Why does this matter? (the reasoning behind it)
   - How to check if it's already in place? (the verification command or check)
   - How to apply it? (install command, config change, etc.)
   - Priority: `critical` | `recommended` | `nice-to-have`

2. **Be a sparring partner**: Challenge assumptions, ask if there are edge cases, suggest related practices that might also be worth capturing.

3. **Generate the practice file** using this template:

```markdown
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
  command: "the verification command"
  expected: "expected output or condition"
apply:
  type: command|manual
  command: "the install/apply command"
  manual: "manual steps if not automatable"
tags: [relevant, tags]
---

## Why

Explanation of why this practice matters. What problem does it solve?
What happens if you don't follow it?

## Details

Additional context, configuration examples, gotchas.

## References

- Links to relevant documentation
- Related practices
```

4. **Write the file** to `${CLAUDE_PLUGIN_ROOT}/practices/<category>/<practice-name>.md`

5. **Confirm with Michael** before writing. Show the full file content for review.

6. After saving, remind Michael to commit the new practice.
