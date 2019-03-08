#!/bin/bash -e

# shellcheck disable=SC2034

# Base Image Dependency
BASE_IMAGE="ruby"
BASE_IMAGE_VERSION="2.6.1-stretch"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Version information
VERSION="0.3.05"
BUILD_NUMBER="b1"

IMAGE_VERSION="${VERSION}-${BUILD_NUMBER}"
