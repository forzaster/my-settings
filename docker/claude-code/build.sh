#!/bin/bash
set -euo pipefail

USERNAME=$(whoami)
USER_ID=$(id -u)
GROUP_ID=$(id -g)
GROUPNAME=$(id -gn)
IMAGE_NAME="${1:-claude-code}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

docker build \
    --build-arg USERNAME="${USERNAME}" \
    --build-arg UID="${USER_ID}" \
    --build-arg GID="${GROUP_ID}" \
    --build-arg GROUPNAME="${GROUPNAME}" \
    -t "${IMAGE_NAME}" \
    -f "${SCRIPT_DIR}/Dockerfile" \
    "${SCRIPT_DIR}"

echo "Built: ${IMAGE_NAME} (user=${USERNAME}, uid=${USER_ID}, gid=${GROUP_ID})"
