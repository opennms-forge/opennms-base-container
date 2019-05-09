#!/bin/bash -e

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="build-env"

# Base Image Dependency
BASE_IMAGE="opennms/maven"
JDK_VERSION="jdk8"
BASE_IMAGE_VERSION="${JDK_VERSION}_3.6.1-b1"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"
SHELLCHECK_VERSION="0.6.0"

# Version information
VERSION="1.1"
BUILD_NUMBER="b1"
IMAGE_VERSION=("${JDK_VERSION}_${VERSION}-${BUILD_NUMBER}"
               "${JDK_VERSION}_${VERSION}")

REPO_RELEASE="stable"
REPO_HOST="yum.opennms.org"
REPO_URL="https://${REPO_HOST}/${REPO_RELEASE}/common/opennms"
REPO_KEY_URL="https://${REPO_HOST}/OPENNMS-GPG-KEY"

REPO_RPM="https://${REPO_HOST}/repofiles/opennms-repo-${REPO_RELEASE}-rhel7.noarch.rpm \
          http://yum.opennms.org/stable/rhel7/nsis/mingw32-nsis-2.50-1.el7.centos.x86_64.rpm"

PACKAGES="gettext \
          tree \
          wget \
          git-core \
          openssh-clients \
          which \
          expect \
          make \
          cmake \
          gcc-c++ \
          jq \
          rrdtool-devel \
          automake \
          libtool \
          rpm-build \
          redhat-rpm-config \
          R-core \
          jicmp \
          jicmp6 \
          jrrd2"

