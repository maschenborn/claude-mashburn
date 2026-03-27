---
name: figma-mcp
description: Install Community Figma MCP server for read+write access to Figma documents, paired with the figma marketplace plugin for design workflows
category: mcp-servers
scope: user
priority: nice-to-have
added: 2026-03-27
updated: 2026-03-27
check:
  type: command
  command: "test -d ~/Dev/figma-mcp-server && echo 'installed' || echo 'not installed'"
  expected: "installed"
apply:
  type: manual
  manual: |
    1. Clone: git clone https://github.com/Antonytm/mcp-figma.git ~/Dev/figma-mcp-server
    2. Build plugin: cd ~/Dev/figma-mcp-server/plugin && npm i && npm run build
    3. Build MCP server: cd ~/Dev/figma-mcp-server/mcp && npm i
    4. In Figma: Plugins > Development > Import Plugin from manifest > select plugin/manifest.json
    5. Start plugin in Figma (keep window open)
    6. Start MCP server: cd ~/Dev/figma-mcp-server/mcp && npm run start
    7. Configure MCP in Claude Code: Streaming HTTP transport, URL http://localhost:38450/mcp
    8. Install figma marketplace plugin for workflow skills
tags: [figma, mcp, design, ui, read-write]
---

## Why

The official Figma MCP server is read-only — you can inspect designs but not change them. The Community Figma MCP server by Antonytm adds full write access, letting Claude create and modify Figma designs directly.

Combined with the **figma marketplace plugin** (which provides workflow skills), this gives Claude a complete Figma pipeline:
- Read designs and extract specs
- Create new designs from descriptions or code
- Build and maintain design systems
- Implement designs as production code
- Connect Figma components to code components

## Details

### Architecture

The setup has two parts:

**1. Community Figma MCP Server** (this practice)
- A Figma plugin that runs inside Figma and connects via WebSocket
- A local MCP server on `localhost:38450` that bridges Claude and the plugin
- Provides the `use_figma` tool for executing JavaScript in the Figma context

**2. Figma Marketplace Plugin** (separate install)
- Provides 5 workflow skills that teach Claude HOW to use the MCP server effectively:
  - `figma:figma-use` — mandatory prerequisite before every `use_figma` call
  - `figma:figma-generate-design` — translate pages/layouts from code to Figma
  - `figma:figma-implement-design` — translate Figma designs to production code
  - `figma:figma-generate-library` — build design systems with variables, tokens, components
  - `figma:figma-code-connect-components` — map Figma components to code components

### Important: both are needed

The MCP server without the skills means Claude has raw API access but doesn't know the best patterns. The skills without the MCP server means Claude has knowledge but can't write to Figma. Install both.

### Starting a session

Every Figma session requires:
1. Open your Figma document
2. Start the Figma MCP Server plugin (Plugins > Development > Figma MCP Server)
3. Start the MCP server: `cd ~/Dev/figma-mcp-server/mcp && npm run start`
4. Verify connection: plugin shows "Connected to MCP server"

### Audit check

During audit, verify:
1. MCP server directory exists: `test -d ~/Dev/figma-mcp-server`
2. Plugin is built: `test -f ~/Dev/figma-mcp-server/plugin/dist/code.js`
3. Figma marketplace plugin installed (for workflow skills)

## References

- [GitHub: Antonytm/mcp-figma](https://github.com/Antonytm/mcp-figma)
- [Product Hunt: Community Figma MCP Server](https://www.producthunt.com/products/community-figma-mcp-server)
