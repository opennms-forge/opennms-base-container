#!/bin/bash -e

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="openjdk"

# Base Image Dependency
BASE_IMAGE="opennms/centos"
BASE_IMAGE_VERSION="8-b7625"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# inherit $BASE_IMAGE_VERSION
PARENT_PROJECT="centos"

# Specific container config
JDK_MAJOR_VERSION="11"
JDK_VERSION_DETAIL="${JDK_MAJOR_VERSION}.0.13.0.8"
IMAGE_VERSION=("${JDK_VERSION_DETAIL}")

# Most specific tag when it is not build locally and in CircleCI
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("${JDK_VERSION_DETAIL}-b${CIRCLE_BUILD_NUM}")
fi
