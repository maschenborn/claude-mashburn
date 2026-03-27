---
name: mashburn-init
description: Guides new users through Claude Code environment setup using mashburn best practices. Checks prerequisites, walks through recommendations, offers to apply changes.
version: 0.1.0
metadata:
  bashPattern:
    - "mashburn.*init|setup.*claude|onboard"
---

# mashburn Init Skill

When activated, guide the user through setting up their Claude Code environment.

## Workflow

1. Run inspect first to understand current state
2. Present practices grouped by priority (critical first)
3. For each recommendation, offer to apply — never auto-apply
4. Summarize what was done at the end

## Key Principle

These are Michael Aschenborn's curated recommendations. Present them as informed suggestions, not mandates. The user decides what to adopt.
