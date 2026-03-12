# LinkedIn Engagement System & Content Bank -- BizBrain OS Launch

> **Author:** Will Welsh, Tech Integration Labs
> **Product:** BizBrain OS -- Claude Code plugin that builds a persistent knowledge brain
> **GitHub:** https://github.com/TechIntegrationLabs/bizbrain-os-plugin
> **Website:** bizbrainos.com
> **Discord:** https://discord.gg/XZCDttmw
> **Install:** `claude plugin add TechIntegrationLabs/bizbrain-os-plugin`
> **Created:** 2026-02-25

---

## Table of Contents

1. [Daily LinkedIn Engagement Routine (15 min)](#1-daily-linkedin-engagement-routine-15-min)
2. [Content Repurposing Matrix](#2-content-repurposing-matrix)
3. [Metrics Tracking System](#3-metrics-tracking-system)
4. [Content Bank (30+ Post Ideas)](#4-content-bank-30-post-ideas)
5. [Composio API Posting Workflow](#5-composio-api-posting-workflow)

---

## 1. Daily LinkedIn Engagement Routine (15 min)

### Time Allocation Breakdown

| Block | Duration | Activity |
|-------|----------|----------|
| Morning Check | 3 min | Notifications, comments, DMs |
| Strategic Engagement | 7 min | Comment on target posts |
| Outbound Connection | 3 min | Send connection requests |
| Content Prep | 2 min | Draft or schedule a post |
| **Total** | **15 min** | |

### Step-by-Step Daily Routine

#### Block 1: Morning Check (3 min) -- 8:00 AM EST

1. Open LinkedIn notifications tab
2. Reply to every comment on your posts from the last 24 hours (prioritize questions)
3. Check DMs -- respond to anything from the last 24 hours
4. Like any comments you cannot reply to substantively right now (bookmark for later)
5. Accept relevant connection requests (AI/dev/startup/founder profiles)

**Rule:** Never leave a comment unanswered for more than 24 hours. The algorithm rewards active comment sections.

#### Block 2: Strategic Engagement (7 min) -- 8:03 AM EST

Comment on **5 posts** from your target engagement list (see below). Each comment should:
- Add genuine value (not "Great post!")
- Be at least 2-3 sentences
- Include a perspective or experience
- NOT mention BizBrain OS unless directly relevant

**Target Engagement Accounts (rotate through these daily):**

| Category | Who to Engage With | Why |
|----------|--------------------|-----|
| AI Builders | People posting about Claude, AI agents, LLM tooling | Direct audience |
| Dev Tool Founders | Founders of dev tools, CLI tools, open-source projects | Peer network, shared audience |
| Indie Hackers | Builders sharing revenue, growth, pivots | Community overlap |
| AI Thought Leaders | People posting about AI strategy, enterprise AI adoption | Visibility to their audience |
| Open Source Champions | Maintainers, contributors, open-source advocates | Credibility by association |

**Specific accounts to follow and engage with regularly:**
- People posting about Claude Code, Cursor, Windsurf, Copilot
- Open-source founders sharing build stories
- AI consultants and agency owners (potential BizBrain users)
- Tech journalists covering AI tools
- Anyone who posts about "AI context," "AI memory," or "prompt engineering"

#### Block 3: Outbound Connection (3 min) -- 8:10 AM EST

Send **3 connection requests** per day with a personalized note. Target:
- People who commented on AI/developer tool posts
- People who liked your posts but are not connected
- Speakers at AI/dev conferences
- Authors of relevant Dev.to or Hacker News posts

**Connection Request Template:**

> Hey [Name] -- I saw your [post/comment] about [topic]. I'm building an open-source Claude Code plugin for persistent AI context and your perspective on [specific thing] really resonated. Would love to connect.

**Do NOT use:**
- Generic "I'd like to add you to my network"
- Anything that mentions your product before establishing relevance
- Mass connection tools (LinkedIn penalizes automation)

#### Block 4: Content Prep (2 min) -- 8:13 AM EST

- If posting today: do a final review of the queued post
- If not posting today: jot down one observation or idea for the content bank
- Check content calendar for upcoming posts that need drafting

### Response Templates for Common Comments

**When someone says "This is exactly what I needed":**
> Thanks [Name]! What's your current workflow for managing AI context? I'd love to hear what pain points you're hitting -- helps me prioritize what to build next.

**When someone asks "How does this compare to [X]?":**
> Great question. [X] does [specific thing] well. The key difference is compounding -- BizBrain builds a knowledge graph that grows automatically across sessions, projects, and entities. It's less about features and more about the accumulation of context over time. Happy to do a deeper comparison if you're interested.

**When someone says "Interesting but I use ChatGPT/Cursor/etc":**
> Totally valid. This specifically targets Claude Code users right now. The underlying idea -- persistent structured context -- is platform-agnostic though. If you're interested in the architecture, the GitHub repo has the full design docs. Curious what context features your current tool handles well?

**When someone asks about privacy/data:**
> Everything stays on your machine. Markdown + JSON files. No cloud, no telemetry, no analytics. AGPL v3 licensed. You can read every file in a text editor. Your business context should belong to you.

**When someone asks "Is this production-ready?":**
> It's in beta (v1.0.0-beta.1). Stable for daily use -- I've been running it on my own consultancy for months. But I'd recommend checking the GitHub issues before relying on it for critical workflows. Community feedback is shaping the roadmap right now.

**When a recruiter or sales person reaches out:**
> Thanks for reaching out! I'm focused on building BizBrain OS right now. Happy to connect though.

---

## 2. Content Repurposing Matrix

Every LinkedIn post should generate content for 4-5 other platforms. Here is the conversion playbook.

### LinkedIn Post --> Twitter/X Thread

| LinkedIn Element | Twitter Adaptation |
|------------------|--------------------|
| Opening hook (1-2 lines) | Tweet 1 (hook tweet, under 280 chars) |
| Problem statement (paragraph) | Tweet 2 (problem in 2 sentences) |
| Insight/solution (paragraph) | Tweet 3-4 (one idea per tweet) |
| Supporting data/examples | Tweet 5-6 (bullet points, screenshots) |
| CTA / closing thought | Final tweet (link + install command) |

**Conversion rules:**
- Strip all LinkedIn-style paragraph breaks (the "one sentence per line" format stays, it works on Twitter too)
- Remove any "I'm humbled" or "I'm excited to announce" framing
- Make the hook tweet self-contained -- it should work even if nobody clicks "show thread"
- Add the GitHub link in tweet 1, not just the last tweet
- Use `//` or line breaks instead of bullet points where possible

**Example conversion:**

LinkedIn opening:
> Six months ago, I noticed something that changed how I think about AI. I was starting every AI session the same way. Re-explaining my business.

Twitter hook:
> Every AI session starts from zero. You re-explain your projects, clients, tech stacks. Ten minutes of setup before a single useful question. I built a Claude Code plugin that fixes this permanently. (thread)

### LinkedIn Post --> Reddit Discussion

| LinkedIn Element | Reddit Adaptation |
|------------------|-------------------|
| Hook | Title (question or statement, no clickbait) |
| Story/insight | First 2-3 paragraphs of body (conversational) |
| Product mention | "So I built..." section (mid-post, after establishing credibility) |
| CTA | "What would you add?" or "How do you handle this?" |

**Conversion rules:**
- Reddit hates self-promotion. Lead with the problem/insight, not the product
- Remove all LinkedIn formatting (no bold hooks, no emoji, no "thought leadership" tone)
- Add technical detail that LinkedIn posts skip
- End with a genuine question to spark discussion
- Choose the right subreddit: r/ClaudeAI for user stories, r/programming for architecture, r/SideProject for builder journey
- Never cross-post the same text to multiple subreddits

**Subreddit tone mapping:**

| Subreddit | Tone | Lead With |
|-----------|------|-----------|
| r/ClaudeAI | Enthusiastic, practical | Workflow improvement |
| r/programming | Technical, skeptical-friendly | Architecture decisions |
| r/SideProject | Builder's journey | Pivot story, lessons |
| r/selfhosted | Privacy-focused | Local-first, no cloud |
| r/opensource | Community-focused | License, contribution guide |

### LinkedIn Post --> Dev.to Article

| LinkedIn Element | Dev.to Adaptation |
|------------------|--------------------|
| Hook | Article title + intro paragraph |
| Core insight | "The Problem" section (expanded with code examples) |
| Solution | "The Architecture" section (with diagrams, code blocks) |
| Compounding story | "How It Works in Practice" section |
| CTA | "Getting Started" section with install instructions |

**Conversion rules:**
- Expand every LinkedIn paragraph into a full section with subheadings
- Add code blocks, file structure trees, architecture diagrams
- Include a table of contents for articles over 1000 words
- Add tags: #claudecode #ai #opensource #productivity
- Cross-post to Hashnode with canonical URL pointing to Dev.to
- A single LinkedIn post should expand into a 1500-2500 word article

### LinkedIn Post --> Discord Announcement

| LinkedIn Element | Discord Adaptation |
|------------------|--------------------|
| Hook | Bold opening line |
| Key insight | 2-3 bullet points |
| Product details | Embed or code block |
| CTA | "Try it and tell us what you think in #help" |

**Conversion rules:**
- Much shorter than LinkedIn (Discord users scan, not read)
- Use Discord markdown: `**bold**`, `> quotes`, ``` code blocks ```
- Tag relevant roles if applicable (@everyone for major announcements only)
- Always include a call to action that drives discussion in a specific channel
- Add emoji reactions to your own post to seed engagement (thumbs up, rocket, etc.)

**Template:**

```
**[One-line hook from LinkedIn post]**

[2-3 sentence summary of the key insight]

> [The most quotable line from the LinkedIn post]

[Install command in code block]

What do you think? Drop your thoughts in #general.
```

### LinkedIn Post --> Newsletter Snippet

| LinkedIn Element | Newsletter Adaptation |
|------------------|-----------------------|
| Hook | Subject line or section header |
| Core insight | 2-3 paragraph section |
| Product mention | Inline with context, not a pitch |
| CTA | "Read the full post" link back to LinkedIn |

**Conversion rules:**
- Newsletter snippets should be 150-250 words max
- Always link back to the full LinkedIn post (drives LinkedIn engagement)
- Frame as "here's what I shared this week" if part of a roundup
- If standalone email, use the LinkedIn hook as the subject line
- Add a personal note that is NOT in the LinkedIn post (rewards subscribers)

---

## 3. Metrics Tracking System

### Key Metrics -- Track Weekly

| Metric | Where to Find | Target (Month 1) | Target (Month 3) |
|--------|---------------|-------------------|-------------------|
| **Impressions** | LinkedIn Analytics > Posts | 10,000/week | 50,000/week |
| **Engagement Rate** | (Reactions + Comments + Shares) / Impressions | 3-5% | 5-8% |
| **Profile Views** | LinkedIn Analytics > Profile | 200/week | 500/week |
| **New Connections** | LinkedIn > My Network | 50/week | 100/week |
| **Follower Growth** | LinkedIn Analytics > Followers | 25/week | 75/week |
| **DMs Received** | LinkedIn Messages | 5/week | 15/week |
| **Post Comments** | Manual count per post | 5-10/post | 15-30/post |

### Cross-Platform Correlation Tracking

Track these alongside LinkedIn metrics to find causation:

| Platform Metric | Source | What It Tells You |
|-----------------|--------|-------------------|
| GitHub Stars (weekly delta) | github.com/TechIntegrationLabs/bizbrain-os-plugin | Does LinkedIn content drive GitHub traffic? |
| GitHub Traffic Sources | Repo > Insights > Traffic | How many clicks come from linkedin.com? |
| Discord Member Growth | Discord Server Settings > Members | Does LinkedIn activity correlate with joins? |
| npm Downloads (weekly) | npmjs.com/package/create-bizbrain | Does thought leadership drive installs? |
| Website Visitors | bizbrainos.com analytics | LinkedIn referral traffic |
| Plugin Installs | GitHub clone/download stats | Ultimate conversion metric |

### Content Performance Scoring Formula

Score each post on a 0-100 scale:

```
Post Score = (Normalized Impressions * 0.20)
           + (Engagement Rate * 0.25)
           + (Comments * 0.25)
           + (Shares/Reposts * 0.15)
           + (Profile Views Delta * 0.15)
```

**Normalization method:**
- Impressions: (post impressions / best post impressions) * 100
- Engagement Rate: (post ER / 0.08) * 100 (cap at 100)
- Comments: (post comments / 30) * 100 (cap at 100)
- Shares: (post shares / 10) * 100 (cap at 100)
- Profile Views Delta: (views day-of minus avg daily views) / avg * 100

**Performance tiers:**
- 80-100: Home run. Repurpose to all platforms. Write a follow-up post.
- 60-79: Strong. Repurpose to 2-3 platforms. Note what worked.
- 40-59: Average. Analyze what could improve. Test a variation.
- 0-39: Below average. Diagnose why (timing? topic? hook?). Do not repeat format.

### Weekly Review Template

Copy this into a file or spreadsheet every Sunday:

```markdown
## LinkedIn Weekly Review -- Week of [DATE]

### Posts Published This Week
| Day | Post Title/Topic | Impressions | Engagement Rate | Comments | Score |
|-----|-----------------|-------------|-----------------|----------|-------|
| Mon | | | | | |
| Wed | | | | | |
| Fri | | | | | |

### Engagement Activity
- Comments left on others' posts: __/35 (target: 5/day)
- Connection requests sent: __/21 (target: 3/day)
- Connection requests accepted: __
- DMs sent: __
- DMs received: __

### Cross-Platform Metrics
- GitHub stars (start of week): __
- GitHub stars (end of week): __ (delta: __)
- Discord members (start): __
- Discord members (end): __ (delta: __)
- npm downloads this week: __
- Website visitors from LinkedIn: __

### Top Performing Post
- Topic:
- What worked:
- Repurposed to:

### Worst Performing Post
- Topic:
- Why it underperformed:
- Lesson:

### Insights & Adjustments
-
-
-

### Next Week Plan
- Post topics:
- Engagement focus:
- Experiment to run:
```

---

## 4. Content Bank (30+ Post Ideas)

### Thought Leadership (10 ideas)

---

**TL-01: The Compound Interest of AI Context**

- **Hook:** "Warren Buffett's best investment advice applies to AI, and nobody's talking about it."
- **Key Angle:** Frame AI context accumulation as compound interest. The businesses building their context layer today will have an insurmountable advantage in 2-3 years. Context takes time to build -- you cannot shortcut it. Connect this to the classic investing analogy: the best time to start was yesterday, the second best time is now.
- **Best Time:** Tuesday 8:00 AM EST
- **Format:** Story post with timeline (Day 1 / Month 1 / Year 2)

---

**TL-02: The Death of "Starting From Scratch"**

- **Hook:** "I timed it. I was spending 47 minutes per day re-explaining my business to AI."
- **Key Angle:** Quantify the cost of context loss. 47 min/day = 4 hours/week = 200 hours/year of just... explaining things AI should already know. Frame persistent context as the obvious next step that nobody has built well yet. Show the math: at $150/hr consulting rate, that is $30,000/year of wasted time.
- **Best Time:** Wednesday 9:00 AM EST
- **Format:** Data-driven post with a personal story

---

**TL-03: Why Prompts Are Overrated (Context > Prompts)**

- **Hook:** "Hot take: prompt engineering is a band-aid for a context problem."
- **Key Angle:** The entire prompt engineering industry exists because AI does not know your specifics. If Claude already knew your projects, clients, tech stack, and preferences, most "prompt engineering" becomes unnecessary. The real skill is building and maintaining context, not crafting clever prompts.
- **Best Time:** Thursday 8:00 AM EST
- **Format:** Contrarian take / "unpopular opinion" style

---

**TL-04: AI Will Have Two Classes of Users**

- **Hook:** "In 3 years, there will be two types of AI users. The gap between them will be uncloseable."
- **Key Angle:** Class 1: People who have 3 years of accumulated, structured business context feeding their AI. Class 2: People who start every session from zero. The difference is not intelligence or subscription tier -- it is accumulated context. This is a moat that compounds daily.
- **Best Time:** Monday 8:30 AM EST
- **Format:** Thought leadership / prediction post

---

**TL-05: The New Hire vs. The Veteran**

- **Hook:** "The difference between a new hire and a 2-year employee is not intelligence. It is context."
- **Key Angle:** AI today is a perpetual new hire. Brilliant, but clueless about your specifics. The new hire asks "what's the project structure?" The veteran says "I know you changed the auth flow last quarter -- here's why we should keep the new approach." Frame BizBrain as what turns AI from new hire to veteran.
- **Best Time:** Tuesday 9:00 AM EST
- **Format:** Analogy-driven story post

---

**TL-06: Your AI Context Layer Will Be Your Most Valuable Digital Asset**

- **Hook:** "Name your company's most valuable digital asset. In 5 years, the answer will surprise you."
- **Key Angle:** Not your code. Not your data. Your AI context layer -- the structured knowledge of how your business operates, who your clients are, what decisions you have made, and why. This asset compounds and is almost impossible to replicate. Companies that realize this early will build it intentionally.
- **Best Time:** Wednesday 8:00 AM EST
- **Format:** Visionary / prediction post

---

**TL-07: Open Source as a Trust Model for AI Context**

- **Hook:** "Would you give a closed-source company the complete map of your business relationships, client preferences, and decision history?"
- **Key Angle:** The AI context layer is the most sensitive data a company owns. It is a complete graph of everything -- clients, revenue, preferences, weaknesses. This data MUST be open source and local-first. Not because of ideology, but because the stakes are too high for trust-me-bro cloud services.
- **Best Time:** Friday 8:00 AM EST
- **Format:** Privacy/security angle with business reasoning

---

**TL-08: The Context Flywheel**

- **Hook:** "The best AI features do not require you to do anything. They just get better because you showed up."
- **Key Angle:** Describe the flywheel: use AI -> AI captures context -> context makes AI more useful -> you use AI more -> more context captured. This is fundamentally different from tools that require you to manually organize, tag, or document. The brain builds itself from the work you are already doing.
- **Best Time:** Monday 8:00 AM EST
- **Format:** Framework/model post with diagram description

---

**TL-09: Why I Bet on Claude Code Over ChatGPT for Business**

- **Hook:** "I switched from ChatGPT to Claude Code 14 months ago. Here is what I learned about building on platforms."
- **Key Angle:** Claude Code's plugin system, local-first architecture, and developer-centric design make it the right platform for persistent business context. ChatGPT's memory is shallow by design (preferences, not knowledge graphs). This is not a "which is better" post -- it is about choosing the right substrate for what you are building.
- **Best Time:** Thursday 9:00 AM EST
- **Format:** Personal journey / platform comparison

---

**TL-10: Context Is the New Data**

- **Hook:** "Everyone talks about data being the new oil. Nobody talks about context being the new data."
- **Key Angle:** Raw data is abundant. Structured context -- the relationships between data points, the WHY behind decisions, the history of interactions -- is rare and valuable. AI models are commoditizing. The differentiator is not which model you use, but what context you feed it.
- **Best Time:** Tuesday 8:00 AM EST
- **Format:** Thought leadership / big idea post

---

### Technical Deep-Dives (10 ideas)

---

**TD-01: How the Brain Scanner Works**

- **Hook:** "BizBrain OS scans your entire machine and builds a knowledge graph in 60 seconds. Here is exactly how."
- **Key Angle:** Walk through the scanner architecture: filesystem walking, project detection (`.git`, `package.json`, `pyproject.toml`, `Cargo.toml`), config parsing, tech stack inference, and knowledge graph construction. Include the actual file structure output. Developers love seeing the internals.
- **Best Time:** Wednesday 2:00 PM EST
- **Format:** Technical walkthrough with code/structure examples

---

**TD-02: Claude Code Plugin Architecture Explained**

- **Hook:** "I built a Claude Code plugin with 15 skills, 11 commands, and 2 autonomous agents. Here is the architecture."
- **Key Angle:** Break down the plugin system: skills (brain-bootstrap, entity-management, project-tracking, etc.), commands (/brain, /entity, /todo, etc.), agents (entity-watchdog, brain-gateway), and hooks (SessionStart context injection, PostToolUse heartbeats). Show how they compose together.
- **Best Time:** Thursday 2:00 PM EST
- **Format:** Architecture post with component diagram description

---

**TD-03: Entity Detection: How AI Tracks People Across Conversations**

- **Hook:** "Mention 'Sarah at Acme wants the deadline moved to March' in any conversation. Watch what happens next."
- **Key Angle:** Explain the Entity Watchdog system: how it monitors conversations for known entity mentions, cross-references the Entity Index, auto-updates contact details / interaction history / action items, and asks before creating new entities. The difference between "memory" and "institutional knowledge."
- **Best Time:** Tuesday 2:00 PM EST
- **Format:** Feature deep-dive with before/after examples

---

**TD-04: Why Markdown + JSON Beats Every Database for AI Context**

- **Hook:** "I chose Markdown and JSON over SQLite, Postgres, and vector databases for my AI knowledge graph. Here is why."
- **Key Angle:** Human-readable. Git-friendly. No migration headaches. Works offline. No server. Any text editor can read it. Claude can read it natively without adapters. The format outlives every tool. If BizBrain disappeared tomorrow, you would still have perfectly organized files.
- **Best Time:** Friday 2:00 PM EST
- **Format:** Technical opinion post with format comparison table

---

**TD-05: Building a Cross-Platform Claude Code Plugin (Windows + Mac + Linux)**

- **Hook:** "The hardest bug I fixed was not a logic error. It was a backslash."
- **Key Angle:** The challenges of building a Claude Code plugin that works on Windows, macOS, and Linux: path separators, shell differences (cmd vs bash), file watching (notify crate), and the polyglot run-hook.cmd pattern that detects CMD vs Git Bash on Windows and routes accordingly.
- **Best Time:** Wednesday 2:00 PM EST
- **Format:** "Lessons learned" technical post

---

**TD-06: MCP Server Patterns for Claude Code Plugins**

- **Hook:** "The Model Context Protocol is the most underrated part of Claude Code. Here are 5 patterns I use daily."
- **Key Angle:** Cover MCP patterns: subprocess delegation (run one-off MCP tasks without restarting), profile switching, registry management, auto-detection, and graceful fallbacks. Show how BizBrain manages MCPs across projects.
- **Best Time:** Monday 2:00 PM EST
- **Format:** Pattern catalog with code examples

---

**TD-07: The Knowledge Graph Data Model**

- **Hook:** "Every knowledge graph tutorial uses nodes and edges. Here is a simpler model that actually works for business context."
- **Key Angle:** Show BizBrain's data model: entities (clients/partners/vendors with _context/ subfolders), projects (with .planning/ and _context/), operations (todos, time-tracking), and the _meta.json schema that ties everything together. Why a folder-based graph is more practical than a traditional graph database for this use case.
- **Best Time:** Thursday 2:00 PM EST
- **Format:** Data modeling post with file tree examples

---

**TD-08: How Session Hooks Create Persistent Context**

- **Hook:** "Claude Code's hook system is a hidden superpower. Here is how I use it to inject context before every session."
- **Key Angle:** Explain SessionStart hooks (context injection), PostToolUse hooks (write-through heartbeats), and how they enable "invisible" persistence. The user never thinks about saving context -- it happens automatically. Compare to explicit save/load patterns.
- **Best Time:** Tuesday 2:00 PM EST
- **Format:** Technical how-to with hook code examples

---

**TD-09: Five Profiles for Five Workflows**

- **Hook:** "A developer, a content creator, and a consultant walk into the same plugin. They each get a different experience."
- **Key Angle:** Show BizBrain's 5 profiles (developer, content-creator, consultant, agency, personal) and how each activates different skills and commands. Explain the design decision: one plugin, multiple personas. The plugin adapts to how you work rather than forcing a single workflow.
- **Best Time:** Wednesday 9:00 AM EST
- **Format:** Feature showcase with profile comparison table

---

**TD-10: From 183 Files to One Install Command -- The Architecture of a Pivot**

- **Hook:** "I deleted 183 files and rebuilt my entire product as a single install command. The architecture had to change completely."
- **Key Angle:** Technical deep-dive into the pivot from standalone Node.js app (Express + Socket.io + React) to Claude Code plugin. What stayed (knowledge brain, entity system), what changed (UI layer gone, IPC replaced by hooks, dashboard replaced by commands), and what was surprisingly hard (state management without a server).
- **Best Time:** Friday 9:00 AM EST
- **Format:** Architecture evolution post

---

### Building in Public (5 ideas)

---

**BIP-01: First 100 GitHub Stars**

- **Hook:** "100 stars on GitHub. Here is what happened behind the scenes to get here."
- **Key Angle:** Share the real story: what worked (HN post, Reddit engagement), what didn't (cold DMs, paid promotion), what surprised you (which platform drove the most stars), and what the star count does NOT tell you (install rate, retention, community engagement). Be honest about vanity metrics vs. real traction.
- **Best Time:** Monday 9:00 AM EST
- **Format:** Milestone celebration with honest breakdown

---

**BIP-02: The Bug That Broke Everything on Launch Day**

- **Hook:** "45 minutes after posting to Hacker News, someone found a bug that crashed the scanner on Windows."
- **Key Angle:** Tell the bug story honestly. What went wrong, how you diagnosed it in real-time while responding to HN comments, how you shipped a fix within hours, and what you changed in your testing process afterward. Developers love honest bug stories because they are relatable and demonstrate competence through recovery.
- **Best Time:** Wednesday 9:00 AM EST
- **Format:** Story post with technical detail

---

**BIP-03: Building a Discord Community From Zero**

- **Hook:** "Day 1: 0 members. Day 30: [X] members. Here is everything I did (and what actually worked)."
- **Key Angle:** Document the community building process: channel structure decisions, welcome message crafting, when to use @everyone (almost never), how to seed conversations (ask questions, share updates), and the moment the community started generating its own content. Include what failed.
- **Best Time:** Thursday 9:00 AM EST
- **Format:** Builder's journey with timeline

---

**BIP-04: Revenue: $0. Users: [X]. Lessons: Infinite.**

- **Hook:** "BizBrain OS makes $0. It is the most valuable thing I have ever built."
- **Key Angle:** The open-source business model: give away the tool, build the reputation, attract clients and opportunities through demonstrated expertise. Share specific opportunities that came from building in public (consulting leads, speaking invites, partnerships). Frame open source as a long-term investment, not charity.
- **Best Time:** Friday 9:00 AM EST
- **Format:** Honest reflection / business philosophy post

---

**BIP-05: Weekly Build Update -- What Shipped This Week**

- **Hook:** "This week in BizBrain OS: [2-3 bullet points of what shipped]."
- **Key Angle:** Short, consistent weekly updates. What was built, what was fixed, what is next. Include a screenshot or code snippet. Tag contributors. End with "What should we build next?" to drive engagement. Consistency is the point -- this trains your audience to expect updates.
- **Best Time:** Saturday 10:00 AM EST
- **Format:** Short update post (repeat weekly)

---

### Engagement Bait (7 ideas)

---

**EB-01: Poll -- How Do You Manage AI Context?**

- **Hook:** "Quick poll for anyone using AI daily:"
- **Key Angle:** Poll options: (a) I re-explain everything every session, (b) I use custom instructions / CLAUDE.md, (c) I have a personal knowledge base I paste from, (d) I built something custom. This surfaces the pain point and the comments will be full of people describing their workarounds -- perfect for follow-up content.
- **Best Time:** Tuesday 12:00 PM EST
- **Format:** LinkedIn poll (1 week duration)

---

**EB-02: Unpopular Opinion -- Prompt Engineering Is Dead**

- **Hook:** "Unpopular opinion: prompt engineering is a $0 skill in 2027."
- **Key Angle:** Provocative but defensible. As AI context systems improve, the need for clever prompting decreases. The skill that matters is building and curating context, not crafting prompts. This will generate strong agree/disagree engagement. Be prepared to defend the position respectfully in comments.
- **Best Time:** Thursday 8:00 AM EST
- **Format:** Hot take / opinion post

---

**EB-03: "What Would You Build If AI Remembered Everything?"**

- **Hook:** "Imagine AI that remembered every project, every client, every decision you ever made. What would you build?"
- **Key Angle:** Open-ended question designed to spark imagination. The comments become market research -- people will describe their dream use cases, which are feature requests in disguise. Engage with every comment. Reference interesting answers in future posts.
- **Best Time:** Wednesday 12:00 PM EST
- **Format:** Question post

---

**EB-04: "Tag Someone Who Re-Explains Their Business to AI Every Day"**

- **Hook:** "Tag someone who spends the first 10 minutes of every AI session explaining what they are working on."
- **Key Angle:** Lighthearted, relatable. Almost everyone who uses AI daily has this experience. The tagging mechanic extends reach. Follow up in comments with "What if it just... already knew?" to plant the BizBrain seed naturally.
- **Best Time:** Friday 12:00 PM EST
- **Format:** Engagement / tag post

---

**EB-05: "My AI Context Stack" -- Show Yours**

- **Hook:** "Here is my AI context stack. Show me yours."
- **Key Angle:** Share your personal stack: BizBrain OS for persistent context, Claude Code for development, specific MCPs for integrations. Ask others to share theirs. This format works because it is both educational and ego-driven -- people love showing their setups. Creates a thread of tool recommendations.
- **Best Time:** Monday 12:00 PM EST
- **Format:** Stack showcase / community post

---

**EB-06: Poll -- What Kills Your AI Productivity Most?**

- **Hook:** "What is the single biggest thing that kills your productivity with AI tools?"
- **Key Angle:** Poll options: (a) Re-explaining context every session, (b) Hallucinations / wrong answers, (c) Token limits / context windows, (d) Switching between AI and other tools. Option (a) is the BizBrain pain point -- the results validate the problem. Share results in a follow-up post.
- **Best Time:** Wednesday 8:00 AM EST
- **Format:** LinkedIn poll (1 week duration)

---

**EB-07: "The AI Tool That Changed My Workflow Most in 2026"**

- **Hook:** "Name the ONE AI tool that changed your daily workflow the most this year. I will go first."
- **Key Angle:** Go first with Claude Code + BizBrain OS (naturally). The comments will be full of tool recommendations, which builds engagement. Respond to every comment with genuine curiosity. This positions you as part of the AI tools conversation, not just selling into it.
- **Best Time:** Tuesday 12:00 PM EST
- **Format:** Community question post

---

### Post Timing Summary

| Day | Best Slot | Post Type |
|-----|-----------|-----------|
| Monday | 8:00-9:00 AM EST | Thought leadership or engagement |
| Tuesday | 8:00-9:00 AM EST | Thought leadership |
| Tuesday | 12:00 PM EST | Polls / engagement |
| Wednesday | 8:00-9:00 AM EST | Mixed |
| Wednesday | 2:00 PM EST | Technical deep-dives |
| Thursday | 8:00-9:00 AM EST | Contrarian takes |
| Thursday | 2:00 PM EST | Technical deep-dives |
| Friday | 8:00-9:00 AM EST | Open source / building in public |
| Friday | 12:00 PM EST | Fun engagement posts |
| Saturday | 10:00 AM EST | Weekly build updates |

**Posting frequency:** 3-4 posts per week. Never more than 1 per day. Quality over quantity.

**Best days for reach:** Tuesday through Thursday.

**Avoid:** Sunday posting (low engagement), posting after 5 PM EST (dies overnight), posting more than once in 24 hours (LinkedIn throttles).

---

## 5. Composio API Posting Workflow

Use the Composio LinkedIn MCP to automate posting from a content calendar file. This enables a "write once, schedule from terminal" workflow.

### Prerequisites

- Composio LinkedIn MCP connected (see `BB1/Operations/mcp-configs/` for setup)
- LinkedIn account authenticated via Composio OAuth
- Content calendar file (see template below)

### Step 1: Get Your LinkedIn Person ID

Use `LINKEDIN_GET_MY_INFO` to retrieve your person URN:

```
Tool: LINKEDIN_GET_MY_INFO
Parameters: {}
```

Response will include your `personUrn` in the format `urn:li:person:XXXXXXXXX`. Save this -- you need it for every post.

**Store the URN in your dev-config-system:**
```json
// BB1/Operations/dev-config-system/services/linkedin.json
{
  "personUrn": "urn:li:person:XXXXXXXXX",
  "profileUrl": "https://www.linkedin.com/in/wjwelsh/"
}
```

### Step 2: Create a Post

Use `LINKEDIN_CREATE_LINKED_IN_POST` to publish:

```
Tool: LINKEDIN_CREATE_LINKED_IN_POST
Parameters: {
  "text": "Your post content here. Full text, including line breaks.\n\nMultiple paragraphs work.\n\nHashtags at the end if desired.",
  "visibility": "PUBLIC"
}
```

**Important rules:**
- Do NOT include links in the main post text (LinkedIn suppresses reach for posts with links)
- Keep the text under 3000 characters for optimal reach
- Line breaks are `\n\n` for paragraph breaks, `\n` for line breaks
- The API returns a post URN like `urn:li:share:XXXXXXXXX` -- save this for the next step

### Step 3: Add First Comment (With Links)

Immediately after posting, add your links as the first comment using `LINKEDIN_CREATE_COMMENT_ON_POST`:

```
Tool: LINKEDIN_CREATE_COMMENT_ON_POST
Parameters: {
  "post_id": "urn:li:share:XXXXXXXXX",
  "comment_text": "GitHub: https://github.com/TechIntegrationLabs/bizbrain-os-plugin\nDiscord: https://discord.gg/XZCDttmw\nWebsite: https://bizbrainos.com\n\nHappy to answer questions!",
  "actor_urn": "urn:li:person:XXXXXXXXX"
}
```

### Step 4: Verify and Log

After posting, check the post status and log it:

```
Tool: LINKEDIN_GET_POST_CONTENT
Parameters: {
  "post_id": "urn:li:share:XXXXXXXXX"
}
```

### Content Calendar File Format

Create a content calendar at `bizbrain-os-launch/content/linkedin-calendar.json`:

```json
{
  "posts": [
    {
      "id": "TL-01",
      "title": "The Compound Interest of AI Context",
      "category": "thought-leadership",
      "scheduled_date": "2026-03-04",
      "scheduled_time": "08:00 EST",
      "status": "draft",
      "text": "Warren Buffett's best investment advice applies to AI...",
      "first_comment": "GitHub: https://github.com/TechIntegrationLabs/bizbrain-os-plugin\nDiscord: https://discord.gg/XZCDttmw",
      "post_urn": null,
      "posted_at": null,
      "metrics": {
        "impressions": null,
        "reactions": null,
        "comments": null,
        "shares": null,
        "score": null
      }
    }
  ]
}
```

### Suggested Automated Workflow

The complete workflow from content calendar to posted + logged:

```
1. READ content calendar file (linkedin-calendar.json)
2. FIND next post where status = "draft" and scheduled_date <= today
3. POST using LINKEDIN_CREATE_LINKED_IN_POST
   - Save returned post URN
4. COMMENT using LINKEDIN_CREATE_COMMENT_ON_POST
   - Use saved post URN + first_comment text
5. UPDATE calendar file:
   - Set status = "posted"
   - Set post_urn = returned URN
   - Set posted_at = current timestamp
6. LOG to posting history file for metrics tracking
```

**To execute this workflow in Claude Code:**

```
/mcp run composio-social-check "Read the content calendar at
~/Repos/bizbrain-os-launch/content/linkedin-calendar.json,
find the next draft post scheduled for today or earlier,
post it to LinkedIn, add the first comment with links,
and update the calendar file with the post URN and timestamp."
```

### Metrics Collection (Weekly)

Use the Composio LinkedIn MCP to pull post metrics:

```
Tool: LINKEDIN_GET_SHARE_STATS
Parameters: {
  "share_id": "urn:li:share:XXXXXXXXX"
}
```

Run this weekly for all posts from the past 7 days and update the metrics fields in `linkedin-calendar.json`. Over time, this builds a dataset of what content performs best.

### Safety Notes

- Always draft and review posts in the calendar file before posting programmatically
- Never automate posting without human review of the final text
- LinkedIn rate limits: do not post more than once per day via API
- Keep the Composio OAuth token refreshed (check monthly)
- If a post fails, check the Composio MCP logs before retrying

---

## Appendix: Quick Reference

### Key Links for Every Post's First Comment

```
GitHub: https://github.com/TechIntegrationLabs/bizbrain-os-plugin
Discord: https://discord.gg/XZCDttmw
Website: https://bizbrainos.com
Install: claude plugin add TechIntegrationLabs/bizbrain-os-plugin
```

### Hashtags (Use 3-5 Per Post, Rotate)

**Primary (use 2-3 always):**
- #AI
- #OpenSource
- #ClaudeCode

**Secondary (rotate based on topic):**
- #DeveloperTools
- #BuildInPublic
- #AITools
- #Productivity
- #TechFounder
- #IndieHacker
- #MachineLearning
- #ArtificialIntelligence
- #SaaS
- #DevOps
- #SoftwareEngineering

### Content Pillar Rotation

To avoid audience fatigue, rotate through content pillars:

| Week | Mon | Wed | Fri |
|------|-----|-----|-----|
| 1 | Thought Leadership | Technical Deep-Dive | Building in Public |
| 2 | Engagement Bait | Thought Leadership | Technical Deep-Dive |
| 3 | Building in Public | Engagement Bait | Thought Leadership |
| 4 | Technical Deep-Dive | Building in Public | Engagement Bait |

Repeat. Adjust based on performance data from the weekly review.

---

*End of LinkedIn Engagement System. Review and update monthly based on metrics.*
