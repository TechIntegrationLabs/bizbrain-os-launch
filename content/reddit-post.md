# Reddit Posts

---

## r/ClaudeAI

**Title:** I built a Claude Code plugin that scans your machine and builds a persistent business brain. Open source.

**Body:**

I've been using Claude Code daily for over a year to run my dev consultancy. The biggest friction point was always the same: every new session starts from scratch. I'd spend the first 10 minutes re-explaining my projects, my clients, what I was working on yesterday.

So I built BizBrain OS -- a Claude Code plugin that fixes this permanently.

**What it does:**

1. **Scans your machine** (~60 seconds) -- discovers your repos, project structures, configs, tech stacks
2. **Builds a knowledge brain** -- structured context about your projects, clients, partners, vendors, action items
3. **Persists across sessions** -- every Claude Code session starts with full context
4. **Compounds over time** -- the brain gets smarter every day as it captures decisions, preferences, and patterns

**The before/after:**

Without BizBrain: "Let me explain my project structure again..." (10 min of setup, every time)

With BizBrain: "Check on BuildTrack." -> Claude already knows it's a Next.js 14 app with Clerk auth, Supabase backend, 20 tables with RLS, and that the Stripe webhook needs testing. You never told it any of that in this session. The brain knew.

**How it compares to ChatGPT Memory:**

ChatGPT remembers that you like Python. BizBrain OS knows your five active projects, their tech stacks, your client relationships, open action items across all of them, and that your client Tim prefers Slack over email for status updates.

**How it compares to CLAUDE.md files:**

CLAUDE.md is great for single-project context. BizBrain works across ALL your projects and tracks entities (people, companies) across every conversation automatically.

**Install:**
```
claude plugin add TechIntegrationLabs/bizbrain-os-plugin
```

Everything is local. Your data never leaves your machine. Markdown + JSON files you can read in any editor.

AGPL v3. Alpha release (v1.0.0-alpha.1).

GitHub: https://github.com/TechIntegrationLabs/bizbrain-os-plugin
Discord: https://discord.gg/XZCDttmw

What features would make this useful for your workflow?

---

## r/programming

**Title:** Open-source Claude Code plugin that builds a persistent knowledge graph from your filesystem

**Body:**

I built an open-source Claude Code plugin that scans your filesystem, discovers your repos and projects, and builds a structured knowledge graph that persists across AI sessions.

**The technical architecture:**

The plugin has three core components:

1. **Scanner** -- Walks your filesystem looking for repos (`.git` directories), project configs (`package.json`, `pyproject.toml`, `Cargo.toml`, etc.), README files, and configuration files. Builds a map of what you're working on in about 60 seconds.

2. **Knowledge Brain** -- Structures the scanner output into a graph: projects (with tech stacks, status, relationships), entities (people, companies, with roles and contact info), and action items. Stored as Markdown + JSON -- human-readable, git-friendly, no database required.

3. **Entity Watchdog** -- Monitors conversations for mentions of known entities (clients, partners, vendors) and automatically updates the knowledge graph. If you mention "Sarah at Acme wants the deadline moved to March," it updates Acme's action items and Sarah's interaction history without you asking.

**Why this approach:**

The bottleneck with AI coding assistants isn't model intelligence -- it's context. Every session starts cold. CLAUDE.md files help for individual projects, but they don't capture cross-project knowledge, entity relationships, or evolving business context.

This plugin provides a structured context layer that compounds over time. The more you use it, the more Claude knows about your work without you having to explain anything.

**Data format:**
```
~/bizbrain/
  Clients/
    AcmeCorp/
      _context/contacts.md
      _context/history.md
      _context/action-items.md
      _meta.json
  Projects/
    WebRedesign/
      _context/
      .planning/
  Operations/
    todos/
    time-tracking/
```

All plain text. No proprietary formats. If the plugin disappeared tomorrow, you'd have perfectly organized Markdown files.

**Install:**
```
claude plugin add TechIntegrationLabs/bizbrain-os-plugin
```

AGPL v3. Local-first. No telemetry.

GitHub: https://github.com/TechIntegrationLabs/bizbrain-os-plugin

I'd appreciate feedback on the architecture -- especially from anyone who's built plugin systems or knowledge graph tooling.

---

## r/SideProject

**Title:** I pivoted my side project from a desktop app to a Claude Code plugin. Best decision I made.

**Body:**

Quick backstory: I built BizBrain OS over the past year as an open-source "AI business operating system" -- a standalone desktop app with 183 files, a Node.js dashboard, 27 modules. The whole nine yards.

Then Claude Code plugins launched and I had an epiphany: **the context layer should live where the AI lives.**

So I rebuilt it as a Claude Code plugin. Instead of a separate app you switch to, it's just... there. Every session. Your Claude already knows your business.

**What the plugin does:**

1. Scans your machine in ~60 seconds (discovers repos, projects, configs)
2. Builds a persistent knowledge brain (entities, projects, relationships, action items)
3. Compounds context across every session (the brain gets smarter daily)

**The tagline I'm most proud of:** "The compound interest of AI context."

Because that's exactly what it is. Day 1, Claude knows your project names. Month 6, Claude knows your client preferences, project histories, and which proposals tend to close. Year 2, a competitor starting fresh is hopelessly behind.

**What I learned from the pivot:**

1. **Distribution beats features.** The standalone app had 27 modules. The plugin has a scanner and a brain. The plugin is 10x more useful because it's where people already work.
2. **Structured context > flat text.** A CLAUDE.md file is fine for one project. A knowledge graph that tracks entities across all your projects is a different league.
3. **Compounding is the moat.** The longer you use it, the more valuable it gets. That's not a feature -- it's a business model.

**Current state:** Alpha (v1.0.0-alpha.1). Works. Needs community testing and feedback.

**Install:**
```
claude plugin add TechIntegrationLabs/bizbrain-os-plugin
```

GitHub: https://github.com/TechIntegrationLabs/bizbrain-os-plugin
Discord: https://discord.gg/XZCDttmw

What would you want a persistent AI brain to know about your side projects?
