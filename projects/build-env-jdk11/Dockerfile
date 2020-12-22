ARG BASE_IMAGE="opennms/maven"
ARG BASE_IMAGE_VERSION="jdk11_3.6.1"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG REPO_HOST="yum.opennms.org"
ARG REPO_RELEASE="stable"
ARG REPO_KEY_URL="https://${REPO_HOST}/OPENNMS-GPG-KEY"

ARG ADD_RPMS="https://${REPO_HOST}/repofiles/opennms-repo-${REPO_RELEASE}-rhel8.noarch.rpm \
              https://${REPO_HOST}/${REPO_RELEASE}/rhel7/nsis/mingw32-nsis-2.50-1.el7.centos.x86_64.rpm"

# IF YOU EDIT THIS, MAKE SURE YOU EDIT config.sh TOO!
ARG PACKAGES="\
	automake \
	cmake \
	expect \
	gcc-c++ \
	gettext \
	git-core \
	gnupg2 \
	jicmp \
	jicmp6 \
	jrrd2 \
	jq \
	libtool \
	libxslt \
	make \
	nodejs \
	openssh-clients \
	python2 \
	python3 \
	R-core \
	redhat-rpm-config \
	rpm-build \
	rpm-sign \
	rrdtool-devel \
	rsync \
	tree \
	wget \
	which \
"

ARG SHELLCHECK_VERSION="0.6.0"
ARG DOCKER_COMPOSE_VERSION="1.25.5"

COPY ./rpms /tmp/rpms

SHELL ["/bin/bash", "-c"]

# Install repositories, system and OpenNMS packages and do some cleanup
RUN dnf -y install epel-release dnf-plugins-core && \
    dnf -y install ${ADD_RPMS} && \
    rpm --import "${REPO_KEY_URL}" && \
    dnf config-manager --set-enabled powertools && \
    dnf -y install ${PACKAGES} && \
    dnf clean all && \
    rm -rf /var/cache/yum
RUN wget -qO- "https://github.com/koalaman/shellcheck/releases/download/v${SHELLCHECK_VERSION}/shellcheck-v${SHELLCHECK_VERSION}.linux.x86_64.tar.xz" | tar -xJv && \
    mv shellcheck-"v${SHELLCHECK_VERSION}"/shellcheck /usr/bin/ && \
    rm -rf shellcheck-*
RUN dnf -y install yum-utils device-mapper-persistent-data lvm2 && \
    dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    dnf -y install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm && \
    dnf -y install docker-ce docker-ce-cli && \
    curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    dnf clean all && \
    rm -rf /var/cache/yum
RUN if [ "$(ls -1 /tmp/rpms/*.rpm 2>/dev/null | wc -l)" != 0 ]; then cd /tmp/rpms && yum -y localinstall *.rpm; fi && \
    rm -rf /tmp/rpms && \    
    dnf clean all && \
    rm -rf /var/cache/yum

ARG BUILD_DATE="1970-01-01T00:00:00+0000"
ARG VERSION
ARG SOURCE
ARG REVISION
ARG BUILD_JOB_ID
ARG BUILD_NUMBER
ARG BUILD_URL
ARG BUILD_BRANCH

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.title="OpenNMS Build Environment ${VERSION}" \
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
