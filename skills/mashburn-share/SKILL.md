---
name: mashburn-share
description: Generate a copy-pasteable installation message to share mashburn with someone else.
argument-hint: ""
version: 0.1.0
---

# mashburn:share — Share Installation Instructions

Generate a ready-to-copy message that explains how to install mashburn. Output the following text block exactly, wrapped in a code fence so the user can copy it easily:

```
Hey! Ich nutze "mashburn" — ein Plugin für Claude Code mit Best Practices
für Setup, Tools und Workflows. Spart dir die Recherche.

So installierst du es:

  claude plugin marketplace add maschenborn/claude-mashburn
  claude plugin install mashburn

Danach hast du diese Befehle:

  /mashburn-init       — Geführtes Setup deiner Claude Code Umgebung
  /mashburn-inspect    — Schnellcheck gegen Best Practices
  /mashburn-audit      — Tiefenanalyse einer Kategorie
  /mashburn-whats-new  — Was gibt's Neues?
  /mashburn-suggest    — Eigene Best Practice vorschlagen

Mehr Infos: https://github.com/maschenborn/claude-mashburn
```

Do not add any commentary before or after. Just output the code fence block so the user can copy it directly.
