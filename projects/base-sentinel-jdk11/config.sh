#!/usr/bin/env bash

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="base-sentinel"

# Base Image Dependency
BASE_IMAGE="opennms/openjdk"
BASE_IMAGE_VERSION="11.0.2.7"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Horizon Image versioning
VERSION="jdk11-1.0.0"

# Docker Tags, use version by default
IMAGE_VERSION=("${VERSION}")

# Add Docker tag when build in CircleCI with build number
if [ -n "${CIRCLE_BUILD_NUM}" ]; then
  IMAGE_VERSION+=("${VERSION}-cb.${CIRCLE_BUILD_NUM}")
fi

CONFD_VERSION="0.16.0"
CONFD_URL="https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64"

REPO_HOST="yum.opennms.org"
REPO_RELEASE="stable"
REPO_RPM="https://${REPO_HOST}/repofiles/opennms-repo-${REPO_RELEASE}-rhel7.noarch.rpm"
REPO_KEY_URL="https://${REPO_HOST}/OPENNMS-GPG-KEY"

# OpenNMS Horizon dependencies
PACKAGES="wget
          gettext"
