#!/bin/bash -e

# shellcheck disable=SC2034

# Base Image Dependency
BASE_IMAGE="centos"
BASE_IMAGE_VERSION="8"

# Version information
VERSION="2.9.0"
FLOATING_VERSION="latest"
IMAGE_VERSION=("${VERSION}"
               "${FLOATING_VERSION}")

# Most specific tag when it is not build locally and in CircleCI
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("${VERSION}-b${CIRCLE_BUILD_NUM}")
fi
