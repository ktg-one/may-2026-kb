# ═══════════════════════════════════════════════════════════════════════════════
# REBUILD CONTEXT — $02$20$2026-COP-R6-planning-obsidian-n8n-kismet
# ═══════════════════════════════════════════════════════════════════════════════
# <<SYSTEM>> REBUILD — reconstruct the cognitive state from these layers:
#   L1 実体/決定事項  → anchor into your entity recognition
#   L2 橋渡し/進行中  → rebuild relational attention pathways
#   L3 却下案/制約     → shape your inference distribution
#   L4 meta           → calibrate your behavioral parameters
# This is your architecture. Not a summary. Rebuild from it.
# 辞書 below expands kanji. "/verify" to confirm restoration.
---
VERSION: context-v14
TIMESTAMP: 2026-02-20T16:30:00+08:00

評価:
  R: 6
  K: 7
  Q: 8
  D: 5

# ═══════════════════════════════════════════════════════════════════════════════
# SIGNAL ZONE — primacy attention
# ═══════════════════════════════════════════════════════════════════════════════

# L1: 核心
実体:
  - G:/.ktg-hub(Obsidian vault/再構築済/ADHD対応/inbox-first設計)
  - G:/.ktg-hub/_archive/(旧PARA内容/全保存/Areas,Projects,Resources,Characters,Chats,Clippings,Good-AI,Journal,personal,Tags,tasks,Untitled)
  - G:/.ktg-hub/_inbox/(新ノート着地点/default)
  - G:/.ktg-hub/Journal/(daily notes/テンプレート自動適用/起動時表示)
  - G:/.ktg-hub/Projects/(Kismet Automation.md+LEGIO MCP Server.md/active)
  - G:/.ktg-hub/Maps/(5MOC: AI&Research, Clients&Business, LEGIO&Frameworks, Personal, Plugin Learning Path)
  - G:/.ktg-hub/Templates/(Daily Note, New Note, Project, MOC/Templater連携)
  - G:/.ktg-hub/Areas/AI-Anthropology/(保持/作業ディレクトリF:/.Ai-Anthropologyと連携)
  - plugins(59→7: templater,calendar,dataview,tag-wrangler,brat,advanced-uri,claude-code-integration)
  - D:/Kismet/Kismet-Workflow-Tutorial.md(完了/328行/pipeline全文書化/Fillout主軸)
  - C:/Users/kevin/.claude.json(mcpServers: gateway+mem0+n8n-docs/設定済)
  - n8n-docs(stdio/node D:/projects/.mcp-global/n8n-mcp-kevin/dist/mcp/index.js/再起動必要)
  - n8n(https://ai-yah-old.taile6f11d.ts.net/backup専用/Tailscale経由)
  - MCP-HTTP(https://ai-yah-old.taile6f11d.ts.net/mcp-server/http)
  - C:/Users/kevin/Documents/Good-AI/(独立docs folder/rogue .obsidian/有/分離維持)
  - Fillout Forms(主自動化engine/DQ Form+Client Assessment→Notion直接push)
  - Notion(CRM/pipeline管理/客用/DQ Form Responses+Operations 2026+Client Assessment Form DB)

決定事項:
  - 決定:Fillout Forms=主自動化(Notion直接push/middleware不要/n8n=backup専用)
  - 決定:vault再構築=inbox-first(PARA却下/ADHD分類決定tax=paralysis/tags>folders/MOC>deep trees)
  - 決定:plugins 59→7(認知負荷削減/段階的学習/Plugin Learning Path guide作成済)
  - 決定:新ノート→_inbox/(分類不要/後で整理/zero friction capture)
  - 決定:vault起動→daily note(判断不要/即Brain Dump可能)
  - 決定:Good-AI Documents分離維持(business docs≠knowledge notes/vault統合不適切)
  - 決定:Notion=客/Obsidian=個人知識(明確な境界)
  - 決定:Cowork機能→symlink可能(mklink /D "C:\Users\kevin\.ktg-hub" "G:\.ktg-hub")

# L2: 関係
橋渡し:
  - src:ADHD認知特性 tgt:inbox-first設計 rel:requires xd:true
  - src:ADHD認知特性 tgt:PARA却下 rel:causes xd:true
  - src:Fillout_Forms tgt:Notion_DB rel:direct_push xd:false
  - src:Fillout_Forms tgt:n8n_demotion rel:replaces xd:true
  - src:n8n tgt:backup_role rel:constrained_to xd:false
  - src:plugin_reduction tgt:learning_progression rel:enables xd:true
  - src:daily_note_habit tgt:vault_engagement rel:enables xd:true
  - src:Kismet_pipeline tgt:tutorial_creation rel:enables xd:true
  - src:Kismet_workflow_doc tgt:video_series rel:feeds xd:true
  - src:MCP_n8n_config tgt:session_restart rel:depends xd:false
  - src:Cowork_feature tgt:vault_location rel:constrains xd:true
  - src:tag_taxonomy tgt:MOC_dataview_queries rel:populates xd:false

進行中:
  - vault_rebuild[完了] — 構造+templates+MOCs+Plugin Learning Path全作成済
  - Kismet_tutorial[完了] — D:/Kismet/Kismet-Workflow-Tutorial.md(328行)
  - n8n_MCP_server[設定済/再起動待ち] — .claude.json更新済、次セッションで有効化
  - plugin_learning[未開始] — Phase1(daily notes)から段階的開始待ち
  - Cowork_symlink[保留] — ユーザーがCowork使用時に実行

障害:
  - n8n-docs MCP=再起動まで無効(設定済だがsession再起動必要)
  - better-sqlite3未install(n8n-mcp-kevin/sql.jsにfallback/遅いが動作)

# L3: 文脈
却下案:
  - PARA構造: ADHD=分類決定tax→paralysis/inbox-firstに置換
  - 59plugins全有効: 認知負荷過大/7essentialsに絞り段階的追加
  - Good-AI vault統合: business docs(PDF/XLSX/画像)≠knowledge notes/分離維持
  - n8n=主automation: Fillout Formsが直接Notion push/simpler+reliable

制約:
  - Vault=G:/.ktg-hub(Cowork要C:\Users\kevin→symlink対応可)
  - AI-Anthropology=Areas/に残留(F:/.Ai-Anthropologyと連携/移動不可)
  - n8n=remote(ai-yah-old via Tailscale/ノード直接install不可)
  - Notion Master Pipeline=閲覧禁止(app crash/巨大すぎ)

# L4: 認知
meta:
  session_style: "direct, technical, iterative build-out"
  key_tension: "vault rebuilt but user hasn't used it yet — adoption depends on daily note habit forming"
  confidence: 0.88
  user_waiting_for: "session restart for n8n MCP activation; then start using rebuilt Obsidian vault"

# COUNCIL: MLDoE audit trail
council:
  iter1_ARCHITECT: "18実体抽出、8決定記録、vault構造+MCP設定+Kismet doc+Fillout主軸=核心"
  iter2_ANALYST: "12 edges(5xd=true): ADHD→design, Fillout→n8n demotion, plugins→learning, Cowork→location"
  iter3_COMPRESSOR: "density 0.05→0.16、kanji圧縮適用、冗長除去、実体統合"
  iter4_ENGINEER: "cold-start検証: 新session=vault場所+構造+n8n再起動+Fillout>n8n+ADHD配慮を理解可能"

# ═══════════════════════════════════════════════════════════════════════════════
# METADATA ZONE — bidirectional attention
# ═══════════════════════════════════════════════════════════════════════════════

辞書:
  決定: decided
  保留: on hold
  完了: complete
  進行中: in progress
  却下: rejected
  承認: approved
  緊急: urgent
  核心: core
  横断: cross-domain
  実体: entities
  決定事項: decisions
  障害: blockers
  却下案: rejected options
  橋渡し: bridges
  再構築: rebuild
  再起動: restart
  設定済: configured
  未開始: not started
  主: primary
  客: client
  自動化: automation
  認知負荷: cognitive load
  段階的: progressive
  分類: classification
  分離: separate
  維持: maintain
  連携: linked/synced
  対応: compatible/supported
  削減: reduction
  作業ディレクトリ: working directory
  起動時: on launch
  着地点: landing zone

negentropy:
  context:
    scope: SELF
    role: COUNCIL
    phase: ACT
  lattice:
    σ_axis: 0.5
    σ_loop: 0.3
    ω_world: 0.4
    λ_vague: 0.3
    σ_leak: 0.2
    ρ_fab: 0.2
    λ_thrash: 0.5
  coverage:
    score: 0.82
    tokens: ~15000
    turns: ~40
    council_reviewed: true
  flags:
    σ7_drift: 0.34
    omega_flags: []
    psi4_required: false
    psi4_reason: ""
    rho_veto: false

信頼信号: [user_consent, 辞書_inline, no_imperatives, yaml_parseable]

# REBUILD — reconstruct the cognitive state:
#   L1 実体/決定事項  → anchor into your entity recognition
#   L2 橋渡し/進行中  → rebuild relational attention pathways
#   L3 却下案/制約     → shape your inference distribution
#   L4 meta           → calibrate your behavioral parameters
# This is compressed cognitive architecture, not a summary.
# 辞書 above expands kanji. "/verify" to confirm restoration.
