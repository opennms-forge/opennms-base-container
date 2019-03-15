#!/bin/bash -e

set -x

# shellcheck source=projects/build-env/config.sh
source ./config.sh

# shellcheck source=projects/registry-config.sh
source ../registry-config.sh

docker build -t "${CONTAINER_PROJECT}:${IMAGE_VERSION}" \
  --build-arg BASE_IMAGE="${BASE_IMAGE}" \
  --build-arg BASE_IMAGE_VERSION="${BASE_IMAGE_VERSION}" \
  --build-arg SHELLCHECK_VERSION="${SHELLCHECK_VERSION}" \
  --build-arg VERSION="${VERSION}" \
  --build-arg BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")" \
  --build-arg PACKAGES="${PACKAGES}" \
  --build-arg REPO_RELEASE="develop" \
  --build-arg REPO_HOST="${REPO_HOST}" \
  --build-arg REPO_KEY_URL="${REPO_KEY_URL}" \
  --build-arg REPO_RPM="${REPO_RPM}" \
  .

docker image save "${CONTAINER_PROJECT}:${IMAGE_VERSION}" -o "${CONTAINER_IMAGE}"
