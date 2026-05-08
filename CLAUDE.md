# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

Personal settings/dotfiles repository for version-controlling tool configuration files.

All files committed to this repository must be written in English.

Configuration files are organized by domain (tool/purpose), one folder per tool.

```
my-settings/
├── tmux/       # tmux configuration
├── docker/     # Docker-related files
└── <tool>/     # add new tools here
```

## Development Workflow

For every implementation task, follow these steps in order without skipping:

1. **Plan** — outline the approach and list files to be changed
2. **User confirmation** — present the plan and wait for explicit approval before writing any code
3. **Implementation** — execute the approved plan
4. **Local review** — run `/review` against the changes before committing
5. **Fix critical findings** — address any major or critical issues raised in the review; minor suggestions may be left to the user's discretion
6. **Commit** — create the commit only after the review is clean
7. **Notify review result** — present the final review outcome to the user before pushing
8. **Push** — the user handles `git push`; do not push automatically
9. **Create PR** — once the user confirms the push is done, create a pull request

## Review Guidelines

Check the following on every code review:

- No hardcoded secrets such as API keys, passwords, tokens, or private keys
- No personally identifiable information (PII) such as names, email addresses, phone numbers, postal addresses, or user IDs

Review output must explicitly state whether any secrets or PII were found.
