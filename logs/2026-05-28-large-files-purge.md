---
title: Large-files purge — pre-push history rewrite
type: log
tags: [git, cleanup, kb-transfer]
sources: []
last_updated: 2026-05-28
---

# 2026-05-28 — Large-files purge

## Why

First push of `knowledge2026` → `ktg-one/may-2026-kb` was rejected by GitHub's pre-receive hook (100 MB hard cap per file). Three blobs in commit `204a70c "transfer"` exceeded the limit. To unblock the push, history was rewritten with `git-filter-repo` to excise the offending paths from every commit.

## What was removed

| Path | Size | Why it was junk |
|---|---|---|
| `OpenHuman_0.53.22_x64-setup.exe` | 136.55 MB | Unrelated installer that landed in the bulk "transfer" commit. Already deleted in working tree before the purge. |
| `.obsidian/plugins/mcp-tools/bin/mcp-server.exe` | 112.80 MB | Binary for the Obsidian `mcp-tools` plugin. Re-installable via the Obsidian plugin manager — does not belong in version control. |
| `assets/templates/homely-nextjs-tailwind-v1.zip` | 61.42 MB | Template archive. Below GitHub's 100 MB hard limit but above the 50 MB warning threshold; dropped to keep the repo lean. |

Total reclaimed: ~310 MB of blob storage. `.git` shrank from 434 MB to 196 MB.

## Mechanics

```bash
git-filter-repo --invert-paths \
  --path OpenHuman_0.53.22_x64-setup.exe \
  --path .obsidian/plugins/mcp-tools/bin/mcp-server.exe \
  --path assets/templates/homely-nextjs-tailwind-v1.zip \
  --force
```

Filter-repo strips the `origin` remote as a safety measure; re-added manually to `https://github.com/ktg-one/may-2026-kb` afterward.

## Effects

- All commit SHAs changed. Previous: `204a70c → cd1f354 → 9a762cc`. After rewrite: `5ca7ac3 → 75a2b1d → b5e64bc`. Commit messages preserved.
- The three files are gone from both `HEAD` and history. To get them back: re-download from source (OpenHuman setup, the Obsidian plugin, the template).
- `.gitignore` already covered `*.exe` and `*.zip` patterns (added in commit `cd1f354` *after* the offending "transfer" commit). No gitignore changes needed — the patterns prevent re-staging going forward.

## Authorization

Destructive rewrite + force-push were explicitly authorized in-session before execution. Remote was empty (`git ls-remote origin` returned nothing) so the force-push was a genuine first-push, not an overwrite of any prior history.
