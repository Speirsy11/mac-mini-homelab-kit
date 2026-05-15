# Service offer: Mac Mini Homelab Kit

A Mac-first setup package for people who want a useful home server or local-AI box without spending weeks learning Docker, launchd, DNS, backups, and remote access the hard way.

## Who this is for

Best fit:

- Apple Silicon Mac mini owners using the machine as a 24/7 home server.
- Beginners/intermediates who want safe defaults and a guided setup.
- People who want LAN/tailnet-first access, monitoring, DNS/ad-blocking, media basics, or a local-AI/automation profile.

Not a fit:

- Enterprise production infrastructure.
- Public SaaS hosting with uptime guarantees.
- Piracy setup, seedbox management, or copyrighted-media sourcing.
- Security-sensitive password/photo deployments without backups and a reviewed exposure model.
- Hands-off managed hosting after setup.

## Tier 0 — Free repo

Price: **free**

Deliverables:

- Conservative macOS-first installer with dry-run default.
- Starter Docker Compose profiles for monitoring, logs, DNS/ad-blocking, proxy placeholder, vault placeholder, and media automation.
- Setup guide, operations notes, and security/backup checklist.
- Example Caddyfile and `.env.example` only — no real secrets.

Boundaries:

- Community/asynchronous support only if enabled later.
- No guarantee that every optional upstream app is current.
- No public exposure instructions by default; tailnet/LAN first.

Call to action:

- Run `./scripts/install.sh --dry-run`.
- Open an issue only after checking the docs and including OS, Mac model, command, and redacted logs.

## Tier 1 — Setup review

Price: **£199 fixed**

Format: 60-90 minute remote call plus a written action plan.

Deliverables:

- Review of buyer goals, Mac model/specs, storage, network, router constraints, backup plan, and risk tolerance.
- Recommended profile: starter homelab, media, photos, vault, proxy, or local-AI/automation.
- Exposure plan: LAN-only, Tailscale, or reviewed single-service public access.
- Backup and rollback plan before real photos/passwords/DNS changes.
- Written checklist with next steps and explicit “do not do this yet” items.

Boundaries:

- Advisory only; no implementation unless separately booked.
- No router changes, DNS changes, public exposure, credential entry, or account creation performed by default.
- No handling of secrets; buyer enters credentials privately.
- No emergency/on-call support.

Good outcome:

- Buyer knows exactly what to install first, what to defer, and what risks must be closed before trusting the box with important data.

## Tier 2 — Remote BYO setup

Price: **£499-£799 fixed**, depending on scope.

Recommended pricing:

- **£499 Starter setup**: monitoring, logs, Tailscale-first access, AdGuard test install, operations walkthrough.
- **£649 Home server setup**: starter setup plus native Jellyfin guidance, storage layout, basic media profile scaffolding, backup routine.
- **£799 Local AI / house brain setup**: starter setup plus local-AI/automation profile planning and installation walkthrough for Ollama + workflow/chat tooling.

Format: remote screenshare, 2-4 hours plus a short written handover. Buyer owns hardware and accounts.

Core deliverables for every setup:

- Preflight: macOS version, Apple Silicon, Homebrew, OrbStack/Docker, free disk space, admin access, backups.
- Install this repo into a buyer-owned directory.
- Run the installer in dry-run first, then apply only approved profiles.
- Configure Tailscale/LAN-first access and explain why no router port forwards are created by default.
- Bring up Uptime Kuma and Dozzle; add basic monitors.
- Configure AdGuard in test mode only; router DNS change is optional and reversible.
- Create a simple operations handover: start/stop/update commands, where data lives, and what to back up.

Optional deliverables by scope:

- Native Jellyfin install guidance for macOS VideoToolbox.
- Media folders and compose profile scaffolding, without sourcing content.
- Caddy/reverse-proxy planning after hostnames and exposure model are chosen.
- Vaultwarden readiness review; real password use only after HTTPS, backups, signup lock, and restore testing.
- Local-AI/automation profile: Ollama, n8n, AnythingLLM or Open WebUI, vector store choice, Telegram bot wiring plan, and launchd persistence plan.

Hard boundaries:

- No public port forwarding unless separately approved in writing during the session and limited to one reviewed service.
- No guarantee of upstream app stability; many images/apps change independently.
- No live production data migration without a backup/restore test.
- No credential custody. Buyer enters passwords/API tokens themselves.
- No ongoing managed service, incident response, or 24/7 support included.
- No illegal content sourcing, DRM bypass, or piracy workflows.
- No financial, legal, or security certification claims.

Acceptance criteria:

- Buyer can open the agreed services locally or over Tailscale.
- Buyer can run `docker compose ps` and identify healthy/unhealthy services.
- Buyer has a rollback note for DNS/router changes, if any.
- Buyer receives a handover doc with installed profiles, ports, data paths, update command, backup command, and deferred-risk list.

## Support policy draft

- Setup review includes one follow-up email/message within 7 days for clarifying the written plan.
- Remote setup includes 7 days of async bug-fix support for issues directly caused by the setup session.
- New services, hardware changes, ISP/router changes, and upstream app migrations are new work.
- Response-time SLA is not included unless a separate managed-support product is created.

## Suggested public positioning

Short version:

> A Mac mini homelab starter kit and setup service for people who want monitoring, private remote access, DNS/ad-blocking, media basics, and local-AI automation without unsafe public exposure.

Buyer-facing promise:

- Useful first, safe by default, boring to operate.
- Tailnet/LAN before public internet.
- Clear boundaries around photos, passwords, DNS, backups, and AI tokens.
