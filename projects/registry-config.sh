#!/bin/bash -e

# shellcheck disable=SC2034

# Container registry and tags
CONTAINER_PROJECT="$(basename "$(pwd)")"
CONTAINER_REGISTRY="docker.io"
CONTAINER_REGISTRY_REPO="no42org"
CONTAINER_VERSION_TAGS=("${IMAGE_VERSION}")

# Container Image Artifact
CONTAINER_IMAGE="images/image.oci"
