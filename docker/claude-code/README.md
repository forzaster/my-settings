# claude-code container

Python 3.13 + uv + Claude Code CLI が入ったコンテナイメージ。
ホスト側と同じ UID/GID でユーザーを作成するため、マウントしたファイルの権限問題が起きない。

## 構成

| ファイル | 説明 |
|----------|------|
| `Dockerfile` | `python:3.13-slim-bookworm` ベース。Node.js LTS, Claude Code CLI, uv を含む |
| `build.sh` | ホストの UID/GID/ユーザー名を自動取得して `docker build` を実行 |
| `run.sh` | `~/.claude` とカレントディレクトリをマウントして起動 |

## 使い方

```bash
# ビルド（イメージ名はデフォルト: claude-code）
./docker/claude-code/build.sh

# イメージ名を指定する場合
./docker/claude-code/build.sh my-image-name

# 起動（カレントディレクトリが /workspace にマウントされる）
./docker/claude-code/run.sh

# イメージ名を指定して起動
./docker/claude-code/run.sh my-image-name
```

## マウント

| ホスト | コンテナ |
|--------|----------|
| `~/.claude` | `/home/<username>/.claude` |
| `$(pwd)` | `/workspace` |

`~/.claude` をマウントすることで、ホスト側で認証済みの Claude Code セッションをそのままコンテナ内で使用できる。
