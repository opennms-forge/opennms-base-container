#!/bin/bash -e

# shellcheck disable=SC2034

# Configure base image dependency
BASE_IMAGE="ubuntu"
BASE_IMAGE_VERSION="rolling"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"
BUILD_NUMBER="b1"

# Version information
VERSION="0.5.0"
IMAGE_VERSION="${VERSION}-${BUILD_NUMBER}"

# Container registry and tags
CONTAINER_PROJECT="$(basename "$(pwd)")"
CONTAINER_REGISTRY="docker.io"
CONTAINER_REGISTRY_REPO="opennms"
CONTAINER_VERSION_TAGS=("${IMAGE_VERSION}" "latest")

# Container Image Artifact
CONTAINER_IMAGE="images/image.oci"
