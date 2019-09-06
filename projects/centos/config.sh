#!/bin/bash -e

# shellcheck disable=SC2034

# Configure base image dependency
BASE_IMAGE="centos"
MAJOR_VERSION="7"
MINOR_VERSION="6"
VERSION="${MAJOR_VERSION}.${MINOR_VERSION}.1810"
BASE_IMAGE_VERSION="${VERSION}"
FLOATING_VERSION="latest"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"
BUILD_NUMBER="b6"
IMAGE_VERSION=("${VERSION}-${BUILD_NUMBER}"
              "${VERSION}"
              "${MAJOR_VERSION}"
              "${MAJOR_VERSION}.${MINOR_VERSION}"
              "${FLOATING_VERSION}")

# Most specific tag when it is not build locally and in CircleCI
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("${VERSION}-${BUILD_NUMBER}.${CIRCLE_BUILD_NUM}")
fi
