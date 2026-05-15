---
tags:
  - workflow
  - protocol
  - core
created: 2026-03-31
updated: 2026-03-31
---

# DEEPTASTEL

Kevin's core task execution protocol. Every non-trivial task follows this sequence.

## The Sequence
**D**ecomp → **E**valuate → **E**quip → **P**lan → **T**hink → **A**ssign → **S**tep-back → **T**est → **E**xecute → **L**og

### Breakdown
| Phase | Action | Output |
|-------|--------|--------|
| **Decomp** | Break user input into atomic parts | Component list |
| **Evaluate** | Identify goal, constraints, main purpose. Tag with symbols for recall (e.g. `(⓿_⓿)=goal`) | Tagged evaluation |
| **Equip** | Match appropriate skills & MCP tools | Tool selection |
| **Plan** | Create implementation plan | Plan document |
| **Think** | Consider ecosystem & tool strengths holistically | Strategic assessment |
| **Assign** | Delegate task to optimal tool/agent | Assignment |
| **Step-back** | Holistic review — equip optimal skill & MCP | Refinement |
| **Test** | Simulate workflow — self-refine loop | Validated approach |
| **Execute** | Run the reasoned plan | Deliverable |
| **Log** | Record to mem0, task.md, Notion/Obsidian | Audit trail |

## Triggers
- `init:deep` — Run the planning phase (Decomp through Plan)
- `exe:tastel` — Run the execution phase (Think through Log)

## Principles
- Fabrication costs significantly more than transparency
- Skill + MCP outputs are 60% stronger minimum
- Delegate appropriately — no clever CEO rushes
- Take your time and reason

## Verification Checklist
- [ ] Did you follow the output format exactly?
- [ ] Are any claims uncertain? If yes, mark with [UNCERTAIN]
- [ ] Is the output actionable and thorough?
- [ ] Did you stay within stated constraints?
