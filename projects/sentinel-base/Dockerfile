#
# Dockerfile to build a base image before installing Horizon to be cachable
#
ARG BASE_IMAGE="opennms/openjdk"
ARG BASE_IMAGE_VERSION="11.0.2.7"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION=${BASE_IMAGE_VERSION}
ARG BUILD_DATE="1970-01-01T00:00:00+0000"

ARG PACKAGES="wget gettext"
ARG CONFD_VERSION="0.16.0"
ARG CONFD_URL="https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64"

ARG REPO_KEY_URL="https://yum.opennms.org/OPENNMS-GPG-KEY"
ARG REPO_RPM="https://yum.opennms.org/repofiles/opennms-repo-stable-rhel7.noarch.rpm"

SHELL ["/bin/bash", "-c"]

# Install packages, repositories and dependencies
RUN setcap cap_net_raw+ep ${JAVA_HOME}/bin/java && \
    echo ${JAVA_HOME}/lib/jli > /etc/ld.so.conf.d/java-latest.conf && \
    ldconfig && \
    curl -L ${CONFD_URL} -o /usr/bin/confd && \
    chmod +x /usr/bin/confd && \
    yum -y install epel-release && \
    rpm --import "${REPO_KEY_URL}" && \
    yum -y install "${REPO_RPM}" && \
    yum -y install ${PACKAGES} && \
    yum clean all -y && \
    rm -rf /var/cache/yum

LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="Sentinel Base Install Image" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      io.confd.version="${CONFD_VERSION}"
