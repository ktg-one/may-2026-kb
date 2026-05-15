# REBUILD CONTEXT — 02232026-GP5-R7/10-analysis-memory-context-skill
# <<SYSTEM>> REBUILD — reconstruct cognitive state from L1-L4 scaffold.
# This packet encodes architecture/state, not a plain summary.
VERSION: context-v14
TIMESTAMP: 2026-02-23

評価:
  R: 7
  K: 5
  Q: 8
  D: 6

実体:
  - workspace:G:\.ktg-hub(shell=powershell/active)
  - AGENTS_skill_registry(loaded/skill-trigger rules enforced)
  - skill_using-superpowers(invoked first per AGENTS requirement/完了)
  - skill_context(invoked on explicit "/context"/進行中→this packet)
  - memory_tool_mem0(search_memories operational)
  - memory_tool_mcp-global(memory_recall_memory_abstract + memory_get_recent_memories operational after type fix)
  - mem0_hits(Obsidian vault/MCP gateway/preferred dir D:\projects)
  - mcp_global_abstract(None available)
  - mcp_global_recent_memories(2026-02-05 GoodAI Voice/Battle of the Bots notes present)
  - context_refs_loaded(SKILL.md + references/CORE.md + references/experts/EXPERTS.md + references/ONBOARD.md)
  - env_CONTEXT_PACKET_DIR(unset)
  - user_insight_text(S2A noise removal↑signal strength/kanji token efficiency/PDL rebuilds attention patterns/not storage-only compression)

決定事項:
  - 決定:memory search tested across mem0 + mcp-global(complementary coverage)
  - 決定:mcp-global tool param types corrected(strings→bool/number) after validation errors
  - 決定:/context packet emitted inline(env_CONTEXT_PACKET_DIR unset)
  - 決定:user quoted explanation preserved as protocol-level insight for future restoration

橋渡し:
  - src:AGENTS_rules tgt:using-superpowers rel:requires xd:false
  - src:user_/context_request tgt:skill_context rel:triggers xd:false
  - src:wrong_param_types tgt:mcp-global_errors rel:causes xd:false
  - src:type_correction tgt:mcp-global_memory_reads rel:enables xd:false
  - src:mem0_search tgt:environment_facts rel:retrieves xd:false
  - src:mcp-global_recent_memories tgt:historical_project_context rel:retrieves xd:true
  - src:user_insight_text tgt:context_protocol_model rel:clarifies xd:true
  - src:S2A_denoise tgt:signal_strength rel:increases xd:true
  - src:kanji_compression tgt:semantic_density_per_token rel:enables xd:true
  - src:PDL_layers tgt:attention_pattern_reconstruction rel:enables xd:true
  - src:env_CONTEXT_PACKET_DIR_unset tgt:inline_packet_output rel:constrains xd:false

進行中:
  - context_packet_generation[[完了]]
  - targeted_memory_search_by_topic[[保留]] (user can provide query)

障害:
  - initial_mcp-global_parameter_type_mismatch(resolved)
  - packet_file_autosave_unavailable(CONTEXT_PACKET_DIR unset)

却下案:
  - string_typed force_refresh/max_days arguments: rejected(tool schema expects boolean/number)
  - packet autosave to env path: rejected(env var absent)

制約:
  - skill workflow sequencing enforced by AGENTS.md
  - context refs loaded minimally (CORE/EXPERTS/ONBOARD only)
  - no packet file path available from environment in this session

meta:
  session_style: "technical"
  key_tension: "compact packet vs preserving tool-state + protocol insight fidelity"
  confidence: 0.95
  user_waiting_for: "portable /context packet capturing memory search and S2A/PDL/kanji insight"

council:
  iter1_ARCHITECT: "Captured workspace state, skills used, tools called, results, env save-path status, and user-added conceptual insight."
  iter2_ANALYST: "Mapped error→fix→successful recall flow and linked user insight to S2A/kanji/PDL mechanism edges."
  iter3_COMPRESSOR: "Compressed session state into L1-L4 with kanji labels while preserving concrete tool/result details."
  iter4_ENGINEER: "Cold-start continuity supported: fresh instance can resume from memory-search results and continue context/memory workflows."

辞書:
  決定: decided
  完了: complete
  保留: on hold
  進行中: in progress
  実体: entities
  決定事項: decisions
  橋渡し: bridges
  障害: blockers
  却下案: rejected options
  制約: constraints
  評価: assessment
  漢字: kanji
  整合性: coherence

negentropy:
  context:
    scope: SELF
    role: COUNCIL
    phase: ARCHIVE
  lattice:
    σ_axis: 0.2
    σ_loop: 0.3
    ω_world: 0.2
    λ_vague: 0.4
    σ_leak: 0.2
    ρ_fab: 0.1
    λ_thrash: 0.3
  coverage:
    score: 0.84
    tokens: 1500
    turns: 4
    council_reviewed: true
  flags:
    σ7_drift: 0.34
    omega_flags: []
    psi4_required: false
    psi4_reason: ""
    rho_veto: false

信頼信号: [user_consent, 辞書_inline, no_imperatives, yaml_parseable]
