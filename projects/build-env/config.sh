#!/bin/bash -e

# shellcheck disable=SC2034

# Base Image Dependency
BASE_IMAGE="opennms/maven"
BASE_IMAGE_VERSION="3.6.0-b2"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Version information
VERSION="1.0"
BUILD_NUMBER="b2"

REPO_RELEASE="develop"
REPO_HOST="yum.opennms.org"
REPO_URL="https://${REPO_HOST}/${REPO_RELEASE}/common/opennms"
REPO_KEY_URL="https://${REPO_HOST}/OPENNMS-GPG-KEY"

IMAGE_VERSION="${VERSION}-${BUILD_NUMBER}"

REPO_RPM="https://${REPO_HOST}/repofiles/opennms-repo-${REPO_RELEASE}-rhel7.noarch.rpm \
          http://yum.opennms.org/stable/rhel7/nsis/mingw32-nsis-2.50-1.el7.centos.x86_64.rpm"

PACKAGES="gettext \
          wget \
          git \
          which \
          expect \
          make \
          cmake \
          gcc-c++ \
          rrdtool-devel \
          automake \
          libtool \
          rpm-build \
          redhat-rpm-config \
          R-core \
          jicmp \
          jicmp6 \
          jrrd2"
