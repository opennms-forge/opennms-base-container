#!/bin/bash -e

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="maven"

# Base Image Dependency
BASE_IMAGE="opennms/openjdk"
JDK_VERSION="8u322b06"
MAVEN_VERSION="3.8.7"
BASE_IMAGE_VERSION="${JDK_VERSION}-b8085"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# inherit $BASE_IMAGE_VERSION
PARENT_PROJECT="openjdk-8"

# Version information
VERSION="${JDK_VERSION}-${MAVEN_VERSION}"
IMAGE_VERSION=("${VERSION}")

MAVEN_HOST="https://archive.apache.org"
MAVEN_URL="${MAVEN_HOST}/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz"
MAVEN_HOME="/opt/apache-maven-${MAVEN_VERSION}"

# Most specific tag when it is not build locally and in CircleCI
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("${VERSION}-b${CIRCLE_BUILD_NUM}")
fi
