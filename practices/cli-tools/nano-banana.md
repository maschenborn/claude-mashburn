---
name: nano-banana
description: Install nano-banana CLI for AI image generation via Gemini (supports transparent assets, style transfer, multi-resolution)
category: cli-tools
scope: system
priority: recommended
added: 2026-03-27
updated: 2026-03-27
check:
  type: command
  command: "which nano-banana && echo 'installed' || echo 'not installed'"
  expected: "installed"
apply:
  type: manual
  manual: |
    1. Ensure Bun is installed: curl -fsSL https://bun.sh/install | bash
    2. Clone: git clone https://github.com/kingbootoshi/nano-banana-2-skill.git ~/tools/nano-banana-2
    3. Install: cd ~/tools/nano-banana-2 && bun install
    4. Link globally: cd ~/tools/nano-banana-2 && bun link
    5. If bun link fails: ln -sf ~/tools/nano-banana-2/src/cli.ts ~/.local/bin/nano-banana
    6. Get a Gemini API key at https://aistudio.google.com/apikey
    7. Store it: mkdir -p ~/.nano-banana && echo "GEMINI_API_KEY=<your-key>" > ~/.nano-banana/.env
    8. Install the Claude Code skill: claude plugin marketplace add kingbootoshi/nano-banana-2-skill && claude plugin install nano-banana
tags: [image-generation, gemini, cli, assets, design]
---

## Why

Claude Code can't generate images natively. nano-banana bridges that gap — it wraps Gemini's image generation models into a CLI that Claude can call directly via Bash.

Key capabilities:
- **Multi-resolution:** 512px to 4K
- **Transparent assets:** `-t` flag auto-generates on green screen and keys out the background (requires FFmpeg)
- **Reference images:** Style transfer and image editing via `-r` flag
- **Aspect ratios:** 1:1, 16:9, 9:16, 4:3, and more
- **Two models:** Flash (~$0.07/image, fast) and Pro (~$0.13/image, highest quality)
- **Cost tracking:** `nano-banana --costs` shows total spend

Without it, any image generation request requires leaving Claude Code for a separate tool.

## Details

### Prerequisites

- **Bun** runtime (for installation and linking)
- **Gemini API key** — free tier available at https://aistudio.google.com/apikey
- **FFmpeg + ImageMagick** (optional, for transparent asset workflow): `brew install ffmpeg imagemagick`

### API Key verification

During audit, check that `GEMINI_API_KEY` is configured:

```bash
# Check env var
echo $GEMINI_API_KEY

# Or check .env file
cat ~/.nano-banana/.env 2>/dev/null | grep GEMINI_API_KEY
```

At least one of these must return a key. Without it, nano-banana will fail silently on generation.

### Companion skill

The CLI alone isn't enough — Claude needs to know how to use it. Install the **nano-banana marketplace plugin** which provides the skill that teaches Claude the CLI options, workflows, and prompt patterns.

### Common usage

```bash
nano-banana "minimal dashboard UI" -o dashboard -s 2K
nano-banana "robot mascot" -t -o mascot           # transparent
nano-banana "edit background to white" -r input.png # reference
nano-banana "cinematic scene" -a 16:9 --model pro  # widescreen, pro quality
```

## References

- [GitHub: kingbootoshi/nano-banana-2-skill](https://github.com/kingbootoshi/nano-banana-2-skill)
- Gemini API keys: https://aistudio.google.com/apikey
