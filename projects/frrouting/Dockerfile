####
# Build a dist tarball from the source
####
ARG BASE_IMAGE="alpine"
ARG BASE_IMAGE_VERSION="edge"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION} as source-builder

ARG FRR_GIT_URL="https://github.com/FRRouting/frr.git"
ARG FRR_BRANCH="origin/stable/7.1"
ARG SRC_DIR="/src/frr"
ARG DIST_DIR="/dist/"

RUN mkdir -p "${SRC_DIR}"

# hadolint ignore=DL3013,DL3018
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    apk --no-cache add \
        json-c c-ares ipsec-tools iproute2 python2 python2-dev py-ipaddr bash gzip \
    	ncurses-dev net-snmp-dev gawk texinfo perl \
        acct autoconf automake bash binutils bison bsd-compat-headers build-base c-ares c-ares-dev ca-certificates \
        cryptsetup-libs curl device-mapper-libs expat fakeroot flex fortify-headers gdbm git gmp isl json-c-dev kmod \
        lddtree libacl libatomic libattr libblkid libburn libbz2 libc-dev libcap-dev libcurl libedit libffi libgcc \
        libgomp libisoburn libisofs libltdl libressl libssh2 libstdc++ libtool libuuid libyang-dev linux-headers \
        lzip lzo m4 make mkinitfs mpc1 mpfr3 mtools musl-dev ncurses-libs ncurses-terminfo ncurses-terminfo-base \
        patch pax-utils pcre perl pkgconf readline readline-dev sqlite-libs squashfs-tools sudo tar texinfo xorriso \
        xz-libs py-pip py-sphinx rtrlib rtrlib-dev && \
    pip install pytest

RUN mkdir -p "${SRC_DIR}" "${DIST_DIR}" && \
    git clone "${FRR_GIT_URL}" "${SRC_DIR}"

# hadolint ignore=DL3000
WORKDIR "${SRC_DIR}"

RUN echo "_git$(printf '%u\n' 0x"$(git rev-parse --short=10 HEAD)")" > pkgver && \
    if [ "${FRR_BRANCH}" != "master" ]; then git checkout "${FRR_BRANCH}"; fi

# Build Alpine Packages with custom configure flags
COPY container-fs/APKBUILD.in "${SRC_DIR}"/alpine

RUN ./bootstrap.sh && \
    ./configure \
      --enable-numeric-version \
      --with-pkg-extra-version="$(cat pkgver)" && \
    make dist && \
    cp frr-*.tar.gz "${DIST_DIR}" && \
    cp -r alpine/* "${DIST_DIR}"

####
# Build an alpine package (apk) from the dist tarball
####
FROM source-builder as package-builder

ARG SRC_DIR="/src/frr"
ARG PKG_DIR="/pkgs/apk"
ARG DIST_DIR="/dist/"

# hadolint ignore=DL3018
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --no-cache \
	abuild alpine-conf alpine-sdk py-pip && \
    setup-apkcache /var/cache/apk && \
    mkdir -p "${PKG_DIR}" "${DIST_DIR}" && \
    echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN adduser -D -G abuild builder && chown -R builder /dist /pkgs

USER builder

# hadolint ignore=DL3000
WORKDIR "${DIST_DIR}"

RUN abuild-keygen -a -n && \
    abuild checksum && \
    abuild -r -P /pkgs/apk

####
# Build container image based on Alpine
####
ARG BASE_IMAGE="alpine"
ARG BASE_IMAGE_VERSION="edge"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG S6_OVERLAY_VERSION="v1.22.1.0"
ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
    rm -rf /tmp/s6-overlay-amd64.tar.gz

RUN mkdir -p /pkgs/apk

COPY --from=package-builder /pkgs/apk/ /pkgs/apk/

# hadolint ignore=DL3018
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
	apk add --no-cache --update-cache net-snmp net-snmp-tools && \
	apk add --no-cache --allow-untrusted /pkgs/apk/*/*.apk && \
	rm -rf /pkgs

COPY container-fs/etc/s6/services /etc/s6/services
COPY container-fs/etc/fix-attrs.d /etc/fix-attrs.d
COPY container-fs/etc/snmp /etc/snmp
COPY container-fs/docker-start /usr/lib/frr

ENTRYPOINT [ "/init" ]

CMD ["/usr/lib/frr/docker-start"]

LABEL maintainer="ronny@opennms.org" \
      license="LGPLv2.1" \
      name="FRRouting" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      org.opennms.container.image.os.name="alpine" \
      org.opennms.container.image.os.version="${VERSION}" \
      org.opennms.container.image.os.build-date="${BUILD_DATE}"