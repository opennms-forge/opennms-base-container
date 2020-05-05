#!/bin/bash -e

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="openjdk"

# Base Image Dependency
BASE_IMAGE="opennms/debian"
BASE_IMAGE_VERSION="stretch-b4175"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"
SHORT_DATE="$(date -u +"%Y%m%d%H%M%S")"

VM_TYPE="openj9"

IMAGE_VERSION=("debian-jdk8-${VM_TYPE}")

# Most specific tag when it is not build locally and in CircleCI
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("debian-jdk8-${VM_TYPE}-b${CIRCLE_BUILD_NUM}")
fi
