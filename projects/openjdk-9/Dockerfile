ARG BASE_IMAGE="centos"
ARG BASE_IMAGE_VERSION="latest"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG BUILD_DATE="1970-01-01T00:00:00+0000"

ARG JDK_MAJOR_VERSION=9
ARG JDK_VERSION_DETAIL=${MAJOR_VERSION}+181

ENV JAVA_HOME /usr/lib/jvm/java

RUN yum install -y unzip && \
    curl https://download.java.net/openjdk/jdk9/ri/openjdk-9+181_linux-x64_ri.zip -o /opt/openjdk.zip && \
    cd /opt/ && \
    unzip /opt/openjdk.zip && \
    mv /opt/java-se-9-ri/jdk-9 /opt && \
    rm -rf /opt/java-se-9-ri && \
    rm -rf /opt/openjdk.zip && \
    ln -s /opt/jdk-9/bin/java /usr/bin/java && \
    ln -s /opt/jdk-9/bin/javac /usr/bin/javac && \
    yum -y clean all && \
    rm -rf /var/cache/yum

LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="OpenJDK Development Kit" \
      version="${JDK_VERSION_DETAIL}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      org.opennms.container.image.java.name="${BASE_IMAGE}" \
      org.opennms.container.image.java.version="${JDK_VERSION_DETAIL}" \
      org.opennms.container.image.java.build-date="${BUILD_DATE}"