#!/bin/bash -e

# shellcheck disable=SC2034

# Base Image Dependency
BASE_IMAGE="node"
BASE_IMAGE_VERSION="11-alpine"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Version information
VERSION="2.8.3"
BUILD_NUMBER="b1"

IMAGE_VERSION="${VERSION}-${BUILD_NUMBER}"
