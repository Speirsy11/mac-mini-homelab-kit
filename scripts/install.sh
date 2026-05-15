#!/usr/bin/env bash
set -euo pipefail

ROOT_DEFAULT="$HOME/mac-mini-homelab"
PROFILES="monitoring,dns"
APPLY=0
INSTALL_NATIVE=1
INSTALL_LAUNCH_AGENT=0

usage() {
  cat <<USAGE
Mac Mini Homelab Kit installer

Usage:
  scripts/install.sh [--dry-run] [--apply] [--dir PATH] [--profiles monitoring,dns] [--no-native] [--launch-agent]

Defaults are conservative: dry-run, starter profiles only, no public exposure.

Options:
  --apply          Actually install/copy/start. Without this, prints planned actions.
  --dry-run        Force dry-run mode.
  --dir PATH       Install directory. Default: ~/mac-mini-homelab
  --profiles LIST  Docker Compose profiles to start. Default: monitoring,dns
  --no-native      Skip native Homebrew casks/apps (Tailscale, Jellyfin).
  --launch-agent   Create a user LaunchAgent to start selected profiles at login.
  -h, --help       Show help.
USAGE
}

log() { printf '\033[1;34m[homelab-kit]\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m[warn]\033[0m %s\n' "$*"; }
run() {
  if [[ "$APPLY" -eq 1 ]]; then
    log "+ $*"
    eval "$@"
  else
    printf '[dry-run] %s\n' "$*"
  fi
}

INSTALL_DIR="$ROOT_DEFAULT"
while [[ $# -gt 0 ]]; do
  case "$1" in
    --apply) APPLY=1 ;;
    --dry-run) APPLY=0 ;;
    --dir) INSTALL_DIR="${2:?missing path}"; shift ;;
    --profiles) PROFILES="${2:?missing profiles}"; shift ;;
    --no-native) INSTALL_NATIVE=0 ;;
    --launch-agent) INSTALL_LAUNCH_AGENT=1 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage; exit 2 ;;
  esac
  shift
done

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This kit is Mac-first and currently supports macOS only." >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_PROFILES=()
IFS=',' read -ra COMPOSE_PROFILES <<< "$PROFILES"

log "Install dir: $INSTALL_DIR"
log "Profiles: $PROFILES"
[[ "$APPLY" -eq 0 ]] && warn "Dry-run mode. Re-run with --apply to make changes."

if ! command -v brew >/dev/null 2>&1; then
  warn "Homebrew is missing. Install Homebrew first from https://brew.sh, then rerun."
  warn "This installer does not bootstrap Homebrew automatically because it requires interactive sudo/password prompts."
else
  run "brew list --cask orbstack >/dev/null 2>&1 || brew install --cask orbstack"
  if [[ "$INSTALL_NATIVE" -eq 1 ]]; then
    run "brew list --cask tailscale >/dev/null 2>&1 || brew install --cask tailscale"
    run "brew list --cask jellyfin >/dev/null 2>&1 || brew install --cask jellyfin"
  fi
fi

run "mkdir -p '$INSTALL_DIR' '$INSTALL_DIR/data' '$INSTALL_DIR/caddy'"
run "cp '$REPO_ROOT/stack/docker-compose.yml' '$INSTALL_DIR/docker-compose.yml'"
run "cp '$REPO_ROOT/stack/.env.example' '$INSTALL_DIR/.env.example'"
run "cp '$REPO_ROOT/caddy/Caddyfile.example' '$INSTALL_DIR/caddy/Caddyfile'"
if [[ ! -f "$INSTALL_DIR/.env" ]]; then
  run "cp '$REPO_ROOT/stack/.env.example' '$INSTALL_DIR/.env'"
else
  warn "$INSTALL_DIR/.env already exists; leaving it untouched."
fi

if command -v open >/dev/null 2>&1; then
  run "open -a OrbStack || true"
fi

if [[ "$APPLY" -eq 1 ]]; then
  for i in {1..60}; do
    if command -v docker >/dev/null 2>&1 && docker info >/dev/null 2>&1; then
      break
    fi
    sleep 2
  done
  if ! command -v docker >/dev/null 2>&1 || ! docker info >/dev/null 2>&1; then
    warn "Docker/OrbStack is not ready yet. Open OrbStack, finish onboarding, then run:"
    echo "  cd '$INSTALL_DIR' && docker compose $(printf -- ' --profile %q' "${COMPOSE_PROFILES[@]}") up -d"
    exit 0
  fi
fi

PROFILE_FLAGS=""
for p in "${COMPOSE_PROFILES[@]}"; do
  PROFILE_FLAGS="$PROFILE_FLAGS --profile $p"
done
run "cd '$INSTALL_DIR' && docker compose$PROFILE_FLAGS up -d"
run "cd '$INSTALL_DIR' && docker compose ps"

if [[ "$INSTALL_LAUNCH_AGENT" -eq 1 ]]; then
  PLIST="$HOME/Library/LaunchAgents/local.mac-mini-homelab-kit.plist"
  STARTER="$INSTALL_DIR/start-homelab.sh"
  if [[ "$APPLY" -eq 1 ]]; then
    cat > "$STARTER" <<SCRIPT
#!/usr/bin/env bash
set -euo pipefail
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
open -a OrbStack || true
for i in {1..60}; do docker info >/dev/null 2>&1 && break || sleep 2; done
cd "$INSTALL_DIR"
docker compose$PROFILE_FLAGS up -d
SCRIPT
    chmod +x "$STARTER"
    cat > "$PLIST" <<PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
  <key>Label</key><string>local.mac-mini-homelab-kit</string>
  <key>ProgramArguments</key><array><string>$STARTER</string></array>
  <key>RunAtLoad</key><true/>
  <key>StandardOutPath</key><string>$INSTALL_DIR/data/startup.out.log</string>
  <key>StandardErrorPath</key><string>$INSTALL_DIR/data/startup.err.log</string>
</dict></plist>
PLIST
    launchctl unload "$PLIST" >/dev/null 2>&1 || true
    launchctl load "$PLIST"
  else
    echo "[dry-run] write LaunchAgent $PLIST and starter $STARTER"
  fi
fi

cat <<NEXT

Next steps:
1. Open Tailscale and log in; keep services tailnet/LAN-only.
2. Visit Uptime Kuma: http://localhost:3100
3. Visit Dozzle:      http://localhost:9999
4. Visit AdGuard:     http://localhost:3000 (do not change router DNS until tested)
5. Read docs/setup-guide.md before enabling media/photos/vault/proxy profiles.
NEXT
