---
name: cloudinary-cli
description: Install Cloudinary CLI (cld) for managing media assets — upload, search, sync, transform, and deliver images/videos
category: cli-tools
scope: system
priority: nice-to-have
added: 2026-03-27
updated: 2026-03-27
check:
  type: command
  command: "which cld && echo 'installed' || echo 'not installed'"
  expected: "installed"
apply:
  type: command
  command: "brew install pipx && pipx install cloudinary-cli"
tags: [cloudinary, media, images, cdn, assets]
---

## Why

If your projects use Cloudinary for media management, the `cld` CLI lets Claude upload, search, sync, and transform assets directly from the terminal. Faster and more token-efficient than using the Node.js SDK for interactive operations.

Key capabilities:
- **Upload** — single files, directories, with transformations
- **Search** — find assets by name, tag, folder, format, size, date
- **Sync** — bidirectional sync between local folders and Cloudinary
- **Transform** — generate optimized URLs, resize, crop, format conversion
- **Admin** — list resources, manage folders, check usage

Without it, Cloudinary operations require the web dashboard or custom scripts.

## Details

### Installation

```bash
brew install pipx && pipx install cloudinary-cli
```

> **Note:** The npm package `cloudinary-cli` is NOT the official CLI. The official tool is `cld`, installed via pipx.

### Credentials

Set `CLOUDINARY_URL` in your environment:

```bash
export CLOUDINARY_URL=cloudinary://API_KEY:API_SECRET@CLOUD_NAME
```

Get this from: Cloudinary Console → Settings → API Keys.

Store in `~/.zshrc` for global access, or in `.env.local` per project.

### Companion skill

mashburn includes an auto-activating skill that teaches Claude the full `cld` CLI syntax, search expressions, sync workflows, and Next.js integration patterns. It triggers automatically when Cloudinary operations are needed.

## References

- [Cloudinary CLI Documentation](https://cloudinary.com/documentation/cloudinary_cli)
