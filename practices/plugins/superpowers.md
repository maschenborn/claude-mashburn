---
name: superpowers
description: Install superpowers plugin for structured development workflows — TDD, debugging, planning, code review, and parallel agents
category: plugins
scope: user
priority: recommended
added: 2026-03-27
updated: 2026-03-27
check:
  type: command
  command: "test -d ~/.claude/plugins/cache/claude-plugins-official/superpowers && echo 'installed' || echo 'not installed'"
  expected: "installed"
apply:
  type: manual
  manual: |
    1. Run: claude plugin marketplace add obra/superpowers
    2. Run: claude plugin install superpowers
    3. Restart Claude Code session
tags: [workflows, tdd, debugging, planning, code-review, agents]
---

## Why

Claude Code is capable but unstructured by default — it jumps straight into code without planning, skips tests, and doesn't verify its own work. superpowers fixes this by teaching Claude disciplined development workflows through a collection of 14 skills.

The most impactful skills:

- **writing-plans** — Forces Claude to plan before coding. Produces step-by-step implementation plans with architectural considerations.
- **executing-plans** — Executes plans with review checkpoints instead of charging ahead.
- **test-driven-development** — Red-green-refactor discipline. Write tests first, then implement.
- **systematic-debugging** — Structured debugging instead of guess-and-check. Hypothesis-driven with evidence.
- **verification-before-completion** — Prevents Claude from claiming "done" without running verification. Evidence before assertions.
- **dispatching-parallel-agents** — Splits independent tasks across subagents for parallel execution.
- **brainstorming** — Explores requirements and design before implementation. Mandatory before creative work.
- **using-git-worktrees** — Isolates feature work in git worktrees for safe experimentation.
- **code-review** — Structured code review requesting and receiving with technical rigor.

Without superpowers, Claude tends to skip planning, skip tests, and declare success without verification.

## Details

### How it works

superpowers is a skills-only plugin — no hooks, no MCP servers, no agents. Each skill is a markdown file that gets loaded into Claude's context when triggered, teaching it a specific workflow pattern.

### Key skill triggers

- `/superpowers:writing-plans` — before multi-step tasks
- `/superpowers:test-driven-development` — before implementing features
- `/superpowers:systematic-debugging` — when hitting bugs
- `/superpowers:verification-before-completion` — before claiming done
- `/superpowers:brainstorming` — before creative work

### Auto-activation

The `using-superpowers` skill loads at session start and teaches Claude when to invoke other skills. Most skills trigger automatically based on context — no manual invocation needed.

## References

- [GitHub: obra/superpowers](https://github.com/obra/superpowers)
- Author: Jesse Vincent (jesse@fsck.com)
