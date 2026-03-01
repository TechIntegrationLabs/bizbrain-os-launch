# I Replaced Otter.ai With 200 Lines of Python in My Claude Code Plugin

**TL;DR:** I built a local meeting transcription system that captures system audio via WASAPI loopback, transcribes with faster-whisper, and feeds everything into my AI knowledge brain — for $0/month, 100% private. Here's how.

---

## The Problem

I pay $20/month for Otter.ai. It works well enough — joins my Zoom calls, transcribes them, gives me summaries. But three things bother me:

1. **It only works with specific platforms.** Otter has Zoom/Meet/Teams bots. If I'm on a Discord call, Slack huddle, or some niche platform? Out of luck.
2. **My meeting data lives on someone else's server.** Client conversations, pricing discussions, strategy calls — all in Otter's cloud.
3. **The transcription is isolated.** Otter gives me text, but it doesn't know my clients, my projects, or my action items. I still manually extract all that.

So I built something better.

## The Insight: System Audio Capture

Here's the key realization that makes this work: **you don't need platform-specific bots.** Every meeting app — Zoom, Meet, Teams, Slack, Discord — ultimately sends audio through your system's speakers or headphones.

On Windows, WASAPI (Windows Audio Session API) provides a **loopback capture** mode that records whatever is playing through the default audio output device. This is the same approach that tools like OBS use for "desktop audio" capture.

```python
# Find the WASAPI loopback device
wasapi_info = pa.get_host_api_info_by_type(pyaudio.paWASAPI)
default_output = pa.get_device_info_by_index(wasapi_info["defaultOutputDevice"])

# Find matching loopback device
for i in range(pa.get_device_count()):
    device = pa.get_device_info_by_index(i)
    if device.get("isLoopbackDevice", False):
        # This captures system audio output
        return device
```

**One capture method. Every platform. Zero integrations.**

## The Architecture

The system has five stages:

```
Meeting App (any)
    ↓
WASAPI Loopback (system audio capture)
    ↓
5-min WAV chunks (16kHz mono)
    ↓
faster-whisper (local Whisper, CTranslate2)
    ↓
BizBrain OS Brain
  ├── Markdown transcript
  ├── JSON metadata sidecar
  └── Intake summary → entity linking + action items
```

### 1. Meeting Detection

A lightweight daemon polls running processes every 5 seconds looking for meeting apps:

```python
MEETING_PATTERNS = [
    (r"zoom\.exe", "zoom", r"zoom meeting"),
    (r"slack\.exe", "slack", r"huddle|slack call"),
    (r"teams\.exe", "teams", r"meeting|call"),
    (r"discord\.exe", "discord", r"voice connected"),
    # Browser-based meetings via window title
    (r"chrome\.exe|msedge\.exe", "meet", r"meet\.google\.com"),
]
```

For native apps, just checking if the process is running is enough. For browser-based meetings (Google Meet, Teams web), we check window titles via Win32 API.

### 2. Chunked Recording

Audio is recorded in 5-minute chunks instead of one massive file. This:
- Prevents memory issues in long meetings
- Enables incremental transcription (transcribe while still recording)
- Keeps individual file sizes manageable (~9.6MB per chunk at 16kHz mono)

```python
class LoopbackRecorder:
    def __init__(self, output_dir, chunk_seconds=300):
        self.chunk_seconds = chunk_seconds
        # Records to WAV, auto-converts to 16kHz mono
```

### 3. Local Transcription

[faster-whisper](https://github.com/SYSTRAN/faster-whisper) is a CTranslate2 reimplementation of OpenAI's Whisper. It runs 4x faster than the original with the same accuracy. The `base` model is only ~150MB and handles English meetings well.

```python
transcriber = WhisperTranscriber(model_size="base")
segments = transcriber.transcribe_chunks(chunk_paths)
# Returns timestamped segments with text
```

VAD (Voice Activity Detection) filtering is enabled by default, so silence is automatically skipped — no wasted processing.

### 4. Optional Speaker Diarization

If you install the optional `pyannote-audio` dependency, the system can identify individual speakers. This requires a HuggingFace token but still runs entirely locally.

### 5. Brain Integration (The 10x Multiplier)

This is where it gets interesting. Raw transcription is table stakes — every tool does that. The real value is what happens after:

```markdown
# Meeting Transcript — Client Sync with Acme Corp

**Platform:** zoom
**Date:** 2026-02-28
**Duration:** 45 minutes

---

## Transcript

[00:00] Welcome everyone. Let's start with the API status.
[00:15] The refactor is on track, we should have it deployed by Friday.
[02:30] Sarah mentioned the new pricing model needs review...
```

The transcript is saved to the brain's meetings folder, but a **summary is also dropped to the intake system**. The intake processor then:

- **Links entity mentions** — "Acme Corp" matches a known client
- **Extracts action items** — "deployed by Friday" becomes a todo
- **Updates project status** — discussion about the API refactor updates the project tracker

One meeting transcript, zero manual work.

## How to Use It

The transcriber is packaged as a standalone Python tool inside the BizBrain OS Claude Code plugin:

```bash
# Install (one-time)
cd ~/.claude/plugins/bizbrain-os/tools/meeting-transcriber
uv pip install -e .

# Start the daemon before your meeting
/meetings start

# Check status during the meeting
/meetings status

# View transcripts after
/meetings list
/meetings 2026-02-28-client-sync

# Stop when done
/meetings stop
```

## Cost Comparison

| | Otter.ai | BizBrain Meetings |
|---|---|---|
| **Monthly cost** | $20/user | $0 |
| **Platforms** | Zoom, Meet, Teams (bot-based) | Any audio source |
| **Privacy** | Cloud processing | 100% local |
| **Integration** | Standalone | Brain-native (entities, actions, intake) |
| **Speaker ID** | Yes | Optional (pyannote) |
| **Storage** | Their cloud | Your machine |

## The Bigger Picture: Local-First Free Alternatives

This meeting transcriber is the first in a series of "Local-First Free Alternatives" built into BizBrain OS. The pattern:

1. **Identify** an expensive SaaS tool everyone uses
2. **Find** the open-source local equivalent of the hard part
3. **Build** the glue between the local tool and the brain
4. **Integrate** so the brain's entity/project/todo systems multiply the value

Meeting transcription was the perfect first target: Whisper made the hard part free, WASAPI made it platform-agnostic, and brain integration made it 10x more useful than a standalone transcription service.

What's next? Local CRM, local analytics, local email automation — all compound with the brain.

## Try It

BizBrain OS is a free, open-source Claude Code plugin:

```bash
claude plugin marketplace add TechIntegrationLabs/bizbrain-os-plugin
claude plugin install bizbrain-os
/brain setup
```

The meeting transcriber is available in v3.0.1. Enable it in your brain config or use the consultant/agency profile.

---

*BizBrain OS — the compound interest of AI context.*

**GitHub:** [TechIntegrationLabs/bizbrain-os-plugin](https://github.com/TechIntegrationLabs/bizbrain-os-plugin)
