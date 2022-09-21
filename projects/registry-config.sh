#!/bin/bash -e

# shellcheck disable=SC2034

CONTAINER_DIR="$(basename "$(pwd)")"

# Fallback set container project to working directory
if [ -z "${CONTAINER_PROJECT}" ]; then
  CONTAINER_PROJECT="${CONTAINER_DIR}"
fi

# Container registry and tags
CONTAINER_REGISTRY="docker.io"
CONTAINER_REGISTRY_REPO="opennms"
CONTAINER_VERSION_TAGS=("${IMAGE_VERSION[@]}")

# Container Image Artifact
CONTAINER_IMAGE="images/image.oci"

# if we have more than one $IMAGE_VERSION, that means
# we got a specific build from CIRCLECI; save our
# version to the `.circleci/build-numbers` directory
if [ "${#IMAGE_VERSION[@]}" -gt 1 ]; then
  _output_file="${CONTAINER_DIR}"
  _image_version="${IMAGE_VERSION[${#IMAGE_VERSION[@]}-1]}"
  echo "project has a specific build image set, saving to build-numbers/${_output_file}: ${_image_version}"
  echo "BASE_IMAGE_VERSION=${_image_version}" > "../../.circleci/build-numbers/${_output_file}"
fi

if [ "${CIRCLE_BRANCH}" == "master" ]; then
  # if the parent build left a file in the `.circleci/build-numbers`
  # directory, source it to override the current $BASE_IMAGE_VERSION
  if [ -n "$PARENT_PROJECT" ] && [ -e "../../.circleci/build-numbers/${PARENT_PROJECT}" ]; then
    echo "found a parent project for this build: ${PARENT_PROJECT}"
    echo "BASE_IMAGE_VERSION (before): $BASE_IMAGE_VERSION"
    # shellcheck disable=SC1090
    source "../../.circleci/build-numbers/${PARENT_PROJECT}"
    echo "BASE_IMAGE_VERSION (after): $BASE_IMAGE_VERSION"
  fi
else
  # on non-master branches, we don't publish, so pull in a local copy instead
  PARENT_IMAGE="../${PARENT_PROJECT}/images/image.oci"
  if [ -e "${PARENT_IMAGE}" ]; then
    _output="$(docker image load -i "${PARENT_IMAGE}" | grep 'Loaded image:' | cut -d: -f2- | xargs)"
    _name="$(echo "${_output}" | cut -d: -f1)"
    _version="$(echo "${_output}" | cut -d: -f2)"
    if [ -n "${_name}" ] && [ -n "${_version}" ]; then
      BASE_IMAGE="${_name}"
      BASE_IMAGE_VERSION="${_version}"
    fi
  fi
fi

