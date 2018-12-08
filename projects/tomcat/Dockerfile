ARG BASE_IMAGE=tomcat
ARG BASE_IMAGE_VERSION="latest"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION=${BASE_IMAGE_VERSION}
ARG BUILD_DATE="1970-01-01T00:00:00+0000"

LABEL maintainer="Jesse White <jesse@opennms.org>" \
      license="AGPLv3" \
      name="Tomcat" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community"

# Enable JMX
ENV JAVA_OPTS -Dcom.sun.management.jmxremote.port=8081 -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false

# JMX
EXPOSE 8081