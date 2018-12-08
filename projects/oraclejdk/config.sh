#!/bin/bash -e


# shellcheck disable=SC2034

# Base Image Dependency
BASE_IMAGE="opennms/centos"
BASE_IMAGE_VERSION="7.6.1810-b1"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Version information
JDK_VERSION="8u191"
JDK_BUILD_NUMBER="b12"
JDK_RPM_URL="http://download.oracle.com/otn-pub/java/jdk/${JDK_VERSION}-${JDK_BUILD_NUMBER}/2787e4a523244c269598db4e85c51e0c/jdk-${JDK_VERSION}-linux-x64.rpm"

VERSION="${JDK_VERSION}-${JDK_BUILD_NUMBER}"
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
