ARG BASE_IMAGE=alpine
ARG BASE_IMAGE_VERSION="latest"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION="4.4.1-r1"
ARG BUILD_DATE="1970-01-01T00:00:00+0000"

RUN apk add --no-cache dhcp
RUN ["touch", "/var/lib/dhcp/dhcpd.leases"]

CMD ["/usr/sbin/dhcpd", "-4", "-f", "-d", "--no-pid", "-cf", "/etc/dhcp/dhcpd.conf"]

VOLUME ["/etc/dhcp"]

EXPOSE 67/udp 67/tcp

LABEL maintainer="The OpenNMS Group" \
      license="ISC" \
      name="ISC Dynamic Host Configuration Protocol (DHCP)" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="ISC" \
      org.opennms.container.image.app.dhcp.name="ISC DHCP" \
      org.opennms.container.image.app.dhcp.version="${VERSION}" \
      org.opennms.container.image.app.dhcp.build-date="${BUILD_DATE}"