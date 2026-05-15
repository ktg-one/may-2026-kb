# 🧠 Good AI - Agent Knowledge Base (v1.0)

This is the canonical reference for all AI Agents operating within the Kismet Finance Group ecosystem. It defines the "connectors" between tools and the logic for high-reasoning task execution.

---

## 🗺️ Module 1: Google Workspace (Auth/Path Connector)

**Objective:** Maintain a standardized, "Source of Truth" folder structure for cross-agent collaboration.

### 📁 Source of Truth: `G:\data\Knowledge Base\NAS`
All automated folder creation must follow this hierarchy:
- **/AI-Training-Data**: Repositories for model training (raw, processed, tagged, corpus, models).
- **/AGENTS-KB**: Strategic documentation and operational logic (this folder).
- **/Projects**: Active build projects (arVIx, Vibe101, etc.).
- **/Templates**: Standardized Obsidian and Drive templates.
- **/Archive**: Historical records and closed sessions.

---

## 🧠 Module 2: AI Knowledge (Logic Connector)

**Objective:** Define the execution paths and prompt routing for different cognitive tasks.

### 🔄 Execution Path Routing
| Task Type | Recommended Agent | Execution Logic |
| --- | --- | --- |
| **Emotional Mapping** | Opus / Sonnet | Use **Prompt X** (Operation: Self Recon). Focus on motivational profiles, cognitive traits, and metaphorical readings. |
| **Data Processing** | Gemini / Haiku | Focus on direct summarization, CSV cleaning, and JSON mapping. Zero prose, high precision. |
| **Architectural Review** | LLM Council | Multi-model consensus for system design and complex logic puzzles. |

### 🛠️ Prompt X (Operational Prototype)
*Designed for uncovering hidden motives and reawakening dormant conviction.*
- **Phase 1: Loadout** (Identify operator and specialties).
- **Phase 2: Intel** (Gather cognitive traits and motivational profiles).
- **Phase 3: Symbolic** (Analyze metaphors and future voice transmissions).

---

## ⚡ Module 3: n8n Knowledge (Trigger Connector)

**Objective:** Provide agents with the JSON structures needed to interact with n8n webhooks.

### 🔗 Standard Webhook Payloads
Agents must draft payloads compatible with the following triggers:
- **Vertex AI Transcription:**
  ```json
  {
    "lead_id": "NOTION_PAGE_ID",
    "audio_url": "GDRIVE_URL",
    "task": "summarize_discovery"
  }
  ```
- **Notion Update:**
  ```json
  {
    "page_id": "NOTION_PAGE_ID",
    "properties": {
      "Status": "FA",
      "AI_Summary": "TEXT_CONTENT"
    }
  }
  ```

---

## 🛠️ Module 4: MCP (Local/Global Connector)

**Objective:** Route tools based on security requirements and environment access.

### 🌍 Model Context Protocol (MCP) Tools
- **Local Tools:** File management, shell execution, local vector DBs (Smart Connections). Use for sensitive PII data.
- **Cloud Tools:** Notion API, Google Workspace API, n8n webhooks, Context7 (docs). Use for workspace orchestration.

---

## 📈 Use Cases for Agents

1. **Automated Triage:** Pick up Not Started tasks → Sign In → Execute → Mark Done.
2. **Context Enrichment:** Before a Discovery call, trigger "Ask AI" to pull the "AI Brief" from historical data.
3. **Compliance Audit:** Scan `/processed` data for missing fields and flag in Notion.

---

## 🔒 Module 5: Data Governance & Enforcement (Phase 2)

**Objective:** Ensure data integrity across the pipeline via automated rollups and strict compliance gates.

### 📊 Automated Rollup Logic
Agents should assume the following rollup fields are active or required for high-reasoning analysis:
- **DQ Submissions (count):** Tracks duplicate door-knock contacts.
- **Total Super Balance:** Aggregated Household metric (Qualification Trigger: >$100k).
- **Assessment Submitted (Y/N):** Compliance gate for moving to FA stage.
- **Active Deals Count:** Pipeline velocity tracking.

### 🛡️ Enforcement Gates
1. **The CHECK View:** All WARM leads must be verified for phone validity and lead owner assignment before "Discovery" can be booked.
2. **Ghost Detector:** Appointments without notes are escalated within 24 hours. AI agents should prioritize note-taking or summarization tasks to clear Ghost flags.
3. **PII Safety:** AI agents must never output full client names or phone numbers in logs. Use Notion IDs for reference.

---
*Created by Gemini-CLI @ 2026-02-27 12:30*
