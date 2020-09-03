#!/bin/bash -e

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="horizon"

# Base Image Dependency
BASE_IMAGE="opennms/horizon"
BASE_IMAGE_VERSION="26.2.0"

VERSION="${BASE_IMAGE_VERSION}-gns3"
IMAGE_VERSION="${VERSION}"

# Most specific tag when it is not build locally and in CircleCI
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("${VERSION}-b${CIRCLE_BUILD_NUM}")
fi
