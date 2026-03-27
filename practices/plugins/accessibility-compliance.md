---
name: accessibility-compliance
description: Install accessibility-compliance plugin for WCAG audits, screen reader testing, and accessible design patterns
category: plugins
scope: user
priority: recommended
added: 2026-03-27
updated: 2026-03-27
check:
  type: command
  command: "test -d ~/.claude/plugins/cache/claude-code-workflows/accessibility-compliance && echo 'installed' || echo 'not installed'"
  expected: "installed"
apply:
  type: manual
  manual: |
    1. Run: claude plugin marketplace add anthropics/claude-code-workflows
    2. Run: claude plugin install accessibility-compliance
    3. Restart Claude Code session
tags: [accessibility, wcag, a11y, screen-reader, compliance]
---

## Why

Accessibility is easy to forget and hard to retrofit. This plugin gives Claude structured workflows for WCAG compliance and screen reader testing — so accessibility is checked during development, not discovered in production.

Key skills:

- **wcag-audit-patterns** — Conduct WCAG 2.2 audits with automated testing, manual verification checklists, and remediation guidance
- **screen-reader-testing** — Test with VoiceOver, NVDA, and JAWS; validate assistive technology support

Without it, Claude produces code that looks accessible (semantic HTML) but misses ARIA roles, focus management, keyboard navigation, and color contrast issues.

## Details

### When it triggers

Auto-activates when:
- Auditing websites for accessibility
- Fixing WCAG violations
- Implementing accessible design patterns
- Validating screen reader compatibility

### What it covers

- WCAG 2.2 Level A, AA, and AAA criteria
- Color contrast verification
- Keyboard navigation patterns
- ARIA attributes and roles
- Focus management
- Screen reader announcement testing

## References

- [WCAG 2.2 Guidelines](https://www.w3.org/TR/WCAG22/)
- Plugin source: anthropics/claude-code-workflows marketplace
