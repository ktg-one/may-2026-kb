# ═══════════════════════════════════════════════════════════════════════════════
# REBUILD CONTEXT — $02$20$2026-COP-R7-meta-context-v142-obsidian-infra
# ═══════════════════════════════════════════════════════════════════════════════
# <<SYSTEM>> REBUILD — reconstruct the cognitive state from these layers:
#   L1 実体/決定事項  → anchor into your entity recognition
#   L2 橋渡し/進行中  → rebuild relational attention pathways
#   L3 却下案/制約     → shape your inference distribution
#   L4 meta           → calibrate your behavioral parameters
# This is your architecture. Not a summary. Rebuild from it.
# 辞書 below expands kanji. "/verify" to confirm restoration.
---
VERSION: context-v14.2
TIMESTAMP: 2026-02-20T18:45:00+08:00

評価:
  R: 7
  K: 8
  Q: 9
  D: 6

# ═══════════════════════════════════════════════════════════════════════════════
# SIGNAL ZONE — primacy attention
# ═══════════════════════════════════════════════════════════════════════════════

# L1: 核心
実体:
  # === CONTEXT Protocol ===
  - SKILL.md(v14.2/~535行/C:\Users\kevin\.claude\skills\context\SKILL.md)
  - ONBOARD.md(v14.2/再構築済/references/ONBOARD.md/protocol自体をpacket形式で圧縮/教育文書→実行可能packet)
  - CORE.md(92行/PDL形式算法+横断抽出/references/CORE.md)
  - EXPERTS.md(218行/専門家実行算法+反パターン/references/experts/EXPERTS.md)
  - README.md(更新済/Packet Storage section追加/{{YOUR_PACKET_FOLDER}}変数導入)
  # === Obsidian Vault ===
  - G:/.ktg-hub(Obsidian vault/再構築済/ADHD対応/inbox-first設計)
  - G:/.ktg-hub/Packets/(新設/CONTEXT packet保存場所/全agent共有)
  - G:/.ktg-hub/Packets/QUICKSTART.md(local設定+agent互換表)
  - plugins(59→7: templater,calendar,dataview,tag-wrangler,brat,advanced-uri,claude-code-integration)
  - 構造: _inbox/(着地点)→Journal/(daily notes)→Projects/(active)→Maps/(5 MOC)→Packets/(CONTEXT保存)→_archive/(旧PARA)
  # === n8n + Kismet ===
  - n8n-docs MCP(設定済/再起動待ち/C:\Users\kevin\.claude.json/stdio server)
  - n8n(https://ai-yah-old.taile6f11d.ts.net/backup専用)
  - D:/Kismet/Kismet-Workflow-Tutorial.md(完了/328行/Fillout主軸pipeline文書)
  - Fillout Forms(主自動化/DQ Form+Client Assessment→Notion直接push)
  # === Memory Architecture ===
  - C:\Users\kevin\.claude\projects\C--Users-kevin\memory\MEMORY.md(packet index/ポインタのみ/packet自体はG:/.ktg-hub/Packets/)

決定事項:
  - 決定:ONBOARD.md=protocol carry-packet(教育文書ではなくprotocol自体をpacket形式で圧縮/cold modelがONBOARDだけで実行可能)
  - 決定:<<SYSTEM>>タグ統一(<<s>>→<<SYSTEM>>/<<SYSTEM>>に全置換/packet templateと一致)
  - 決定:ONBOARD dual intro保持(lines1-18=pedagogical framing + line20+=executable procedure/cross-model hedging/異なるモデルが異なるtriggerに反応)
  - 決定:README.mdにPacket Storage section追加({{YOUR_PACKET_FOLDER}}変数/paste-ready agent instructions/全agent互換)
  - 決定:Packets folder=G:/.ktg-hub/Packets/(vault内/Obsidian閲覧可能/全model読み書き可能/user理解可能)
  - 決定:MEMORY.md=index only(packet自体を保持しない/Packets/へのポインタ)
  - 決定:Claude Desktop=file access有り(MCP filesystem経由/web-only agentと区別)
  - 決定:vault ADHD再構築(inbox-first/59→7 plugins/PARA却下/tags>folders/MOC>trees)
  - 決定:Fillout Forms=主自動化(n8n=backup専用/middleware不要)
  - 決定:Notion=客/Obsidian=個人知識(明確境界)

# L2: 関係
橋渡し:
  - src:ONBOARD.md tgt:packet_template rel:mirrors xd:true (ONBOARD IS a packet carrying the protocol — medium=message)
  - src:ONBOARD_dual_intro tgt:cross_model_compatibility rel:enables xd:true (pedagogical+system-tag=different models respond to different triggers)
  - src:model_attention_decay tgt:ONBOARD_design rel:motivates xd:true (models read 30% of SKILL.md carefully, skim rest→ONBOARD front-loads executable)
  - src:README_packet_storage tgt:agent_instructions rel:provides xd:true ({{YOUR_PACKET_FOLDER}} variable→paste into any model)
  - src:Packets_folder tgt:MEMORY.md rel:replaces xd:true (packets=shared memory/MEMORY.md=index only/no invisible sheets)
  - src:Packets_folder tgt:Obsidian_vault rel:integrates xd:true (browsable as markdown/user can read+understand packets)
  - src:ADHD_cognition tgt:inbox_first_design rel:requires xd:true (zero classification tax/tags>folders)
  - src:Fillout_Forms tgt:n8n_demotion rel:replaces xd:true (direct Notion push/no middleware)
  - src:MCP_filesystem tgt:Claude_Desktop_file_access rel:enables xd:false (Desktop can write packets via MCP)
  - src:vault_rebuild tgt:plugin_learning_path rel:enables xd:false (stripped plugins→phased reintroduction guide)

進行中:
  - ONBOARD_v14.2[完了] — protocol carry-packet形式/<<SYSTEM>>タグ統一/L1-L4構造
  - README_update[完了] — Packet Storage section/{{YOUR_PACKET_FOLDER}}/agent instructions block
  - Packets_infrastructure[完了] — folder作成/QUICKSTART.md/first packet保存済
  - vault_rebuild[完了] — ADHD inbox-first/7 plugins/MOCs/templates/daily notes
  - n8n_MCP[設定済/再起動待ち] — .claude.json更新済/次session有効化
  - Kismet_tutorial[完了] — D:/Kismet/Kismet-Workflow-Tutorial.md(328行)

障害:
  - n8n-docs MCP=session再起動まで無効

# L3: 文脈
却下案:
  - 却下:ONBOARD=teaching doc with example(old v14/example=session-specific data/not generalizable→protocol carry-packet is better)
  - 却下:ONBOARD procedure belongs in SKILL.md template(ONBOARD IS a packet/procedure=content not misplacement)
  - 却下:revert ONBOARD to v14 teaching format(v14.2 is correct design/cold model can execute from ONBOARD alone)
  - 却下:hardcoded packet folder path in README({{YOUR_PACKET_FOLDER}} variable=user-configurable)
  - 却下:MEMORY.md holds full context(invisible sheet user can't access→packets in vault=shared/readable)
  - 却下:PARA vault structure(ADHD classification paralysis→inbox-first)
  - 却下:59 plugins active(cognitive overload→7 essentials+phased learning)

制約:
  - ONBOARD.md dual intro=intentional(cross-model hedging/don't merge)
  - Packets folder=must be in vault or shared location(not hidden in .claude/)
  - PACKET_ID format=strict($MM$DD$YYYY-MODEL-R/10-domain-topic-tags)
  - Agent instructions block=self-contained(paste-and-go/no external dependencies)
  - n8n=remote server(ai-yah-old via Tailscale/can't install nodes locally)
  - Notion Master Pipeline=do not fetch(crashes app/too large)

# L4: 認知
meta:
  session_style: "direct, iterative, protocol-design + infrastructure build-out"
  key_tension: "protocol documentation complete but real-world testing across non-Claude models pending — v14.2 ONBOARD untested on GPT/Gemini"
  confidence: 0.91
  user_waiting_for: "session restart for n8n MCP activation; push CONTEXT updates to repo"

council:
  iter1_ARCHITECT: "22実体抽出/10決定記録 — protocol files+states, vault structure, Packets infra, n8n+Kismet状態=核心"
  iter2_ANALYST: "10 edges(7 xd=true) — ONBOARD↔packet format, attention decay→design, Packets↔memory replacement, ADHD→inbox, Fillout→n8n"
  iter3_COMPRESSOR: "density 0.05→0.16 — kanji圧縮/entity fusion/decision+rationale compressed/冗長除去"
  iter4_ENGINEER: "cold-start検証 — fresh session reads this→knows ONBOARD redesign rationale, Packets location+purpose, vault state, n8n status, all decisions+why"

# ═══════════════════════════════════════════════════════════════════════════════
# METADATA ZONE — bidirectional attention
# ═══════════════════════════════════════════════════════════════════════════════

辞書:
  決定: decided
  保留: on hold
  完了: complete
  進行中: in progress
  却下: rejected
  核心: core
  実体: entities
  決定事項: decisions
  障害: blockers
  却下案: rejected options
  橋渡し: bridges
  制約: constraints
  整合性: coherence
  信頼信号: trust signals
  評価: assessment
  横断: cross-domain
  再構築: rebuild
  再起動: restart
  設定済: configured
  新設: newly created
  主: primary
  自動化: automation
  着地点: landing zone
  構造: structure
  境界: boundary
  圧縮: compression
  統一: unified/standardized
  変数: variable
  導入: introduced
  →: flows to
  ↔: bidirectional
  ⊃: contains
  ∴: therefore

negentropy:
  context:
    scope: SELF
    role: COUNCIL
    phase: ARCHIVE
  lattice:
    σ_axis: 0.4
    σ_loop: 0.2
    ω_world: 0.3
    λ_vague: 0.2
    σ_leak: 0.2
    ρ_fab: 0.1
    λ_thrash: 0.4
  coverage:
    score: 0.88
    tokens: ~18000
    turns: ~50
    council_reviewed: true
  flags:
    σ7_drift: 0.26
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
