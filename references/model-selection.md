# AI Agents — Model Selection Guide

**Document:** ai-agents/model-selection.md
**KB Version:** 2.0
**Last Updated:** 2026-02-27
**Source:** CLAUDE.md, AGENTS.md, STRUCTURED_AGENTS_KB.md, business-context/overview.md

---

## Purpose

This document defines which AI model or agent to use for specific task types within the Kismet Finance Group ecosystem. Selecting the wrong agent wastes tokens, increases latency, or produces lower-quality output. Read this before dispatching any AI task.

---

## Agent Roster Overview

| Agent | Model | Role | Status |
|-------|-------|------|--------|
| Claude Code (Sonnet 4.6) | claude-sonnet-4-6 | Primary orchestrator | Active |
| Claude Code (Opus 4.6) | claude-opus-4-6 | Deep reasoning orchestrator | Active (expensive) |
| Gemini CLI | Gemini 2.x | Web search, large context | Active |
| Codex CLI | OpenAI Codex | Code editing, file manipulation | Active |
| Jules | Google Jules | Async GitHub tasks | Active |
| OpenCode | Various | Coding agent | Active |
| Vertex AI Agent | Gemini (GCP) | Voice, RAG, transcription | Planned (Phase 3) |

---

## Claude Code — Sonnet 4.6

**Model ID:** `claude-sonnet-4-6`
**Role:** Primary orchestrator for all complex, multi-step tasks

### Strengths
- Multi-file codebase reasoning and understanding
- Complex planning with structured execution (BMAD, plans)
- Notion API interactions requiring semantic understanding
- Writing and editing documentation with high accuracy
- Tool-use orchestration (MCP servers, parallel agents)
- Memory management (mem0 sign-in/out, task tracking)
- Interpreting ambiguous requirements and asking clarifying questions
- Long-horizon task execution with verification checkpoints

### Weaknesses
- Not ideal for real-time web search (use Gemini CLI)
- Context window has limits — very large codebases may require chunking
- More expensive per token than smaller models

### Cost Consideration
Mid-tier cost. Use for tasks that require genuine reasoning, planning, or multi-step orchestration. Do not use for simple data lookups or format conversions.

### Primary Dispatch Patterns
```
Complex KB tasks          → Claude Sonnet 4.6 (orchestrator)
Notion CRM updates        → Claude Sonnet 4.6 (via Notion MCP)
n8n workflow debugging    → Claude Sonnet 4.6 (via n8n MCP)
Multi-file code changes   → Claude Sonnet 4.6 (with Codex assist)
Task planning + execution → Claude Sonnet 4.6 (BMAD + superpowers)
```

---

## Claude Code — Opus 4.6

**Model ID:** `claude-opus-4-6`
**Role:** Deep reasoning for complex architectural or strategic decisions

### Strengths
- All Sonnet 4.6 strengths, amplified
- Superior performance on highly ambiguous or complex reasoning
- Best for architecture design, PRD creation, deep code review
- Produces the highest-quality output for strategic documents

### Weaknesses
- Most expensive model in the roster — significant cost per task
- Slower than Sonnet 4.6

### Cost Consideration
High cost. Reserve for tasks where output quality is critical and cannot be achieved by Sonnet 4.6. Do not use for routine tasks.

### Primary Dispatch Patterns
```
Architecture design       → Claude Opus 4.6
PRD / spec creation       → Claude Opus 4.6
Critical code review      → Claude Opus 4.6
Complex debugging         → Claude Opus 4.6 (when Sonnet fails)
```

---

## Gemini CLI

**Model:** Gemini 2.x (Flash/Pro)
**Role:** Parallel worker — web search, large context processing, data summarization

### Strengths
- Real-time web search (grounded in current information)
- Very large context window (up to 1M tokens in some configurations)
- Fast for summarization and extraction tasks
- Cost-effective for high-volume data processing
- Good at structured data extraction from large documents

### Weaknesses
- Less reliable for multi-step agentic tasks with tool use
- Does not maintain task state as reliably as Claude
- Not integrated with MCP servers in the same way as Claude Code
- Less precise for complex code changes

### Cost Consideration
Low-to-mid cost. Use freely for search, summarization, and large-context tasks.

### Primary Dispatch Patterns
```
Web research tasks            → Gemini CLI
Summarizing large documents   → Gemini CLI
Market / competitor research  → Gemini CLI
Processing large CSV/data     → Gemini CLI
Parallelizable analysis tasks → Gemini CLI (multiple instances)
```

---

## Codex CLI

**Model:** OpenAI Codex (via CLI)
**Role:** Parallel worker — deep code editing, automation scripts, file manipulation

### Strengths
- Strong at focused, precise code editing within a single file
- Excellent at generating automation scripts (Python, Bash, PowerShell)
- Works well for repetitive code transformations
- Can handle multiple small file edits in parallel

