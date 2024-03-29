#!/bin/bash -e

set -x

# shellcheck disable=SC1091
source ./config.sh

# shellcheck disable=SC1091
source ../registry-config.sh

cp ../../tools/*.sh tools/

docker build -t "${CONTAINER_PROJECT}:${IMAGE_VERSION[0]}" \
  --build-arg BASE_IMAGE="${BASE_IMAGE}" \
  --build-arg BASE_IMAGE_VERSION="${BASE_IMAGE_VERSION}" \
  --build-arg BUILD_DATE="${BUILD_DATE}" \
  --build-arg VERSION="${VERSION}" \
  --build-arg SOURCE="${CIRCLE_REPOSITORY_URL}" \
  --build-arg REVISION="$(git describe --always)" \
  --build-arg BUILD_JOB_ID="${CIRCLE_WORKFLOW_JOB_ID}" \
  --build-arg BUILD_NUMBER="${CIRCLE_BUILD_NUM}" \
  --build-arg BUILD_URL="${CIRCLE_BUILD_URL}" \
  --build-arg BUILD_BRANCH="${CIRCLE_BRANCH}" \
  --build-arg SHELLCHECK_VERSION="${SHELLCHECK_VERSION}" \
  --build-arg DOCKER_COMPOSE_VERSION="${DOCKER_COMPOSE_VERSION}" \
  --build-arg PACKAGES="${PACKAGES}" \
  --build-arg REPO_RELEASE="stable" \
  --build-arg REPO_HOST="${REPO_HOST}" \
  --build-arg REPO_KEY_URL="${REPO_KEY_URL}" \
  .

docker image save "${CONTAINER_PROJECT}:${IMAGE_VERSION[0]}" -o "${CONTAINER_IMAGE}"
