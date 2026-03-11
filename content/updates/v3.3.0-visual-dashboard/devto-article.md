---
title: "BizBrain OS v3.3.0: I Built a Visual Command Center Inside Claude Code"
published: false
description: "BizBrain OS v3.3.0 adds a browser-based visual dashboard with a 37-item setup checklist, AI-generated icons, progress tracking, and integrations hub. One command: /dashboard. Zero config."
tags: claudecode, ai, opensource, developer
cover_image: https://raw.githubusercontent.com/TechIntegrationLabs/bizbrain-os-plugin/main/assets/bizbrain-architecture-demo.jpg
---

I built a visual command center for my AI brain. It runs inside Claude Code and launches with one command.

I've been building [BizBrain OS](https://github.com/TechIntegrationLabs/bizbrain-os-plugin), an open-source Claude Code plugin that creates a persistent knowledge brain from your development work. Over 20+ releases, I've added 21 skills, 13 commands, 4 agents, and a full orchestration layer. All configured through the CLI.

And that was the problem.

## The Problem: Your Brain Is Invisible

BizBrain OS builds a `~/bizbrain-os/` folder with hundreds of files — entities, decision logs, workflow patterns, learned preferences, project contexts. All in Markdown and JSON. All maintained by background agents. All invisible unless you go digging.

Every new user hit the same wall. They'd install BizBrain OS, run `/brain setup`, and then... stare at a terminal wondering what to do next. The brain was working — compounding context in the background — but there was no way to *see* it. No way to know which features were configured, which integrations were connected, which capabilities they were leaving on the table.

I had 37 distinct features across 8 categories. Users were discovering maybe 6 of them.

The answer wasn't better documentation. It was a dashboard.

## The Solution: `/dashboard`

v3.3.0 adds a browser-based visual command center. Type `/dashboard` in any Claude Code session. That's it.

On first run, it auto-installs an Express server, generates the frontend, and opens your browser. No npm install, no config files, no build step. The entire thing bootstraps from a single slash command.

What you see:

- **Setup Checklist** — 37 items across 8 categories, each with a unique AI-generated app icon, description, benefits, use cases, and a setup command you can copy
- **Progress Tracking** — Ring visualization showing overall completion, plus category-level progress bars
- **Integrations Hub** — Which MCPs and services are connected vs. available
- **Quick Launch** — One-click buttons to open your brain folder, conversations, repos, or start a new Claude Code session

The dashboard reads your brain state in real time. Configured entity tracking? The checklist shows it complete. Connected the Notion MCP? The integrations hub reflects it. Everything is derived from your actual brain files — no separate state to maintain.

## The Technical Architecture

I wanted this to be zero-dependency and bulletproof. Here's what I landed on.

### Server Discovery

The dashboard runs a local Express server on port 3850. The server discovery logic handles the full lifecycle:

```javascript
// Server lifecycle: discover -> install -> launch -> open
async function ensureDashboard(brainPath) {
  const dashboardDir = path.join(brainPath, '.dashboard');

  // Auto-install on first run
  if (!fs.existsSync(dashboardDir)) {
    await scaffoldDashboard(dashboardDir);
    await installDependencies(dashboardDir);
  }

  // Check if already running
  const running = await checkPort(3850);
  if (running) {
    open('http://localhost:3850');
    return;
  }

  // Launch and open
  const server = spawn('node', ['server.js'], {
    cwd: dashboardDir,
    detached: true,
    stdio: 'ignore'
  });
  server.unref();

  await waitForPort(3850);
  open('http://localhost:3850');
}
```

The server is detached from the Claude Code process. It persists after your session ends, so subsequent `/dashboard` calls just open the browser — instant.

### The Checklist Data Model

Each of the 37 setup items is a structured object that the dashboard evaluates against your brain state:

```javascript
const checklistItem = {
  id: 'entity-tracking',
  category: 'Business Operations',
  title: 'Entity Tracking',
  description: 'Track clients, partners, and vendors automatically',
  benefits: [
    'Auto-detect entity mentions in conversations',
    'Maintain contact records without manual updates',
    'Build interaction history over time'
  ],
  useCases: [
    'Client relationship management',
    'Partner collaboration tracking'
  ],
  setupCommand: '/brain setup entities',
  icon: 'entity-tracking.svg',  // AI-generated, unique per item
  check: (brainState) => {
    return fs.existsSync(
      path.join(brainState.brainPath, 'Entities')
    ) && brainState.config?.features?.entityWatchdog !== false;
  }
};
```

