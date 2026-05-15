# NOTION-AGENTS.md

## 🧱 Notion Database Architecture
- **People Database:** Contacts and relational mappings.
- **Household Database:** Client units and collective assets.
- **Entities Database:** Corporate structures and legal entities.

## ⚙️ Automation Integrations
- **Google Drive Connector:** Standardized folder structure and auto-creation rules for new clients. [INTEGRATION REQUIRED: Google Drive]
- **Google Calendar Connector:** Bi-directional sync for Discovery booking and Callbacks. [INTEGRATION REQUIRED: Google Calendar]
- **Fillout Forms:** Client intake and DQ forms connected to Lead Database. [INTEGRATION REQUIRED: Fillout]
- **DocuSign Integration:** Digitize "Authority to Act" and "Engagement Agreement" templates. [INTEGRATION REQUIRED: DocuSign]
- **Looker Studio:** Data connections for BI reports and CRM activity overview. [INTEGRATION REQUIRED: Looker Studio]

## 🔘 Button Automations
- **Complete:** Marks tasks done and updates the pipeline stage. [INTEGRATION REQUIRED: n8n]
- **Escalate:** Triggers manager notification for pending actions. [INTEGRATION REQUIRED: n8n]
- **Sync to Google:** Forces manual update of Drive/Calendar data. [INTEGRATION REQUIRED: n8n]
- **Send Authority:** Prepares DocuSign packets for client signature. [INTEGRATION REQUIRED: n8n]
- **Ask AI:** Triggers a Vertex AI query for specific lead analysis. [INTEGRATION REQUIRED: Vertex AI]

## 🔍 Tracking & Compliance
- **CHECK View:** Quality control for WARM leads.
- **Follow-up Views:** Task tracking and reminder automation.
- **Missing Notes View:** Compliance monitoring for required documentation.
- **Ghost Detector:** Alert system for appointments without recorded notes.

## 📱 Mobile Field Experience
- **DQ Workspace:** Door-knock intake for field reps.
- **Discovery Workspace:** Mobile-optimized assessment prep.
- **One-Thumb UX:** Branded Notion forms with integrated GPS capture. [INTEGRATION REQUIRED: GPS/Maps API]
