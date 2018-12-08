#!/bin/bash -e

# shellcheck disable=SC2034

# Base Image Dependency
BASE_IMAGE="centos"
BASE_IMAGE_VERSION="7.6.1810"

# Version information
VERISON="${BASE_IMAGE}.${BASE_IMAGE_VERSION}"

# Container registry and tags
CONTAINER_PROJECT="$(basename "$(pwd)")"
CONTAINER_REGISTRY="docker.io"
CONTAINER_REGISTRY_REPO="opennms"
CONTAINER_VERSION_TAGS=("${IMAGE_VERSION}"
                        "latest")

# Container Image Artifact
CONTAINER_IMAGE="images/image.oci"
