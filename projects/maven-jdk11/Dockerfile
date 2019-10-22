ARG BASE_IMAGE=opennms/openjdk
ARG BASE_IMAGE_VERSION="11.0.4.11"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG MAVEN_VERSION="3.6.1"

ARG MAVEN_HOST="https://www-eu.apache.org"
ARG MAVEN_URL="${MAVEN_HOST}/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz"
ARG MAVEN_HOME="/opt/apache-maven-${MAVEN_VERSION}"

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${MAVEN_HOME}/bin

WORKDIR /opt

RUN curl ${MAVEN_URL} | tar xz

ARG BUILD_DATE="1970-01-01T00:00:00+0000"

LABEL maintainer="The OpenNMS Group" \
      license="Apache License, Version 2.0" \
      name="Apache Maven" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      org.opennms.container.image.app.maven.name="Apache Maven" \
      org.opennms.container.image.app.maven.version="${VERSION}" \
      org.opennms.container.image.app.maven.build-date="${BUILD_DATE}"
