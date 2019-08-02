ARG BASE_IMAGE="ubuntu"
ARG BASE_IMAGE_VERSION="latest"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION} AS s6-overlay

ARG S6_OVERLAY_VERSION="v1.22.1.0"
ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

FROM s6-overlay

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# Set some defaults for Postfix mail server
ENV MAILDOMAIN="example.org"
ENV MESSAGE_SIZE_LIMIT="52428800"

# Install package here for cache
RUN apt-get update && \
    apt-get -y install --no-install-recommends inetutils-syslogd \
                                               postfix \
                                               dovecot-common \
                                               dovecot-imapd \
                                               whois && \
    mv /etc/dovecot/conf.d /etc/dovecot/conf.d-example && \
    rm -rf /var/lib/apt/lists/*

COPY container-fs/etc/s6/services /etc/s6/services
COPY container-fs/etc/cont-init.d /etc/cont-init.d
COPY container-fs/etc/syslog.conf /etc/syslog.conf
COPY --chown=root:dovecot container-fs/etc/dovecot/conf.d /etc/dovecot/conf.d

LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="Minimal Mail Container with Postfix and Dovecot" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community"

EXPOSE 25 143

VOLUME ["/var/mail","/home"]

ENTRYPOINT ["/init"]

CMD ["/usr/lib/postfix/sbin/master", "-d"]
