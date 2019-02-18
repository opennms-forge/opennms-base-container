#!/bin/bash -e

# Executed relative to working directory
# shellcheck disable=SC1091
source ./config.sh

# shellcheck disable=SC1091
source ../registry-config.sh

for TAG in ${CONTAINER_VERSION_TAGS[*]}; do
  docker push "${CONTAINER_REGISTRY}/${CONTAINER_REGISTRY_REPO}/${CONTAINER_PROJECT}:${TAG}"
done
