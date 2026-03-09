---
title: "My 3 AI Brain Agents Were Working Alone. Now They Have a Conductor."
published: false
description: "BizBrain OS v3.0.2 adds Brain Swarm — an orchestration layer that coordinates independent brain agents with an event queue, staging validation, conflict detection, changelog audit trail, and smart model routing. Here's the architecture."
tags: claudecode, ai, opensource, architecture
cover_image: https://raw.githubusercontent.com/TechIntegrationLabs/bizbrain-os-plugin/main/assets/bizbrain-architecture-demo.jpg
---

Every AI session, my 3 brain agents were working alone. Now they have a conductor.

I've been building [BizBrain OS](https://github.com/TechIntegrationLabs/bizbrain-os-plugin), an open-source Claude Code plugin that builds a persistent knowledge brain from your work. Over the last few releases, I added three background agents — an entity watchdog that tracks clients and contacts, a brain learner that captures decisions and patterns, and a gateway that gives every repo full brain access.

They worked. But they worked *independently*. And independent agents modifying the same knowledge base is a problem I ignored for too long.

## The Problem: Three Writers, No Editor

Here's what was actually happening in production:

**Race conditions.** The entity-watchdog detects "Sarah from Acme" in a conversation and updates her contact record. Simultaneously, the brain-learner captures a session summary that also mentions Sarah's new role. Two agents, same file, last write wins. One update disappears.

**No audit trail.** My brain folder is 400+ files of Markdown and JSON. When something changes, I have no way to answer: *What changed? When? Why? Which agent did it?* I'm trusting three independent processes to modify my business knowledge correctly, with no paper trail.

**Implicit invocation.** The agents fire based on pattern matching in the SessionStart context injection. "If you detect an entity mention, invoke the watchdog." This works surprisingly well — until it doesn't. Sometimes Claude invokes two agents on the same trigger. Sometimes it invokes none. The orchestration logic lives in a prompt, not in a system.

**No cost awareness.** Every agent invocation spawns a subagent. Three agents per session, each using sonnet-class models even for trivial tasks like "log this timestamp." My agent operations were burning tokens on work that a smaller model could handle in 100ms.

I lived with all of this for about two months. The brain was still net positive — compounding context is powerful enough to paper over coordination failures. But the failure rate was growing with the brain's complexity. More files meant more conflicts. More agents meant more implicit invocation bugs.

The answer wasn't more agents. It was orchestration.

## Brain Swarm: The Architecture

v3.0.2 adds a fourth agent — the **brain-orchestrator** — and a supporting infrastructure layer I'm calling Brain Swarm. The orchestrator doesn't do entity detection or learning itself. It coordinates the agents that do.

Here's the flow:

```
User Session
    |
    v
PostToolUse Hook
    |
    v
Event Queue (.bizbrain/events/)
    |
    v
Brain Orchestrator
    |
    +---> Entity Watchdog ---> Staging Area
    +---> Brain Learner -----> Staging Area
    +---> Brain Gateway -----> Staging Area
                                   |
                                   v
                              Validation
                                   |
                                   v
                              Brain Files
                                   |
                                   v
                              Changelog
```

Six components make this work.

### 1. Event Queue

Every tool use in your Claude Code session generates a structured event via the PostToolUse hook:

```json
{
  "id": "evt_a3f8c912",
  "type": "entity_mention",
  "timestamp": "2026-03-01T14:23:07Z",
  "source": "post-tool-use",
  "data": {
    "entity": "Acme Corp",
    "context": "Sarah mentioned the new pricing model needs review",
    "file": "src/api/pricing.ts"
  },
  "processed": false
}
```

Events go to `.bizbrain/events/` as individual JSON files, named `{timestamp}-{type}-{id}.json`. The orchestrator processes them in chronological order. This is the key architectural change: agents no longer fire directly from prompt-based pattern matching. They fire from a queue.

### 2. Staging Area

Before Brain Swarm, agents wrote directly to brain files. Now they write proposals:

```json
{
  "id": "stg_7b2e4f01",
  "agent": "entity-watchdog",
  "action": "update",
  "target_path": "Entities/Clients/Acme/_context/contacts.md",
  "content": "## Sarah Chen\n- **Role:** VP of Product (updated from PM)\n- **Email:** sarah@acme.com",
  "reason": "User conversation mentioned Sarah's promotion to VP",
  "urgency": "normal"
}
```

Proposals sit in `staging/` until the orchestrator validates them. This is the single most important change in v3.0.2. It transforms brain modifications from fire-and-forget to propose-validate-apply.

### 3. Conflict Detection

The validation step checks whether two proposals target the same file. If they do:

```
staging/
  conflicts/
    stg_7b2e4f01.json  # watchdog wants to update contacts.md
    stg_9d4a1c83.json  # learner also wants to update contacts.md
```

Both proposals are moved to `staging/conflicts/` and flagged for the user. Run `/swarm conflicts` to see them and choose which to apply, merge, or discard. No more silent last-write-wins.

