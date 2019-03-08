ARG BASE_IMAGE="alpine"
ARG BASE_IMAGE_VERSION="3.9"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION="0.12.0"
ARG BUILD_DATE="1970-01-01T00:00:00+0000"
ARG GHR_RELEASE_URL="https://github.com/tcnksm/ghr/releases/download/v${VERSION}/ghr_v${VERSION}_linux_amd64.tar.gz"

RUN apk add --no-cache ca-certificates && \
    wget ${GHR_RELEASE_URL} -O /tmp/ghr.tar.gz && \
    tar --strip 1 -xzf /tmp/ghr.tar.gz ghr_v${VERSION}_linux_amd64/ghr -C /usr/local/bin && \
    rm -rf /tmp/ghr.tar.gz
    
LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="Git Hub Release (ghr)" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      org.opennms.container.image.os.name="Debian Stretch" \
      org.opennms.container.image.os.build-date="${BUILD_DATE}"
