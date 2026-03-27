---
name: vercel-shadcn
description: Install Vercel plugin for shadcn/ui component integration — search components, view examples, and use best practices
category: plugins
scope: user
priority: recommended
added: 2026-03-27
updated: 2026-03-27
check:
  type: command
  command: "test -d ~/.claude/plugins/cache/claude-plugins-official/vercel && echo 'installed' || echo 'not installed'"
  expected: "installed"
apply:
  type: manual
  manual: |
    1. Run: claude plugin marketplace add anthropics/claude-code-plugins
    2. Run: claude plugin install vercel
    3. Restart Claude Code session
tags: [shadcn, ui, components, vercel, react, nextjs]
---

## Why

shadcn/ui is the dominant component library for modern React/Next.js projects. The Vercel plugin gives Claude direct access to shadcn/ui component documentation, examples, and patterns — so it uses components correctly instead of guessing or hallucinating props.

Key capabilities:
- Search shadcn/ui components by name or functionality
- View component examples and usage patterns
- Follow shadcn/ui best practices for composition and styling

Without it, Claude often gets shadcn/ui component APIs wrong or uses outdated patterns.

## Details

### What's included

The Vercel plugin includes a `shadcn` skill that provides component reference and examples. It auto-activates when Claude detects shadcn/ui usage in a project.

### When to use

Essential for any project using shadcn/ui. Also useful as reference even when exploring whether to adopt shadcn/ui.

## References

- [shadcn/ui](https://ui.shadcn.com/)
- Official Anthropic plugin (claude-plugins-official marketplace)
