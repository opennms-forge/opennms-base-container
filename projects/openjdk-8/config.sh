#!/bin/bash -e

# shellcheck disable=SC2034

# Base Image Dependency
BASE_IMAGE="opennms/centos"
BASE_IMAGE_VERSION="7.6.1810"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Specific container config
JDK_MAJOR_VERSION="1.8.0"
JDK_VERSION_DETAIL="${JDK_MAJOR_VERSION}.191.b12"
BUILD_NUMBER="b4"
FLOATING_VERSION="latest"
IMAGE_VERSION=("${JDK_VERSION_DETAIL}-${BUILD_NUMBER}"
               "${JDK_VERSION_DETAIL}"
               "${JDK_MAJOR_VERSION}"
               "${FLOATING_VERSION}")
