---
description: Install spinner verbs — pick from three packs (Regular Podervianskyi / SFW-light / Ukrainian political memes)
disable-model-invocation: true
---

The user wants to install one of the spinner-verb packs into their `~/.claude/settings.json`.

**Step 1 — ask which pack** (use the AskUserQuestion tool, single-select):

| Choice | Asset file | Notes |
| --- | --- | --- |
| **Regular** — Podervianskyi, full | `spinner-verbs.json` | verbatim quotes, strong language / NSFW |
| **SFW-light** — no profanity | `spinner-verbs-sfw.json` | same absurdist vibe, clean |
| **Political memes** — Ukrainian | `spinner-verbs-political.json` | Kuchma→wartime quotes, some strong language |

**Step 2 — install the chosen pack.** Run this, replacing `<ASSET>` with the file from the table:

```bash
bash "${CLAUDE_PLUGIN_ROOT}/bin/install-verbs.sh" <ASSET>
```

The script backs up the user's settings (timestamped), then sets `spinnerVerbs` to
`mode: "replace"` with the chosen pack. Requires `jq`.

**After it runs:**
- Report which pack was installed and how many verbs (from the script output).
- Tell the user to **restart Claude Code** for the spinner to pick up the new words.
- If `jq` is missing, tell them to install it (`brew install jq` / `sudo apt install jq`) and re-run `/podervianskyi-spinner:install`.

Do not edit `settings.json` by hand — always use the script so the backup is created.
The user can re-run this command anytime to switch packs.
