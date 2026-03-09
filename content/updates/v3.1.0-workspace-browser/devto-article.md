---
title: "My AI Can Now Read My Email and Browse the Web. Here's How I Set It Up."
published: false
description: "BizBrain OS v3.1.0 adds Google Workspace integration and a 3-tool browser automation stack to Claude Code."
tags: claudecode, ai, opensource, productivity
cover_image: https://raw.githubusercontent.com/TechIntegrationLabs/bizbrain-os-plugin/main/assets/bizbrain-architecture-demo.jpg
---

I was tired of copy-pasting emails into Claude.

Every morning, same routine: open Gmail, find the client thread, copy the relevant messages, paste them into Claude, explain the context, then ask for a response. Repeat for calendar invites. Repeat for Drive documents. Repeat for everything.

My AI assistant had a persistent brain — months of accumulated knowledge about my clients, projects, and workflows — but it was completely blind to the tools where my actual work lives. It knew *about* my clients but couldn't read the email a client sent me ten minutes ago.

[BizBrain OS](https://github.com/TechIntegrationLabs/bizbrain-os-plugin) v3.1.0 fixes this. Your AI can now read your email, check your calendar, search your Drive, and browse the web. Here's the architecture and how to set it up.

## The Problem: AI With Amnesia About Your Actual Day

AI coding assistants have gotten remarkably good at understanding codebases. But code is maybe 30% of a developer's actual workload. The rest is communication — emails, calendar scheduling, document reviews, researching things in a browser.

Every time you context-switch between your AI tool and your work tools, you're doing manual integration. You're the middleware. You read the email, summarize it for the AI, get a response, then go paste it back. You're doing what software should be doing for you.

The core insight: **your AI doesn't need to be smarter. It needs to see what you see.**

## Google Workspace: The Hybrid Approach

This was the hardest design decision in v3.1.0. Google Workspace has 12 services (Gmail, Calendar, Drive, Docs, Sheets, Slides, Forms, Keep, Tasks, Contacts, Groups, Admin). Each one is rich enough to be its own MCP server. Loading all 12 into Claude's context at startup would burn thousands of tokens before you even ask a question.

So we built two integration paths:

### gwcli: The Lightweight CLI (Zero Context Cost)

`gwcli` is a standalone CLI tool that wraps Google Workspace APIs. It runs *outside* Claude's context — no MCP overhead, no token cost for idle services.

```bash
# Quick operations that don't need AI reasoning
gwcli gmail search "from:sarah@acme.com subject:invoice"
gwcli calendar today
gwcli drive search "Q1 report"
gwcli contacts find "Sarah"
```

BizBrain OS calls `gwcli` through the Bash tool when it needs quick lookups. Check today's calendar? One bash command. Search for an email? One bash command. No MCP server running in the background, no context consumed until the results come back.

### Full Google Workspace MCP (On-Demand for Heavy Work)

For sessions where you need deep, multi-step interaction with Google services — drafting email replies, creating calendar events with context from your brain, building spreadsheets from project data — you can enable the full MCP:

```bash
# Enable for a session that needs heavy Google interaction
/mcp enable google-workspace
```

This gives Claude direct tool access to all 12 services with rich parameter schemas, streaming responses, and multi-step workflows. It costs more context, but it's the right tool when you need it.

### The Decision Matrix

| Scenario | Use gwcli | Use Full MCP |
|----------|-----------|--------------|
| "Check my calendar for today" | Yes | Overkill |
| "Search Gmail for the latest from Acme" | Yes | Overkill |
| "Draft replies to all unread client emails" | No | Yes |
| "Create a project timeline in Sheets from my brain data" | No | Yes |
| "Find a file on Drive" | Yes | Overkill |
| "Reorganize my Drive folder structure" | No | Yes |

BizBrain OS makes this decision automatically. The brain's skill router evaluates the complexity of your request and picks the right tool. Simple lookups go through `gwcli`. Multi-step workflows activate the full MCP.

### Setup

```bash
# 1. Install gwcli
npm install -g @bizbrain/gwcli

# 2. Authenticate (opens browser for OAuth)
gwcli auth login

# 3. BizBrain OS detects it automatically
claude plugin add TechIntegrationLabs/bizbrain-os-plugin
```

That's it. Once `gwcli` is authenticated, BizBrain OS picks it up on the next session start. No configuration files to edit.

## Browser Automation: Three Tools, One Brain

The second half of v3.1.0 is browser automation. This one has a longer story.

I started with Claude-in-Chrome — the extension that gives Claude access to your active browser tab. It's great for one thing: interacting with pages where you're already logged in. Your authenticated SaaS dashboards, your internal tools, your banking portal. The extension sees what you see, including your session cookies.

But it has real limitations. It only works in Chrome. It can only see the active tab. It can't run headless (no browser window = no extension). And it can't do structured data extraction from the accessibility tree.

So v3.1.0 adds Playwright MCP as the **default** browser automation tool, with Claude-in-Chrome and Puppeteer as specialized alternatives.

### Why Playwright MCP is the Default

Playwright MCP uses the browser's accessibility tree instead of screenshots. This matters because:

1. **Structured data.** The accessibility tree gives you labeled elements — buttons, links, form fields — with their roles and names. No vision model needed to find the "Submit" button.
2. **Cross-browser.** Chromium, Firefox, WebKit. Test against all three or pick the one you need.
3. **Headless.** Runs without a visible browser window. Perfect for background automation, CI pipelines, and server environments.
4. **Deterministic.** Click element by accessibility label, not by pixel coordinates. More reliable, less flaky.

```bash
# Playwright MCP is enabled by default in v3.1.0
# No setup needed — it's included in the plugin
```

### When to Use Each Tool

| Tool | Best For | Limitation |
|------|----------|------------|
| **Playwright MCP** | Scraping, testing, automation, headless tasks | No access to existing logged-in sessions |
| **Claude-in-Chrome** | Interacting with authenticated pages you're viewing | Chrome only, active tab only, needs visible browser |
| **Puppeteer** | Legacy scripts, Chrome DevTools Protocol access | Chrome only, no cross-browser |

### The Decision Matrix

```
Need to interact with a page I'm logged into?
  → Claude-in-Chrome

Need headless automation or cross-browser?
  → Playwright MCP

Need Chrome DevTools Protocol features?
  → Puppeteer

Not sure?
  → Playwright MCP (it's the default for a reason)
```

BizBrain OS routes automatically. If your request involves "the page I'm looking at" or "this tab," it routes to Claude-in-Chrome. Everything else goes to Playwright.

## Brain Integration: Where It Gets Interesting

Google Workspace and browser automation are useful on their own. But the real power comes from connecting them to BizBrain OS's persistent brain.

### Gmail to Intake

When BizBrain OS reads your email, it doesn't just show you the content. It routes it through the intake system:

1. **Entity linking.** "This email is from Sarah at Acme Corp" — the brain already knows Sarah, her role, her history with your projects. The email gets linked to her entity record.
2. **Action item extraction.** "Can you send the invoice by Friday?" becomes a todo in your brain's task system, linked to the Acme entity, with a Friday deadline.
3. **History append.** The interaction gets logged in `Clients/Acme/_context/history.md` — your brain remembers every touchpoint.

### Calendar to Entities

Calendar events get the same treatment:

- "Meeting with Acme team" links to the Acme entity and all known team members
- Meeting notes (if you use the meeting transcriber from v3.0.1) automatically flow into entity history
- Follow-up tasks from meetings become brain todos

### Drive to Knowledge

Documents found on Drive can be ingested into the brain's knowledge base:

- SOWs and contracts link to client entities
- Technical specs feed into project knowledge
- Shared documents get tracked for changes

### Browser to Research

Playwright automation feeds research directly into the brain:

- Competitor analysis gets stored as structured knowledge
- Documentation lookups get cached for future reference
- Web research links to the project or entity that triggered it

## Everything Compounds

This is the core thesis of BizBrain OS: **the compound interest of AI context.**

Before v3.1.0, the brain compounded from your coding sessions and conversations. Now it compounds from your email, your calendar, your documents, and your web research too. Every interaction makes the brain marginally smarter, and that intelligence persists across every future session.

Your Monday morning standup email gets ingested. Tuesday, when you're coding the feature that client requested, the brain already knows the context — it read the email, linked it to the client, extracted the requirements. You don't explain anything. You just work.

## Installation

```bash
# Install the plugin
claude plugin add TechIntegrationLabs/bizbrain-os-plugin

# Set up Google Workspace (optional but recommended)
npm install -g @bizbrain/gwcli
gwcli auth login

# Browser automation works out of the box
# Playwright MCP is included and enabled by default
```

First session after install, BizBrain OS creates your brain folder at `~/bizbrain-os/` and starts accumulating context. The Google Workspace and browser tools are available immediately.

## What's Next

v3.1.0 is about connecting your AI to the tools where your work actually lives. The roadmap continues in that direction:

- **Slack integration** — real-time channel monitoring with entity linking
- **GitHub deep integration** — beyond code: issues, PRs, discussions feeding the brain
- **Local-first alternatives** — more $0/month replacements for expensive SaaS (meeting transcription shipped in v3.0.1, more coming)
- **Multi-brain sync** — share brain segments across team members while keeping private data private

The multi-agent future isn't about smarter models. It's about models that can see your whole world.

---

**BizBrain OS is free and open source under AGPL-3.0.**

- GitHub: [github.com/TechIntegrationLabs/bizbrain-os-plugin](https://github.com/TechIntegrationLabs/bizbrain-os-plugin)
- Discord: [discord.gg/ph9D5gSgW3](https://discord.gg/ph9D5gSgW3)
- Install: `claude plugin add TechIntegrationLabs/bizbrain-os-plugin`

Install once. Compound forever.
