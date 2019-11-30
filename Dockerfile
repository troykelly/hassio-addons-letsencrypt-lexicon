ARG BUILD_FROM
FROM $BUILD_FROM

# setup base
ARG CERTBOT_VERSION

RUN apk add --no-cache --update openssl libffi musl \
    && apk add --no-cache --virtual .build-dependencies g++ musl-dev openssl-dev libffi-dev libxml2-dev libxslt-dev git \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir certbot==${CERTBOT_VERSION} dns-lexicon[full] \
    && mkdir -p /opt \
    && git clone https://github.com/lukas2511/dehydrated.git /opt/dehydrated/ \
    && curl -L https://raw.githubusercontent.com/AnalogJ/lexicon/master/examples/dehydrated.default.sh -o /opt/dehydrated/dehydrated.default.sh \
    && chmod +x /opt/dehydrated/dehydrated.default.sh \
    && apk del .build-dependencies

# Copy data
COPY run.sh /

CMD [ "/run.sh" ]
