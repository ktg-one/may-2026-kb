---
title: Source — Professor Prompt (React + Gemini API)
type: source-summary
tags: [source, code, prompt-engineering, gemini, react, asset]
status: review
revenue_impact: low
sources:
  - assets/code/professor-prompt.ts.zip
last_updated: 2026-05-25
review_needed: true
---

# Source — Professor Prompt

**Original:** `assets/code/professor-prompt.ts.zip`
**Type:** React + TypeScript app, 60 KB zip
**Date origin:** Aug 2025

## What it is

A React/TypeScript single-purpose tool that uses the Gemini API to refine user prompts. Files in the zip:

- `types.ts`, `metadata.json`
- `constants/systemPrompt.ts` (the prompt-refinement system prompt itself)
- `services/geminiService.ts`
- `components/Header.tsx`, `LoadingSpinner.tsx`, `ApiKeyWarning.tsx`, `PromptInput.tsx`, `RefinedPromptDisplay.tsx`

## Why it's in the wiki

Conceptually overlaps with `[[wiki/projects/legio-framework]]` (prompt engineering). Could be a precursor or a candidate widget for the broader LEGIO framework. Status unclear — Aug 2025 origin predates the vault restructure.

## Connections

- `[[wiki/projects/legio-framework]]` — prompt engineering framework
- `prompts/` — directory of 5 production prompts

## Review items

- **R5** — Active project or superseded by LEGIO? Extract and inspect; decide keep / fold-in / archive.
