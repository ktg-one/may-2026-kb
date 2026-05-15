# CONTEXT Packet Quick Start — Your Setup
> This is your local copy. The official README with the `{{YOUR_PACKET_FOLDER}}` variable
> is at `C:\Users\kevin\.claude\skills\context\README.md`

## Your Config
```
CONTEXT_PACKET_DIR = G:/.ktg-hub/packets/
```

## What's Here
```
G:/.ktg-hub/packets/
├── quickstart.md              ← this file
├── MM-DD-YYYY-*.md            ← dated context packets
├── ktg-cep-readme.md          ← CEP protocol docs
├── kevin-pl-tan-context-packet.yaml
└── [future packets land here]
```

## Which Agents Can Write Here
| Agent | File Access | How |
|-------|------------|-----|
| Claude Code | Yes | Direct file write |
| Claude Desktop | Yes | MCP filesystem server |
| Cursor / Windsurf / Cline | Yes | Direct file write |
| ChatGPT | With plugins | File tools or code interpreter |
| Gemini | With extensions | Google Drive or filesystem |
| Any web-only model | No | Outputs code block → you save manually |

## Paste Into Your Agents
Copy the agent instructions block from the official README (`README.md` → Packet Storage section).
Replace `{{YOUR_PACKET_FOLDER}}` with `G:/.ktg-hub/packets/`

## Tips
- One packet per session or major topic shift
- Any model can read any model's packets — cross-compatible
- Old packets don't expire — reload anytime for historical context
- For the full protocol: read SKILL.md in the CONTEXT skill folder
