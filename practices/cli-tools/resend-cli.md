---
name: resend-cli
description: Set up Resend API for sending emails directly from Claude Code — transactional emails, notifications, and outreach
category: cli-tools
scope: system
priority: nice-to-have
added: 2026-03-27
updated: 2026-03-27
check:
  type: command
  command: "test -n \"$RESEND_API_KEY\" && echo 'configured' || echo 'not configured'"
  expected: "configured"
apply:
  type: manual
  manual: |
    1. Sign up at https://resend.com and verify a sending domain
    2. Create an API key at https://resend.com/api-keys
    3. Add to shell profile: export RESEND_API_KEY=re_xxxxxxxxx
    4. Restart shell or source profile
tags: [email, resend, api, notifications, communication]
---

## Why

Sometimes Claude needs to send real emails — status updates, notifications, sharing results, or reaching out on your behalf. Resend provides a simple API that Claude can call via curl, no SDK installation needed.

Key capabilities:
- **Send HTML emails** — formatted, professional emails via API
- **Custom sender domain** — emails come from your verified domain, not a generic address
- **Reply-to routing** — replies go to your inbox, not the sender address
- **Attachments** — base64-encoded file attachments
- **Multiple recipients** — to, cc, bcc support

Without it, Claude can only draft emails — not actually send them.

## Details

### Setup

1. **Create a Resend account** at [resend.com](https://resend.com)
2. **Verify a sending domain** — add DNS records for your domain
3. **Create an API key** at [resend.com/api-keys](https://resend.com/api-keys)
4. **Store the key** in your shell profile:

```bash
echo 'export RESEND_API_KEY=re_your_key_here' >> ~/.zshrc
source ~/.zshrc
```

### Companion skill

mashburn includes an auto-activating skill that teaches Claude how to compose and send emails via the Resend API. It handles HTML formatting, recipient management, and confirmation before sending. It triggers automatically when email sending is needed.

### Important

- Claude should always show the email content and ask for confirmation before sending
- Configure a `reply_to` address so replies reach your inbox
- The sender address must be on your verified domain

## References

- [Resend Documentation](https://resend.com/docs)
- [Resend API Reference](https://resend.com/docs/api-reference)
