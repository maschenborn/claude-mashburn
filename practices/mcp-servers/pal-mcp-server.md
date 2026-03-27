---
name: pal-mcp-server
description: Install PAL MCP server to give Claude access to other AI models (GPT, Gemini, Grok) for code review, planning, consensus, and deep reasoning
category: mcp-servers
scope: user
priority: recommended
added: 2026-03-27
updated: 2026-03-27
check:
  type: command
  command: "test -d ~/Dev/pal-mcp-server && echo 'installed' || echo 'not installed'"
  expected: "installed"
apply:
  type: manual
  manual: |
    1. Clone: git clone https://github.com/BeehiveInnovations/pal-mcp-server.git ~/Dev/pal-mcp-server
    2. Run setup: cd ~/Dev/pal-mcp-server && ./run-server.sh
    3. Configure at least one API key (GEMINI_API_KEY, OPENAI_API_KEY, or OPENROUTER_API_KEY)
    4. Restart Claude Code session
tags: [mcp, multi-model, code-review, planning, reasoning, consensus]
---

## Why

Claude Code is powerful, but sometimes a second opinion from a different model catches things Claude misses. PAL gives Claude access to 70+ models from OpenAI, Google, X.AI, and others — directly within your Claude Code session. No context switching, no copy-paste between tools.

Key use cases:

- **Code review** (`/pal:codereview`) — get a GPT or Gemini review of your changes, catching blind spots Claude might have
- **Deep reasoning** (`/pal:thinkdeep`) — route complex problems to models optimized for reasoning (o3, Gemini Pro)
- **Consensus** (`/pal:consensus`) — ask multiple models the same question and compare answers
- **Planning** (`/pal:planner`) — structured implementation plans from a different perspective
- **Debug** (`/pal:debug`) — root cause analysis through a fresh set of eyes
- **Pre-commit** (`/pal:precommit`) — validation before committing

The concept: "Many Workflows. One Context" — Claude orchestrates, other models contribute.

## Details

### Installation

```bash
git clone https://github.com/BeehiveInnovations/pal-mcp-server.git ~/Dev/pal-mcp-server
cd ~/Dev/pal-mcp-server
./run-server.sh  # Auto-configures MCP registration and dependencies
```

### API Keys

PAL itself is free. You pay the model providers directly. Configure at least one:

| Provider | Env Variable | Notes |
|----------|-------------|-------|
| Google Gemini | `GEMINI_API_KEY` | Free tier available, good default |
| OpenAI | `OPENAI_API_KEY` | GPT-5, o3 series |
| OpenRouter | `OPENROUTER_API_KEY` | Aggregates many providers |
| X.AI | `XAI_API_KEY` | Grok models (up to 2M context) |
| Ollama | (none) | Free local models, no API key needed |

If you already have `GEMINI_API_KEY` set (e.g., for nano-banana), PAL uses it automatically.

### Available tools

**Enabled by default:** `chat`, `planner`, `codereview`, `debug`, `thinkdeep`, `consensus`, `apilookup`, `challenge`, `precommit`, `listmodels`, `clink`, `version`

**Disabled by default** (enable in config): `analyze`, `refactor`, `testgen`, `secaudit`, `docgen`, `tracer`

### Listing available models

Use `/pal:listmodels` or the `mcp__pal__listmodels` tool to see all 70+ models with their context window sizes and capabilities.

### Audit check

During audit, verify:
1. PAL directory exists: `test -d ~/Dev/pal-mcp-server`
2. At least one API key is configured: check env vars or `.env` in PAL directory
3. MCP registration: PAL should appear in Claude Code's MCP server list

## References

- [GitHub: BeehiveInnovations/pal-mcp-server](https://github.com/BeehiveInnovations/pal-mcp-server)
