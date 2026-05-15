# Redaction and publish checklist

Use this before making the repo public, posting screenshots, or linking it in an offer page.

## 1. Repository secrets and private data

- [ ] Run `git status --short` and review every changed/untracked file.
- [ ] Run a secret scan before publishing, for example `gitleaks detect --source . --no-git` if available.
- [ ] Confirm `.env` is not present in git and `.env.example` contains placeholders only.
- [ ] Search for real tokens, passwords, cookies, API keys, bot tokens, OAuth secrets, and private keys.
- [ ] Search for personal hostnames, Tailnet names, MagicDNS domains, local usernames, home paths, public IPs, LAN IPs, MAC addresses, serial numbers, and router/admin URLs.
- [ ] Search for customer/client names or copied support logs.
- [ ] Check shell history snippets, terminal transcripts, and logs before adding any to docs.

Suggested local checks:

```bash
git status --short
git diff --check
rg -n "(token|secret|password|passwd|api[_-]?key|bearer|cookie|tailscale|tailnet|192\.168\.|10\.|172\.(1[6-9]|2[0-9]|3[01])\.|/Users/)" .
```

## 2. Personal paths and environment assumptions

- [ ] Replace `/Users/<name>/...` with `~/...` or `/Volumes/ExampleDrive/...`.
- [ ] Replace real volume names with examples such as `/Volumes/MediaRAID`.
- [ ] Replace real domains with `example.com` or `mac-mini.your-tailnet.ts.net`.
- [ ] Replace real router/DNS/provider names if they reveal household setup.
- [ ] Confirm commands are copy-pasteable for a new user and not bound to Charlie's machine.

## 3. Screenshots and videos

- [ ] Crop menu bar if it shows name, Apple ID, location, VPN, calendar, or message previews.
- [ ] Blur terminal prompt username/hostname and full paths.
- [ ] Blur Tailscale device names, IPs, tailnet name, and auth/account details.
- [ ] Blur Uptime Kuma monitor URLs, notification destinations, and incident history.
- [ ] Blur AdGuard query logs, client names, domains visited, and DNS upstream details.
- [ ] Blur Docker/OrbStack container env vars and mounted host paths if personal.
- [ ] Avoid showing browser profiles, bookmarks, email, chat, or account switchers.
- [ ] Rewatch final videos at 1x speed before publishing.

## 4. Installer and compose safety

- [ ] Installer defaults to dry-run and requires `--apply` before changes.
- [ ] Installer refuses non-macOS hosts.
- [ ] No `curl | bash` public instruction unless release checksums and script review story exist.
- [ ] No automatic router changes, DNS changes, public tunnels, port forwards, or account creation.
- [ ] No default public exposure of Dozzle, AdGuard, qBittorrent, Uptime Kuma, Vaultwarden, or admin UIs.
- [ ] `.env.example` values are safe placeholders; any default password says `change_me...`.
- [ ] LaunchAgent is opt-in and easy to unload.
- [ ] Docs explain how to stop containers and roll back DNS/router changes.

## 5. Support and liability boundaries

- [ ] README and service offer state that this is not managed hosting or 24/7 support.
- [ ] Support channels and expected response style are defined before inviting issues.
- [ ] Paid tiers include exact deliverables, follow-up window, and out-of-scope work.
- [ ] No promise of uptime, data recovery, security certification, or compatibility with every router/ISP.
- [ ] Photos/password services require backups, HTTPS/exposure review, and restore testing before real use.
- [ ] Media docs do not encourage piracy, copyrighted-content sourcing, or DRM bypass.
- [ ] AI/automation docs warn that model outputs and workflow actions need human review.

## 6. License and attribution

- [ ] Confirm the root `LICENSE` matches intended distribution.
- [ ] Attribute third-party services/apps by name without implying endorsement.
- [ ] Do not copy large sections from upstream docs; link users to official docs for fast-moving services.
- [ ] Check logos/screenshots for trademark-sensitive use before an offer page.
- [ ] If accepting paid work, use a simple written scope/terms before the session.

## 7. Public-post readiness

- [ ] README has a clear audience, install path, safety stance, and what is intentionally deferred.
- [ ] `docs/service-offer.md` is internally reviewed and prices are intentional.
- [ ] `docs/local-ai-profile-plan.md` is labelled as a plan until tested end-to-end.
- [ ] Known limitations are listed instead of hidden.
- [ ] First post has a narrow ask, e.g. “does this solve setup friction for Mac mini homelab beginners?” rather than spammy selling.
- [ ] Approval obtained from Charlie before publishing, posting, outreach, paid listing, or account creation.

## 8. Final pre-publish command bundle

Run from repo root:

```bash
bash -n scripts/install.sh
git diff --check
./scripts/install.sh --dry-run --no-native
docker compose --env-file stack/.env.example -f stack/docker-compose.yml --profile monitoring --profile dns config >/tmp/mac-mini-homelab-compose.yml
```

If Docker Compose is unavailable, note that as a blocker instead of skipping silently.
