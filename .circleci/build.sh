#!/bin/bash -e

PROJECT="$(basename "$(pwd)")"

found_changes() {
  if git show --name-only --format='' | grep "^projects/registry-config.sh"; then
    echo "registry-config.sh changed, triggering build"
    return 0
  fi
  if git show --name-only --format='' | grep "^.circleci/"; then
    echo "CircleCI config changed, triggering build"
    return 0
  fi
  if git show --name-only --format='' | grep "^projects/${PROJECT}"; then
    echo "${PROJECT} changed, triggering build"
    return 0
  fi
  return 1
}

export CONTAINER_REGISTRY="docker.io"
export CONTAINER_REGISTRY_REPO="swachter"

#echo "Detect changes in projects"
# if found_changes; then
  ./build_container_image.sh && \
  ~/opennms-container/.circleci/tag.sh && \
  ~/opennms-container/.circleci/publish.sh
#else
#  echo "No changes detected"
#  exit 0
#fi
