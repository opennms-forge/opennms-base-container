ARG BASE_IMAGE="debian"
ARG BASE_IMAGE_VERSION="buster"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG JDK_MAJOR_VERSION=17
ARG JDK_RELEASE_VERSION=17.0.2
ARG JDK_BUILD_VERSION=8_oracle
ARG JDK_VERSION_DETAIL=${JDK_RELEASE_VERSION}_${JDK_BUILD_VERSION}

ENV JAVA_HOME /usr/lib/jvm/jdk-${JDK_MAJOR_VERSION}

RUN apt-get update && \
    apt-get -y --no-install-recommends install apt-transport-https ca-certificates gnupg2 wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    wget -O /tmp/jdk.deb https://download.oracle.com/java/17/archive/jdk-${JDK_RELEASE_VERSION}_linux-x64_bin.deb; \
    JAVA_SHA256="$(wget --quiet -O - https://download.oracle.com/java/17/archive/jdk-${JDK_RELEASE_VERSION}_linux-x64_bin.deb.sha256)"; \
    (echo "$JAVA_SHA256 */tmp/jdk.deb" | sha256sum -c); \
    apt-get update; \
    apt-get -y --no-install-recommends install $(dpkg -I /tmp/jdk.deb | grep Depends: | cut -d: -f2- | sed -e 's/,/ /g'); \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
    dpkg -i /tmp/jdk.deb; \
    rm -f /tmp/jdk.deb

ARG BUILD_DATE="1970-01-01T00:00:00+0000"
ARG SOURCE
ARG REVISION
ARG BUILD_JOB_ID
ARG BUILD_NUMBER
ARG BUILD_URL
ARG BUILD_BRANCH

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.title="OpenJDK Development Kit 17" \
      org.opencontainers.image.source="${SOURCE}" \
      org.opencontainers.image.revision="${REVISION}" \
      org.opencontainers.image.version="17" \
      org.opencontainers.image.vendor="The OpenNMS Group, Inc." \
      org.opencontainers.image.authors="OpenNMS Community" \
      org.opencontainers.image.licenses="AGPL-3.0" \
      org.opennms.image.base="${BASE_IMAGE}:${BASE_IMAGE_VERSION}" \
      org.opennme.cicd.jobid="${BUILD_JOB_ID}" \
      org.opennms.cicd.buildnumber="${BUILD_NUMBER}" \
      org.opennms.cicd.buildurl="${BUILD_URL}" \
      org.opennms.cicd.branch="${BUILD_BRANCH}"
