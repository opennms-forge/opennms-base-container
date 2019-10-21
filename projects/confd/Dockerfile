ARG BASE_IMAGE="opennms/centos"
ARG BASE_IMAGE_VERSION="8"
ARG VERSION=${BASE_IMAGE_VERSION}

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG BUILD_DATE="1970-01-01T00:00:00+0000"
ARG VERSION="0.16.0"
ARG CONFD_URL="https://github.com/kelseyhightower/confd/releases/download/v${VERSION}/confd-${VERSION}-linux-amd64"

RUN curl -L ${CONFD_URL} -o /usr/bin/confd && \
    chmod +x /usr/bin/confd

LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="CentOS" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      org.opennms.container.image.os.name="CentOS" \
      org.opennms.container.image.os.version="${VERSION}" \
      org.opennms.container.image.os.build-date="${BUILD_DATE}"
