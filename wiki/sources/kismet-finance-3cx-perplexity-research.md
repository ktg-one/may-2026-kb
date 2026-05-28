---
title: Source — KFG 3CX Google Workspace Research
type: source-summary
tags: [source, 3cx, google-workspace, research, kismet]
status: active
revenue_impact: high
sources:
  - sources/clients/kismet-finance/3cx-perplexity-research.md
last_updated: 2026-05-26
review_needed: false
---

# Source — KFG 3CX Google Workspace Research

**Original:** `sources/clients/kismet-finance/3cx-perplexity-research.md`  
**Type:** Technical research, Markdown text, 4 KB  
**Date origin:** May 2026  

## What it is

Comprehensive Perplexity AI technical research and validation audit of the Google Workspace integration process on the **3CX v20 PBX system**. It compares legacy configuration procedures with live official docs (last updated 19 Feb 2025) and highlights crucial DWD requirements.

## Why it's in the wiki

Provides the immutable technical logic supporting the compiled guide `[[wiki/clients/kismet-finance-3cx-integration]]`. It resolves common community integration traps, specifically:
- Correcting the legacy *integrations.3cx.com* OAuth wizard flow.
- Detailing the manual Domain-wide Delegation (DWD) client ID registration required to prevent silent contact sync failure.

## Connections

- `[[wiki/clients/kismet-finance]]` — client CRM and Voice Assistant owner.
- `[[wiki/clients/kismet-finance-3cx-integration]]` — the compiled, production-ready integration runbook.
- `[[wiki/projects/gws-cli]]` — Google Workspace API CLI project.

## Review items

- [ ] Verify that KFG's live 3CX PBX system is updated to **V20 U5** or higher.
- [ ] Audit KFG's Google Admin Console to ensure Domain-wide Delegation has been authorized with all four required Google API scopes (`directory.user.readonly`, `directory.group.readonly`, `contacts`, `calendar`).
