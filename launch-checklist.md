# BizBrain OS Launch Checklist

> Updated 2026-02-23 | Pivoted to Claude Code Plugin narrative
> Plugin Repo: https://github.com/TechIntegrationLabs/bizbrain-os-plugin
> Discord: https://discord.gg/XZCDttmw

## Status Key
- [x] = Done (automated or completed)
- [ ] = Needs manual action

---

## Phase 1: Plugin Development (DONE)

- [x] Build bizbrain-os-plugin repo (Claude Code plugin architecture)
- [x] Implement machine scanner — discovers repos, projects, configs in 60 seconds
- [x] Implement persistent knowledge brain — structured context that compounds across sessions
- [x] Implement slash commands and skills for Claude Code
- [x] Push to GitHub: github.com/TechIntegrationLabs/bizbrain-os-plugin
- [x] Tag v1.0.0-alpha.1

## Phase 2: Distribution Setup (DONE)

- [x] Plugin repo public on GitHub
- [x] create-bizbrain npm package built (CLI installer still exists)
- [x] Push to GitHub: github.com/TechIntegrationLabs/create-bizbrain
- [x] Discord server created: https://discord.gg/XZCDttmw
- [x] AGPL v3 license in place
- [x] CLA added to .github/

## Phase 3: Website & Marketplace (IN PROGRESS)

- [ ] **Rebuild website** for plugin narrative (bizbrain-os-site repo)
  - Hero: "The compound interest of AI context."
  - Subhead: "A Claude Code plugin that scans your machine, builds a knowledge brain, and compounds context across every session."
  - Install: `claude plugin add bizbrain-os` (or git clone instructions)
  - Comparison section: vs ChatGPT Memory, vs Notion/Obsidian, vs starting fresh
  - Demo GIF/video of 60-second scan
- [ ] **Deploy website to Vercel:** `cd ~/Repos/bizbrain-os-site && vercel --prod`
- [ ] **Register/connect domain:** bizbrain-os.com (and bizbrainos.com, bizbrain.dev)
- [ ] **Submit to Claude Code marketplace** (when marketplace opens)
  - Plugin name: bizbrain-os
  - Description: "The context layer that teaches AI your business"
  - Categories: productivity, business, context-management
- [ ] **Publish create-bizbrain to npm** (updated for plugin install flow)
  - `cd ~/Repos/create-bizbrain && npm publish --access public`
  - Test: `npx create-bizbrain@latest`

## Phase 4: Platform Security (MANUAL)

- [ ] **npm scope:** Register `@bizbrain` scope on npmjs.com
- [ ] **X/Twitter:** Secure @BizBrainOS handle (or @bizbrain_os)
- [x] **Discord:** BizBrain OS Discord server live — https://discord.gg/XZCDttmw
  - [ ] Set up channels: #announcements, #general, #introductions, #help, #plugins, #contributing, #feature-ideas
  - [ ] Post welcome message (from content/discord-welcome.md)
  - [ ] Set up Community Onboarding
- [ ] **Update Discord links** in README.md and website (use https://discord.gg/XZCDttmw)
- [ ] **Product Hunt:** Create upcoming page at producthunt.com
- [ ] **Dev.to:** Create account / verify existing
- [ ] **LinkedIn:** Prepare personal profile for launch posts

## Phase 5: IP Protection (HIGH PRIORITY)

- [x] AGPL v3 license
- [x] CLA for contributors
- [ ] **File trademark** for "BizBrain OS" with USPTO
  - File under Class 9 (computer software) + Class 42 (software services)
  - Budget: $850-$2,500 (filing + attorney)
  - Timeline: 12-18 months to registration
- [ ] **Trademark usage guidelines** page on website/repo
- [ ] **Register domains:** bizbrain-os.com, bizbrainos.com, bizbrain.io, bizbrain.dev

## Phase 6: Content Assets (MANUAL)

- [x] All launch posts drafted (content/ folder in this repo)
- [ ] **Record demo video** (60-90 seconds)
  - Show: `claude plugin add bizbrain-os` -> 60-second machine scan -> knowledge brain building -> slash commands in action
  - Tools: OBS Studio or Loom
  - Key moment: scanner discovering 5 repos and building knowledge graph in real-time
- [ ] **Create screenshots** for README and website
  - Scanner output discovering repos/projects
  - Knowledge brain structure
  - Slash commands in action
  - Before/after comparison (fresh Claude vs BizBrain-enhanced Claude)
- [ ] **Create social banner** (1200x630 for X/Twitter and OG image)
  - Tagline: "The compound interest of AI context."
- [ ] **Upload demo to YouTube** (title: "BizBrain OS — Install a Claude Code Plugin, Get a Business Brain in 60 Seconds")

## Phase 7: Launch Week (SEE launch-week.md)

- [ ] Day 1: Hacker News "Show HN"
- [ ] Day 2: Reddit (r/ClaudeAI, r/programming, r/SideProject)
- [ ] Day 3: Product Hunt
- [ ] Day 4: Dev.to article
- [ ] Day 5: LinkedIn + Twitter campaign
- [ ] Day 6: YouTube demo video
- [ ] Day 7: Retrospective + community engagement

## Phase 8: Post-Launch

- [ ] Respond to ALL comments within 4 hours (HN, Reddit, PH)
- [ ] Create "Good First Issue" labels on 5-10 GitHub issues
- [ ] Publish 2 articles per week for first month
- [ ] Weekly community office hours on Discord
- [ ] Monthly changelog/release posts
- [ ] YouTube tutorial series (plugin setup, knowledge brain, custom skills)
- [ ] Submit to: TLDR newsletter, Console.dev, JavaScript Weekly, Node Weekly
- [ ] Submit to awesome-claude-code lists when they exist
- [ ] Monitor Claude Code marketplace for submission window

---

## Quick Commands

```bash
# Check pre-launch status
bash ~/Repos/bizbrain-os-launch/pre-launch.sh

# Publish to npm
cd ~/Repos/create-bizbrain && npm publish --access public

# Deploy website
cd ~/Repos/bizbrain-os-site && vercel --prod

# Test the plugin (local install)
cd ~/Repos/bizbrain-os-plugin && claude plugin add .

# Commit and push plugin updates
cd ~/Repos/bizbrain-os-plugin && git add -A && git commit -m "update" && git push
```
