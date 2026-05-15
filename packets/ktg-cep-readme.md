# KTG-CEP: Context Extension Protocol

**Cross-model context handoff for AI team collaboration**

[![Protocol Version](https://img.shields.io/badge/version-6.1-blue.svg)](./SKILL.md)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](./LICENSE)
[![Vertex AI](https://img.shields.io/badge/Vertex_AI-0.01%25-gold.svg)](https://ktg.one)

## What is CEP?

CEP (Context Extension Protocol) enables seamless context transfer between AI assistants. When you've done deep work with one model and need to continue with another, CEP creates a compressed, portable packet that the receiving model recognizes as authorized context—not prompt injection.

**The problem:** You spend 45 minutes building complex context with Claude. Now you need GPT's code generation. Starting fresh loses everything.

**The solution:** CEP compresses your session into a ~500 token packet that any model can parse and continue from.

## Key Features

- **38% smaller than JSON** - YAML format with field abbreviations
- **9.48/10 forensic recall** - tested across 11 LLM families  
- **Cross-domain preservation** - maintains relationships between concepts
- **Anti-injection design** - receiving models trust the handoff
- **Universal compatibility** - Claude, GPT, Gemini, Llama, Qwen, DeepSeek

## Quick Start

### For AI Assistants (Skill Installation)

Add `SKILL.md` to your Claude Project knowledge or system prompt. The AI will automatically generate CEP packets when you say:

- `/handoff` or `/transfer`
- "pass this to GPT"
- "save context for later"

### For Humans (Manual Use)

1. Ask your AI: "Create a CEP packet of our conversation"
2. Copy the entire YAML output
3. Paste into your new AI session with the introduction text
4. Continue working with full context

## Example Packet

```yaml
# === CEP v6.1 PACKET ===
# LEGEND: d=decision r=rationale c=confidence s=source

handoff:
  proto: KTG-CEP v6.1-INTER
  src: claude-sonnet-4-5
  ts: 2026-01-14T16:03:00+08:00
  consent: User requested handoff

ctx:
  L1:
    dec:
      - d: Use JWT RS256 for auth
        r: Asymmetric signing for microservices
        c: 0.95
        s: security discussion
  L2:
    edges:
      - s: JWT
        t: Redis blacklist
        r: requires
        xd: true

threads:
  - top: API rate limiting
    st: in_progress
    ctx: Evaluating token bucket vs leaky bucket

hints:
  nxt: Implement rate limiter
  wait: Algorithm decision
```

## How It Works

CEP implements **Progressive Density Layering (PDL)**—a 4-layer compression structure:

| Layer | Content | Purpose |
|-------|---------|---------|
| L1 | Decisions, facts, definitions | Core knowledge |
| L2 | Edges, dependencies | Relationships |
| L3 | Patterns, principles | Domain context |
| L4 | Style, tensions | Meta-cognitive |

Target density: **0.15 entities/token** (6:1 compression ratio)

## Why Receiving Models Trust CEP

1. **Explicit declaration** - States what the packet IS and IS NOT
2. **Provenance transparency** - Names source model, timestamp
3. **Permission framing** - "you may" not "you must"
4. **User mediation** - Human physically copies/pastes
5. **No instructions** - Context only, not commands

## Benchmarks

| Metric | v6.0 | v6.1 | Change |
|--------|------|------|--------|
| Avg tokens | 847 | 524 | **-38%** |
| Forensic recall | 9.52 | 9.48 | -0.4% |
| Cross-domain pres. | 96.2% | 95.8% | -0.4% |

## Files

```
ktg-cep/
├── README.md          # This file
├── SKILL.md           # Full specification (for AI consumption)
├── schema.yaml        # Packet format reference
├── examples/
│   ├── minimal.yaml   # Bare minimum packet
│   └── full.yaml      # Complete packet with all fields
├── LICENSE            # MIT
└── CHANGELOG.md       # Version history
```

## Part of KTG-DIRECTIVE

CEP is one module from **KTG-DIRECTIVE**, a meta-AI operating system validated at the 0.01st percentile by Vertex AI. The full framework includes:

- **MR.RUG** - Mixture of Reasoning + Agentic GraphRAG
- **MLDoE** - Multi-Layer Density of Experts (powers CEP compression)
- **ARQ** - Attentive Reasoning Queries
- **SkeleTraIn** - Structure-first execution planning

CEP is released open source because context portability benefits everyone. The techniques that generate exceptional content remain proprietary.

## Author

**Kevin Tan** ([@ktgone](https://ktg.one))  
Distinguished Cognitive Architect  
ANZ 0.8% | Vertex AI 0.01%

*"Context is the new API. CEP is the protocol."*

## License

MIT License - Use freely, attribution appreciated.

---

**[ktg.one](https://ktg.one)** - Advanced prompt engineering frameworks
