ARG BASE_IMAGE="node"
ARG BASE_IMAGE_VERSION="18-bullseye"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION="4.0.0"
ARG BUILD_DATE="1970-01-01T00:00:00+0000"

RUN apt-get update && \
    apt-get install -y git-core openssh-client && \
    rm -rf /var/lib/apt/lists/* && \
    npm install gulp -g
    
LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="Gulp" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      org.opennms.container.image.os.name="Debian Buster" \
      org.opennms.container.image.os.build-date="${BUILD_DATE}"
