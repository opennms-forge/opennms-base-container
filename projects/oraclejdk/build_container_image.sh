#!/bin/bash -e

set -x

# shellcheck source=projects/_new_project_template/config.sh
source ./config.sh

docker build -t "${CONTAINER_PROJECT}:${IMAGE_VERSION}" \
  --build-arg BASE_IMAGE="${BASE_IMAGE}" \
  --build-arg BASE_IMAGE_VERSION="${BASE_IMAGE_VERSION}" \
  --build-arg VERSION="${VERSION}" \
  --build-arg BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")" \
  --build-arg JDK_RPM_URL="${JDK_RPM_URL}" \
  .

docker image save "${CONTAINER_PROJECT}:${IMAGE_VERSION}" -o "${CONTAINER_IMAGE}"
