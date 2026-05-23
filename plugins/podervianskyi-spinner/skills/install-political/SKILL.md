---
description: Install the Ukrainian political-meme spinner verbs into your Claude Code settings
disable-model-invocation: true
---

The user wants the Ukrainian political-meme spinner verbs in their `~/.claude/settings.json`.

Run exactly this command:

```bash
bash "${CLAUDE_PLUGIN_ROOT}/bin/install-verbs.sh" spinner-verbs-political.json
```

Same script as the other packs, but loads the political-meme verbs. It backs up the user's
settings, then sets `spinnerVerbs` to `mode: "replace"`. Requires `jq`.

After it runs:
- Report how many verbs were installed (from the script output).
- Tell the user to **restart Claude Code** for the spinner to pick up the new words.
- If `jq` is missing, tell them to install it (`brew install jq` / `sudo apt install jq`) and run
  `/podervianskyi-spinner:install-political` again.

Do not edit `settings.json` by hand — always use the script so the backup is created.
