---
name: essential-cli-toolkit
description: Essential CLI tools that Claude Code relies on for search, JSON processing, media handling, and system tasks
category: cli-tools
scope: system
priority: recommended
added: 2026-03-27
updated: 2026-03-27
check:
  type: custom
  command: |
    missing=""
    for cmd in git node jq rg tree fzf ffmpeg magick yt-dlp bat fd tldr htop bun; do
      which "$cmd" >/dev/null 2>&1 || missing="$missing $cmd"
    done
    if [ -z "$missing" ]; then echo "all installed"; else echo "missing:$missing"; fi
  expected: "all installed"
apply:
  type: command
  command: "brew install jq ripgrep tree fzf ffmpeg imagemagick yt-dlp bat fd tldr htop bun"
tags: [cli, tools, essentials, media, search, productivity]
---

## Why

Claude Code constantly shells out to CLI tools for search, file processing, JSON parsing, media handling, and system inspection. Missing tools cause silent fallbacks, workarounds, or outright failures. Having the full toolkit installed means Claude can take the most efficient path for every task.

## Details

### Core (critical)

| Tool | What Claude uses it for | Install |
|------|------------------------|---------|
| `git` | Version control — every project interaction | `brew install git` |
| `node` | Claude Code runtime, npm scripts | `brew install node` |
| `bun` | Fast JS/TS runtime, package management | `brew install bun` |
| `jq` | JSON parsing from API responses, config files | `brew install jq` |

### Search & Navigation

| Tool | What Claude uses it for | Install |
|------|------------------------|---------|
| `rg` (ripgrep) | Fast code search across large codebases | `brew install ripgrep` |
| `fzf` | Fuzzy finding files and content | `brew install fzf` |
| `fd` | Fast, user-friendly alternative to `find` | `brew install fd` |
| `tree` | Directory structure visualization | `brew install tree` |

### File & Text Processing

| Tool | What Claude uses it for | Install |
|------|------------------------|---------|
| `bat` | Syntax-highlighted file viewing (better `cat`) | `brew install bat` |
| `tldr` | Quick command reference (shorter than `man`) | `brew install tldr` |
| `htop` | Process monitoring, resource usage | `brew install htop` |

### Media Processing

| Tool | What Claude uses it for | Install |
|------|------------------------|---------|
| `ffmpeg` | Video/audio conversion, nano-banana transparency (`-t` flag) | `brew install ffmpeg` |
| `magick` (ImageMagick) | Image resize, convert, compose, optimize | `brew install imagemagick` |
| `yt-dlp` | Download video/audio from YouTube and other platforms | `brew install yt-dlp` |

### Audit check

During audit, verify each tool individually and report which are missing:

```bash
for cmd in git node jq rg tree fzf ffmpeg magick yt-dlp bat fd tldr htop bun; do
  printf "%-12s " "$cmd"
  which "$cmd" >/dev/null 2>&1 && echo "OK" || echo "MISSING — brew install <package>"
done
```

### Windows note

On Windows, most of these require WSL (Windows Subsystem for Linux) or Git Bash. Native Windows alternatives exist for some (`ripgrep`, `fd`, `bat` have Windows builds), but the full toolkit works best under WSL.

## References

- [Homebrew](https://brew.sh/) — macOS/Linux package manager
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [bat](https://github.com/sharkdp/bat)
- [fzf](https://github.com/junegunn/fzf)
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
