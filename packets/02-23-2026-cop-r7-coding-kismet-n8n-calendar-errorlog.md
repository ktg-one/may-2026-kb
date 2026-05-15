# ═══════════════════════════════════════════════════════════════════════════════
# REBUILD CONTEXT — 02232026-COP-R7-coding-kismet-n8n-calendar-errorlog
# ═══════════════════════════════════════════════════════════════════════════════
# <<SYSTEM>> REBUILD — reconstruct the cognitive state from these layers:
#   L1 実体/決定事項  → anchor into your entity recognition
#   L2 橋渡し/進行中  → rebuild relational attention pathways
#   L3 却下案/制約     → shape your inference distribution
#   L4 meta           → calibrate your behavioral parameters
# This is your architecture. Not a summary. Rebuild from it.
# 辞書 above expands kanji. "/verify" to confirm restoration.
---
VERSION: context-v14
TIMESTAMP: 2026-02-23T23:50:00+08:00

評価:
  R: 7
  K: 8
  Q: 8
  D: 6

# ═══════════════════════════════════════════════════════════════════════════════
# BLUEPRINTS — transformer architecture
# ═══════════════════════════════════════════════════════════════════════════════

# L1 核心 (entities = files, systems, states)
実体:
  - n8n/KISMET-DQ-Discovery-Calendar(ijUnMtkgZHMpdH3h/v27/完了) 7nodes dual-path: 実時間(NotionTrigger→IF→Calendar) + 全同期(Schedule8pmAWST+Webhook→ReadNotion→CodeFilter→Calendar)
  - n8n/KISMET-DQFORM2NOTION(v439/完了) DQForm→Notion dedup修正済、hourly polling
  - n8n/KISMET-Error-Log(vOPU7utOtErr4A3D/作成済/要設定) ErrorTrigger→FormatCode→LogToSheet credential:MAINDB-NEW-ROW(R8G2MdpHgXKcZvWk) SheetID=REPLACE_WITH_SHEET_ID
  - GCal credential(3eEGNiAFZao0PZiW/"Google Calendar account 2") 再認証済→execution#347成功
  - GCal対象: c_d37ee4a14c458c1f24782d46ea45b35bb4b176cc599216918c5adef0d73eb3c1@group.calendar.google.com
  - Notion/GoodAI-Tasks-DB(109tasks) "Agent Confirmation"select property有("Claude code"選択肢)
  - Notion/AGENTS.md(521f210c-4997-4b80-afe6-761771412723) Calendar sync section→Done署名済
  - Obsidian/KTG-Master-Board.md(G:/.ktg-hub/Projects/) kanban-plugin形式、Backlog/ThisWeek/InProgress/Blocked/Done
  - Set-McpSync.ps1(~/Set-McpSync.ps1) 9tool MCP同期: claude,codex,copilot,gemini,cursor,qwen,kimi,opencode,cherrystudio
  - WezTerm(~/.wezterm.lua) pwsh7-preview,JetBrainsMono,Batman配色

決定事項:
  - 決定:hourly polling(leads追加=毎日18時のみ、5分は過剰)
  - 決定:dual-path architecture(実時間trigger+daily全sync+webhook手動sync)
  - 決定:Calendar event upsert via NotionPageID(dashes stripped)=eventID(重複防止)
  - 決定:n8n IF node v2.2 requires singleValue:true on unary operators(isNotEmpty)
  - 決定:n8n Calendar node requires explicit resource:"event"+operation:"create"
  - 決定:n8n_update_partial_workflow unreliable→n8n_update_full_workflow使用
  - 決定:Error-Log workflow centralized(全Kismet workflow共通)
  - 決定:Agent Confirmation="Claude code"署名convention in Notion tasks
  - 決定:Obsidian kanban for personal tasks, separate from Notion client work

