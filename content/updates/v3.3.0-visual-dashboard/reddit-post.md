# Reddit Post — r/ClaudeAI

## Title
I built a visual dashboard for my Claude Code plugin (BizBrain OS v3.3.0)

## Body

I've been building [BizBrain OS](https://github.com/TechIntegrationLabs/bizbrain-os-plugin), a Claude Code plugin that creates a persistent knowledge brain from your work. Just shipped v3.3.0 which adds a browser-based visual dashboard, and I wanted to walk through the technical architecture because I think the patterns are interesting.

### The problem

BizBrain OS has grown to 37 distinct features across 8 categories. Entity tracking, decision logging, workflow orchestration, content pipelines, integrations — all managed through CLI commands and slash commands inside Claude Code.

The issue: most users configured 5-8 features and never discovered the rest. The CLI is powerful but opaque. There's no way to see "what have I set up?" vs. "what am I missing?" without reading documentation.

I needed a visual layer that reads the brain state and shows it.

### The solution: `/dashboard`

One command. Type `/dashboard` in any Claude Code session.

First run:
1. Scaffolds an Express server into `~/bizbrain-os/.dashboard/`
2. Installs dependencies (just Express)
3. Launches the server on port 3850 (detached from Claude Code process)
4. Opens your browser

Subsequent runs: detects the server is already running, opens the browser. Instant.

### Architecture

**Server:** Express on port 3850. Two responsibilities — serve the SPA and expose REST endpoints that read brain state from the filesystem.

```javascript
// Brain state discovery — reads actual files, no separate database
app.get('/api/brain-state', (req, res) => {
  const brainPath = discoverBrainPath();
  const state = {
    configured: scanConfiguredFeatures(brainPath),
    entities: countEntities(brainPath),
    integrations: detectIntegrations(brainPath),
    health: checkBrainHealth(brainPath)
  };
  res.json(state);
});
```

No database. Every API call reads the brain folder directly. The dashboard is always consistent with reality because there's no cached state to drift.

**Frontend:** Vanilla HTML/CSS/JS. No React, no build step, no bundler. Hash router for view switching:

```javascript
// Views: overview | checklist | integrations | settings
window.addEventListener('hashchange', () => {
  const route = window.location.hash.slice(1) || 'overview';
  renderView(route);
});
```

The entire frontend is a single HTML file served by Express. I considered React and decided the added complexity wasn't worth it for what's essentially a read-only status dashboard.

**Checklist system:** 37 items, each with a programmatic check function:

```javascript
{
  id: 'brain-swarm',
  category: 'Advanced Intelligence',
  title: 'Brain Swarm Orchestration',
  description: 'Coordinate multiple brain agents through an event queue',
  setupCommand: '/swarm',
  check: (state) => {
    return state.config?.features?.orchestration === true
      && fs.existsSync(path.join(state.brainPath, '.bizbrain/events'));
  }
}
```

Each check function evaluates against the live brain state — looking for config flags, directory existence, file presence, integration tokens. The dashboard evaluates all 37 checks on every page load and renders completion status.

### The 8 categories

| Category | # Items | Examples |
|----------|---------|---------|
| Foundations | 5 | Brain setup, config, profiles, health checks, backups |
| Memory & Persistence | 5 | Decision logs, pattern learning, session memory, knowledge base |
| Communication | 4 | Slack, Discord, Gmail, unified comms |
| Productivity | 5 | Todos, time tracking, GSD workflow, session archiving |
| Development | 5 | Git integration, worktrees, TDD, code patterns |
| Business Operations | 5 | Entity tracking, contracts, client dashboards |
| Content & Media | 4 | Content pipeline, social posting, presentations |
| Advanced Intelligence | 4 | Brain Swarm, model routing, workflow patterns |

### Progress visualization

The overview page has a ring visualization (SVG, calculated client-side) showing overall completion as a percentage. Below it, each category gets a progress bar with the ratio of completed items.

This is psychologically effective. Users see "34% complete" and immediately want to know what's missing. They click through categories, see features they didn't know existed, and start enabling them. The dashboard became the best onboarding tool in the project.

### AI-generated icons

Each of the 37 checklist items has a unique app-style icon. Generated with a consistent prompt, category-color-coded, embedded as inline SVGs. No external requests, no CDN. The dashboard works completely offline.

### What I intentionally left out

- **No auth.** Localhost only. If someone's on your port 3850, you have bigger issues.
- **No telemetry.** I don't know how many people use the dashboard. That's fine.
- **No write operations.** The dashboard is read-only. Actions are "copy this command to your clipboard" — execution happens in Claude Code, not the browser.
- **No websockets.** I considered live updates but decided against the complexity. Refresh the page to get fresh state.

### Server lifecycle

The server detaches from the Claude Code process, so it survives session ends:

```javascript
const server = spawn('node', ['server.js'], {
  cwd: dashboardDir,
  detached: true,
  stdio: 'ignore'
});
server.unref();  // Parent process can exit without killing the server
```

This means `/dashboard` is fast on repeat calls — just opens the browser. The server runs until you kill it or reboot.

### Install

```bash
claude plugin marketplace add TechIntegrationLabs/bizbrain-os-plugin
claude plugin install bizbrain-os
```

Then in Claude Code:

```
/brain setup
/dashboard
```

Auto-installs on first call. Zero manual configuration.

Open source, AGPL-3.0, free, local-first. All code: [TechIntegrationLabs/bizbrain-os-plugin](https://github.com/TechIntegrationLabs/bizbrain-os-plugin)

Discord if you want to chat about it: [discord.gg/ph9D5gSgW3](https://discord.gg/ph9D5gSgW3)

Happy to answer questions about the architecture. The "filesystem as database for a status dashboard" pattern worked out better than I expected, and the auto-scaffolding approach (install on first use, not on plugin install) keeps the initial setup fast.
