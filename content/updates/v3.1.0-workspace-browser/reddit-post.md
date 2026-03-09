# Reddit Post — r/ClaudeAI

## Title
v3.1.0: BizBrain OS can now read your email, check your calendar, and browse the web

## Body

Just shipped v3.1.0 of [BizBrain OS](https://github.com/TechIntegrationLabs/bizbrain-os-plugin), the Claude Code plugin that builds a persistent knowledge brain from your work. This release adds Google Workspace integration and a 3-tool browser automation stack.

### What's new

**Google Workspace (all 12 services):** Gmail, Calendar, Drive, Docs, Sheets, Slides, Forms, Keep, Tasks, Contacts, Groups, Admin. We built two integration paths:

- **gwcli** — a lightweight CLI for quick lookups. Zero context cost. `gwcli gmail search "from:client"` or `gwcli calendar today`. BizBrain calls it through Bash when it needs fast answers.
- **Full MCP** — on-demand for heavy multi-step workflows like drafting email replies or building spreadsheets from brain data. Only activates when the task needs it.

The brain decides which path to take automatically. Quick lookup? gwcli. Complex workflow? Full MCP. You don't think about it.

**Browser automation (3 tools, smart routing):**

- **Playwright MCP** (new default) — accessibility tree based, cross-browser, headless capable. Way more reliable than screenshot-based approaches.
- **Claude-in-Chrome** — still there for interacting with pages where you're logged in. Can't beat it for authenticated sessions.
- **Puppeteer** — available for Chrome DevTools Protocol edge cases.

Again, the brain routes automatically. "Look at this page I have open" goes to Claude-in-Chrome. Everything else goes to Playwright.

### Why it matters for daily workflow

The killer feature isn't email access or browser automation individually — it's the brain integration.

When BizBrain reads an email from a client, it automatically links it to that client's entity record, extracts action items into your todo system, and logs the interaction in client history. Next time you're coding something for that client, the brain already has the context from the email thread. No copy-pasting. No "let me explain what the client wants."

Same with calendar — meetings link to entities, and if you're using the meeting transcriber (shipped in v3.0.1), transcripts flow right into entity history and action items.

### Setup

```bash
# Install plugin
claude plugin add TechIntegrationLabs/bizbrain-os-plugin

# Google Workspace (optional)
npm install -g @bizbrain/gwcli
gwcli auth login

# Browser automation works out of the box
```

Playwright MCP is included and enabled by default. No extra setup.

### What's next

Slack integration, GitHub deep integration (issues/PRs/discussions feeding the brain), and more local-first free alternatives to expensive SaaS tools.

Free and open source (AGPL-3.0). Your data stays on your machine.

- **GitHub:** [github.com/TechIntegrationLabs/bizbrain-os-plugin](https://github.com/TechIntegrationLabs/bizbrain-os-plugin)
- **Discord:** [discord.gg/ph9D5gSgW3](https://discord.gg/ph9D5gSgW3)

Happy to answer questions about the architecture or setup.
