# BizBrain OS Launch Content -- All Platforms

> Updated 2026-02-23 | Plugin Narrative (pivoted from standalone app)
> Plugin Repo: https://github.com/TechIntegrationLabs/bizbrain-os-plugin
> Original Repo: https://github.com/TechIntegrationLabs/bizbrain-os
> Website: https://bizbrainos.com
> Discord: https://discord.gg/XZCDttmw
> License: AGPL v3
> Install: `claude plugin add TechIntegrationLabs/bizbrain-os-plugin`

---

## Key Narrative Shift

BizBrain OS has pivoted from a standalone desktop application to a **Claude Code plugin** as the hero product. All launch content reflects this shift.

**Old narrative:** "An open-source AI business operating system. Clone the repo, open start.html, configure 27 modules."

**New narrative:** "A Claude Code plugin that scans your machine, builds a persistent knowledge brain, and compounds context across every session. Install once. Compound forever."

---

## Approved Marketing Copy

### Taglines
- "The compound interest of AI context."
- "The context layer that teaches AI your business."
- "Install once. Compound forever."
- "The AI that remembers your business."
- "Stop explaining. Start building."
- "Open source. Local first. Yours forever."

### Key Comparisons
- **vs ChatGPT Memory:** "ChatGPT remembers that you like Python. BizBrain OS knows your five active projects, their tech stacks, your client relationships, open action items across all of them."
- **vs Notion/Obsidian:** "Notion is where you organize what you already know. BizBrain OS captures what you don't even realize you're learning."
- **vs Starting Fresh:** "Without BizBrain: 'Let me explain my project structure again...' With BizBrain: 'Check on BuildTrack.' -> Claude already knows."
- **vs CLAUDE.md:** "CLAUDE.md works for one project. BizBrain builds a knowledge graph across all your projects and tracks entities across every conversation."

### Social Media Angles
- **Twitter:** Thread opener about scanning machine and building knowledge graph in 60 seconds
- **LinkedIn:** Thought leadership on compound interest of AI context
- **Reddit AMA:** Building an open-source Claude Code plugin -- technical architecture and lessons learned

---

## Content Inventory

All platform-specific content lives in the `content/` folder of the bizbrain-os-launch repo:

| File | Platform | Status |
|------|----------|--------|
| `content/hacker-news-post.md` | Hacker News (Show HN) | Ready for review |
| `content/reddit-post.md` | Reddit (r/ClaudeAI, r/programming, r/SideProject) | Ready for review |
| `content/devto-article.md` | Dev.to | Ready for review |
| `content/twitter-thread.md` | X/Twitter (10-tweet thread) | Ready for review |
| `content/linkedin-post.md` | LinkedIn | Ready for review |
| `content/product-hunt.md` | Product Hunt | Ready for review |

---

## Core Messaging Framework

### The Problem (use in all content)
Every AI session starts from zero. You re-explain your projects, clients, architecture, preferences. The context evaporates when the session ends.

### The Insight (use in thought leadership)
The bottleneck isn't smarter AI. It's AI that doesn't know your business. We've been optimizing models when the real leverage is context.

### The Solution (use in product-focused content)
BizBrain OS is a Claude Code plugin that scans your machine, builds a persistent knowledge brain, and compounds context across every session.

### The Compounding Story (use everywhere)
- Day 1: Claude knows your project names and tech stacks
- Month 1: Claude knows your client preferences and decision history
- Month 6: Claude anticipates your needs
- Year 2: Competitors starting fresh are hopelessly behind

### The Pivot Story (use in builder/indie communities)
Built the standalone app first (183 files, 27 modules). Realized the context layer should live where the AI lives. Rebuilt as a plugin. One install command. No separate app.

---

## Platform-Specific Tone Guide

| Platform | Tone | Focus | Avoid |
|----------|------|-------|-------|
| Hacker News | Technical, honest, self-aware | Architecture, tradeoffs, limitations | Hype, marketing speak, "disrupting" |
| r/ClaudeAI | Enthusiastic but practical | Daily workflow improvement | Over-promising, being salesy |
| r/programming | Technical deep-dive | Architecture decisions, data format | Business jargon, "AI employee" |
| r/SideProject | Builder's journey | Pivot story, lessons learned | Technical jargon |
| Dev.to | Educational, thorough | Full technical walkthrough | Being too brief |
| X/Twitter | Punchy, visual, shareable | One idea per tweet, strong hooks | Walls of text |
| LinkedIn | Professional, thought leadership | Business value, compounding | Being too technical |
| Product Hunt | Clear value prop, honest | Features, comparisons | Being too technical |

---

## Discord Content

### Server Description
BizBrain OS -- The AI that remembers your business. Open source Claude Code plugin. Local-first.

### Welcome Message
See `content/hacker-news-post.md` for Discord welcome copy adapted from the launch narrative.

### Recommended Channels
- #announcements -- Official releases and milestones
- #general -- General discussion
- #introductions -- New member introductions
- #help -- Setup and troubleshooting
- #plugins -- Plugin development and extensions
- #showcase -- Share your setup and workflows
- #feature-requests -- Ideas and suggestions
- #bugs -- Bug reports
- #contributing -- For active contributors

---

## Email Newsletter

### Subject Line
```
I built a Claude Code plugin that remembers your business (open source)
```

### Body

Hi,

I want to share something I've been building.

BizBrain OS is an open-source Claude Code plugin that scans your machine, builds a persistent knowledge brain about your business, and compounds that context across every session.

The insight: every AI session starts from zero because no tool has persistent, structured knowledge about YOUR specific business. ChatGPT remembers preferences. BizBrain builds a knowledge graph.

Install the plugin. It scans your filesystem in about 60 seconds, discovers your repos and projects, and builds a structured brain -- clients, projects, relationships, action items. This brain persists and compounds. Every day it gets smarter about your work without you doing anything.

All data stays on your machine. Markdown + JSON files. No cloud. No telemetry. AGPL v3.

The catch: requires a Claude Code subscription from Anthropic.

If you're already using Claude Code and want it to actually know your business, I'd love for you to try it.

- **Install:** `claude plugin add TechIntegrationLabs/bizbrain-os-plugin`
- **GitHub:** https://github.com/TechIntegrationLabs/bizbrain-os-plugin
- **Discord:** https://discord.gg/XZCDttmw

If you try it, reply and tell me what you think.

---

*End of launch content. All drafts updated for plugin narrative as of 2026-02-23.*
