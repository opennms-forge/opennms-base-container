ARG BASE_IMAGE="cimg/base"
ARG BASE_IMAGE_VERSION="current-22.04"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

SHELL ["/bin/bash", "-c"]

COPY tools/*.sh /usr/local/bin/

ARG REPO_HOST="debian.opennms.org"
ARG REPO_RELEASE="stable"
ARG REPO_KEY_URL="https://${REPO_HOST}/OPENNMS-GPG-KEY"
ARG DOCKER_COMPOSE_VERSION="2.15.1"

RUN sudo /usr/local/bin/ghost-apt-install.sh gnupg ca-certificates && \
    wget -qO- "${REPO_KEY_URL}" | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/opennms.gpg >/dev/null && \
    echo "deb https://${REPO_HOST} ${REPO_RELEASE} main" | sudo tee /etc/apt/sources.list.d/opennms.list

ARG PACKAGES="\
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
  openjdk-11-jdk-headless \
  po-debconf \
  python2 \
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
  xsltproc \
"

COPY ./debs /tmp/debs

RUN curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh && \
    sudo bash /tmp/nodesource_setup.sh && \
    rm -f /tmp/nodesource_setup.sh && \
    sudo /usr/local/bin/ghost-apt-install.sh ${PACKAGES}

RUN sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    sudo chmod +x /usr/local/bin/docker-compose

RUN curl -L https://github.com/jwilder/dockerize/releases/download/v0.6.1/dockerize-linux-amd64-v0.6.1.tar.gz --output /tmp/dockerize.tar.gz && sudo tar -C /usr/local/bin -xzvf /tmp/dockerize.tar.gz && rm /tmp/dockerize.tar.gz

# install R
RUN curl -sSf https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc && \
    sudo add-apt-repository -y "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" && \
    echo '* libraries/restart-without-asking boolean true' | sudo debconf-set-selections && \
    sudo /usr/local/bin/ghost-apt-install.sh r-base

RUN if [ "$(ls -1 /tmp/debs/*.deb 2>/dev/null | wc -l)" != 0 ]; then dpkg -i /tmp/debs/*.deb; fi && \
    sudo rm -rf /tmp/debs

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
