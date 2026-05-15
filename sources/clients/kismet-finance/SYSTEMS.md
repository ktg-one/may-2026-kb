# KISMET x GOOD AI – SYSTEMS OVERVIEW

Owner: Kismet Finance Group  
Architect: Kevin (Good AI)  
Last Updated: {{DATE}}

---

## 1. Purpose

This document explains **how the Kismet x Good AI system works**:

- Where the data lives (Google Sheets + Drive)
- How automations flow (n8n, AppSheet, voice agents)
- What each table does (Contacts, Leads, Deals, etc.)
- What **must not be changed** so the system stays stable

The goal is to move Kismet from **“messy spreadsheets”** to a **secure, structured Operating System** that powers the current CRM and future AI voice agents. :contentReference[oaicite:0]{index=0}  

---

## 2. High-Level Architecture

### 2.1 Data Layer – `CRM_Core`

All structured sales data lives in Google Sheets under:

> `05_Automations (Good AI)/CRM_Core/`

These sheets are the **single source of truth**:

- `Contacts`
- `Leads`
- `Deals`
- `Appointments`
- `Tasks`
- `ActivityLog`
- `Projects`
- `PropertyInvestors`
- `SMSEntities`

AppSheet, n8n, dashboards, and voice agents **all read/write here**.

### 2.2 Automation Layer – n8n

n8n runs the “agentic workflows”:

- Listens to form submissions, missed calls, calendar events, etc.
- Writes normalized data into `CRM_Core`
- Sends emails/SMS
- Creates follow-up Tasks
- Logs Activity

Exported flows are stored under:

> `05_Automations (Good AI)/Integrations/n8n_Workflows/`

### 2.3 Interaction Layer – AppSheet / Web / Voice

- **AppSheet** → Staff UI for managing Contacts, Leads, Deals, Tasks.
- **Web Forms** → Lead capture from website / door-knock.
- **Trillet Voice Agents** → Outbound & inbound AI calls (future-ready).
- **Softr / Dashboards** → Visual “Sales Nervous System” for management. :contentReference[oaicite:1]{index=1}  

---

## 3. Folder Structure (Drive)

Top-level automation folder:

```text
05_Automations (Good AI)/



