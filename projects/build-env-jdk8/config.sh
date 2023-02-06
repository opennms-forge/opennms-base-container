#!/bin/bash -e

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="build-env"

# Base Image Dependency
BASE_IMAGE="opennms/maven"
JDK_VERSION="8u322b06"
MAVEN_VERSION="3.8.7"
BASE_IMAGE_VERSION="${JDK_VERSION}-${MAVEN_VERSION}-b8088"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"
SHELLCHECK_VERSION="0.8.0"
DOCKER_COMPOSE_VERSION="1.29.2"

# inherit $BASE_IMAGE_VERSION
PARENT_PROJECT="maven-jdk8"

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

PACKAGES="\
  automake \
  cmake \
  expect \
  gcc-c++ \
  gettext \
  git-core \
  gnupg2 \
  jicmp \
  jicmp6 \
  jrrd2 \
  jq \
  libtool \
  libxslt \
  make \
  nodejs \
  openssh-clients \
  python2 \
  python3 \
  R-core \
  redhat-rpm-config \
  rpm-build \
  rpm-sign \
  rrdtool-devel \
  rsync \
  tree \
  wget \
  which \
"
