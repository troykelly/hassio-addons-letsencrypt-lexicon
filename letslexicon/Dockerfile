ARG BUILD_FROM=ghcr.io/hassio-addons/base-python/amd64:9.0.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Copy root filesystem
COPY rootfs /

ARG DEHYDRATED_VERSION=v0.7.0
ARG LEXICON_VERSION=3.11.4

# Setup base
RUN apk add --no-cache \
        coreutils=9.1-r0 \
        libffi=3.4.2-r1 \
        musl=1.2.3-r0 \
        openssl=1.1.1q-r0 \
        sed=4.8-r0 \
        wget=1.21.3-r0 && \
    apk add --no-cache --virtual .build-dependencies \
        g++=11.2.1_git20220219-r2 \
        git=2.36.2-r0 \
        libffi-dev=3.4.2-r1 \
        libxml2-dev=2.9.14-r1 \
        libxslt-dev=1.1.35-r0 \
        musl-dev=1.2.3-r0 \
        openssl-dev=1.1.1q-r0 && \
    pip install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir dns-lexicon[full]==${LEXICON_VERSION} && \
    mkdir -p /opt /var/www/dehydrated && \
    git clone https://github.com/lukas2511/dehydrated.git --branch ${DEHYDRATED_VERSION} --depth 1 /opt/dehydrated/ && \
    curl -L https://raw.githubusercontent.com/AnalogJ/lexicon/master/examples/dehydrated.default.sh -o /opt/dehydrated/dehydrated.default.sh && \
    chmod +x /opt/dehydrated/dehydrated.default.sh && \
    apk del .build-dependencies

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Troy Kelly <troy@troykelly.com>" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="Home Assistant Community Add-ons" \
    org.opencontainers.image.authors="Troy Kelly <troy@troykelly.com>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://troykelly.com" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
