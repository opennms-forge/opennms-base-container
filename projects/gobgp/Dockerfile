
ARG BASE_IMAGE="centos"
ARG BASE_IMAGE_VERSION="8"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG GOBGP_VERSION="2.9.0"

ADD https://github.com/osrg/gobgp/releases/download/v${GOBGP_VERSION}/gobgp_${GOBGP_VERSION}_linux_amd64.tar.gz /tmp/gobgp.tar.gz

RUN tar xzf /tmp/gobgp.tar.gz -C /usr/bin; \
    rm -rf /tmp/gobgp.tar.gz

ENTRYPOINT [ "/usr/bin/gobgpd" ]

CMD [ "--help" ]