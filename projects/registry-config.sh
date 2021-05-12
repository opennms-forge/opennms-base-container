#!/bin/bash -e

# shellcheck disable=SC2034

CONTAINER_DIR="$(basename "$(pwd)")"

# Fallback set container project to working directory
if [ -z "${CONTAINER_PROJECT}" ]; then
  CONTAINER_PROJECT="${CONTAINER_DIR}"
fi

# Container registry and tags
CONTAINER_VERSION_TAGS=${IMAGE_VERSION[*]}

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

# if the parent build left a file in the `.circleci/build-numbers`
# directory, source it to override the current $BASE_IMAGE_VERSION
if [ -n "$PARENT_PROJECT" ] && [ -e "../../.circleci/build-numbers/${PARENT_PROJECT}" ]; then
  echo "found a parent project for this build: ${PARENT_PROJECT}"
  echo "BASE_IMAGE_VERSION (before): $BASE_IMAGE_VERSION"
  # shellcheck disable=SC1090
  source "../../.circleci/build-numbers/${PARENT_PROJECT}"
  echo "BASE_IMAGE_VERSION (after): $BASE_IMAGE_VERSION"
fi
