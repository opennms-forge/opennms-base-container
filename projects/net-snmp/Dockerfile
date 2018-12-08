ARG BASE_IMAGE="alpine"
ARG BASE_IMAGE_VERSION="latest"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION="5.7.3-r11"
ARG BUILD_DATE="1970-01-01T00:00:00+0000"

RUN apk --no-cache add net-snmp>${VERSION} && \
    mkdir -p /etc/snmp/conf.d

COPY config/snmpd.conf /etc/snmp/snmpd.conf
COPY config/conf.d/* /etc/snmp/conf.d/

LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="Net-SNMP" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community"

ENTRYPOINT [ "/usr/sbin/snmpd" ]

CMD [ "-f", "-Le", "-LS0-6d", "-c", "/etc/snmp/snmpd.conf" ]

### Runtime information and not relevant at build time

EXPOSE 161/udp
