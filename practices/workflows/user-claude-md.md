---
name: user-claude-md
description: Maintain a global ~/.claude/CLAUDE.md with identity, project rules, and a coding agent protocol
category: workflows
scope: user
priority: recommended
added: 2026-03-27
updated: 2026-03-27
check:
  type: file-exists
  command: "test -f ~/.claude/CLAUDE.md && echo 'exists' || echo 'missing'"
  expected: "exists"
apply:
  type: manual
  manual: |
    Create ~/.claude/CLAUDE.md with at minimum these sections:
    1. User Identity (name, email, how Claude should address you)
    2. Project-Specific Rules (framework quirks, deployment rules)
    3. Coding Agent Protocol (failure handling, autonomy boundaries)
tags: [claude-md, workflow, identity, configuration]
---

## Why

The global `~/.claude/CLAUDE.md` is loaded into every Claude Code session across all projects. Without it, Claude starts each conversation from scratch — no context about who you are, how you work, or what guardrails to respect.

A well-crafted global CLAUDE.md dramatically reduces:
- Repeated explanations ("don't push without asking", "call me Michael")
- Framework-specific mistakes (wrong import syntax, deprecated patterns)
- Overly autonomous behavior (deploying, force-pushing, amending commits)

## Details

### Recommended sections

**1. User Identity**
Who you are, how Claude should address you. Keeps communication natural.

```markdown
# User Identity
- **Name:** Your Name
- **Email:** your@email.com
- Refer to user as **YourName** in conversation
```

**2. Project-Specific Rules**
Framework quirks that apply across your projects. Things Claude gets wrong repeatedly.

```markdown
# Project-Specific Rules
- Never push or deploy without asking first
- MUI v7: import Grid from '@mui/material/Grid' (not Grid2!)
- Bun projects: prefer Bun's built-in SQL
```

**3. Coding Agent Protocol**
Behavioral guardrails. How Claude should handle failure, uncertainty, and autonomy.

Key principles to include:
- **RULE 0:** When anything fails, STOP. Words before tools. State what failed, your theory, what you want to do.
- **Autonomy boundaries:** Punt to user on ambiguous intent, irreversible actions, scope changes.
- **Git discipline:** `git add .` is forbidden. Add files individually.
- **Verification:** Batch size of 3 actions, then checkpoint against observable reality.
- **Epistemic hygiene:** "I believe X" is theory, "I verified X" is evidence. "I don't know" is valid.

**4. Communication preferences**
- How verbose should Claude be?
- Push back when Claude has information you don't?
- Handoff protocol when stopping mid-task?

### What NOT to put in global CLAUDE.md

- Project-specific architecture (belongs in project CLAUDE.md)
- Secrets or API keys
- Temporary instructions (use memory or conversation context)
- Things Claude already knows (general programming best practices)

### Maintenance

Review your global CLAUDE.md monthly. Remove rules you've added for one-off situations. Add patterns where Claude keeps making the same mistake.

## References

- [CLAUDE.md Best Practices — Nick Babich (UX Planet)](https://uxplanet.org/claude-md-best-practices-1ef4f861ce7c)
