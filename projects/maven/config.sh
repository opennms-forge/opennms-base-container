#!/bin/bash -e

# shellcheck disable=SC2034

# Base Image Dependency
BASE_IMAGE="opennms/openjdk"
BASE_IMAGE_VERSION="1.8.0.191.b12-b2"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Version information
VERSION="3.6.0"
BUILD_NUMBER="b2"
IMAGE_VERSION="${VERSION}-${BUILD_NUMBER}"

MAVEN_URL="https://www-eu.apache.org"
MAVEN_PKG="${MAVEN_URL}/dist/maven/maven-3/${VERSION}/binaries/apache-maven-${VERSION}-bin.tar.gz"
MAVEN_HOME="/opt/apache-maven-${VERSION}"
