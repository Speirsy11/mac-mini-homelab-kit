# Publish readiness review — 2026-05-15 final audit

Internal review only. Do not publish, push, post, submit, create offer pages, or contact anyone without Charlie's explicit approval.

## Readiness verdict

**Verdict: near-ready for an approval-gated public repo polish/publish step.**

The working tree now has a coherent public-facing package: safer README positioning, docs index/decision tree, service offer, redaction checklist, local-AI profile plan, and launch-copy drafts. Lightweight verification passed. No working-tree secrets were found by the available scanner fallback.

Recommended launch angle: **Mac mini homelab starter kit with local-AI/house-brain expansion path**. Lead with safe first win + Mac-specific setup friction; mention local AI as the differentiated expansion, not as the only promise.

## What changed in this run series

- `README.md`: stronger positioning, safer goal statement, clone-first guidance, “What this is”, “Choose your path”, docs links, and clearer deferred-risk framing.
- `docs/README.md`: docs index and decision tree by user goal.
- `docs/service-offer.md`: free repo, £199 setup review, and £499/£649/£799 remote setup tiers with boundaries and acceptance criteria.
- `docs/redaction-and-publish-checklist.md`: pre-publication checklist for secrets, paths, screenshots, installer safety, support/liability, license, and final command bundle.
- `docs/local-ai-profile-plan.md`: optional local-AI/house-brain plan without deploying anything.
- `docs/launch-copy.md`: approval-gated GitHub/Reddit/HN/service/social copy drafts.
- `docs/product-brief.md`: links to service offer and publish checklist.
- This file: internal readiness assessment and approval packet.

## Verification performed

Final audit passed on 2026-05-15 chunk 10:

```bash
bash -n scripts/install.sh
./scripts/install.sh --dry-run --no-native
docker compose --env-file stack/.env.example -f stack/docker-compose.yml --profile monitoring --profile dns config >/tmp/mac-mini-homelab-compose-config-final.yml
git diff --check
grep -RInE --exclude-dir=.git --exclude='publish-readiness-review.md' '<secret/personal-data pattern>' .
```

Final audit findings:

- No obvious tokens, private keys, real `.env`, passwords, API keys, or LAN IPs found in the working tree by grep fallback.
- Remaining matches are approval/identity decisions, not accidental secrets: real name in `LICENSE`, `Speirsy11` clone URL in `README.md`, and Charlie/internal references in strategy docs.
- Recommendation unchanged: publish via a cleaned public file set or fresh public initial commit after moving/excluding internal docs.

Earlier chunk 4 checks also passed on 2026-05-15:

```bash
bash -n scripts/install.sh
./scripts/install.sh --dry-run --no-native
docker compose --env-file stack/.env.example -f stack/docker-compose.yml --profile monitoring --profile dns config >/tmp/mac-mini-homelab-compose-config.yml
git diff --check
python3 markdown link/smoke check over README.md and docs/*.md
```

Scanner availability:

- `gitleaks`: not installed.
- `trufflehog`: not installed.
- `rg`: not installed.
- `grep`: available and used as fallback.

Fallback redaction scan command used:

```bash
grep -RInE --exclude-dir=.git --exclude='publish-readiness-review.md' '(AKIA[0-9A-Z]{16}|ghp_[A-Za-z0-9_]{20,}|github_pat_[A-Za-z0-9_]{20,}|sk-[A-Za-z0-9_-]{20,}|xox[baprs]-[A-Za-z0-9-]{10,}|BEGIN (RSA|OPENSSH|EC|DSA) PRIVATE KEY|password\s*=|passwd\s*=|secret\s*=|token\s*=|api[_-]?key\s*=|[0-9]{1,3}(\.[0-9]{1,3}){3}|charliespeirs|Charlie|Speirsy11)' .
```

Redaction scan results:

- No obvious tokens, private keys, real `.env`, passwords, API keys, or LAN IPs found in the working tree.
- Expected/potentially public-personal matches:
  - `LICENSE`: `Copyright (c) 2026 Charlie Speirs`.
  - `docs/launch-copy.md`, `docs/redaction-and-publish-checklist.md`, `docs/product-brief.md`: internal approval references to Charlie.
  - `README.md`: clone URL points to `https://github.com/Speirsy11/mac-mini-homelab-kit.git`.

## Risks and approval decisions

1. **Public identity / repo owner**
   - Current README uses `Speirsy11/mac-mini-homelab-kit`.
   - License uses Charlie's real name.
   - Decision needed: publish under this identity, change owner/name, or use a fresh public repo/org.

