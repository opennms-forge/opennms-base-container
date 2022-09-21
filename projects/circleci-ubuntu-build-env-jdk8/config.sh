#!/bin/bash -e

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="build-env"

# Base Image Dependency
BASE_IMAGE="cimg/base"
BASE_IMAGE_VERSION="stable-20.04"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"
SHELLCHECK_VERSION="0.8.0"
DOCKER_COMPOSE_VERSION="2.11.1"

# inherit $BASE_IMAGE_VERSION
PARENT_PROJECT="debian-openjdk-8"

# Version information
VERSION="circleci-ubuntu-jdk8"
IMAGE_VERSION=("${VERSION}")

# Most specific tag when it is not build locally and in CircleCI
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("${VERSION}-b${CIRCLE_BUILD_NUM}")
fi

REPO_RELEASE="stable"
REPO_HOST="debian.opennms.org"
REPO_KEY_URL="https://${REPO_HOST}/OPENNMS-GPG-KEY"

PACKAGES="\
  autoconf \
  automake \
  build-essential \
  ca-certificates \
  cmake \
  curl \
  debconf-utils \
  debhelper \
  debsigs \
  devscripts \
  dh-systemd \
  docker-ce \
  dpkg-sig \
  expect \
  git \
  gnupg2 \
  libdatetime-format-iso8601-perl \
  libjson-pp-perl \
  liblwp-protocol-https-perl \
  librpm-dev \
  librrd-dev \
  libtool \
  libwww-perl \
  make \
  nodejs \
  nsis \
  openjdk-8-jdk-headless \
  po-debconf \
  python \
  python3 \
  rpm \
  rpm2cpio \
  rpmlint \
  rsync \
  shellcheck \
  software-properties-common \
  ssh \
  sudo \
  thin-provisioning-tools \
  tzdata \
"
