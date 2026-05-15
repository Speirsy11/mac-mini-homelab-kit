# Mac Mini Homelab Kit

A beginner-friendly, Mac-first homelab starter kit for Apple Silicon Mac mini owners who want a useful 24/7 home server, private remote access, and a path toward local-AI/automation without Proxmox, racks, or weeks of yak-shaving.

**Goal:** start with a safe monitoring + DNS stack, learn the tradeoffs, and only then opt into higher-risk services like photos, passwords, public proxying, or local-AI integrations.

```bash
git clone https://github.com/Speirsy11/mac-mini-homelab-kit.git && \
  cd mac-mini-homelab-kit && \
  ./scripts/install.sh --dry-run
```

When you like the dry-run plan, apply the starter stack:

```bash
./scripts/install.sh --apply --profiles monitoring,dns
```

A true curl-pipe one-liner is intentionally deferred until the installer can verify checksums/releases. For now, clone first so you can inspect the script before running it.

## What this is

This repo is a practical starter path for turning an Apple Silicon Mac mini into a small home server:

- beginner-friendly commands and docs;
- macOS/OrbStack-first defaults rather than Linux-server assumptions;
- LAN/Tailscale-first access, with no public exposure by default;
- clear warnings for services that can hold real data or secrets;
- optional plans for media, photos, password vaults, and local AI/agent tooling.

It is not a managed hosting platform, a security certification, a piracy/media-sourcing guide, or a promise that every upstream container will stay current forever.

## What it installs/configures

Starter profile:

- OrbStack as the Docker runtime on macOS.
- Uptime Kuma for service monitoring.
- Dozzle for container logs.
- AdGuard Home for DNS/ad-blocking setup/testing.
- Optional native app installs: Tailscale and Jellyfin.
- Optional LaunchAgent to start the starter Docker profiles at login.

Deferred/advanced profiles:

- Media automation: Sonarr, Radarr, Prowlarr, qBittorrent.
- Photos: Immich, with a warning to check current upstream compose before storing real photos.
- Vault: Vaultwarden, only after HTTPS and backups are in place.
- Proxy: Caddy, after hostnames are chosen.

## Why Mac mini?

Current market signal suggests a clear niche: people are buying or reusing Mac minis for low-power self-hosting, local AI, media, and “house brain” agents. The gap is not raw technical possibility; it is setup friction, safe defaults, launchd/OrbStack weirdness, and knowing what **not** to expose.

## Quick start

```bash
./scripts/install.sh --dry-run
./scripts/install.sh --apply --profiles monitoring,dns
```

The installer is conservative:

- defaults to dry-run unless `--apply` is passed;
- refuses non-macOS hosts;
- creates `.env` from `.env.example` only if missing;
- starts only monitoring + DNS by default;
- does not point your router at AdGuard;
- does not expose services publicly;
- does not create accounts or store secrets.

## Choose your path

Not sure where to start? Use the [docs index and decision tree](docs/README.md). Short version:

- **I just want to see if this works:** run the dry-run, then the monitoring profile.
- **I want safer remote access:** set up Tailscale before thinking about public DNS or port forwards.
- **I want DNS/ad-blocking:** test AdGuard on one device before changing router DNS.
- **I want media:** start with Jellyfin/storage layout; do not mix this with public exposure work.
- **I want photos or passwords:** finish backups, HTTPS/exposure review, and restore testing first.
- **I want local AI / a house brain:** see the local-AI profile plan after the starter stack is healthy.

## Product packaging options

1. **Free GitHub repo + paid setup checklist** — easiest distribution, low trust barrier.
2. **£49–£99 paid template** — polished scripts, screenshots, and update checklists.
3. **£199 setup review / £499–£799 BYO setup service** — current market signal supports paid local-AI/Mac-mini setup services.

See [`docs/product-brief.md`](docs/product-brief.md) and [`docs/service-offer.md`](docs/service-offer.md).

## Safety stance

- Tailnet/LAN first; no port forwarding by default.
- Keep `.env` out of git.
- Run Jellyfin natively for VideoToolbox on macOS.
- Treat Immich/Vaultwarden as “real data” services: backups and HTTPS before use.
- Do not expose Dozzle, AdGuard, qBittorrent, or admin UIs publicly.

## Files

```text
scripts/install.sh          one-command installer/dry-run
stack/docker-compose.yml    starter Docker Compose profiles
stack/.env.example          safe defaults template
caddy/Caddyfile.example     placeholder Caddy routes
docs/README.md             docs index and decision tree
docs/setup-guide.md         walkthrough and configuration guide
docs/security-backup-checklist.md
docs/redaction-and-publish-checklist.md
docs/service-offer.md       paid tier/service packaging
docs/local-ai-profile-plan.md optional local-AI/house-brain plan
docs/launch-copy.md         approval-gated launch copy drafts
docs/product-brief.md       monetisation/scoring notes
docs/operations.md          day-2 maintenance commands
```
