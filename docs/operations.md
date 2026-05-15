# Operations

```bash
cd ~/mac-mini-homelab

docker compose --profile monitoring --profile dns up -d
docker compose ps
docker compose logs --tail=100 uptime-kuma
docker compose pull && docker compose --profile monitoring --profile dns up -d
```

Troubleshooting:

```bash
orb status || open -a OrbStack
docker info
lsof -i :3000
lsof -i :53
```

Backup service configs:

```bash
rsync -av ~/mac-mini-homelab/data/ /Volumes/BackupDrive/mac-mini-homelab-data/
```
