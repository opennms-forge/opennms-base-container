#!/bin/bash -e

# shellcheck disable=SC2034

# Configure base image dependency
BASE_IMAGE="opennms/centos"
BASE_IMAGE_VERSION="8-b4056"

# inherit $BASE_IMAGE_VERSION
PARENT_PROJECT="centos"

MAJOR_VERSION="0"
VERSION="${MAJOR_VERSION}.16.0"
CONFD_URL="https://github.com/kelseyhightower/confd/releases/download/v${VERSION}/confd-${VERSION}-linux-amd64"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"
IMAGE_VERSION=("${VERSION}")

# Most specific tag when it is not build locally and in CircleCI
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("${VERSION}-b${CIRCLE_BUILD_NUM}")
fi
