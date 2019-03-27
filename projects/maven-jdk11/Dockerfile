ARG BASE_IMAGE=opennms/openjdk
ARG BASE_IMAGE_VERSION="latest"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION="3.6.0"
ARG BUILD_DATE="1970-01-01T00:00:00+0000"

ARG MAVEN_URL="https://mirror.netcologne.de/apache.org"
ARG MAVEN_PKG="${MAVEN_URL}/maven/maven-3/${VERSION}/binaries/apache-maven-${VERSION}-bin.tar.gz"
ARG MAVEN_HOME="/opt/apache-maven-${VERSION}"

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${MAVEN_HOME}/bin

WORKDIR /opt

RUN curl ${MAVEN_PKG} | tar xz

LABEL maintainer="The OpenNMS Group" \
      license="Apache License, Version 2.0" \
      name="Apache Maven" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      org.opennms.container.image.app.maven.name="Apache Maven" \
      org.opennms.container.image.app.maven.version="${VERSION}" \
      org.opennms.container.image.app.maven.build-date="${BUILD_DATE}"
