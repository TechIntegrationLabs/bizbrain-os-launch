# Twitter Thread — BizBrain OS v3.1.0 "Workspace + Browser"

## Tweet 1 (Hook)
Your AI can read your entire codebase but can't check what your client emailed you this morning.

BizBrain OS v3.1.0 fixes that. Your AI now reads your email, checks your calendar, and browses the web.

Here's the architecture:

## Tweet 2 (Google Workspace — the problem)
Google Workspace has 12 services. Loading all 12 as MCP servers burns thousands of tokens before you even ask a question.

So we built two paths:
- gwcli: lightweight CLI, zero context cost
- Full MCP: on-demand for heavy workflows

The brain picks the right one automatically.

## Tweet 3 (gwcli in action)
Quick lookups cost almost nothing:

gwcli gmail search "from:sarah@acme.com"
gwcli calendar today
gwcli drive search "Q1 report"

BizBrain calls these through Bash. No MCP server running. No tokens burned on idle services.

Need to draft replies to 10 emails? The full MCP activates. Simple.

## Tweet 4 (Browser — why Playwright)
Browser automation: we made Playwright MCP the default over Claude-in-Chrome.

Why? Accessibility tree > screenshots. Cross-browser > Chrome only. Headless > needs visible window.

Structured element labels beat pixel coordinates every time.

## Tweet 5 (Browser — the full stack)
Three tools, one brain:

Playwright MCP — scraping, testing, headless automation
Claude-in-Chrome — authenticated pages you're viewing
Puppeteer — Chrome DevTools edge cases

"Look at this page" routes to Chrome extension.
Everything else routes to Playwright.
You never think about it.

## Tweet 6 (Brain integration)
Here's where it compounds:

BizBrain reads your email from Acme Corp. It automatically:
- Links the sender to their entity record
- Extracts action items into your todo system
- Logs the interaction in client history

Next coding session, the brain already knows the context.

## Tweet 7 (The compound effect)
Monday: client email gets ingested
Tuesday: calendar meeting links to that client
Wednesday: you're coding the feature they requested

You never explained the requirements. The brain read the email, attended the meeting, and connected the dots.

The compound interest of AI context.

## Tweet 8 (Setup)
Setup is three commands:

claude plugin add TechIntegrationLabs/bizbrain-os-plugin
npm install -g @bizbrain/gwcli
gwcli auth login

Browser automation works out of the box. Playwright MCP is included and enabled by default.

Install once. Compound forever.

## Tweet 9 (What's next)
What's next:
- Slack integration with entity linking
- GitHub deep integration (issues, PRs, discussions)
- More local-first free alternatives to expensive SaaS
- Multi-brain sync for teams

Your AI stops being a tool and starts being a colleague who remembers everything.

## Tweet 10 (CTA)
BizBrain OS is free and open source (AGPL-3.0). Runs entirely on your machine. No servers, no subscriptions.

GitHub: github.com/TechIntegrationLabs/bizbrain-os-plugin
Discord: discord.gg/ph9D5gSgW3

Star it, try it, break it, tell us what to build next.
