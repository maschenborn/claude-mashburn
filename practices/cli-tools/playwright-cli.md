---
name: playwright-cli
description: Install playwright-cli for browser automation — web testing, screenshots, form filling, and data extraction from the terminal
category: cli-tools
scope: system
priority: recommended
added: 2026-03-27
updated: 2026-03-27
check:
  type: command
  command: "which playwright-cli && echo 'installed' || echo 'not installed'"
  expected: "installed"
apply:
  type: command
  command: "npm install -g playwright-cli"
tags: [browser, automation, testing, screenshots, web]
---

## Why

Claude Code can't interact with browsers natively. playwright-cli bridges that gap — it provides a CLI that Claude can call via Bash to open browsers, navigate pages, fill forms, take screenshots, and extract data.

Key capabilities:
- **Browser automation** — open, navigate, click, fill, submit forms
- **Screenshots & PDFs** — capture pages or specific elements
- **Snapshot-based interaction** — each command returns a structured snapshot with element refs for precise targeting
- **Multi-tab workflows** — open, switch, and manage browser tabs
- **DevTools access** — console logs, network requests, tracing
- **Session persistence** — save and restore auth state (cookies, localStorage)
- **Request mocking** — intercept and mock network requests for testing

Without it, any browser interaction requires leaving Claude Code.

## Details

### Installation

```bash
npm install -g playwright-cli
```

If global install fails, use `npx playwright-cli` as fallback.

### Companion skill

The CLI alone isn't enough — Claude needs to know the command syntax, snapshot workflow, and interaction patterns. mashburn includes an auto-activating skill that teaches Claude how to use playwright-cli effectively. It triggers automatically when browser automation is needed.

## References

- [playwright-cli on npm](https://www.npmjs.com/package/playwright-cli)