### Weaknesses
- Limited multi-file reasoning (worse than Claude for cross-file changes)
- Does not have access to MCP tools natively
- Requires clear, specific instructions — struggles with ambiguous tasks
- No memory persistence between sessions

### Cost Consideration
Mid-tier cost. Use for code-specific tasks where precision matters but full orchestration is not needed.

### Primary Dispatch Patterns
```
Single-file code edits        → Codex CLI
Script generation (Python)    → Codex CLI
Automation script creation    → Codex CLI
Parallel code transformations → Codex CLI (multiple instances)
```

---

## Jules (Google Jules)

**Model:** Google Jules
**Role:** Async GitHub task execution

### Strengths
- Designed for asynchronous GitHub-based tasks
- Can open PRs, review code, implement features without blocking the orchestrator
- Integrated with GitHub natively

### Weaknesses
- Async only — results are not immediate
- Limited to GitHub-connected workflows
- Not suitable for Notion/n8n tasks

### Cost Consideration
Use when GitHub-based async work needs to happen in parallel with other tasks.

### Primary Dispatch Patterns
```
GitHub PR creation      → Jules
GitHub code review      → Jules
Async branch work       → Jules
Background repo tasks   → Jules
```

---

## OpenCode

**Model:** Various (configurable)
**Role:** Coding agent with broader context

### Strengths
- Broad coding capabilities across languages
- Can be pointed at a codebase for interactive coding sessions
- Useful for exploratory coding tasks

### Weaknesses
- Less integrated into the Kismet ecosystem than Claude Code
- Does not have the MCP server connections configured by default

### Primary Dispatch Patterns
```
Exploratory coding tasks      → OpenCode
Language-specific work        → OpenCode
When Claude Code is occupied  → OpenCode as fallback
```

---

## Vertex AI Agent (Planned — Phase 3)

**Model:** Gemini (via GCP Vertex AI)
**Role:** Voice transcription, RAG retrieval, conversation agent

### Planned Capabilities
- Voice note transcription for field reps
- RAG over Notion documents and client records
- "Ask AI" button — pre-call client intel retrieval
- Post-call next-action suggestions

### Current Status
**Blocked** — Vertex AI tasks cannot be started until all Phase 2 tasks are complete. GCP organization access issue (requires boss/admin access to GCP project).

### Notes
- Do NOT begin Vertex AI configuration until the blocker is resolved and all prior-priority Kanban tasks are Done
- See Critical Rule #1 in index.md

---

## Decision Matrix

Use this matrix to select the right agent for a task:

| Task Type | Primary Agent | Secondary/Parallel |
|-----------|--------------|-------------------|
| Notion CRM read/write | Claude Sonnet 4.6 | — |
| n8n workflow build/debug | Claude Sonnet 4.6 | — |
| Documentation writing | Claude Sonnet 4.6 | — |
| KB file creation/update | Claude Sonnet 4.6 | — |
| Web research | Gemini CLI | — |
| Large document summarization | Gemini CLI | — |
| Script / automation writing | Codex CLI | Claude Sonnet 4.6 (review) |
| Architecture design | Claude Opus 4.6 | — |
| Strategic planning (PRD) | Claude Opus 4.6 | — |
| GitHub PR / async work | Jules | — |
| Parallel analysis tasks | Gemini CLI (multiple) | — |
| Voice / RAG / transcription | Vertex AI Agent (Phase 3) | — |

---

## Orchestration Patterns

### Pattern 1: Single-Agent Task
For simple, well-defined tasks:
```
Claude Sonnet 4.6 (orchestrator)
  → Execute task directly
  → Sign in/out via mem0
  → Mark Kanban Done
```

### Pattern 2: Orchestrator + Parallel Workers
For tasks with parallelizable sub-tasks:
```
Claude Sonnet 4.6 (orchestrator)
  → Dispatch Sub-task A → Gemini CLI
  → Dispatch Sub-task B → Codex CLI
  → Dispatch Sub-task C → Gemini CLI
  → Collect results
  → Synthesize and verify
  → Sign out via mem0
```

### Pattern 3: Sequential Handoff
For tasks requiring different model strengths in sequence:
```
Gemini CLI → Research phase (web search, large context)
Claude Sonnet 4.6 → Planning phase (synthesize research → plan)
Codex CLI → Implementation phase (code edits)
Claude Sonnet 4.6 → Verification phase (review, test, document)
```

---

## Cost Management Rules

1. Default to Claude Sonnet 4.6 for orchestration — do not escalate to Opus 4.6 unless explicitly needed
2. Use Gemini CLI for all web search — do not use Claude with WebSearch for routine research
3. Use Codex CLI for isolated code edits — do not use Opus 4.6 for single-file changes
4. Batch parallel tasks — dispatch multiple Gemini/Codex instances simultaneously rather than sequentially
5. Do not run Opus 4.6 on documentation tasks — Sonnet 4.6 is sufficient

---

*Back to [index.md](../index.md)*
