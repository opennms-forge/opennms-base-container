#!/bin/bash -e

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="openjdk"

# Base Image Dependency
BASE_IMAGE="opennms/centos"
BASE_IMAGE_VERSION="8-b5649"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# inherit $BASE_IMAGE_VERSION
PARENT_PROJECT="centos"

# Specific container config
JDK_MAJOR_VERSION="17"
JDK_BUILD_VERSION="26"
JDK_VERSION_DETAIL="${JDK_MAJOR_VERSION}_${JDK_BUILD_VERSION}"
IMAGE_VERSION=("${JDK_VERSION_DETAIL}")

# Most specific tag when it is not build locally and in CircleCI
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("${JDK_VERSION_DETAIL}-b${CIRCLE_BUILD_NUM}")
fi
