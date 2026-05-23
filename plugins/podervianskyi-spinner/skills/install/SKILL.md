---
description: Install the Podervianskyi spinner verbs into your Claude Code settings (replaces your spinner words)
disable-model-invocation: true
---

The user wants to install the Podervianskyi spinner verbs into their `~/.claude/settings.json`.

Run exactly this command:

```bash
bash "${CLAUDE_PLUGIN_ROOT}/bin/install-verbs.sh"
```

The script makes a timestamped backup of the user's settings, then sets `spinnerVerbs`
to `mode: "replace"` with the bundled verb list. It requires `jq`.

After it runs:
- Report how many verbs were installed (from the script output).
- Tell the user to **restart Claude Code** for the spinner to pick up the new words.
- If the script reports that `jq` is missing, tell the user to install it (`brew install jq`) and run `/podervianskyi-spinner:install` again.

Do not edit `settings.json` by hand — always use the script so the backup is created.
