---
name: frontend-design
description: Install frontend-design plugin for distinctive, production-grade UI implementation that avoids generic AI aesthetics
category: plugins
scope: user
priority: recommended
added: 2026-03-27
updated: 2026-03-27
check:
  type: command
  command: "test -d ~/.claude/plugins/cache/claude-plugins-official/frontend-design && echo 'installed' || echo 'not installed'"
  expected: "installed"
apply:
  type: manual
  manual: |
    1. Run: claude plugin marketplace add anthropics/claude-code-plugins
    2. Run: claude plugin install frontend-design
    3. Restart Claude Code session
tags: [frontend, ui, design, components, css, html]
---

## Why

Official Anthropic plugin that teaches Claude to create polished, creative frontend interfaces. Focuses on avoiding the "looks AI-generated" problem — generic layouts, predictable color choices, and cookie-cutter components.

Triggers automatically when you ask Claude to build web components, pages, landing pages, dashboards, or any web UI.

## Details

### What it improves

- Component quality — distinctive, not template-looking
- Layout creativity — breaks out of generic grid patterns
- Visual polish — attention to spacing, shadows, transitions
- Code quality — production-ready, accessible HTML/CSS/React

### Complements UI/UX Pro Max

frontend-design focuses on **implementation quality** (making code look good). UI/UX Pro Max focuses on **design intelligence** (choosing the right styles, colors, fonts). Together they cover the full design-to-code pipeline.

## References

- Official Anthropic plugin (claude-plugins-official marketplace)
