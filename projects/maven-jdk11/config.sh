#!/bin/bash -e

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="maven"

# Base Image Dependency
BASE_IMAGE="opennms/openjdk"
BASE_IMAGE_VERSION="11.0.3.7-b1"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Version information
JDK_VERSION="jdk11"
VERSION="3.6.0"
BUILD_NUMBER="b1"
IMAGE_VERSION=("${JDK_VERSION}_${VERSION}-${BUILD_NUMBER}"
               "${JDK_VERSION}_${VERSION}")

MAVEN_URL="https://www-eu.apache.org"
MAVEN_PKG="${MAVEN_URL}/dist/maven/maven-3/${VERSION}/binaries/apache-maven-${VERSION}-bin.tar.gz"
MAVEN_HOME="/opt/apache-maven-${VERSION}"

