ARG BASE_IMAGE="centos"
ARG BASE_IMAGE_VERSION="8"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG JDK_MAJOR_VERSION=8u322
ARG JDK_BUILD_VERSION=06
ARG JDK_VERSION_DETAIL=${JDK_MAJOR_VERSION}b${JDK_BUILD_VERSION}
ARG JDK_TARBALL=https://github.com/adoptium/temurin8-binaries/releases/download/jdk${JDK_MAJOR_VERSION}-b${JDK_BUILD_VERSION}/OpenJDK8U-jdk_x64_linux_hotspot_${JDK_MAJOR_VERSION}b${JDK_BUILD_VERSION}.tar.gz

ENV JAVA_HOME /usr/lib/jvm/jdk-8

RUN mkdir -p /usr/lib/jvm && \
    curl -L -o /tmp/jdk.tar.gz \
    "${JDK_TARBALL}" && \
    tar -C /usr/lib/jvm -xvzf /tmp/jdk.tar.gz && \
    mv "/usr/lib/jvm/jdk${JDK_MAJOR_VERSION}"* "${JAVA_HOME}" && \
    rm /tmp/jdk.tar.gz

ARG BUILD_DATE="1970-01-01T00:00:00+0000"
ARG SOURCE
ARG REVISION
ARG BUILD_JOB_ID
ARG BUILD_NUMBER
ARG BUILD_URL
ARG BUILD_BRANCH

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.title="OpenJDK Development Kit ${JDK_VERSION_DETAIL}" \
      org.opencontainers.image.source="${SOURCE}" \
      org.opencontainers.image.revision="${REVISION}" \
      org.opencontainers.image.version="${JDK_VERSION_DETAIL}" \
      org.opencontainers.image.vendor="The OpenNMS Group, Inc." \
      org.opencontainers.image.authors="OpenNMS Community" \
      org.opencontainers.image.licenses="AGPL-3.0" \
      org.opennms.image.base="${BASE_IMAGE}:${BASE_IMAGE_VERSION}" \
      org.opennme.cicd.jobid="${BUILD_JOB_ID}" \
      org.opennms.cicd.buildnumber="${BUILD_NUMBER}" \
      org.opennms.cicd.buildurl="${BUILD_URL}" \
      org.opennms.cicd.branch="${BUILD_BRANCH}"
