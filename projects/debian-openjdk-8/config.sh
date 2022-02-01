#!/bin/bash -e

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="openjdk"

# Base Image Dependency
BASE_IMAGE="opennms/debian"
BASE_IMAGE_VERSION="stretch-b5775"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"
SHORT_DATE="$(date -u +"%Y%m%d%H%M%S")"

# inherit $BASE_IMAGE_VERSION
PARENT_PROJECT="debian"

JDK_MAJOR_VERSION=8u322
JDK_BUILD_VERSION=06
JDK_VERSION_DETAIL=${JDK_MAJOR_VERSION}b${JDK_BUILD_VERSION}

IMAGE_VERSION=("debian-jdk8" "debian-jdk8-${JDK_VERSION_DETAIL}")

# Most specific tag when it is not build locally and in CircleCI
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("debian-jdk8-${JDK_VERSION_DETAIL}-b${CIRCLE_BUILD_NUM}")
fi
