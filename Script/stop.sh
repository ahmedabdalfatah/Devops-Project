#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# check Container_name.txt exists
if [ ! -f "${SCRIPT_DIR}/Container_name.txt" ]

then
  echo "No Container_name.txt found. Nothing to stop."
  exit 0
fi

container_name=$(cat "${SCRIPT_DIR}/Container_name.txt")

# check file is not empty

if [ -z "${container_name}" ]

then
  echo "Container_name.txt is empty. Nothing to stop."
  exit 0
fi

# check container actually exists in Docker

if docker ps -a --format '{{.Names}}' | grep -q "^${container_name}$"
then
  echo "Stopping container: ${container_name}"
  docker stop "${container_name}"
  docker rm "${container_name}"
  echo "Container stopped and removed."
else
  echo "No container named '${container_name}' found. Nothing to stop."
fi