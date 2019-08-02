#!/bin/bash -e

# shellcheck disable=SC2034

# Base Image Dependency
BASE_IMAGE="ubuntu"
BASE_IMAGE_VERSION="bionic"
S6_OVERLAY_VERSION="v1.22.1.0"

# Version information
VERSION="1.0"
FLOATING_VERSION="latest"
IMAGE_VERSION=("${VERSION}-${CIRCLE_BUILD_NUM:-"b1"}"
               "${VERSION}"
               "${FLOATING_VERSION}")
