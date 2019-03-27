#!/bin/bash -e

# shellcheck disable=SC2034

# Configure base image dependency
BASE_IMAGE="centos"
BASE_IMAGE_VERSION="7.6.1810"
MINOR_VERSION="7.6"
MAJOR_VERSION="7"
FLOATING_VERSION="latest"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"
BUILD_NUMBER="b4"
IMAGE_VERSION=("${BASE_IMAGE_VERSION}-${BUILD_NUMBER}"
              "${BASE_IMAGE_VERSION}"
              "${MINOR_VERSION}"
              "${MAJOR_VERSION}"
              "${FLOATING_VERSION}")