2. **Internal docs in public repo**
   - `docs/product-brief.md`, `docs/service-offer.md`, `docs/launch-copy.md`, and this review are revenue/internal strategy docs.
   - Recommendation: keep `docs/service-offer.md` public only if Charlie wants the paid offer visible. Keep `docs/product-brief.md`, `docs/launch-copy.md`, and `docs/publish-readiness-review.md` internal or move them out before public launch.

3. **Scanner strength**
   - Only grep fallback ran because stronger tools are not installed.
   - Recommendation before public push: either approve installing/running `gitleaks`/`trufflehog` or run equivalent scanners on another machine/CI.

4. **Git history / author metadata**
   - `.git` history currently contains GitHub noreply author metadata: `Speirsy11 <99479680+Speirsy11@users.noreply.github.com>`.
   - Remote is `git@github.com:Speirsy11/mac-mini-homelab-kit.git`.
   - No local personal email observed in the sampled git log; history appears to be a single public-identity commit, but `.git` is not part of the working tree scan.
   - Recommendation: if publishing from this repo, author metadata is probably acceptable if `Speirsy11` is the intended identity. For maximum cleanliness, publish via a fresh public initial commit after moving/removing internal docs, rather than rewriting this repo's history.

5. **Revenue promise / availability**
   - Service copy is plausible and bounded, but Charlie must confirm whether paid setup/review is actually available now.
   - Recommendation: first public post should ask for feedback on the free repo and mention setup help only softly unless availability is confirmed.

## Approval packet

Charlie should explicitly approve or reject these before external action:

- Final public GitHub owner/repo URL.
- Whether to publish with real name in `LICENSE` and `Speirsy11` clone URL.
- Whether `docs/service-offer.md` is public now, private for now, or converted into a short “Services coming later” section.
- Whether to remove/move internal docs before public launch: `docs/product-brief.md`, `docs/launch-copy.md`, `docs/publish-readiness-review.md`.
- Launch angle: broad Mac mini homelab vs Mac mini homelab + local-AI/house-brain.
- Offer ladder: include £49-£99 paid pack, or simplify to free repo + £199 review + £499-£799 setup.
- Permission to install/run stronger scanners (`gitleaks`, `trufflehog`, `rg`) or use an external scanner.
- Permission to create/push a public branch/repo and/or post launch copy.

## Exact next commands if Charlie approves

Assuming Charlie approves publishing under the current `Speirsy11/mac-mini-homelab-kit` repo and wants internal strategy docs kept out of the public commit:

```bash
cd /Users/charliespeirs/Developer/mac-mini-homelab-kit

# Optional but recommended: move internal docs out before public commit.
mkdir -p /Users/charliespeirs/brain/projects/income-engine/mac-mini-homelab-internal
mv docs/product-brief.md docs/launch-copy.md docs/publish-readiness-review.md \
  /Users/charliespeirs/brain/projects/income-engine/mac-mini-homelab-internal/

# Re-run checks.
bash -n scripts/install.sh
./scripts/install.sh --dry-run --no-native
docker compose --env-file stack/.env.example -f stack/docker-compose.yml --profile monitoring --profile dns config >/tmp/mac-mini-homelab-compose-config.yml
git diff --check
grep -RInE --exclude-dir=.git '(AKIA[0-9A-Z]{16}|ghp_[A-Za-z0-9_]{20,}|github_pat_[A-Za-z0-9_]{20,}|sk-[A-Za-z0-9_-]{20,}|xox[baprs]-[A-Za-z0-9-]{10,}|BEGIN (RSA|OPENSSH|EC|DSA) PRIVATE KEY|password\s*=|passwd\s*=|secret\s*=|token\s*=|api[_-]?key\s*=|[0-9]{1,3}(\.[0-9]{1,3}){3}|/Users/|charliespeirs)' . || true

# Commit locally only after reviewing git diff.
git status --short
git diff -- README.md docs scripts stack caddy .gitignore LICENSE
git add README.md docs scripts stack caddy .gitignore LICENSE
git commit -m "Prepare Mac mini homelab kit for public launch"

# External action: run only after explicit final push approval.
git push origin HEAD
```

If Charlie wants maximum-clean public history instead:

```bash
cd /Users/charliespeirs/Developer
mkdir mac-mini-homelab-kit-public
rsync -a --exclude .git --exclude docs/product-brief.md --exclude docs/launch-copy.md --exclude docs/publish-readiness-review.md \
  mac-mini-homelab-kit/ mac-mini-homelab-kit-public/
cd mac-mini-homelab-kit-public
git init
git add .
git commit -m "Initial public Mac mini homelab kit"
# Then create/connect the GitHub repo and push only after explicit approval.
```
