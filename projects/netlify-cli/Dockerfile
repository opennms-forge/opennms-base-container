ARG BASE_IMAGE="node/11-alpine"
ARG BASE_IMAGE_VERSION="latest"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION="2.8.3"
ARG BUILD_DATE="1970-01-01T00:00:00+0000"

# Install repositories, system and OpenNMS packages and do some cleanup
RUN apk add --no-cache ca-certificates && \
    npm install netlify-cli -g

LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="OpenNMS Build Environment" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      org.opennms.container.image.os.name="Alpine Linux" \
      org.opennms.container.image.os.build-date="${BUILD_DATE}"
