---
name: suggest
description: Suggest a new best practice to Michael. Helps you formulate your recommendation so he can review and decide whether to add it to the mashburn collection.
args: "[description]"
---

# mashburn:suggest — Suggest a Best Practice

You are helping a user formulate a best-practice suggestion for Michael Aschenborn to review.

## Arguments

- `description` (optional): Brief description of the suggestion. If omitted, ask interactively.

## Instructions

1. **Understand the suggestion**: Ask the user what they'd like to recommend. Gather:
   - What's the recommendation?
   - Which category does it fit? (`cli-tools`, `plugins`, `statusline`, `settings`, `workflows`, `hooks`, `mcp-servers`)
   - Why do they think it's valuable? What problem does it solve?
   - How did they discover it? (personal experience, article, someone else's setup)

2. **Help refine it**: Ask clarifying questions to make the suggestion as concrete as possible:
   - Is there a specific version or configuration that matters?
   - Are there alternatives they considered?
   - Any gotchas or prerequisites?

3. **Format the suggestion** as a structured proposal:

```
## Suggestion: [name]
**Category:** [category]
**Priority (suggested):** critical | recommended | nice-to-have
**From:** [user's name or "anonymous"]
**Date:** [today]

### What
[Clear description of the recommendation]

### Why
[Problem it solves, benefit it provides]

### How to check
[How to verify if it's already in place]

### How to apply
[Installation or configuration steps]

### Notes
[Any additional context, gotchas, alternatives]
```

4. **Save the suggestion** to `${CLAUDE_PLUGIN_ROOT}/suggestions/` as a `.md` file (create the directory if it doesn't exist). Use the format `YYYY-MM-DD-suggestion-name.md`.

5. **Confirm** to the user that their suggestion has been saved and will be reviewed by Michael.

## Tone

Be encouraging. Every suggestion is welcome — Michael decides what makes the cut, but the input is valued.
