# peaksystemstx-website

Static site for Peak Systems, live at `peaksystemstx.com`.

**GitHub Pages is production.** Every push to `main` deploys `site/` as-is via
`.github/workflows/pages.yml`. The domain is served through Cloudflare DNS with
the custom domain set in the repo's Settings → Pages. There is no build step —
what's in `site/` is what visitors see. (The old Netlify drag-and-drop flow in
`README.md` is retired.)

## Pushing = deploying. Ask first, every time.

Because a push to `main` goes straight to the live site, this repo is **no
longer** an exception to the global no-push rule (exception revoked 2026-08-23,
when Pages became production). Commit locally, then ask Eddie before pushing —
or let him push himself. `--force` and `gh pr create` require asking as always.