### 4. Changelog Audit Trail

Every brain change — applied, discarded, or conflicted — gets a changelog entry:

```markdown
## 14:23:12 — [entity-watchdog] update Entities/Clients/Acme/_context/contacts.md
- **What:** Updated Sarah Chen's role from PM to VP of Product
- **Why:** User conversation mentioned Sarah's promotion
- **Source:** evt_a3f8c912
```

Daily changelog files live in `.bizbrain/changelog/{YYYY-MM-DD}.md`. Run `/swarm changelog` to see them. After two months of "what changed in my brain?" anxiety, having a complete audit trail is a genuine relief.

### 5. Workflow Pattern Learning

The orchestrator observes sequences of successful agent operations and records them as patterns:

```json
{
  "trigger": "entity_mention + decision",
  "sequence": ["entity-watchdog", "brain-learner"],
  "confidence": 0.85,
  "times_used": 12
}
```

When a new event matches a known pattern (confidence > 0.7), the orchestrator replays the full sequence automatically instead of routing each event individually. Patterns that never fire lose confidence over time and eventually drop out.

This is the compound interest layer on top of the compound interest layer. The brain learns your business. The swarm learns how to maintain the brain.

### 6. Smart Model Routing

Not every agent task needs a sonnet-class model. The orchestrator routes by task complexity:

| Task | Agent | Model | Why |
|------|-------|-------|-----|
| Entity detection | entity-watchdog | haiku | Pattern matching — fast, cheap |
| Decision logging | brain-learner | haiku | Structured extraction |
| Session summary | brain-learner | haiku | Concise summarization |
| Conflict resolution | brain-orchestrator | haiku | Rule-based validation |
| Complex brain operations | brain-gateway | sonnet | Needs full reasoning |

In my testing, this cuts agent operation costs by 40-60%. Most brain maintenance is mechanical — detect a pattern, extract structured data, write to a file. That's haiku territory. Sonnet is reserved for tasks that actually require complex reasoning.

## Before and After

| | Before (v3.0.1) | After (v3.0.2) |
|---|---|---|
| **Agent coordination** | Implicit (prompt-based) | Explicit (event queue + orchestrator) |
| **Brain modifications** | Direct writes | Staged proposals with validation |
| **Conflict handling** | Last write wins (silent data loss) | Detected, flagged, user-resolved |
| **Audit trail** | None | Full changelog with what/why/source |
| **Model usage** | All sonnet | Routed by task complexity (haiku/sonnet) |
| **Agent sequences** | Ad hoc | Learned patterns, auto-replayed |
| **Observability** | None | `/swarm status` — queue depth, conflicts, recent changes |

## Enable It

Brain Swarm is opt-in. When disabled, all agents work exactly as they did in v3.0.1 — zero behavior change.

To enable, add one line to your brain config:

```json
// ~/bizbrain-os/brain/config.json
{
  "features": {
    "orchestration": true
  }
}
```

Then check status:

```
/swarm              # Queue depth, pending proposals, conflicts, recent changes
/swarm process      # Manually drain the event queue
/swarm conflicts    # View and resolve any staging conflicts
/swarm changelog    # Browse the audit trail
/swarm patterns     # See what workflow patterns the system has learned
```

## Install BizBrain OS

If you're new to BizBrain OS — it's a free, open-source (AGPL-3.0) Claude Code plugin. 17 skills, 14 commands, 4 agents, 5 role-based profiles. Everything runs locally. Your data never leaves your machine.

```bash
claude plugin marketplace add TechIntegrationLabs/bizbrain-os-plugin
claude plugin install bizbrain-os
```

Then start Claude Code and run `/brain setup`.

## What's Next

Brain Swarm is the foundation for something bigger. Once your agents are coordinated through an event queue with validated staging and learned patterns, you can start asking harder questions:

**Cross-session orchestration.** Right now, the event queue drains within a session. But events could persist across sessions — the orchestrator picks up where it left off, processing overnight observations or deferred decisions.

**Agent-to-agent communication.** Currently, agents only communicate through the shared staging area. Direct agent messaging would enable coordination patterns like "watchdog detects new entity, learner immediately researches their company, gateway updates all project contexts."

**Community patterns.** Workflow patterns are learned locally today. But if users could share proven patterns (anonymized, opt-in), a new BizBrain OS install could start with the community's best orchestration sequences instead of learning from scratch.

The thesis hasn't changed: your AI context layer will be your most valuable digital asset. Brain Swarm just makes sure the agents building that asset aren't stepping on each other.

---

*BizBrain OS — the compound interest of AI context.*

**GitHub:** [TechIntegrationLabs/bizbrain-os-plugin](https://github.com/TechIntegrationLabs/bizbrain-os-plugin)
**Discord:** [https://discord.gg/XZCDttmw](https://discord.gg/XZCDttmw)
