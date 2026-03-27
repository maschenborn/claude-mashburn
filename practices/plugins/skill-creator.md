---
name: skill-creator
description: Install skill-creator plugin for creating, improving, and evaluating Claude Code skills with performance benchmarking
category: plugins
scope: user
priority: recommended
added: 2026-03-27
updated: 2026-03-27
check:
  type: command
  command: "test -d ~/.claude/plugins/cache/claude-plugins-official/skill-creator && echo 'installed' || echo 'not installed'"
  expected: "installed"
apply:
  type: manual
  manual: |
    1. Run: claude plugin marketplace add anthropics/claude-code-plugins
    2. Run: claude plugin install skill-creator
    3. Restart Claude Code session
tags: [skills, development, evals, optimization]
---

## Why

Building good Claude Code skills is trial and error without tooling. skill-creator provides a structured workflow for creating, refining, and measuring skill performance — including eval runs and variance analysis.

Key capabilities:

- **Create skills from scratch** — guided workflow for structure, description, and content
- **Improve existing skills** — optimize descriptions for better triggering accuracy
- **Run evals** — test if a skill triggers correctly across different prompts
- **Benchmark performance** — variance analysis to measure consistency

Without it, skill descriptions are guesswork — you don't know if your skill triggers when it should or stays silent when it shouldn't.

## Details

### Usage

Invoke via `/skill-creator:skill-creator` or let it auto-trigger when you mention creating or improving a skill.

### When to use

- Building a new skill for a plugin or personal use
- A skill isn't triggering when it should (description optimization)
- A skill triggers too often on unrelated prompts (false positive reduction)
- You want to measure how reliably a skill activates

## References

- Official Anthropic plugin (claude-plugins-official marketplace)
