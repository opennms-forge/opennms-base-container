#!/bin/bash -e

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="openjdk"

# Base Image Dependency
BASE_IMAGE="opennms/centos"
BASE_IMAGE_VERSION="7.6.1810"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Specific container config
JDK_MAJOR_VERSION="1.8.0"
JDK_VERSION_DETAIL="${JDK_MAJOR_VERSION}.212.b04"
BUILD_NUMBER="b1"
FLOATING_VERSION="latest"
IMAGE_VERSION=("${JDK_VERSION_DETAIL}-${BUILD_NUMBER}"
               "${JDK_VERSION_DETAIL}"
               "${JDK_MAJOR_VERSION}"
               "${FLOATING_VERSION}")
