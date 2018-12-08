ARG BASE_IMAGE=centos
ARG BASE_IMAGE_VERSION="latest"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION=${BASE_IMAGE_VERSION}
ARG BUILD_DATE="1970-01-01T00:00:00+0000"

ARG JDK_RPM_URL

ENV JAVA_HOME="/usr/java/default"

RUN yum update -y && \
    curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" "${JDK_RPM_URL}" > jdk-linux-x64.rpm && \
    yum localinstall -y jdk-linux-x64.rpm && \
    rm -f jdk-linux-x64.rpm && \
    yum -y clean all && \
    rm -rf /var/cache/yum
    
LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="Oracle JDK" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      org.opennms.container.image.java.name="Oracle Java" \
      org.opennms.container.image.java.version="${VERSION}" \
      org.opennms.container.image.java.build-date="${BUILD_DATE}"


