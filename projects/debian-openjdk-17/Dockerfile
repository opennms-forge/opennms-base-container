ARG BASE_IMAGE="debian"
ARG BASE_IMAGE_VERSION="buster"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG JDK_MAJOR_VERSION=17
ARG JDK_BUILD_VERSION=35
ARG JDK_VERSION_DETAIL=${JDK_MAJOR_VERSION}_${JDK_BUILD_VERSION}
ARG JDK_TARBALL=https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_linux-x64_bin.tar.gz

RUN apt-get update && \
    apt-get -y --no-install-recommends install apt-transport-https ca-certificates gnupg2 wget && \
    mkdir -p /usr/lib/jvm && \
    wget -v -O /tmp/jdk.tar.gz \
    "${JDK_TARBALL}" && \
    tar -C /usr/lib/jvm -xvzf /tmp/jdk.tar.gz && \
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

ENV JAVA_HOME /usr/lib/jvm/jdk-17
