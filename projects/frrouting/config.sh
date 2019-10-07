#!/bin/bash -e

# shellcheck disable=SC2034

# Base Image Dependency
BASE_IMAGE="alpine"
BASE_IMAGE_VERSION="edge"

# Version information
VERSION="7.1"
FLOATING_VERSION="latest"
IMAGE_VERSION=("${VERSION}"
               "${FLOATING_VERSION}")
