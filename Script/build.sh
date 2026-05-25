#!/bin/bash

set -euo pipefail

# get absolute path of project root 
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "${PROJECT_ROOT}"

image_version="${1:-latest}"
deploy_image="my-flask-app:${image_version}"


echo "${deploy_image}" > Script/Images.txt

echo "Building: ${deploy_image}"
docker build -t "${deploy_image}" .
echo "Build complete: ${deploy_image}"