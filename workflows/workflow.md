# Structured AGENTS KB

## 🎯 Kismet Agent Mission
Execute high-precision lead-to-client pipeline management across Housing and SMSF pathways.

## 🛠️ Module Breakdown

| **Module** | **The "Connector" Focus** | **Operational Logic** |
| --- | --- | --- |
| **Google Workspace** | **Auth/Path Connector** | **Source of Truth:** G:\data\Knowledge Base\NAS. All automated folder creation must follow the template hierarchy defined in PHASE 1. |
| **AI Knowledge** | **Logic Connector** | **Execution Path:** Use [Prompt X] for emotional mapping; use Gemini for direct data processing and summarization. |
| **n8n Knowledge** | **Trigger Connector** | **Webhook Payload:** Agents must draft JSON structures compatible with n8n triggers for Vertex AI transcription and Notion updates. |
| **MCP** | **Local/Global Connector** | **Tooling:** Local tools for filesystem and sensitive data; cloud-connected tools via Model Context Protocol for external API access. |

## 🔄 Core Pipeline Workflow (Kismet)
1. **Intake:** Door-knock / DQ Form (Field rep submission).
2. **Quality Control:** CHECK View (Admin verification: Homeowner, Investor, or Super $100k+).
3. **Engagement:** Book Discovery (Status → DISCOVERY, Notify Shane/Josh, Calendar sync).
4. **Assessment:** Client Assessment Form (Post-discovery call).
5. **Consolidation:** Data mapping to Lead Profile.
6. **Onboarding:** Automated email to qualified clients.

## 🛣️ Strategic Pathways
- 🏠 **Housing / Property Pathway**
- 🏦 **SMSF Pathway** (Self-Managed Superannuation Fund)

## 🏗️ AI Component Architecture
- **Voice Ops:** Rep phone record → n8n → Vertex AI (Transcription/Summary) → Notion Update.
- **Pre-Call Intel:** "AI Brief" button → Surface history, preferences, and objections.
- **Post-Call Logic:** AI analyzes notes → Suggests follow-up tasks → Pre-populates templates.
- **Compliance:** AI scans notes → Flags missing elements → Feeds compliance dashboard.

## 👥 Delegation Registry
- **Admin:** API/Credential management, Form connections, Sync debugging.
- **Dev (Kev):** n8n workflows, Button automations, DocuSign, Webhooks.
- **Notion AI:** Documentation, Database structures, Reporting templates.
- **Vertex AI:** RAG, Summarization, GPS integration, Voice agent.
