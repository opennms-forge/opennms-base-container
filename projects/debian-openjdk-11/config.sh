#!/bin/bash -e

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="openjdk"

# Base Image Dependency
BASE_IMAGE="opennms/debian"
BASE_IMAGE_VERSION="buster-b6149"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"
SHORT_DATE="$(date -u +"%Y%m%d%H%M%S")"

# inherit $BASE_IMAGE_VERSION
PARENT_PROJECT="debian"

IMAGE_VERSION=("debian-jdk11")

# Most specific tag when it is not build locally and in CircleCI
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("debian-jdk11-b${CIRCLE_BUILD_NUM}")
fi
