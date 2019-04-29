#!/usr/bin/env bash

# shellcheck disable=SC2034

# Relative path to helper build helper scripts
SCRIPTS_PATH="../../.circleci/scripts"

# Base Image Dependency
BASE_IMAGE="opennms/openjdk"
BASE_IMAGE_VERSION="11.0.2.7"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Horizon Image versioning
VERSION="1.0.0"

# Docker Tags, use version by default
IMAGE_VERSION=("${VERSION}")

# Add Docker tag when build in CircleCI with build number
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("${VERSION}-cb.${CIRCLE_BUILD_NUM}")
fi

CONFD_VERSION="0.16.0"
CONFD_URL="https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64"

# OpenNMS Horizon dependencies
PACKAGES="R-core"
