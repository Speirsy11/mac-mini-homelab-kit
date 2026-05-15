# Docs index and decision tree

Start small. The safest Mac mini homelab is the one you can understand, back up, and roll back.

## If your goal is...

### “I want a safe first win”

1. Read [`setup-guide.md`](setup-guide.md).
2. Run `./scripts/install.sh --dry-run`.
3. Apply only `monitoring,dns` once the dry-run looks right.
4. Use [`operations.md`](operations.md) for start/stop/update commands.

Why: Uptime Kuma, Dozzle, and AdGuard test mode give you useful visibility without trusting the box with irreplaceable data.

### “I want private remote access”

1. Prefer Tailscale or LAN-only access first.
2. Avoid router port forwards while learning.
3. Do not expose admin UIs such as Dozzle, AdGuard, qBittorrent, or Uptime Kuma directly to the public internet.
4. Review [`security-backup-checklist.md`](security-backup-checklist.md) before any public hostname/reverse-proxy work.

### “I want DNS/ad-blocking”

1. Bring up AdGuard in test mode.
2. Point one device at it manually.
3. Confirm rollback steps before changing router DNS.
4. Keep a note of the router’s original DNS settings.

### “I want media”

1. Decide where media and app data live before installing services.
2. Prefer native Jellyfin on macOS if hardware transcoding matters.
3. Use Docker profiles for helper apps only when you understand ports, volumes, and updates.
4. This kit does not help source copyrighted media or bypass DRM.

### “I want photos”

1. Treat photos as real irreplaceable data.
2. Verify the current upstream Immich Docker Compose guidance before use.
3. Do not import your main library until backups and restore testing are done.
4. Keep Immich off the public internet unless you have reviewed HTTPS, auth, updates, and rollback.

### “I want a password vault”

1. Do not start with Vaultwarden as your first service.
2. Finish HTTPS/exposure review, backups, signup-locking, and restore testing first.
3. Keep an export/escape plan from day one.

### “I want local AI / a house brain”

1. Get the starter stack healthy first.
2. Read [`local-ai-profile-plan.md`](local-ai-profile-plan.md).
3. Pick one chat/workflow stack before adding vector databases and bots.
4. Keep AI tokens, Telegram bot tokens, and private documents out of git and screenshots.

## Reference docs

- [`setup-guide.md`](setup-guide.md) — first install walkthrough.
- [`operations.md`](operations.md) — day-2 commands and maintenance.
- [`security-backup-checklist.md`](security-backup-checklist.md) — safety checks before trusting the box.
- [`local-ai-profile-plan.md`](local-ai-profile-plan.md) — optional Ollama/workflow/chat profile plan.
- [`service-offer.md`](service-offer.md) — draft paid setup/review offer.
- [`redaction-and-publish-checklist.md`](redaction-and-publish-checklist.md) — checks before public launch.
- [`launch-copy.md`](launch-copy.md) — approval-gated public copy drafts.
- [`product-brief.md`](product-brief.md) — positioning and monetisation notes.
