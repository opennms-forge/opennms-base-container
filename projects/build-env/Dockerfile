ARG BASE_IMAGE="opennms/maven"
ARG BASE_IMAGE_VERSION="latest"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION=${BASE_IMAGE_VERSION}
ARG BUILD_DATE="1970-01-01T00:00:00+0000"

ARG REPO_KEY_URL="https://${REPO_HOST}/OPENNMS-GPG-KEY"
ARG REPO_RELEASE="develop"
ARG REPO_HOST="yum.opennms.org"

ARG REPO_RPM="https://${REPO_HOST}/repofiles/opennms-repo-${REPO_RELEASE}-rhel7.noarch.rpm \
                 http://yum.opennms.org/stable/rhel7/nsis/mingw32-nsis-2.50-1.el7.centos.x86_64.rpm"

ARG PACKAGES="gettext wget git which expect make cmake gcc-c++ rrdtool-devel automake libtool rpm-build redhat-rpm-config R-core jicmp jicmp6 jrrd2"

COPY ./rpms /tmp/rpms

SHELL ["/bin/bash", "-c"]

# Install repositories, system and OpenNMS packages and do some cleanup
RUN yum -y install epel-release && \
    rpm --import "${REPO_KEY_URL}" && \
    yum -y install ${REPO_RPM} && \
    if [ "$(ls -1 /tmp/rpms/*.rpm 2>/dev/null | wc -l)" != 0 ]; then cd /tmp/rpms && yum -y localinstall *.rpm; fi && \
    rm -rf /tmp/rpms && \
    yum -y install ${PACKAGES} && \
    yum clean all && \
    rm -rf /var/cache/yum

LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="OpenNMS Build Environment" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      org.opennms.container.image.os.name="CentOS" \
      org.opennms.container.image.os.version="${VERSION}" \
      org.opennms.container.image.os.build-date="${BUILD_DATE}"
