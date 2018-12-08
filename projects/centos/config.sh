#!/bin/bash -e

# shellcheck disable=SC2034

# Configure base image dependency
BASE_IMAGE="centos"
BASE_IMAGE_VERSION="7.6.1810"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"
BUILD_NUMBER="b1"
IMAGE_VERSION="${BASE_IMAGE_VERSION}-${BUILD_NUMBER}"

# Container registry and tags
CONTAINER_PROJECT="$(basename "$(pwd)")"
CONTAINER_REGISTRY="docker.io"
CONTAINER_REGISTRY_REPO="opennms"
CONTAINER_VERSION_TAGS=("${IMAGE_VERSION}" "latest")

# Container Image Artifact
CONTAINER_IMAGE="images/image.oci"
