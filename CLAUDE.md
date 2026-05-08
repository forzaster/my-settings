# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

個人の設定ファイル（dotfiles）置き場。各ツールの設定ファイルをバージョン管理する汎用リポジトリ。

設定ファイルはドメイン（ツール・用途）ごとにフォルダを切って格納する。

```
my-settings/
├── tmux/       # tmux設定
├── docker/     # Docker関連
└── <tool>/     # 新しいツールはここに追加
```

## Review Guidelines

コードレビュー時は以下を必ず確認すること。

- APIキー、パスワード、トークン、秘密鍵などの機密情報がハードコードされていないこと
- 氏名、メールアドレス、電話番号、住所、ユーザーIDなど個人を識別できる情報（PII）が含まれていないこと

レビュー結果には、機密情報・個人情報が含まれていなかったかどうかを必ず明示すること。
