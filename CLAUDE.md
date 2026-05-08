# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a personal settings/dotfiles repository. Currently it contains:

- `.tmux.conf` — tmux configuration with Japanese comments

## tmux Configuration Overview

The `.tmux.conf` remaps the prefix key from `C-b` to `C-t` and sets up a default 3-pane layout (left pane split top/bottom, one right pane) on new sessions. Key custom bindings:

| Key | Action |
|-----|--------|
| `C-t` | Prefix |
| `Prefix + n/p` | Next/previous pane |
| `Prefix + 2` | Split pane vertically (top/bottom) |
| `Prefix + 3` | Split pane horizontally (left/right) |
| `Prefix + q` | Kill pane |
| `Prefix + >/<` | Resize pane right/left |
| `Prefix + +/-` | Resize pane down/up |
| Double-click | Select word and copy to clipboard via `pbcopy` |

Mouse support is enabled. Word separators are set to spaces only (`.` and `-` do not break words).

## Deployment

To apply the tmux config:

```sh
ln -sf /Users/n-naka/work/my-settings/.tmux.conf ~/.tmux.conf
# Then reload inside a running tmux session:
tmux source-file ~/.tmux.conf
```
