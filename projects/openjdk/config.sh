#!/bin/bash -e

# shellcheck disable=SC2034

# Base Image Dependency
BASE_IMAGE="opennms/centos"
BASE_IMAGE_VERSION="7.6.1810-b1"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Specific container config
JDK_MAJOR_VERSION="1.8.0"
JDK_VERSION_DETAIL="${JDK_MAJOR_VERSION}.191.b12"
BUILD_NUMBER="b1"
IMAGE_VERSION="${JDK_VERSION_DETAIL}-${BUILD_NUMBER}"

# Container registry and tags
CONTAINER_PROJECT="$(basename "$(pwd)")"
CONTAINER_REGISTRY="docker.io"
CONTAINER_REGISTRY_REPO="opennms"
CONTAINER_VERSION_TAGS=("${IMAGE_VERSION}"
                        "latest")

# Container Image Artifact
CONTAINER_IMAGE="images/image.oci"
