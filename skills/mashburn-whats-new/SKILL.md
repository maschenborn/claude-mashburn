---
name: mashburn-whats-new
description: Show recent additions and changes to mashburn best practices. Helps users stay up to date with new recommendations.
argument-hint: "[count]"
version: 0.1.0
---

# mashburn:whats-new — Recent Changes

Show the user what's new in the mashburn best practices collection.

## Arguments

- `count` (optional): Number of recent changes to show. Defaults to 10.

## Instructions

1. **Read all practice files** from `${CLAUDE_PLUGIN_ROOT}/practices/` and their subdirectories.

2. **Sort by `added` or `updated` date** from each file's YAML frontmatter (most recent first).

3. **Present as a changelog**:

```
## What's New in mashburn

### 2026-03-27
- **[cli-tools]** Added: tool-name — reason it was added
- **[plugins]** Updated: plugin-name — what changed in the recommendation

### 2026-03-20
- **[settings]** Added: setting-name — why this matters
```

4. **Highlight breaking changes** — if a practice was removed or significantly changed, call it out clearly.

5. If no practices exist yet, say so and explain that Michael curates these personally.
