#!/bin/bash
set -euo pipefail

IMAGE_NAME="${1:-claude-code}"

docker run -it --rm \
    -v "${HOME}/.claude:/home/$(whoami)/.claude" \
    -v "$(pwd):/workspace" \
    -w /workspace \
    "${IMAGE_NAME}"
