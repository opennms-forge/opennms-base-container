#!/bin/bash -e

# shellcheck disable=SC2034

# Base Image Dependency
BASE_IMAGE="alpine"
BASE_IMAGE_VERSION="3.9"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Version information
VERSION="0.13.0"
BUILD_NUMBER="b1"

GHR_RELEASE_URL="https://github.com/tcnksm/ghr/releases/download/v${VERSION}/ghr_v${VERSION}_linux_amd64.tar.gz"

IMAGE_VERSION="${VERSION}"

# Most specific tag when it is not build locally and in CircleCI
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("${IMAGE_VERSION}-b${CIRCLE_BUILD_NUM}")
fi
