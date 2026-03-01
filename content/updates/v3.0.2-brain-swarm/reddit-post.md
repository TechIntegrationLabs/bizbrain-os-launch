# Reddit Post — r/ClaudeAI

## Title
I built an orchestration layer for my Claude Code brain agents — here's how it works

## Body

I've been building [BizBrain OS](https://github.com/TechIntegrationLabs/bizbrain-os-plugin), a Claude Code plugin that creates a persistent knowledge brain from your work. Just shipped v3.0.2 "Brain Swarm" which adds multi-agent orchestration, and I wanted to walk through the architecture because I think the patterns are broadly useful.

### The problem

BizBrain OS has multiple agents — an entity watchdog that tracks mentions of clients/partners, a brain gateway for operations, a brain learner that improves over time. They all read and write to the same brain (a structured folder of markdown and JSON files).

This works fine when one agent runs at a time. But as soon as you have concurrent operations — or even sequential ones that don't know about each other — things get messy. Agent A updates a client's contact info while Agent B is rewriting the same file with status updates. Whoever writes last wins. No merge, no warning.

I needed the equivalent of a database transaction layer, but for a folder of files.

### The solution: event queue + staging area + orchestrator

Three pieces:

**1. Event Queue**

Every tool use now emits a structured event before anything touches the filesystem:

```json
{
  "id": "evt_20260301_103000_001",
  "type": "brain-write",
  "agent": "entity-watchdog",
  "target": "Clients/Acme/_context/contacts.md",
  "operation": "append",
  "timestamp": "2026-03-01T10:30:00Z",
  "status": "pending",
  "priority": "normal"
}
```

The orchestrator consumes events from the queue and decides execution order. Events can be held, reordered, or rejected.

**2. Staging Area**

Instead of writing directly, agents submit proposals:

```json
{
  "id": "prop_20260301_103000_001",
  "proposedBy": "entity-watchdog",
  "target": "Clients/Acme/_context/contacts.md",
  "operation": "append",
  "content": "## New Contact\n- Email: ceo@acme.com (detected 2026-03-01)",
  "reason": "CEO email mentioned in conversation with Acme team",
  "validation": {
    "status": "passed",
    "targetExists": true,
    "schemaValid": true,
    "conflicts": []
  }
}
```

The orchestrator validates the proposal (does the target file exist? is the content well-formed? are there conflicts with other pending proposals?), then either commits it or rejects it with a reason.

**3. Conflict Detection**

When two proposals target the same file, the orchestrator has three strategies:

- **Merge**: If the operations are compatible (e.g., two appends to different sections), merge them into a single write.
- **Queue**: If they conflict, hold the lower-priority one until the first commits, then re-validate.
- **Reject**: If they're fundamentally incompatible, reject the lower-priority proposal and notify the agent.

This is simple compared to git merge, but it handles the 90% case for brain files.

### Changelog audit trail

Every committed change gets a changelog entry:

```
[2026-03-01 10:30:15] entity-watchdog → Clients/Acme/_context/contacts.md
  Operation: append
  Reason: CEO email mentioned in conversation
  Previous: (285 bytes)
  Added: "## New Contact\n- Email: ceo@acme.com"
  Proposal: prop_20260301_103000_001
```

Full attribution, full history, full rollback capability. I can answer "who changed this client record and why" for any field at any point in time.

### Smart model routing

This was a side benefit I didn't plan for. Once you have an orchestrator that sees every operation, you can route operations to different models based on complexity:

| Operation | Model | Why |
|-----------|-------|-----|
| Update contact field | Haiku | Structured, low complexity |
| Append to history log | Haiku | Simple append |
| Extract action items | Sonnet | Requires understanding |
| Resolve conflicts | Sonnet | Needs judgment |
| Workflow learning | Sonnet | Pattern recognition |

In practice, ~60% of brain operations are simple enough for Haiku. That's a 40-60% cost reduction on brain-related operations with no measurable quality drop on the tasks that matter.

### What it doesn't do

Being honest about limitations:

- **Not a database.** This is file-level coordination, not row-level locking. It works because brain files are relatively coarse-grained (one file per entity context type).
- **Not distributed.** Single machine, single brain. This isn't solving distributed consensus.
- **Not real-time.** The event queue introduces latency. A direct write is faster than a proposal-validate-commit cycle. The tradeoff is correctness.
- **Conflict resolution is simple.** Merge strategies are basic. For genuinely complex conflicts, it punts to the user.

### The /swarm command

New in v3.0.2: `/swarm` activates the brain-orchestrator agent, which manages the event queue and processes proposals. You can also run individual operations through it:

```
/swarm                    # Activate orchestrator
/swarm status             # Show queue and pending proposals
/swarm history            # Recent changelog
```

### Numbers

v3.0.2 brings the totals to:
- 17 skills
- 14 commands
- 4 agents (new: brain-orchestrator)
- 5 profiles (developer, content-creator, consultant, agency, personal)

### Install

```
claude plugin marketplace add TechIntegrationLabs/bizbrain-os-plugin
/brain setup
```

Open source, AGPL-3.0, free, local-first. All code is in the repo: [TechIntegrationLabs/bizbrain-os-plugin](https://github.com/TechIntegrationLabs/bizbrain-os-plugin)

Happy to answer questions about the orchestration patterns or the implementation. The event queue / staging area pattern is something I think more agent frameworks will need as multi-agent setups become common.
