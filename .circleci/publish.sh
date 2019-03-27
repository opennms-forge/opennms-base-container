#!/bin/bash -e

# Executed relative to working directory
# shellcheck disable=SC1091
source ./config.sh

# shellcheck disable=SC1091
source ../registry-config.sh

if [ "${CIRCLE_BRANCH}" == "master" ]; then
  echo "Publish images for master branch ..."
  for TAG in ${CONTAINER_VERSION_TAGS[*]}; do
    docker push "${CONTAINER_REGISTRY}/${CONTAINER_REGISTRY_REPO}/${CONTAINER_PROJECT}:${TAG}"
  done
else
  echo "Skip publishing for working branches other than master."
  echo "Build images for branches are available in the CircleCI build artifacts."
fi
