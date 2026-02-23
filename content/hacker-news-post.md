# Hacker News — Show HN Post

## Title

```
Show HN: BizBrain OS – a Claude Code plugin that builds a persistent knowledge brain
```

## URL

```
https://github.com/TechIntegrationLabs/bizbrain-os-plugin
```

## Creator's First Comment

Hi HN -- I built BizBrain OS, a Claude Code plugin that scans your machine and builds a persistent knowledge brain about your business. I'd love your honest feedback.

**The problem:** Every AI session starts from zero. You re-explain your projects, your clients, your architecture, your preferences. The context evaporates when the session ends. ChatGPT Memory remembers that you like Python. But it doesn't know your five active projects, their tech stacks, your client relationships, or the open action items across all of them.

**What BizBrain OS does:** Install the plugin. It scans your machine in about 60 seconds -- discovers your repos, project structures, configs, READMEs. It builds a structured knowledge graph: entities (clients, partners, vendors), projects, tech stacks, relationships, action items. This context persists across every Claude Code session and compounds over time.

**The compounding effect is the real product.** Day 1, Claude knows your project names and tech stacks. Month 1, it knows your client preferences, project histories, and decision patterns. Month 6, you say "Check on BuildTrack" and Claude already knows it's a Next.js 14 app with Clerk auth, Supabase backend, 20 tables with RLS, and that the last deployment had a Stripe webhook issue. You never explained any of that. The brain learned it.

**Why a plugin, not a standalone app?** I actually built the standalone version first -- 183 files, Node.js dashboard, the works. Then Claude Code plugins launched and I realized: the context layer should live where the AI lives. No separate app. No context-switching. Just install and your Claude gets a brain.

**Technical details:**
- Scans filesystem for repos, projects, configs, READMEs
- Builds structured knowledge graph (entities, projects, relationships)
- Persistent local storage -- Markdown + JSON, human-readable, git-friendly
- Entity watchdog -- automatically tracks people/companies mentioned in conversations
- Slash commands for quick access to business context
- Zero cloud dependency -- everything stays on your machine
- AGPL v3 licensed

**Install:**
```
claude plugin add TechIntegrationLabs/bizbrain-os-plugin
```

**Honest limitations:**
- Requires Claude Code subscription (Anthropic Max or API key)
- Alpha stage -- scanner coverage will improve with community feedback
- Knowledge graph is as good as what's on your filesystem
- Terminal-first -- there's no GUI dashboard (yet)

**Comparison:**
- vs ChatGPT Memory: ChatGPT remembers preferences. BizBrain builds a structured knowledge graph of your entire business.
- vs Notion/Obsidian: Those organize what you already know. BizBrain captures what you don't even realize you're learning.
- vs CLAUDE.md: Great for single-project context. BizBrain works across all your projects and tracks entities across conversations.

GitHub: https://github.com/TechIntegrationLabs/bizbrain-os-plugin
Discord: https://discord.gg/XZCDttmw

Would love to hear what's missing, what's broken, and what you'd build on top of this.
