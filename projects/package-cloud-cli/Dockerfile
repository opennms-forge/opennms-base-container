ARG BASE_IMAGE="ruby"
ARG BASE_IMAGE_VERSION="2.6.1-alpine"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION="0.3.05"
ARG BUILD_DATE="1970-01-01T00:00:00+0000"

# Install repositories, system and OpenNMS packages and do some cleanup
RUN apk add --no-cache ca-certificates && \
    gem install package_cloud

LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="Package Cloud CLI" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      org.opennms.container.image.os.name="Alpine Linux" \
      org.opennms.container.image.os.build-date="${BUILD_DATE}"