The `check` function runs against the live brain state on every page load. No cached status, no stale data. The dashboard always reflects reality.

### Eight Categories

The 37 items span the full BizBrain OS capability surface:

| Category | Items | What It Covers |
|----------|-------|----------------|
| **Foundations** | 5 | Brain setup, config, profiles, brain health, backups |
| **Memory & Persistence** | 5 | Decision logging, pattern learning, session memory, knowledge base, context injection |
| **Communication** | 4 | Slack, Discord, Gmail, unified comms hub |
| **Productivity** | 5 | Todos, time tracking, GSD workflow, session archiving, intake processing |
| **Development** | 5 | Git integration, worktrees, TDD workflow, code patterns, dependency tracking |
| **Business Operations** | 5 | Entity tracking, contracts, invoicing, client dashboards, partner management |
| **Content & Media** | 4 | Content pipeline, social posting, presentations, video creation |
| **Advanced Intelligence** | 4 | Brain Swarm orchestration, smart model routing, workflow patterns, brain learning |

Each category has its own progress bar. The ring visualization in the header shows overall completion as a percentage. It's immediately obvious where you've invested in your brain and where the gaps are.

### AI-Generated Icons

Every checklist item has a unique app-style icon. I generated these using a consistent prompt that produces recognizable, category-color-coded SVGs. The icons make the dashboard scannable — you can identify features by their visual identity without reading the labels.

The icons are embedded inline (no external requests), so the dashboard works completely offline. No CDN, no external fonts, no analytics. Port 3850 serves everything.

### Hash Router SPA

The frontend is vanilla HTML, CSS, and JavaScript. No React, no build step, no bundler. It uses a hash router for navigation between views:

```javascript
// Hash-based routing — no server-side routing needed
window.addEventListener('hashchange', () => {
  const route = window.location.hash.slice(1) || 'overview';
  renderView(route);
});

function renderView(route) {
  switch(route) {
    case 'overview':    renderOverview(); break;
    case 'checklist':   renderChecklist(); break;
    case 'integrations': renderIntegrations(); break;
    case 'settings':    renderSettings(); break;
    default:            renderOverview();
  }
}
```

This keeps the entire dashboard in a single HTML file served by Express. No multi-page routing complexity, no 404 handling, no build artifacts. The server has two jobs: serve the HTML and expose REST endpoints for brain state queries.

## The Real Value: Onboarding

The dashboard solves a problem I didn't fully appreciate until I watched new users try BizBrain OS. The CLI is powerful but opaque. When someone runs `/brain setup`, they get entity tracking, decision logging, and context injection — maybe 8 of 37 features. The other 29 exist but are invisible.

With the dashboard, a new user immediately sees: "I have 37 capabilities available. I've configured 8. Here are the other 29, what they do, and the exact command to enable each one."

That changes the adoption curve from "discover features by accident over weeks" to "see everything, pick what matters, configure in minutes."

The progress ring is psychologically effective too. Nobody wants to see 22% completion. You start clicking setup commands just to fill the bar.

## What's Not in the Dashboard

Worth noting what I intentionally left out:

- **No authentication.** It's localhost:3850. If someone has access to your local network and port 3850, you have bigger problems.
- **No database.** All state comes from reading brain files. The dashboard is a read-only view with action buttons that copy CLI commands.
- **No telemetry.** Zero external requests. I don't know how many people use the dashboard and I don't want to.
- **No auto-update.** The dashboard scaffolds once and stays. Plugin updates may add new checklist items, but the server doesn't phone home.

## Install

BizBrain OS is free, open source (AGPL-3.0), and runs entirely on your machine.

```bash
claude plugin marketplace add TechIntegrationLabs/bizbrain-os-plugin
claude plugin install bizbrain-os
```

Then in Claude Code:

```
/brain setup
/dashboard
```

The dashboard auto-installs on first `/dashboard` call. Zero config.

## What's Next

The dashboard is a read-only view today. The next step is making it interactive — click a checklist item and it runs the setup command directly, without copying to the CLI. After that: real-time brain activity visualization, showing agent operations, event queue depth, and staging proposals as they happen.

The thesis remains: your AI context layer will be your most valuable digital asset. Now you can finally see it.

---

*BizBrain OS — the compound interest of AI context.*

**GitHub:** [TechIntegrationLabs/bizbrain-os-plugin](https://github.com/TechIntegrationLabs/bizbrain-os-plugin)
**Website:** [bizbrainos.com](https://bizbrainos.com)
**Discord:** [https://discord.gg/ph9D5gSgW3](https://discord.gg/ph9D5gSgW3)
