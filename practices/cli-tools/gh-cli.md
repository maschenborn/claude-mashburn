---
name: gh-cli
description: Install GitHub CLI (gh) for PR workflows, issue management, and GitHub API access from the terminal
category: cli-tools
scope: system
priority: recommended
added: 2026-03-27
updated: 2026-03-27
check:
  type: command
  command: "which gh && echo 'installed' || echo 'not installed'"
  expected: "installed"
apply:
  type: command
  command: "brew install gh"
tags: [github, cli, pr, issues, git]
---

## Why

Claude Code uses `gh` for all GitHub operations — creating PRs, reviewing issues, checking CI status, managing releases. Without it, Claude falls back to raw `git` commands and can't interact with GitHub's API features.

Key capabilities Claude uses:
- **`gh pr create/view/merge`** — full PR lifecycle without leaving the terminal
- **`gh issue list/create/view`** — issue management
- **`gh run view/watch`** — CI/CD status checks
- **`gh api`** — direct GitHub API access for anything else

Without gh, any request involving PRs, issues, or GitHub checks requires manual browser work.

## Details

### Installation

```bash
brew install gh
```

### Authentication

After installation, authenticate with GitHub:

```bash
gh auth login
```

Follow the interactive prompts to authenticate via browser or token. Verify with:

```bash
gh auth status
```

During audit, check both installation AND authentication — gh without auth is useless.

### Useful verification commands

```bash
gh --version          # Version check
gh auth status        # Auth check (shows logged-in user and scopes)
gh api user -q .login # Quick API test (returns GitHub username)
```

## References

- [GitHub CLI](https://cli.github.com/)
- [GitHub CLI Manual](https://cli.github.com/manual/)
