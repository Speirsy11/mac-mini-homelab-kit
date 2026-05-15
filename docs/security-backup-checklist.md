# Security and backup checklist

## Network exposure

- [ ] No router port forwards for admin UIs.
- [ ] Tailscale installed and tested for remote access.
- [ ] macOS firewall enabled or reviewed.
- [ ] Dozzle, AdGuard, qBittorrent, and Uptime Kuma are LAN/tailnet only.
- [ ] Caddy/proxy profile disabled until hostnames and exposure model are reviewed.

## Secrets

- [ ] `.env` is gitignored and never published.
- [ ] Default Immich DB password changed before first run.
- [ ] Vaultwarden signups disabled after account creation.
- [ ] No API keys committed in compose, docs, screenshots, or logs.

## Backups

- [ ] `./data/` backed up regularly.
- [ ] Photos/media backup plan exists before Immich/media automation.
- [ ] Restore test completed for at least one service.
- [ ] Backup destination is not the same physical disk/enclosure.

## macOS operations

- [ ] Automatic updates policy chosen.
- [ ] Login/boot behavior verified after reboot.
- [ ] OrbStack starts before Docker profiles.
- [ ] Uptime Kuma alerts configured.

## Rollback

- [ ] Router DNS rollback known.
- [ ] `docker compose down` tested.
- [ ] LaunchAgent unload command documented if used.
