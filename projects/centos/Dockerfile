ARG BASE_IMAGE="centos"
ARG BASE_IMAGE_VERSION="latest"
ARG VERSION=${BASE_IMAGE_VERSION}

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION=${BASE_IMAGE_VERSION}

RUN dnf -y --nodocs upgrade && \
    dnf clean all

ARG BUILD_DATE="1970-01-01T00:00:00+0000"

LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="CentOS" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      org.opennms.container.image.os.name="CentOS" \
      org.opennms.container.image.os.version="${VERSION}" \
      org.opennms.container.image.os.build-date="${BUILD_DATE}"
