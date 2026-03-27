---
name: init
description: Onboard your Claude Code environment using mashburn best practices. Checks prerequisites, suggests plugins, and walks you through setup.
---

# mashburn:init — Environment Onboarding

You are helping a user set up their Claude Code environment according to mashburn best practices.

## Instructions

1. **Greet the user** and explain that mashburn is Michael Aschenborn's curated collection of Claude Code best practices.

2. **Run the inspect skill first** to understand the user's current state:
   - Use the `mashburn:inspect` agent to analyze their system
   - Present findings as a checklist: what's already good, what's missing, what could be improved

3. **Walk through each category** of best practices that has entries in `${CLAUDE_PLUGIN_ROOT}/practices/`:
   - For each practice file, read it and determine if it applies
   - Present recommendations grouped by priority (critical → recommended → nice-to-have)
   - For CLI tool practices: check if the tool is installed, offer install commands
   - For plugin practices: check if the plugin is active
   - For settings practices: compare against current config

4. **Offer to apply changes** — but always ask before making any modification. Never auto-apply.

5. **Generate a summary report** at the end showing:
   - What was already in place
   - What was newly configured
   - What was skipped (and why)
   - Next steps the user should do manually

## Tone

Be helpful but not pushy. These are recommendations, not requirements. The user decides what to adopt.
