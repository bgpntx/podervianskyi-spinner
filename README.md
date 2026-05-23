# Podervianskyi Spinner Verbs — a Claude Code plugin

Replaces Claude Code's spinner words (the little "Discombobulating…" / "Pondering…"
labels) with phrases in the style of **Лесь Подерв'янський** (Les Podervianskyi).

> ⚠️ **Strong language / NSFW.** These are surzhyk phrases full of profanity, taken from
> and inspired by Podervianskyi's plays. Install only if that's the vibe you want in your terminal.

> 💻 **Claude Code CLI only.** `spinnerVerbs` customizes the terminal spinner. The Claude
> Desktop app has no text spinner with verbs, so custom verbs won't render there — the plugin
> installs fine but has no visible effect in the desktop GUI.

## Honest attribution

The author of these texts is **Лесь Подерв'янський** — a Ukrainian playwright and artist.
The verbatim phrases here are short quotes from his plays (*Гамлєт, або Феномен датського
кацапізму*, *Кацапи*, *Піздєц*, *Васіліса Єґоровна і мужікі / Масло*); the rest are humble
imitations written in his style.

I am **not** the author — just a skromний прихильник (a humble fan) who packaged a few lines
into a Claude Code plugin. All credit for the language and the genius behind it goes to Лесь.
If you enjoy this, go read/listen to the originals and support the real thing.

This packaging is released under MIT; the underlying texts remain the intellectual property of
their author. If the rights holder objects, open an issue and it comes down.

## Install

```text
/plugin marketplace add bgpntx/podervianskyi-spinner
/plugin install podervianskyi-spinner@spinner-verbs
/podervianskyi-spinner:install
```

Then **restart Claude Code**. The installer backs up your existing
`~/.claude/settings.json` (as `settings.json.bak-<timestamp>`) before writing.

Requires [`jq`](https://jqlang.github.io/jq/).

## Manual install (no plugin)

Don't want a plugin? Just merge this into `~/.claude/settings.json` yourself — copy the
`spinnerVerbs` object from
[`plugins/podervianskyi-spinner/assets/spinner-verbs.json`](plugins/podervianskyi-spinner/assets/spinner-verbs.json):

```json
{
  "spinnerVerbs": {
    "mode": "replace",
    "verbs": ["Хуйня якась", "Там масла дохуя!", "...etc"]
  }
}
```

`mode: "replace"` shows only these verbs. Use `"append"` to add them to Claude Code's defaults.

## Uninstall / revert

Restore the backup the installer made:

```bash
cp ~/.claude/settings.json.bak-<timestamp> ~/.claude/settings.json
```

…or just remove the `spinnerVerbs` key from `~/.claude/settings.json`.

## What's inside

```text
.claude-plugin/marketplace.json          # marketplace listing
plugins/podervianskyi-spinner/
├── .claude-plugin/plugin.json           # plugin manifest
├── skills/install/SKILL.md              # the /podervianskyi-spinner:install command
├── bin/install-verbs.sh                 # merges verbs into settings.json (with backup)
└── assets/spinner-verbs.json            # the 84 verbs
```

> Note: a Claude Code plugin **cannot** set `spinnerVerbs` automatically on enable — plugin-level
> settings only honor `agent` and `subagentStatusLine`. That's why this ships an explicit
> `/install` command instead of applying itself silently.
