# claude-code container

Container image with Python 3.13, uv, and Claude Code CLI.
The container user is created with the same UID/GID as the host, avoiding file permission issues on mounted volumes.

## Files

| File | Description |
|------|-------------|
| `Dockerfile` | Based on `python:3.13-slim-bookworm`. Includes Node.js LTS, Claude Code CLI, and uv |
| `build.sh` | Detects host UID/GID/username automatically and runs `docker build` |
| `run.sh` | Mounts `~/.claude` and the current directory, then starts the container |

## Usage

```bash
# Build (default image name: claude-code)
./docker/claude-code/build.sh

# Build with a custom image name
./docker/claude-code/build.sh my-image-name

# Run (current directory is mounted as /workspace)
./docker/claude-code/run.sh

# Run with a custom image name
./docker/claude-code/run.sh my-image-name
```

## Mounts

| Host | Container |
|------|-----------|
| `~/.claude` | `/home/<username>/.claude` |
| `$(pwd)` | `/workspace` |

Mounting `~/.claude` allows the container to reuse an already-authenticated Claude Code session from the host.
