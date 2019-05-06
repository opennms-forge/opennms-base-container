#!/usr/bin/env bash

# Exit script if a statement returns a non-true return value.
set -o errexit

# Use the error status of the first failure, rather than that of the last item in a pipeline.
set -o pipefail

# shellcheck source=projects/base-sentinel-jdk8/config.sh
source ./config.sh

# shellcheck source=projects/registry-config.sh
source ../registry-config.sh

docker build -t "${CONTAINER_PROJECT}:${IMAGE_VERSION[0]}" \
  --build-arg BUILD_DATE="${BUILD_DATE}" \
  --build-arg BASE_IMAGE="${BASE_IMAGE}" \
  --build-arg BASE_IMAGE_VERSION="${BASE_IMAGE_VERSION}" \
  --build-arg CONFD_VERSION="${CONFD_VERSION}" \
  --build-arg CONFD_URL="${CONFD_URL}" \
  --build-arg REPO_RPM="${REPO_RPM}" \
  --build-arg REPO_KEY_URL="${REPO_KEY_URL}" \
  --build-arg VERSION="${VERSION}" \
  --build-arg PACKAGES="${PACKAGES}" \
  .

docker image save "${CONTAINER_PROJECT}:${IMAGE_VERSION[0]}" -o "${CONTAINER_IMAGE}"
