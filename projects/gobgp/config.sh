#!/bin/bash -e

# shellcheck disable=SC2034

# Base Image Dependency
BASE_IMAGE="opennms/centos"
BASE_IMAGE_VERSION="8-b3697"

# Version information
VERSION="2.13.0"
CONFD_URL=https://github.com/osrg/gobgp/releases/download/v${VERSION}/gobgp_${VERSION}_linux_amd64.tar.gz
IMAGE_VERSION=("${VERSION}")

# Most specific tag when it is not build locally and in CircleCI
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("${VERSION}-b${CIRCLE_BUILD_NUM}")
fi
