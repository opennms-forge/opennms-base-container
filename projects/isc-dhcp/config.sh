#!/bin/bash -e

# shellcheck disable=SC2034

# Base Image Dependency
BASE_IMAGE="alpine"
BASE_IMAGE_VERSION="3.9"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Version information
VERSION="4.4.1-r1"
BUILD_NUMBER="b1"
IMAGE_VERSION="${VERSION}-${BUILD_NUMBER}"

# Container registry and tags
CONTAINER_PROJECT="$(basename "$(pwd)")"
CONTAINER_REGISTRY="docker.io"
CONTAINER_REGISTRY_REPO="opennms"
CONTAINER_VERSION_TAGS=("${IMAGE_VERSION}"
                        "latest")

# Container Image Artifact
CONTAINER_IMAGE="images/image.oci"
