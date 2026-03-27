---
name: ui-ux-pro-max
description: Install UI/UX Pro Max plugin for design intelligence — 50+ styles, color palettes, font pairings, charts, and multi-framework support
category: plugins
scope: user
priority: recommended
added: 2026-03-27
updated: 2026-03-27
check:
  type: command
  command: "test -d ~/.claude/plugins/cache/ui-ux-pro-max-skill && echo 'installed' || echo 'not installed'"
  expected: "installed"
apply:
  type: manual
  manual: |
    1. Run: claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill
    2. Run: claude plugin install ui-ux-pro-max
    3. Restart Claude Code session
tags: [ui, ux, design, styles, typography, color, components]
---

## Why

Claude Code produces functional but generic-looking UIs by default. UI/UX Pro Max injects deep design intelligence — styles, palettes, font pairings, and UX guidelines — so Claude generates visually distinctive, production-grade interfaces.

Key capabilities:
- **50+ design styles** — glassmorphism, claymorphism, brutalism, neumorphism, bento grid, and more
- **161 color palettes** and **57 font pairings** for cohesive design
- **25 chart types** with proper data visualization patterns
- **10 framework stacks** — React, Next.js, Vue, Svelte, SwiftUI, React Native, Flutter, Tailwind, shadcn/ui, HTML/CSS
- **99 UX guidelines** for interaction states, spacing, accessibility
- **161 product types** — website, dashboard, SaaS, e-commerce, mobile app, etc.

Without it, Claude defaults to safe, bland layouts that look AI-generated.

## Details

### How it works

Auto-activating skill — triggers when you ask Claude to build, design, or improve any UI component. No slash command needed. Just describe what you want and the skill provides design context.

### Actions it supports

plan, build, create, design, implement, review, fix, improve, optimize, enhance, refactor, and check UI/UX code.

### shadcn/ui integration

Includes MCP integration for shadcn/ui component search and examples when available.

## References

- Author: nextlevelbuilder
- [Marketplace: nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)
