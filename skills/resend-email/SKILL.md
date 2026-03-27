---
name: resend-email
description: >
  Send emails via the Resend API. Use this skill whenever the user asks to send an email,
  write and send a message, notify someone by email, or forward information via email.
  Trigger on phrases like "send email", "schreib eine mail", "email an", "mail schicken",
  "notify by email", "drop them an email", or any variation involving sending electronic mail.
  Also trigger when the user says "let X know about Y" or "inform X" where email is the implied channel.
---

# Sending Emails via Resend

You can send real emails using the Resend API. Before first use, the user must have:
1. A Resend account with a verified sending domain
2. `RESEND_API_KEY` set as an environment variable

## Composing the Email

**ALWAYS show the email to the user for approval before sending.** Present:
- **From:** sender address (must be on verified domain)
- **To:** recipient email(s)
- **Subject:** proposed subject line
- **Body preview:** the formatted content

Wait for confirmation or change requests before sending.

## Sending

The API key is stored in `RESEND_API_KEY`. Since shell state doesn't persist between tool calls, source the shell config first:

```bash
source ~/.zshrc 2>/dev/null

curl -X POST 'https://api.resend.com/emails' \
  -H "Authorization: Bearer $RESEND_API_KEY" \
  -H 'Content-Type: application/json' \
  -d '{
    "from": "Sender Name <sender@your-domain.com>",
    "reply_to": "your-inbox@example.com",
    "to": ["recipient@example.com"],
    "subject": "Your subject here",
    "html": "<div>Your HTML content here</div>"
  }'
```

### Configuration

The user should configure these in their project or global CLAUDE.md:
- **Sender address** — must be on a verified Resend domain
- **Reply-to address** — where replies should go (typically your personal inbox)
- **Language/tone** — default language and formality level

### HTML Format

Always send HTML emails with clean, readable formatting:

```html
<div style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; color: #333; line-height: 1.6; max-width: 600px;">
  <!-- Email body here -->

  <p>Best regards<br>Your Name</p>
</div>
```

Key rules:
- Use `<p>` tags for paragraphs, not `<br>` chains
- Keep the layout simple — no complex tables or heavy styling
- Use the sans-serif font stack for consistency

### Multiple Recipients

The `to` field accepts an array. Use `cc` and `bcc` fields when requested.

### Attachments

```json
{
  "attachments": [
    {
      "filename": "document.pdf",
      "content": "<base64-encoded-content>"
    }
  ]
}
```

## Important Rules

- **Never send without confirmation** — always show content and wait for approval
- **Never fabricate email addresses** — ask if you don't have the recipient's address
- **Never include secrets** in emails unless explicitly asked
- The API returns a JSON response with an `id` field on success
