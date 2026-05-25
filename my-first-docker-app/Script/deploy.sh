#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

image_version="${1:-latest}"
container_name="${2:-flask-container}"
container_port="${3:-5000}"

echo "==============================="
echo " Deploying my-flask-app:${image_version}"
echo "==============================="

echo "[1/3] Building image..."
bash "${SCRIPT_DIR}/build.sh" "${image_version}"

echo "[2/3] Stopping old container..."
bash "${SCRIPT_DIR}/stop.sh"

echo "[3/3] Starting new container..."
bash "${SCRIPT_DIR}/run.sh" "${container_name}" "${container_port}"

echo "==============================="
echo " Deploy complete!"
echo " App: http://localhost:${container_port}"
echo "==============================="