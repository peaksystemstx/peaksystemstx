# peaksystemstx-website

Static site for Peak Systems. The live site is on Netlify at `peaksystemstx.com`
and is published by **dragging the `site` folder into Netlify by hand** (see
`README.md`) — nothing in this repo deploys to production. This repo's GitHub
Pages deploy is a **preview** copy only.

Preview URL: https://eddie-knight.github.io/peaksystemstx-website/

## Changes must reach the preview site for review

Eddie reviews changes on the preview site, not in the terminal. A change that
is only committed locally is not reviewable, so a session that edits the site
is not done until the preview is live.

**Any time Eddie is in a remote-control session discussing this site:**

1. Commit the change locally.
2. `git push origin main` — **no permission needed, don't ask.** This repo is
   an explicit exception to the global no-push rule. `--force` in any form and
   `gh pr create` still require asking, every time.
3. Watch the Pages deploy: `gh run watch` (workflow: `pages-preview.yml`).
4. When it succeeds, send a **push notification** — not just a chat message —
   with the preview URL. He may have left the session by then.

If the deploy fails, notify with the failure, not silence.

Pushing needs a dedicated passphrase-less deploy key via `core.sshCommand` in
this repo. If a push fails on auth, that setup is missing — say so rather than
falling back to the default key.
