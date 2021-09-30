ARG BASE_IMAGE="debian"
ARG BASE_IMAGE_VERSION="buster-slim"
ARG WWW_ROOT="/var/www/rpms"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

RUN apt-get update && \
    apt-get -y install createrepo lighttpd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY container-fs/lighttpd/httpd.conf /etc/
COPY container-fs/entrypoint.sh /

ARG BUILD_DATE="1970-01-01T00:00:00+0000"
ARG SOURCE
ARG REVISION
ARG BUILD_JOB_ID
ARG BUILD_NUMBER
ARG BUILD_URL
ARG BUILD_BRANCH
ARG VERSION

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.title="YUM repository with confd ${BASE_IMAGE_VERSION}" \
      org.opencontainers.image.source="${SOURCE}" \
      org.opencontainers.image.revision="${REVISION}" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.vendor="The OpenNMS Group, Inc." \
      org.opencontainers.image.authors="OpenNMS Community" \
      org.opencontainers.image.licenses="AGPL-3.0" \
      org.opennms.image.base="${BASE_IMAGE}:${BASE_IMAGE_VERSION}" \
      org.opennme.cicd.jobid="${BUILD_JOB_ID}" \
      org.opennms.cicd.buildnumber="${BUILD_NUMBER}" \
      org.opennms.cicd.buildurl="${BUILD_URL}" \
      org.opennms.cicd.branch="${BUILD_BRANCH}"

CMD ["/usr/local/bin/start-yum-server.sh"]

ENTRYPOINT [ "/entrypoint.sh" ]

### Runtime information and not relevant at build time

VOLUME [ "/repo" ]

EXPOSE 19990/tcp
