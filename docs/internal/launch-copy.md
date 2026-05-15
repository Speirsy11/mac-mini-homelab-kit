# Launch copy drafts — approval gated

These are drafts only. Do not post, publish, submit, DM, email, or create offer pages from this file without explicit approval from Charlie.

## Approval gates

Before any external use:

- [ ] Confirm the final public GitHub URL and repo owner.
- [ ] Run `docs/redaction-and-publish-checklist.md`.
- [ ] Confirm whether paid services are being offered now or only mentioned as “coming later”.
- [ ] Confirm support boundaries and response expectations.
- [ ] Re-run the verification commands in the README/checklist.
- [ ] Do one final scan for personal paths, hostnames, LAN IPs, tokens, screenshots, and real emails.

## GitHub repo description

Beginner-friendly Mac mini homelab starter kit: safe monitoring, logs, DNS/ad-blocking, Tailscale-first access, and optional paths for media, photos, password vaults, and local AI.

Shorter version:

Mac-first homelab starter kit for Apple Silicon: monitoring, DNS, safe defaults, and local-AI expansion notes.

## README/GitHub about blurb

Turn an Apple Silicon Mac mini into a useful home server without starting with racks, Proxmox, or unsafe public exposure. This kit begins with a conservative monitoring + DNS stack, explains the tradeoffs, and marks higher-risk services like photos, password vaults, reverse proxies, and local-AI agents as opt-in paths.

## Reddit draft

Title options:

- I made a beginner-friendly Mac mini homelab starter kit
- Mac mini homelab kit: monitoring, DNS, Tailscale-first access, and local-AI notes
- Turning an Apple Silicon Mac mini into a safe starter homelab

Post draft:

I’ve been using a Mac mini as a small home server / local automation box, and I pulled the repeatable bits into a starter kit.

It is intentionally conservative: dry-run first, monitoring/logs/DNS as the starter profile, Tailscale/LAN before public exposure, and clear warnings around photos, password vaults, reverse proxies, and anything holding real secrets.

What it covers:

- OrbStack-based Docker setup on macOS
- Uptime Kuma and Dozzle for visibility
- AdGuard Home in test mode before router DNS changes
- optional notes for Jellyfin/media, Immich/photos, Vaultwarden, Caddy, and local-AI/automation
- security/backup and day-2 operations checklists

What it does not do:

- no port forwarding by default
- no credential handling
- no piracy/media sourcing
- no claim that every optional upstream app is always current

I’d appreciate feedback from Mac mini/self-hosting folks, especially on beginner safety, docs clarity, and what should stay out of scope.

Link: <FINAL_GITHUB_URL>

## Hacker News draft

Title:

Show HN: Mac Mini Homelab Kit — beginner-friendly Apple Silicon home server setup

Text:

I made a small Mac-first homelab starter kit for Apple Silicon Mac mini owners. It starts with a conservative monitoring/logs/DNS profile and docs for safe next steps rather than jumping straight to public exposure or high-risk services.

The angle is: dry-run first, LAN/Tailscale first, and explicit warnings before photos, password vaults, reverse proxies, or local-AI/agent integrations. It uses OrbStack/Docker Compose for the starter services and keeps native app guidance where macOS is a better fit.

Feedback welcome, especially from people running Mac minis as low-power home servers.

Link: <FINAL_GITHUB_URL>

## Short service-offer blurb

Need help turning a Mac mini into a safe home server or local-AI box? I’m drafting a Mac-first setup review/service around this kit: starter monitoring, private remote access, DNS/ad-blocking test mode, media/local-AI planning, and clear boundaries around photos, password vaults, backups, and public exposure.

No credential custody, no unsafe port-forward-by-default setup, and no managed-hosting promises. Start with a review, then only implement the profiles that match your risk tolerance.

## One-line social post draft

I’m polishing a beginner-friendly Mac mini homelab kit: dry-run installer, monitoring/logs/DNS starter stack, Tailscale-first safety, and optional local-AI/media/photos/vault paths. Looking for feedback before I turn it into a proper launch.
