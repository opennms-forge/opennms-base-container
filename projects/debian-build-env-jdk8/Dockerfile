ARG BASE_IMAGE="openjdk"
ARG BASE_IMAGE_VERSION="debian-jdk8"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

SHELL ["/bin/bash", "-c"]

ARG REPO_HOST="debian.opennms.org"
ARG REPO_RELEASE="stable"
ARG REPO_KEY_URL="https://${REPO_HOST}/OPENNMS-GPG-KEY"
ARG DOCKER_COMPOSE_VERSION="1.29.2"

RUN wget -qO- ${REPO_KEY_URL} | apt-key add - && \
    echo "deb https://${REPO_HOST} ${REPO_RELEASE} main" > /etc/apt/sources.list.d/opennms.list && \
    wget -qO- https://download.docker.com/linux/debian/gpg | apt-key add - && \
    echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list && \
    echo "deb https://deb.nodesource.com/node_18.x $(lsb_release -cs) main" > /etc/apt/sources.list.d/nodesource.list && \
    wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -

ARG PACKAGES="\
  autoconf \
  automake \
  build-essential \
  cmake \
  curl \
  debhelper \
  debsigs \
  devscripts \
  docker-ce \
  dpkg-sig \
  expect \
  git \
  gnupg2 \
  jq \
  librrd-dev \
  libtool \
  make \
  nodejs \
  nsis \
  po-debconf \
  python \
  python3 \
  rsync \
  shellcheck \
  ssh \
  sudo \
  thin-provisioning-tools \
"

COPY ./debs /tmp/debs

RUN apt-get update && \
    apt-get -y --no-install-recommends install ${PACKAGES} && \
    curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN if [ "$(ls -1 /tmp/debs/*.deb 2>/dev/null | wc -l)" != 0 ]; then dpkg -i /tmp/debs/*.deb; fi && \
    rm -rf /tmp/debs

ARG BUILD_DATE="1970-01-01T00:00:00+0000"
ARG VERSION
ARG SOURCE
ARG REVISION
ARG BUILD_JOB_ID
ARG BUILD_NUMBER
ARG BUILD_URL
ARG BUILD_BRANCH

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.title="OpenNMS Build Environment ${VERSION}" \
      org.opencontainers.image.source="${SOURCE}" \
      org.opencontainers.image.revision="${REVISION}" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.vendor="The OpenNMS Group, Inc." \
      org.opencontainers.image.authors="OpenNMS Community" \
      org.opencontainers.image.licenses="AGPL-3.0" \
      org.opennms.image.base="${BASE_IMAGE}:${BASE_IMAGE_VERSION}" \
      org.opennme.cicd.jobid="${BUILD_JOB_ID}" \
      org.opennms.cicd.buildnumber="${BUILD_NUMBER}" \
      org.opennms.cicd.buildurl="${BUILD_URL}" \
      org.opennms.cicd.branch="${BUILD_BRANCH}"
