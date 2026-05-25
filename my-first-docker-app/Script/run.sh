#!/bin/bash

set -euo pipefail

# absolute path to Script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

container_name="${1:-flask-container}"
container_port="${2:-5000}"

# check Images.txt exists
if [ ! -f "${SCRIPT_DIR}/Images.txt" ]

then
  echo "Error: Images.txt not found. Run build.sh first."
  exit 1
fi

deploy_image=$(cat "${SCRIPT_DIR}/Images.txt")

# check Images.txt is not empty
if [ -z "${deploy_image}" ]

then
  echo "Error: Images.txt is empty. Run build.sh first."
  exit 1
fi

echo "Running your container with:
  Container name : ${container_name}
  Port           : ${container_port}
  Image          : ${deploy_image}"

# save container name for stop.sh to use
echo "${container_name}" > "${SCRIPT_DIR}/Container_name.txt"

docker run -d \
  --name "${container_name}" \
  -p "${container_port}:5000" \
  --restart unless-stopped \
  "${deploy_image}"

echo "Container started at http://localhost:${container_port}"