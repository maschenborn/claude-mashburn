---
name: project-claude-md
description: Every project should have a CLAUDE.md with overview, tech stack, structure, conventions, and framework-specific documentation
category: workflows
scope: project
priority: recommended
added: 2026-03-27
updated: 2026-03-27
check:
  type: file-exists
  command: "test -f CLAUDE.md && echo 'exists' || echo 'missing'"
  expected: "exists"
apply:
  type: manual
  manual: |
    Create a CLAUDE.md in the project root with at minimum:
    1. Project Overview (what it does, who uses it)
    2. Tech Stack (languages, frameworks, databases)
    3. Project Structure (key directories)
    4. Coding Standards (patterns, conventions)
    5. Testing & Deployment info
tags: [claude-md, workflow, project, onboarding, conventions]
---

## Why

A project CLAUDE.md is the single biggest quality lever for AI-assisted development. It prevents Claude from guessing your architecture, using wrong patterns, or placing files in the wrong directories.

Nick Babich (UX Planet) reports that a 10-minute investment in a good CLAUDE.md saves hours of debugging and code reviews.

## Details

### The 10 recommended sections

Based on industry best practices, a project CLAUDE.md should cover:

1. **Project Overview** — what the app does, who the target users are
2. **Tech Stack** — languages, frameworks, databases, infrastructure
3. **Project Structure** — key directories and where new files go
4. **Coding Standards** — patterns to use, patterns to avoid
5. **Naming Conventions** — PascalCase, camelCase, kebab-case rules
6. **State Management** — how data flows, which state libraries
7. **Error Handling** — logging, user-facing errors, error boundaries
8. **Testing Requirements** — frameworks, coverage expectations, file placement
9. **UI/UX Guidelines** — design system, styling approach, accessibility
10. **Deployment & Workflow** — branches, PRs, CI/CD, environments

### What NOT to include

- General programming best practices (Claude knows these)
- Detailed API documentation (link to it instead)
- Secrets or credentials (use .env files)
- Changelog or git history

### Keep it maintainable

- Max 500-1000 lines
- Update when conventions change
- Remove outdated information
- Be specific — "use Tailwind" not "write clean CSS"

### Framework-specific: Next.js

For Next.js projects (16.2+), generate framework-aware documentation for the CLAUDE.md:

```bash
npx @next/codemod agents-md --output CLAUDE.md
```

This creates an `AGENTS.md`-style index with Next.js-specific docs that Claude can reference. During audit, check for the `<!-- NEXT-AGENTS-MD-START -->` marker in CLAUDE.md.

Also consider installing `next-browser` for AI-assisted inspection:

```bash
npx skills add vercel-labs/next-browser
```

### Framework-specific: MUI

Add MUI v7 Grid syntax to CLAUDE.md:

```markdown
MUI v7.2.0+: import Grid from '@mui/material/Grid' (not Grid2!)
Props use size={{ xs: 12 }} not xs={12}
```

### Audit checklist

During project audit, verify:
- [ ] CLAUDE.md exists in project root
- [ ] No secrets in CLAUDE.md
- [ ] .gitignore includes .env files
- [ ] (Next.js) docs index generated via `npx @next/codemod agents-md`
- [ ] (MUI) Grid v7 syntax documented
- [ ] (Bun) SQL preference documented if project has DB access

## References

- [CLAUDE.md Best Practices — Nick Babich (UX Planet)](https://uxplanet.org/claude-md-best-practices-1ef4f861ce7c)
- [Next.js 16.2 AI Agent Support](https://nextjs.org/)
- [next-browser CLI](https://github.com/vercel-labs/next-browser)
