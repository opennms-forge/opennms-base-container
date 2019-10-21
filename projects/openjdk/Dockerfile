ARG BASE_IMAGE="centos"
ARG BASE_IMAGE_VERSION="8"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG JDK8_MAJOR_VERSION=1.8.0
ARG JDK8_VERSION_DETAIL=${JDK8_MAJOR_VERSION}.212.b04

ARG JDK11_MAJOR_VERSION="11"
ARG JDK11_VERSION_DETAIL="${JDK11_MAJOR_VERSION}.0.2.7"

RUN dnf -y install java-${JDK8_MAJOR_VERSION}-openjdk-devel-${JDK8_VERSION_DETAIL} && \
    dnf -y install java-${JDK11_MAJOR_VERSION}-openjdk-devel-${JDK11_VERSION_DETAIL} && \
    dnf clean all && \
    rm -rf /var/cache/yum

ARG BUILD_DATE="1970-01-01T00:00:00+0000"
ARG SOURCE
ARG REVISION
ARG BUILD_JOB_ID
ARG BUILD_NUMBER
ARG BUILD_URL
ARG BUILD_BRANCH

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.title="OpenJDK Development Kit ${JDK8_VERSION_DETAIL}-${JDK11_VERSION_DETAIL}" \
      org.opencontainers.image.source="${SOURCE}" \
      org.opencontainers.image.revision="${REVISION}" \
      org.opencontainers.image.version="${JDK8_VERSION_DETAIL}-${JDK11_VERSION_DETAIL}" \
      org.opencontainers.image.vendor="The OpenNMS Group, Inc." \
      org.opencontainers.image.authors="OpenNMS Community" \
      org.opencontainers.image.licenses="AGPL-3.0" \
      org.opennms.image.base="${BASE_IMAGE}:${BASE_IMAGE_VERSION}" \
      org.opennme.cicd.jobid="${BUILD_JOB_ID}" \
      org.opennms.cicd.buildnumber="${BUILD_NUMBER}" \
      org.opennms.cicd.buildurl="${BUILD_URL}" \
      org.opennms.cicd.branch="${BUILD_BRANCH}"

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0