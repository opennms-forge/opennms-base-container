#!/bin/bash -e

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="openjdk"

# Base Image Dependency
BASE_IMAGE="opennms/debian"
BASE_IMAGE_VERSION="bullseye-b8063"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"
SHORT_DATE="$(date -u +"%Y%m%d%H%M%S")"

JDK_MAJOR_VERSION=11
JDK_RELEASE_VERSION=11.0.14
JDK_BUILD_VERSION=9
JDK_VERSION_DETAIL="${JDK_RELEASE_VERSION}_${JDK_BUILD_VERSION}"

# inherit $BASE_IMAGE_VERSION
PARENT_PROJECT="debian"

IMAGE_VERSION=("debian-jdk11" "debian-jdk11-${JDK_VERSION_DETAIL}")

# Most specific tag when it is not build locally and in CircleCI
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("debian-jdk11-${JDK_VERSION_DETAIL}-b${CIRCLE_BUILD_NUM}")
fi
