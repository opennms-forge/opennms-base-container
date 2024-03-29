ARG BASE_IMAGE=opennms/openjdk
ARG BASE_IMAGE_VERSION="17.0.6.0.10"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG MAVEN_VERSION="3.8.8"

ARG MAVEN_HOST="https://archive.apache.org"
ARG MAVEN_URL="${MAVEN_HOST}/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz"
ARG MAVEN_HOME="/opt/apache-maven-${MAVEN_VERSION}"

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${MAVEN_HOME}/bin

WORKDIR /opt

RUN curl ${MAVEN_URL} | tar xz && \
    dnf -y --nodocs install make && \
    dnf clean all && \
    rm -rf /var/cache/yum

ARG BUILD_DATE="1970-01-01T00:00:00+0000"
ARG SOURCE
ARG REVISION
ARG BUILD_JOB_ID
ARG BUILD_NUMBER
ARG BUILD_URL
ARG BUILD_BRANCH
ARG JDK_VERSION
ARG VERSION

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.title="Apache Maven ${MAVEN_VERSION} with OpenJDK ${JDK_VERSION}" \
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
