#!/bin/bash -e

# shellcheck disable=SC2034

# Base Image Dependency
BASE_IMAGE="node"
BASE_IMAGE_VERSION="16-buster"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Version information
VERSION="4.0.0"
BUILD_NUMBER="b1"

IMAGE_VERSION="${VERSION}-${BUILD_NUMBER}"
