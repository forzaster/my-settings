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

## Review Guidelines

Check the following on every code review:

- No hardcoded secrets such as API keys, passwords, tokens, or private keys
- No personally identifiable information (PII) such as names, email addresses, phone numbers, postal addresses, or user IDs

Review output must explicitly state whether any secrets or PII were found.
