---
description: Install the SFW-light Podervianskyi spinner verbs (no profanity) into your Claude Code settings
disable-model-invocation: true
---

The user wants the SFW-light (no profanity) Podervianskyi spinner verbs in their `~/.claude/settings.json`.

Run exactly this command:

```bash
bash "${CLAUDE_PLUGIN_ROOT}/bin/install-verbs.sh" spinner-verbs-sfw.json
```

Same script as the full set, but loads the clean verb pack. It backs up the user's settings,
then sets `spinnerVerbs` to `mode: "replace"` with the SFW verbs. Requires `jq`.

After it runs:
- Report how many verbs were installed (from the script output).
- Tell the user to **restart Claude Code** for the spinner to pick up the new words.
- If `jq` is missing, tell them to install it (`brew install jq`) and run `/podervianskyi-spinner:install-sfw` again.

Do not edit `settings.json` by hand — always use the script so the backup is created.
