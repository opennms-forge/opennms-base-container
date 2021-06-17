ARG BASE_IMAGE="centos"
ARG BASE_IMAGE_VERSION="8"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG JDK_MAJOR_VERSION=17
ARG JDK_BUILD_VERSION=26
ARG JDK_VERSION_DETAIL=${JDK_MAJOR_VERSION}_${JDK_BUILD_VERSION}

ENV JAVA_HOME /usr/lib/jvm/jdk-17

RUN mkdir -p /usr/lib/jvm && \
    curl -L -o /tmp/jdk.tar.gz \
    "https://download.java.net/java/early_access/jdk${JDK_MAJOR_VERSION}/${JDK_BUILD_VERSION}/GPL/openjdk-${JDK_MAJOR_VERSION}-ea+${JDK_BUILD_VERSION}_linux-x64_bin.tar.gz" && \
    tar -C /usr/lib/jvm -xvzf /tmp/jdk.tar.gz && \
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
