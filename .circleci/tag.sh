#!/bin/bash -e

# Executed relative to working directory
# shellcheck disable=SC1091
source ./config.sh

for TAG in ${CONTAINER_VERSION_TAGS[*]}; do
  docker tag "${CONTAINER_PROJECT}:${IMAGE_VERSION}" "${CONTAINER_REGISTRY}/${CONTAINER_REGISTRY_REPO}/${CONTAINER_PROJECT}:${TAG}"
done
docker images
