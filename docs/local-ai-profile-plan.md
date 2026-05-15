# Optional local-AI / house brain profile plan

Status: planning doc only. Do not treat this as a tested installer profile until each service is verified on a clean Mac mini.

## Goal

Add an optional profile for a private local-AI automation box:

- Ollama for local model serving.
- n8n for workflow automation.
- AnythingLLM **or** Open WebUI for chat/RAG UI.
- Qdrant **or** Chroma for vector storage, depending on the chosen UI/tooling.
- Telegram bot/webhook path for lightweight interaction.
- launchd persistence so the stack survives reboot/login reliably on macOS.

## Recommended first paid-service shape

For the £799 local-AI setup tier, keep the promise practical:

- Install and verify one local model in Ollama.
- Configure one chat UI against Ollama.
- Configure one vector store if RAG is in scope.
- Configure n8n locally and build one harmless demo workflow.
- Draft Telegram integration steps but do not take custody of bot tokens.
- Add monitoring for the local-AI services in Uptime Kuma.
- Document update, stop/start, backup, and token-rotation notes.

Avoid promising “fully autonomous agents” or production business automation without a separate risk review.

## Proposed service choices

### Base runtime

- OrbStack/Docker for containerised apps.
- Native Ollama app or Homebrew Ollama for model serving.
- Tailscale for private access.
- Uptime Kuma for health checks.
- Optional LaunchAgent for Docker profile startup.

### Chat/RAG option A: AnythingLLM path

Best for buyers who want a simple workspace/document-chat product.

Candidate components:

- Ollama running locally on macOS.
- AnythingLLM container or app, configured to use Ollama.
- Chroma or built-in vector storage if supported by the chosen current AnythingLLM release.
- Local document folder mounted explicitly, never broad home-directory mounts.

Risks/checks:

- Confirm current AnythingLLM deployment docs before adding compose.
- Keep document paths narrow and redacted.
- Avoid importing private documents during a demo unless buyer explicitly chooses them.

### Chat/RAG option B: Open WebUI + Qdrant/Chroma path

Best for buyers who want a more technical OpenAI-like local chat UI and flexible retrieval.

Candidate components:

- Ollama on host.
- Open WebUI in Docker, pointing at `host.docker.internal` for Ollama.
- Qdrant or Chroma in Docker for vector storage if the selected flow requires it.
- Optional model/prompt/workspace conventions documented in handover.

Risks/checks:

- Confirm current Open WebUI env vars and volume paths.
- Do not expose the UI publicly without auth and reverse-proxy review.
- Avoid storing API keys in compose; use `.env` and buyer-owned secrets.

## n8n automation plan

Candidate scope for a first setup:

- Run n8n on LAN/tailnet only.
- Set a timezone and persistent volume.
- Create an owner account during screenshare; buyer enters credentials.
- Build one demo workflow:
  - manual trigger;
  - call Ollama/local chat endpoint;
  - write a result to a local test note/log;
  - optional Telegram response if buyer has created a bot token.

Boundaries:

- No production business workflow without review.
- No email/calendar/message sending enabled by default.
- No credential custody; buyer owns and enters tokens.
- Workflows that send messages or perform external actions need explicit human approval steps.

## Telegram integration plan

Use Telegram only as an optional interface, not a dependency.

Checklist:

- Buyer creates the bot with BotFather and keeps the token private.
- Token goes into local `.env`, never screenshots or git.
- Start with inbound test messages and local responses only.
- Add allow-listing for buyer chat ID before any action-capable workflow.
- Keep “send external message”, “spend money”, “delete files”, and “change credentials” behind manual confirmation.

## launchd persistence plan

The existing installer already has an opt-in LaunchAgent path for selected Docker profiles. Extend carefully:

- Add a future `ai` Docker Compose profile only after clean-machine testing.
- Include AI services in the generated starter script through compose profiles, not separate hidden daemons.
- For native Ollama, document the chosen persistence path separately:
  - app login item, or
  - Homebrew service, or
  - explicit LaunchAgent.
- Log stdout/stderr under the install directory.
- Document unload/disable commands in `docs/operations.md` before shipping.

## Draft compose profile sketch

This is illustrative only; verify current upstream images/env vars before implementation.

```yaml
services:
  n8n:
    profiles: ["ai"]
    image: n8nio/n8n:latest
    ports: ["5678:5678"]
    volumes: ["./data/n8n:/home/node/.n8n"]
    environment:
      - TZ=${TZ}
    restart: unless-stopped

  qdrant:
    profiles: ["ai"]
    image: qdrant/qdrant:latest
    ports: ["6333:6333"]
    volumes: ["./data/qdrant:/qdrant/storage"]
    restart: unless-stopped
```

Do not add this to the real compose file until tested and reviewed.

## Preflight for a paid local-AI setup

- [ ] Confirm Mac model, RAM, free disk, macOS version, and Apple Silicon.
- [ ] Confirm whether buyer needs privacy/local-only or is okay with cloud APIs.
- [ ] Pick one first model and document realistic speed/quality expectations.
- [ ] Confirm whether documents contain sensitive data.
- [ ] Confirm backup plan for n8n workflows and vector store data.
- [ ] Confirm no public exposure by default.
- [ ] Confirm human-approval boundaries for any workflow that sends messages, changes files, spends money, or calls external APIs.

## Exit criteria before making this an installer profile

- [ ] Clean Mac mini dry-run documented.
- [ ] Compose config validates with the `ai` profile.
- [ ] Ollama host connectivity works from containers.
- [ ] n8n data persists across restart.
- [ ] Chosen chat UI persists settings across restart.
- [ ] Uptime Kuma checks exist for each AI service.
- [ ] Operations docs include stop/start/update/backup/restore notes.
- [ ] Redaction checklist covers tokens, chat IDs, document names, and model logs.
