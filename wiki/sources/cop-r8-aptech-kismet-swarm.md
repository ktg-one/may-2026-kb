---
title: Source — Context Packet R8 (AP Tech + Kismet Swarm)
type: source-summary
tags: [source, context-packet, cop, aptech, kismet]
status: archived
revenue_impact: low
sources:
  - sources/packets/05122026-COP-R8-aptech-kismet-swarm.md
last_updated: 2026-05-25
---

# Source — Context Packet R8

**Original:** `sources/packets/05122026-COP-R8-aptech-kismet-swarm.md`
**Date:** 2026-05-12
**Model:** COP / Opus 4.6
**Version:** context-v15
**Scoring:** R 8 / K 8 / Q 8.5 / D 12

## What it is

A session-handoff context packet using the 4-layer Japanese compression pattern (L1 entities, L2 bridging, L3 rejected/constraints, L4 meta). Designed for the next session to *rebuild* cognitive state rather than read a summary.

## Why it's in sources/packets/ not wiki/

Context packets are session-bridging artifacts, not compiled knowledge. They live in `sources/packets/` and are referenced only when reconstructing state.

## Connections

- `[[wiki/clients/kismet-finance]]` — primary subject
- `[[wiki/clients/ap-tech]]` — primary subject (verify page exists)
- Sibling packets in `sources/packets/` — R6, R7, R7-10, R8

## Review items

- Verify `wiki/clients/ap-tech.md` exists; create if not (Review item R7).
