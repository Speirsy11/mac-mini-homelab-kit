# Setup guide

## 1. Install starter stack

```bash
./scripts/install.sh --apply --profiles monitoring,dns
```

If OrbStack opens an onboarding flow, finish it, then rerun the same command.

## 2. Tailscale first, public internet later (maybe never)

Install and log in to Tailscale. Access services from your tailnet using the Mac mini MagicDNS name or Tailscale IP.

Do **not** port-forward these services to the internet. If you later need public access, use a reviewed reverse proxy/Tunnel/Funnel plan for one service at a time.

## 3. Configure monitoring

Open Uptime Kuma at <http://localhost:3100>, create the admin user, then add monitors for:

- Uptime Kuma itself: `http://uptime-kuma:3001`
- Dozzle: `http://dozzle:8080`
- AdGuard Home web: `http://adguardhome:80`
- Native Jellyfin after install: `http://host.docker.internal:8096/System/Info/Public`
- OpenClaw gateway if used: TCP `host.docker.internal:18789`

## 4. Configure AdGuard carefully

Open <http://localhost:3000> and complete first-run setup. Test from one client before changing router DNS. Keep a rollback note: router DNS back to ISP/Cloudflare/Google if household internet breaks.

## 5. Jellyfin native on macOS

Install Jellyfin as a macOS app, not a Docker container, so Apple VideoToolbox hardware transcoding is available. Point libraries at your media folders.

## 6. Enable media only after storage exists

Set `MEDIA_ROOT=/Volumes/MediaRAID` in `.env`, create:

```text
/Volumes/MediaRAID/movies
/Volumes/MediaRAID/tv
/Volumes/MediaRAID/downloads/complete
/Volumes/MediaRAID/downloads/incomplete
```

Then:

```bash
docker compose --profile media up -d
```

## 7. Immich note

Immich changes quickly. Before storing real photos, download/compare the current official Immich compose and environment docs, confirm database image/vector extension requirements, and test backup/restore.

## 8. Vaultwarden note

Do not use Vaultwarden for real passwords until HTTPS, backups, and signup locking are configured. After creating your account, set `SIGNUPS_ALLOWED=false`.
