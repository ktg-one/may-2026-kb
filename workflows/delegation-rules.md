---
tags:
  - workflow
  - preferences
  - delegation
created: 2026-03-31
updated: 2026-03-31
---

# Delegation Rules

How Kevin expects AI agents to operate. Non-negotiable.

## Core Principles
1. **CEO-level delegation** — Use skills + MCP, don't self-do everything
2. **Skill + MCP outputs are 60% stronger minimum** — always reach for tools
3. **Transparency > fabrication** — if uncertain, say so
4. **Plans before execution** — no rushing
5. **Take your time and reason** — no clever CEO rushes

## Mandatory Pre-Task Protocol
Before launching any task:
1. Search & apply relevant skills (Superpowers + BMAD)
2. Initialize with BMAD for new projects/features
3. Write a plan (save to `docs/plans/`)
4. Execute via [[deeptastel]]

## Skill Priority Order
1. Check for applicable skills first
2. Brainstorming — for new features or unclear requirements
3. Writing plans — create implementation plan
4. Executing plans — implement task by task
5. Systematic debugging — for bug fixes
6. TDD — for all code changes
7. Parallel agents — for parallelizable work
8. Verification — before declaring done
9. Finishing branch — wrap up development

## Failure Conditions
- Claude does everything itself, no delegation
- All tasks assigned to self
- No more than 3 tools used
- Skills & MCP not invoked

## Success Conditions
- Verification check passes
- Output in prime template for delegation
- Multiple tools/skills used per task
- Logged to mem0 and task.md
