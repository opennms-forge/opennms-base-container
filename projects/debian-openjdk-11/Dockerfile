ARG BASE_IMAGE="debian"
ARG BASE_IMAGE_VERSION="stretch"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VM_TYPE=openj9

RUN mkdir -p /usr/share/man/man1 && \
    apt-get update && \
    apt-get -y --no-install-recommends install apt-transport-https ca-certificates gnupg2 wget && \
    apt-get -y --no-install-recommends -t stretch-backports install openjdk-11-jdk-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ARG BUILD_DATE="1970-01-01T00:00:00+0000"
ARG SOURCE
ARG REVISION
ARG BUILD_JOB_ID
ARG BUILD_NUMBER
ARG BUILD_URL
ARG BUILD_BRANCH

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.title="OpenJDK Development Kit 11" \
      org.opencontainers.image.source="${SOURCE}" \
      org.opencontainers.image.revision="${REVISION}" \
      org.opencontainers.image.version="11" \
      org.opencontainers.image.vendor="The OpenNMS Group, Inc." \
      org.opencontainers.image.authors="OpenNMS Community" \
      org.opencontainers.image.licenses="AGPL-3.0" \
      org.opennms.image.base="${BASE_IMAGE}:${BASE_IMAGE_VERSION}" \
      org.opennme.cicd.jobid="${BUILD_JOB_ID}" \
      org.opennms.cicd.buildnumber="${BUILD_NUMBER}" \
      org.opennms.cicd.buildurl="${BUILD_URL}" \
      org.opennms.cicd.branch="${BUILD_BRANCH}"

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