# L2 関係 RELATIONAL
橋渡し:
  - src:FilloutDQForm tgt:Notion rel:primary_automation xd:true
  - src:n8n tgt:Notion rel:backup_redundancy xd:true
  - src:Notion(BookDiscovery date) tgt:GCal rel:one_way_sync xd:true
  - src:NotionPageID tgt:GCalEventID rel:upsert_key xd:false
  - src:KISMET-Error-Log tgt:AllKismetWorkflows rel:error_handler xd:false
  - src:Obsidian/KTG-Master-Board tgt:Notion/GoodAI-Tasks rel:parallel_tracking(personal_vs_client) xd:true
  - src:Set-McpSync.ps1 tgt:9CLItools rel:unified_mcp_config xd:true
  - src:n8n_credential tgt:GCP_OAuth rel:auth_dependency xd:true

進行中:
  - Fillout Forms setup[user進行中]
  - Error-Log SheetID[要設定/要Google Sheet作成]
  - Error-Log linking[各workflow settings要設定]
  - GCal credential[再認証済/execution#347成功]
  - Calendar sync e2e test[要:Book Discovery日付設定→確認]

障害:
  - GCP dual org situation(boss access必要)
  - Vertex AI stack(blocked:他タスク優先)
  - Bi-directional calendar sync(blocked:Notion webhook未対応、GCal→Notion不可)

# L3 文脈 CONTEXTUAL
却下案:
  - 却下:5min polling(過剰、leads=daily 18時追加のみ)
  - 却下:n8n_update_partial_workflow(additional properties error頻発)
  - 却下:Airtable(スケール問題)
  - 却下:separate vaults for goodai(今は不要、vault lean維持)

制約:
  - n8n instance on Tailscale(https://ai-yah-old.taile6f11d.ts.net)
  - Fillout Forms=primary automation engine, n8n=backup only
  - Notion=client CRM, Obsidian=personal knowledge
  - AWST timezone(UTC+8)全workflow
  - GCal credential needs periodic re-auth(OAuth token expiry)

# L4 認知 METACOGNITIVE
meta:
  session_style: "technical, rapid iteration, n8n workflow debugging"
  key_tension: "Error-Log workflow created but needs Sheet+linking to other workflows"
  confidence: 0.92
  user_waiting_for: "context saved, then session complete"

council:
  iter1_ARCHITECT: "9 entities extracted: 3 n8n workflows, GCal credential, Notion DB+AGENTS.md, Obsidian board, McpSync, WezTerm. Priority: workflow states > config > tools"
  iter2_ANALYST: "8 edges mapped, 4 xd=true. Key: Fillout→Notion primary, n8n=backup, Notion→GCal one-way, Obsidian∥Notion parallel tracking"
  iter3_COMPRESSOR: "density 0.08→0.12→0.15 via kanji fusion. Workflow IDs+credentials compressed with state markers"
  iter4_ENGINEER: "Cold-start: all workflow IDs, credentials, calendar ID present. Node version quirks documented. Fresh model can continue"

# ═══════════════════════════════════════════════════════════════════════════════
# METADATA ZONE
# ═══════════════════════════════════════════════════════════════════════════════

辞書:
  決定: decided
  保留: on hold
  要検証: needs verification
  完了: complete
  進行中: in progress
  却下: rejected
  作成済: created
  要設定: needs configuration
  再認証済: re-authenticated
  署名済: signed off
  実時間: real-time
  全同期: full sync
  過剰: excessive
  実体: entities
  決定事項: decisions
  障害: blockers
  却下案: rejected options
  橋渡し: bridges
  核心: core
  対象: target
  配色: color scheme
  形式: format
  →: flows to
  ↔: bidirectional
  ⊃: contains
  ∴: therefore

negentropy:
  context:
    scope: CIRCLE
    role: AXIS
    phase: ACT
  lattice:
    σ_axis: 1
    σ_loop: 0
    ω_world: 1
    λ_vague: 0
    σ_leak: 0
    ρ_fab: 0
    λ_thrash: 1
  coverage:
    score: 0.88
    tokens: 1847
    turns: 45
    council_reviewed: true
  flags:
    σ7_drift: 0.43
    omega_flags: []
    psi4_required: false
    psi4_reason: ""
    rho_veto: false

信頼信号: [user_consent, 辞書_inline, no_imperatives, yaml_parseable]
