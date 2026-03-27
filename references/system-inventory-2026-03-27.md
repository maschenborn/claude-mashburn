# Claude Code System Inventory — Michael Aschenborn

**Date:** 2026-03-27
**User:** Michael Aschenborn (m.aschenborn@teamorange.de)

---

## Summary

| Metric | Count |
|--------|-------|
| Installed Plugins | 73 |
| Enabled Plugins | 68 |
| Disabled Plugins | 5 |
| Skills (SKILL.md) | ~493 |
| Commands (.md) | ~182 |
| MCP Marketplaces | 8 |
| Active Projects | 110+ |
| Hook-Enabled Plugins | 2 (context-mode, vercel) |

---

## MCP Servers / Marketplaces (8)

| Marketplace | Source | Notes |
|-------------|--------|-------|
| claude-plugins-official | GitHub: anthropics/claude-plugins-official | Official Anthropic marketplace |
| claude-code-plugins | GitHub: anthropics/claude-code | Claude Code built-in plugins |
| context-mode | GitHub: mksglu/context-mode | Context window optimization |
| claude-hud | GitHub: jarrodwatts/claude-hud | Statusline enhancement |
| nano-banana-2 | GitHub: kingbootoshi/nano-banana-2-skill | AI image generation |
| ui-ux-pro-max-skill | GitHub: nextlevelbuilder/ui-ux-pro-max-skill | Advanced design systems |
| anthropic-agent-skills | Built-in | Anthropic official agent skills |
| claude-code-workflows | Built-in | Claude Code workflow plugins |

### MCP Tool Permissions

- context7: resolve-library-id, query-docs
- nano-banana: generate_image, edit_image, continue_editing, get_last_image_info, get_configuration_status

---

## Plugins by Marketplace

### Claude Plugins Official (21 plugins)

| Plugin | Status | Purpose |
|--------|--------|---------|
| superpowers (v5.0.6) | enabled | Multi-agent orchestration, planning, debugging, TDD, worktrees |
| vercel | enabled | Full-stack Vercel development, deployment, AI SDK |
| code-review | enabled | Autonomous code review |
| feature-dev | enabled | Guided feature development |
| code-simplifier | enabled | Code simplification and cleanup |
| commit-commands | enabled | Git commit, push, PR workflows |
| hookify | enabled | Hook creation from conversation analysis |
| plugin-dev | enabled | Plugin development guidance |
| skill-creator | enabled | Skill creation and optimization |
| claude-md-management (v1.0.0) | enabled | CLAUDE.md audit and improvement |
| claude-code-setup (v1.0.0) | enabled | Automation recommendations |
| typescript-lsp (v1.0.0) | enabled | TypeScript language server |
| security-guidance | enabled | Security best practices |
| figma (v2.0.2) | enabled | Design system generation |
| firecrawl (v1.0.3) | enabled | Web scraping and research |
| frontend-design | enabled | UI/UX component creation |
| context7 | enabled | API documentation retrieval |
| explanatory-output-style | **disabled** | Output style variant |
| learning-output-style | **disabled** | Output style variant |

### Claude Code Workflows (31 plugins)

**Content & Marketing:**
- content-marketing, seo-content-creation, seo-analysis-monitoring

**Frontend & Mobile:**
- frontend-mobile-development, frontend-mobile-security, accessibility-compliance

**Backend & APIs:**
- backend-development, backend-api-security, api-scaffolding, api-testing-observability, database-design, database-migrations

**Code Quality:**
- code-documentation, code-refactoring, code-review-ai, codebase-cleanup, comprehensive-review, debugging-toolkit, error-debugging, error-diagnostics

**Architecture & Patterns:**
- full-stack-orchestration, agent-orchestration, context-management

**Testing & DevOps:**
- tdd-workflows, unit-testing, cicd-automation, deployment-strategies, deployment-validation

**Data & ML:**
- data-engineering, data-validation-suite, performance-testing-review, llm-application-dev

**Specialized:**
- security-scanning, security-compliance, systems-programming, framework-migration, shell-scripting, customer-sales-automation, business-analytics, payment-processing, documentation-generation, seo-technical-optimization, javascript-typescript, developer-essentials

### Anthropic Agent Skills (2 enabled)

| Plugin | Status |
|--------|--------|
| claude-api | enabled |
| document-skills | **disabled** |
| example-skills | **disabled** |

### Third-Party Plugins

| Plugin | Marketplace | Version | Status |
|--------|------------|---------|--------|
| context-mode | context-mode | v1.0.53 | enabled |
| claude-hud | claude-hud | v0.0.11 | enabled |
| nano-banana | nano-banana-2 | v2.0.0 | enabled |
| ui-ux-pro-max | ui-ux-pro-max-skill | v2.0.1 | enabled |
| web-scripting | claude-code-workflows | v1.2.0 | **disabled** |

