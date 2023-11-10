#!/bin/bash -e

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="openjdk"

# Base Image Dependency
BASE_IMAGE="opennms/centos"
BASE_IMAGE_VERSION="8-b8070"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# inherit $BASE_IMAGE_VERSION
PARENT_PROJECT="centos"

# Specific container config
JDK_MAJOR_VERSION=11
JDK_RELEASE_VERSION=11.0.18.0.10
JDK_VERSION_DETAIL=${JDK_RELEASE_VERSION}

IMAGE_VERSION=("${JDK_VERSION_DETAIL}")

# Most specific tag when it is not build locally and in CircleCI
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("${JDK_VERSION_DETAIL}-b${CIRCLE_BUILD_NUM}")
fi
