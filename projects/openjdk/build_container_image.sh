#!/bin/bash -e

set -x

# shellcheck source=projects/openjdk/config.sh
source ./config.sh

# shellcheck source=projects/registry-config.sh
source ../registry-config.sh

docker build -t "${CONTAINER_PROJECT}:${IMAGE_VERSION[0]}" \
  --build-arg BASE_IMAGE="${BASE_IMAGE}" \
  --build-arg BASE_IMAGE_VERSION="${BASE_IMAGE_VERSION}" \
  --build-arg JDK8_MAJOR_VERSION="${JDK8_MAJOR_VERSION}" \
  --build-arg JDK8_VERSION_DETAIL="${JDK8_VERSION_DETAIL}" \
  --build-arg JDK11_MAJOR_VERSION="${JDK11_MAJOR_VERSION}" \
  --build-arg JDK11_VERSION_DETAIL="${JDK11_VERSION_DETAIL}" \
  --build-arg BUILD_DATE="${BUILD_DATE}" \
  .

docker image save "${CONTAINER_PROJECT}:${IMAGE_VERSION[0]}" -o "${CONTAINER_IMAGE}"
