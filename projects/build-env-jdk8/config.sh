#!/bin/bash -e

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="build-env"

# Base Image Dependency
BASE_IMAGE="opennms/maven"
JDK_VERSION="1.8.0.252.b09"
MAVEN_VERSION="3.6.3"
BASE_IMAGE_VERSION="${JDK_VERSION}-${MAVEN_VERSION}-b4136"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"
SHELLCHECK_VERSION="0.6.0"

# Version information
VERSION="${JDK_VERSION}-${MAVEN_VERSION}"
IMAGE_VERSION=("${VERSION}")

# Most specific tag when it is not build locally and in CircleCI
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("${VERSION}-b${CIRCLE_BUILD_NUM}")
fi

REPO_RELEASE="stable"
REPO_HOST="yum.opennms.org"
REPO_URL="https://${REPO_HOST}/${REPO_RELEASE}/common/opennms"
REPO_KEY_URL="https://${REPO_HOST}/OPENNMS-GPG-KEY"

ADD_RPMS="https://${REPO_HOST}/repofiles/opennms-repo-${REPO_RELEASE}-rhel8.noarch.rpm \
          https://${REPO_HOST}/${REPO_RELEASE}/rhel7/nsis/mingw32-nsis-2.50-1.el7.centos.x86_64.rpm"

PACKAGES="nodejs python2 python3 libxslt rsync gettext tree wget git-core openssh-clients which expect make cmake gcc-c++ jq rrdtool-devel automake libtool rpm-build redhat-rpm-config R-core jicmp jicmp6 jrrd2"
