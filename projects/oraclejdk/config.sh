#!/bin/bash -e

# shellcheck disable=SC2034

# Base Image Dependency
BASE_IMAGE="opennms/centos"
BASE_IMAGE_VERSION="7.6.1810-b2"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Version information
JDK_VERSION="8u201"
JDK_BUILD_NUMBER="b09"
JDK_RPM_URL="https://download.oracle.com/otn-pub/java/jdk/${JDK_VERSION}-${JDK_BUILD_NUMBER}/42970487e3af4f5aa5bca3f542482c60/jdk-${JDK_VERSION}-linux-x64.rpm"
VERSION="${JDK_VERSION}-${JDK_BUILD_NUMBER}"
BUILD_NUMBER="b2"
IMAGE_VERSION="${VERSION}-${BUILD_NUMBER}"
