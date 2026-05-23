# Podervianskyi Spinner Verbs — a Claude Code plugin

Replaces Claude Code's spinner words (the little "Discombobulating…" / "Pondering…"
labels) with Ukrainian phrases. Ships **three packs** you pick from on install — in the
style of playwright **Лесь Подерв'янський** (Les Podervianskyi), a profanity-free variant,
and a set of Ukrainian political memes.

## The three packs

```text
Regular (Podervianskyi)        SFW-light                 Political memes
─────────────────────────      ──────────────────        ────────────────────────────
⠋ Хуйня якась…                 ⠋ Думку гоняю…            ⠋ Астанавітєсь!…
⠙ Там масла дохуя!…            ⠙ Буття визначає код…     ⠹ В мене калізія…
⠹ Кажись піздєц!…              ⠸ Філософствую тіхо…      ⠼ Боже, дапамажи…
⠸ В пизду Брамса!…             ⠴ Сократ би заплакав…     ⠦ Сьогодні буде дощ. Або сніг…
88 verbs · NSFW                72 verbs · clean          116 verbs · some strong language
```

> ⚠️ **Strong language / NSFW.** The Regular and Political packs contain profanity (surzhyk
> phrases from Podervianskyi's plays and political quotes). Pick **SFW-light** if you want it clean.

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

> ⚠️ Run these **one at a time** — paste a single command, press Enter, wait, then the next.
> Pasting them all at once makes `/plugin marketplace add` swallow the rest as a broken URL.

**1. Add the marketplace:**

```text
/plugin marketplace add bgpntx/podervianskyi-spinner
```

**2. Install the plugin:**

```text
/plugin install podervianskyi-spinner@spinner-verbs
```

**3. Install the verbs** — run this, and you'll be **asked which pack** you want:

```text
/podervianskyi-spinner:install
```

| Pack | Contents | Verbs |
| --- | --- | --- |
| **Regular** | Full Podervianskyi — verbatim quotes, strong language / NSFW | 88 |
| **SFW-light** | Same absurdist vibe, no profanity | 72 |
| **Political memes** | Ukrainian Kuchma→wartime quotes: Azarov-isms, Klitschko, Moskal, бавовна & co. (some strong language) | 116 |

Prefer to skip the prompt? Two direct shortcuts also exist:
`/podervianskyi-spinner:install-sfw` and `/podervianskyi-spinner:install-political`.

**4. Restart Claude Code.**

Either installer backs up your existing `~/.claude/settings.json` (as
`settings.json.bak-<timestamp>`) before writing, and uses `mode: "replace"` (only these verbs
show). Re-run the other command anytime to switch packs.

Requires [`jq`](https://jqlang.github.io/jq/).

## Updating (after the verb list changes)

This plugin doesn't apply verbs live — the install command **copies** the verbs into your
`~/.claude/settings.json` once. So pulling a new version of the plugin does **not** change your
spinner on its own. After the verb list is updated in the repo, run these **one at a time**:

```text
/plugin marketplace update spinner-verbs
```

```text
/podervianskyi-spinner:install
```

Then **restart Claude Code**. (Use `:install-sfw` instead in step 2 if you're on the SFW pack.)

Without step 2 the spinner keeps showing the verbs from your last install — `settings.json` holds
a static snapshot, not a live link to the plugin.

## Manual install (no plugin)

Don't want a plugin? Just merge this into `~/.claude/settings.json` yourself — copy the
`spinnerVerbs` object from
[`assets/spinner-verbs.json`](plugins/podervianskyi-spinner/assets/spinner-verbs.json) (full)
or [`assets/spinner-verbs-sfw.json`](plugins/podervianskyi-spinner/assets/spinner-verbs-sfw.json) (SFW-light):

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
├── skills/install/SKILL.md              # /podervianskyi-spinner:install            (pick a pack)
├── skills/install-sfw/SKILL.md          # /podervianskyi-spinner:install-sfw        (SFW-light)
├── skills/install-political/SKILL.md    # /podervianskyi-spinner:install-political  (political memes)
├── bin/install-verbs.sh                 # merges a verb pack into settings.json (with backup)
└── assets/
    ├── spinner-verbs.json               # 88 verbs (full / NSFW)
    ├── spinner-verbs-sfw.json           # 72 verbs (SFW-light, no profanity)
    └── spinner-verbs-political.json     # 116 verbs (Ukrainian political memes)
```

> Note: a Claude Code plugin **cannot** set `spinnerVerbs` automatically on enable — plugin-level
> settings only honor `agent` and `subagentStatusLine`. That's why this ships an explicit
> `/install` command instead of applying itself silently.
