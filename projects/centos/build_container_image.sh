#!/bin/bash -e

set -x

# shellcheck source=projects/centos/config.sh
source ./config.sh

# shellcheck source=projects/registry-config.sh
source ../registry-config.sh

docker build -t "${CONTAINER_PROJECT}:${IMAGE_VERSION[0]}" \
  --build-arg BASE_IMAGE="${BASE_IMAGE}" \
  --build-arg BASE_IMAGE_VERSION="${BASE_IMAGE_VERSION}" \
  --build-arg BUILD_DATE="${BUILD_DATE}" \
  --build-arg VERSION="${BASE_IMAGE_VERSION}" \
  --build-arg VCS_REF="$(git describe --always)" \
  .

docker image save "${CONTAINER_PROJECT}:${IMAGE_VERSION[0]}" -o "${CONTAINER_IMAGE}"

