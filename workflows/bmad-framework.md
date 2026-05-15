---
tags:
  - workflow
  - bmad
  - framework
created: 2026-03-31
updated: 2026-03-31
---

# BMAD Framework

Build Measure Analyze Deliver — project orchestration framework for structured delivery.

## Phases & Skills

### Analysis
| Skill | Purpose |
|-------|---------|
| bmad-bmm-create-product-brief | Product brief creation |
| bmad-bmm-domain-research | Domain research |
| bmad-bmm-market-research | Market research |
| bmad-bmm-technical-research | Technical research |

### Planning
| Skill | Purpose |
|-------|---------|
| bmad-bmm-create-prd | Product Requirements Document |
| bmad-bmm-edit-prd | Edit PRD |
| bmad-bmm-validate-prd | Validate PRD |
| bmad-bmm-create-ux-design | UX design |

### Solutioning
| Skill | Purpose |
|-------|---------|
| bmad-bmm-create-architecture | Architecture design |
| bmad-bmm-create-epics-and-stories | Epic & story breakdown |
| bmad-bmm-check-implementation-readiness | Readiness check |

### Implementation
| Skill | Purpose |
|-------|---------|
| bmad-bmm-create-story | Story creation |
| bmad-bmm-dev-story | Development execution |
| bmad-bmm-quick-spec | Quick specification |
| bmad-bmm-quick-dev | Quick development |
| bmad-bmm-code-review | Code review |
| bmad-bmm-sprint-planning | Sprint planning |
| bmad-bmm-sprint-status | Sprint status |

### Quality
| Skill | Purpose |
|-------|---------|
| bmad-bmm-qa | Quality assurance |
| bmad-tea-testarch-atdd | ATDD testing |
| bmad-tea-testarch-automate | Test automation |
| bmad-tea-testarch-test-review | Test review |

## Workflow
For new projects/features:
`create-product-brief` → `create-prd` → `create-architecture` → `create-epics-and-stories` → `sprint-planning` → `dev-story`

For quick changes:
`quick-spec` → `quick-dev`

## Config
- BMAD core: `_bmad/core/` (projects root)
- BMAD config: `_bmad/_config/`
- BMAD output: `_bmad-output/`
