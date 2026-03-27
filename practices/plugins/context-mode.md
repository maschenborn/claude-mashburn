---
name: context-mode
description: Install context-mode plugin to reduce context window consumption by ~98% and enable session continuity across compactions
category: plugins
scope: user
priority: recommended
added: 2026-03-27
updated: 2026-03-27
check:
  type: command
  command: "test -d ~/.claude/plugins/cache/context-mode && echo 'installed' || echo 'not installed'"
  expected: "installed"
apply:
  type: manual
  manual: |
    1. Run: claude plugins marketplace add mksglu/context-mode
    2. Run: claude plugins install context-mode@context-mode
    3. Restart Claude Code session
    4. Verify with: /context-mode:ctx-doctor (all checks should show [x])
tags: [context-window, performance, session-continuity, mcp]
---

## Why

Claude Code's context window fills up fast. Raw tool output — Playwright snapshots, log files, API responses, git diffs — can consume 40% of available context within 30 minutes. When the context compacts, Claude loses track of what it was doing: which files were being edited, what tasks were in progress, what decisions were made.

context-mode solves both problems:

- **Context reduction:** Raw data gets sandboxed into SQLite instead of flooding the context window. A 56 KB Playwright snapshot becomes 299 bytes. Typical sessions see ~98% reduction (315 KB → 5.4 KB).
- **Session continuity:** Every event (tool calls, file edits, errors, decisions) is tracked in a FTS5 full-text search index. After compaction, a session guide restores the working state — no more "what were we doing?" questions.

The practical effect: sessions last ~3 hours instead of ~30 minutes before hitting context limits.

## Details

context-mode is an MCP server plugin that provides six sandbox tools:

- `ctx_batch_execute` — Run multiple commands + search in one call (primary research tool)
- `ctx_execute` / `ctx_execute_file` — Process data in sandbox (11 languages supported)
- `ctx_search` — Query indexed content via BM25 ranking
- `ctx_index` / `ctx_fetch_and_index` — Chunk and index markdown/HTML for later search

Hooks (PreToolUse, PostToolUse, PreCompact, SessionStart) automatically route large outputs to the sandbox and capture session events.

### Health check after installation

Run `/context-mode:ctx-doctor` to verify all components are working. All checks should show `[x]`:
- Node.js runtime available
- better-sqlite3 built
- FTS5 extension loaded
- Hooks registered (PreToolUse, PostToolUse, PreCompact, SessionStart)

### Other useful commands

- `/context-mode:ctx-stats` — Show context savings for current session
- `/context-mode:ctx-upgrade` — Update to latest version from GitHub

## References

- [GitHub: mksglu/context-mode](https://github.com/mksglu/context-mode)