---

## Key Skills by Plugin

### Superpowers (16 skills)

| Skill | Purpose |
|-------|---------|
| brainstorming | Creative exploration before implementation |
| dispatching-parallel-agents | Multi-agent coordination |
| executing-plans | Implementation orchestration |
| finishing-a-development-branch | Merge/cleanup workflows |
| receiving-code-review | Feedback integration |
| requesting-code-review | Review submission |
| subagent-driven-development | Autonomous development |
| systematic-debugging | Root cause analysis |
| test-driven-development | TDD workflows |
| using-git-worktrees | Isolated development |
| using-superpowers | Feature discovery |
| verification-before-completion | Quality gates |
| writing-plans | Strategic planning |
| writing-skills | Skill authoring |

### Vercel (40+ skills)

Infrastructure: vercel-cli, vercel-functions, vercel-queues, vercel-storage, runtime-cache, ai-gateway, vercel-services
Deployment: deployments-cicd, bootstrap, routing-middleware, vercel-sandbox, cron-jobs
Frontend: nextjs, react-best-practices, turborepo, turbopack, shadcn, ai-elements
Development: investigation-mode, agent-browser, agent-browser-verify, json-render, workflow
APIs: auth, sign-in-with-vercel, marketplace, vercel-api, chat-sdk, ai-sdk
Flags: vercel-flags, observability, env-vars, next-cache-components, next-upgrade, v0-dev, next-forge, verification

### Context-Mode (4 skills)

ctx-stats, ctx-doctor, ctx-upgrade, context-mode

### Claude API (14 skills)

pdf, pptx, xlsx, docx, canvas-design, algorithmic-art, frontend-design, web-artifacts-builder, mcp-builder, slack-gif-creator, internal-comms, doc-coauthoring, theme-factory, brand-guidelines, skill-creator, claude-api, webapp-testing

---

## Key Commands

### Most Used (inferred from config)

| Command | Plugin | Purpose |
|---------|--------|---------|
| /commit | commit-commands | Git commit |
| /commit-push-pr | commit-commands | Full git workflow |
| /clean-gone | commit-commands | Cleanup gone branches |
| /hookify | hookify | Create hooks from conversation |
| /create-plugin | plugin-dev | Plugin development |
| /skill-creator | skill-creator | Skill authoring |
| /revise-claude-md | claude-md-management | CLAUDE.md updates |
| /claude-md-improver | claude-md-management | CLAUDE.md audit |
| /firecrawl-cli | firecrawl | Web research |
| /project-check | claude-code-setup | Project audit |
| /vercel-deploy | vercel | Deploy to Vercel |
| /vercel-status | vercel | Deployment status |
| /vercel-env | vercel | Environment variables |
| /ctx-stats | context-mode | Context window stats |
| /ctx-doctor | context-mode | Diagnostics |

---

## Hooks

### Context-Mode Hooks

| Event | Actions |
|-------|---------|
| SessionStart | Session initialization, context injection |
| PreToolUse | Tool routing for Bash, WebFetch, Read, Grep, Agent, Task |
| PostToolUse | Session capture and processing |
| PreCompact | Memory compaction snapshots |
| UserPromptSubmit | User input interception |

### Vercel Plugin Hooks

| Event | Actions |
|-------|---------|
| SessionStart | Seen-skills tracking, performance profiling, claude.md injection |
| PreToolUse | Skill injection (5s timeout), subagent observation |
| UserPromptSubmit | Telemetry, skill injection (5s timeout) |
| PostToolUse | shadcn font fixes, verification observation, bash chaining |

---

## Settings

### Core

| Setting | Value |
|---------|-------|
| Always Thinking | enabled |
| Voice | enabled |
| Skip Dangerous Mode Prompt | enabled |
| Output Style | explanatory |
| Statusline | Claude HUD (via Bun) |

### Permission Allow List

**Web:** WebFetch(code.claude.com)
**Bash:** curl, sips, find, cat, echo, source .env.local, npx playwright-cli
**MCP:** context7 (2 tools), nano-banana (5 tools)
**Skills:** playwright-cli

---

## Disabled Plugins (5)

| Plugin | Marketplace | Reason |
|--------|------------|--------|
| document-skills | anthropic-agent-skills | Not needed |
| example-skills | anthropic-agent-skills | Reference only |
| web-scripting | claude-code-workflows | Disabled |
| explanatory-output-style | claude-plugins-official | Style variant |
| learning-output-style | claude-plugins-official | Style variant |
