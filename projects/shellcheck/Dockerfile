ARG BASE_IMAGE=ubuntu
ARG BASE_IMAGE_VERSION="rolling"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION=${BASE_IMAGE_VERSION}
ARG BUILD_DATE="1970-01-01T00:00:00+0000"

ENV HOME /home/circleci
ENV DEBIAN_FRONTEND=noninteractive

RUN echo 'APT::Get::Assume-Yes "true";' > /etc/apt/apt.conf.d/90circleci && \
    echo 'DPkg::Options "--force-confnew";' >> /etc/apt/apt.conf.d/90circleci && \
    apt-get update && \
    apt-get install -y ca-certificates shellcheck && \
    rm -rf /var/lib/apt/lists/* && \
    groupadd --gid 3434 circleci && \
    useradd --uid 3434 --gid circleci --shell /bin/bash --create-home circleci

LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="Shellcheck" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      org.opennms.container.image.os.name="Ubuntu" \
      org.opennms.container.image.os.version="${VERSION}" \
      org.opennms.container.image.os.build-date="${BUILD_DATE}"

ENTRYPOINT ["/usr/bin/shellcheck"]

CMD ["--help"]