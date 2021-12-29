#!/bin/bash -e

# shellcheck disable=SC2034

# Configure base image dependency
BASE_IMAGE="antora/antora"
BASE_IMAGE_VERSION="3.0.0"
VERSION=${BASE_IMAGE_VERSION}
IMAGE_VERSION=("${VERSION}")

BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Most specific tag when it is not build locally and in CircleCI
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("${VERSION}-b${CIRCLE_BUILD_NUM}")
fi
