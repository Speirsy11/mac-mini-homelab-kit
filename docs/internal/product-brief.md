# Product brief: Mac Mini Homelab Kit

## Customer

Mac mini owners who want self-hosting, media, monitoring, local AI/agent infrastructure, and private remote access, but do not want to learn Proxmox/Linux networking first.

## Pain

- Too many scattered guides.
- macOS container quirks: OrbStack onboarding, launchd startup, native vs Docker apps.
- Fear of exposing services insecurely.
- Confusion around Tailscale, reverse proxies, AdGuard, backups, and Immich/Vaultwarden risk.
- Local AI/agent trend creates demand for a “house brain” box.

## Offer ladder

1. Free repo: starter compose + installer + safety docs.
2. £49–£99 paid pack: screenshots, video walkthrough, printable checklist, update guide.
3. £199 setup review: advise on Mac/storage/network plan.
4. £499–£799 BYO setup service: remote/screenshare setup for Mac mini + Tailscale + monitoring + local AI apps.

See `docs/service-offer.md` for concrete deliverables, boundaries, support policy, and acceptance criteria.

## Scoring

- Speed: 5/5 — Charlie already has a working setup; this draft is extracted from it.
- Distribution: 4/5 — GitHub, Reddit/HN, Mac mini/selfhosted communities, OpenClaw/local AI overlap.
- Willingness to pay: 3.5/5 — paid service signal exists; paid template is less certain.
- Charlie fit: 5/5 — matches current homelab/OpenClaw/Mac mini interests.
- Defensibility/compounding: 3.5/5 — docs/scripts compound; community trust matters.
- Risk simplicity: 4/5 — safe if no public exposure/secrets and no external publishing without review.

## Validation plan

Internal only until approved:

- Run dry-run and shell syntax checks.
- Test installer into a temp directory.
- Compare Immich compose with official docs before including photos profile.
- Redact personal hostnames/IPs/screenshots.
- Use `docs/redaction-and-publish-checklist.md` before any public repo/post/offer-page step.

Approval-gated:

- Publish as GitHub repo.
- Post a non-spammy Show HN/Reddit guide.
- Offer 3 free setup reviews to collect objections.
- Create paid Gumroad/Polar pack or setup-service landing page.
