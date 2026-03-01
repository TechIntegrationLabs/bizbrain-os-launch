# Reddit Post — r/ClaudeAI

## Title
Added local meeting transcription to my Claude Code plugin — replaces Otter.ai for $0/month

## Body

I've been building [BizBrain OS](https://github.com/TechIntegrationLabs/bizbrain-os-plugin), a Claude Code plugin that creates a persistent knowledge brain from your work. Just shipped v3.0.1 with a feature I'm pretty excited about: **local meeting transcription**.

### What it does

A Python daemon captures system audio via WASAPI loopback (records what plays through your speakers/headphones), transcribes it locally with faster-whisper, and saves brain-compatible transcripts. The transcripts then feed into the brain's intake system for entity linking and action item extraction.

### Why WASAPI loopback instead of a meeting bot?

Otter.ai and Fireflies build platform-specific bots — Zoom bot, Meet bot, Teams bot. That's a lot of moving parts and limits you to supported platforms.

WASAPI loopback captures system audio output regardless of source. Zoom, Meet, Teams, Slack, Discord, WebRTC, whatever — if audio plays through your speakers, it gets captured. One method, every platform.

### What makes it different from just running Whisper manually

Two things:

1. **Automated daemon:** Detects when you're in a meeting (process/window monitoring), auto-starts recording, auto-stops when the meeting ends, auto-transcribes, auto-cleans up old audio. You just run `/meetings start` before your meeting day.

2. **Brain integration:** The transcript doesn't just sit in a folder. It goes through the brain's intake system — client names get linked to entity records, "we need to deploy by Friday" becomes an action item, project status gets updated. The brain makes the raw transcript 10x more useful.

### Quick details

- **Cost:** $0/month (all local, no API keys)
- **Models:** faster-whisper base (~150MB) through large-v3 (~3GB)
- **Privacy:** Audio and transcripts never leave your machine
- **Speaker ID:** Optional via pyannote-audio
- **Cleanup:** Raw audio auto-deleted after 7 days, transcripts kept permanently

### How to use

```
claude plugin install bizbrain-os
/brain setup
/meetings start   # before your meeting
/meetings list    # after
```

The meeting transcriber needs Python 3.10+ and runs on Windows (WASAPI is Windows-specific). Cross-platform audio capture is on the roadmap.

### Source

All code is in the plugin repo: [TechIntegrationLabs/bizbrain-os-plugin](https://github.com/TechIntegrationLabs/bizbrain-os-plugin) under `tools/meeting-transcriber/`.

This is the first of what I'm calling "Local-First Free Alternatives" — replacing expensive SaaS tools with local implementations that integrate with the brain. Meeting transcription was the perfect starting point because Whisper made the hard part free.

Happy to answer questions about the implementation.
