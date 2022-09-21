#!/bin/bash -e

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="build-env"

# Base Image Dependency
BASE_IMAGE="cimg/openjdk"
BASE_IMAGE_VERSION="8.0.345-node"
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

PACKAGES="nodejs autoconf automake build-essential ca-certificates cmake curl debconf-utils debhelper devscripts dh-systemd docker-ce dpkg-sig expect git librrd-dev libtool make nsis po-debconf python python3 rsync shellcheck software-properties-common ssh thin-provisioning-tools"
