# General Skills

A lightweight collection of reusable Codex/agent skills for common repository workflows.

This repository currently focuses on Git automation and skill scaffolding, with each skill stored in its own folder under `skills/`.

## Repository Structure

```text
.
├── skills/
│   ├── auto-commit/
│   ├── auto-push/
│   ├── init-skill/
│   ├── save-memory/
│   └── update-agent/
└── sync_skills.sh
```

## Included Skills

- `auto-commit`: Automates a safe Git commit flow (status check, staging, commit message, and result reporting).
- `auto-push`: Runs a standard commit flow first, then pushes the current branch.
- `init-skill`: Creates a new skill folder with `SKILL.md` and `agents/openai.yaml`.
- `save-memory`: Extracts reusable context from a session and updates project-level `AGENTS.md`.
- `update-agent`: Creates or incrementally updates `AGENTS.md` as a contributor/agent guide.

## Sync Skills to `~/.agents`

Use the sync script to copy local skills into your agent home directory:

```bash
./sync_skills.sh
```

By default, this syncs:

- Source: `<repo>/skills/`
- Destination: `~/.agents/skills/`

You can also provide a custom destination root:

```bash
./sync_skills.sh /path/to/target
```

Then the skills will be synced to:

- `/path/to/target/skills/`

## Requirements

- `sh`
- `rsync`

## Notes

- Hidden files are excluded during sync (`--exclude=".*"`).
- Destination content is mirrored to source (`--delete`), so removed local skills will also be removed in the target directory.
