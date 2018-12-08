ARG BASE_IMAGE=ubuntu
ARG BASE_IMAGE_VERSION="rolling"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION=${BASE_IMAGE_VERSION}
ARG BUILD_DATE="1970-01-01T00:00:00+0000"

USER root

RUN apt-get update && \
    apt-get install -y shellcheck && \
    rm -rf /var/lib/apt/lists/*

LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="Shellcheck" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      org.opennms.container.image.os.name="Ubuntu" \
      org.opennms.container.image.os.version="${VERSION}" \
      org.opennms.container.image.os.build-date="${BUILD_DATE}"

WORKDIR /opt

ENTRYPOINT ["/usr/bin/shellcheck"]
