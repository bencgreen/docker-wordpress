ARG PHP_VERSION=7.4.12-r1
FROM bcgdesign/nginx-php:${PHP_VERSION}

LABEL maintainer="Ben Green <ben@bcgdesign.com>" \
    org.label-schema.name="WordPress" \
    org.label-schema.version="latest" \
    org.label-schema.vendor="Ben Green" \
    org.label-schema.schema-version="1.0"

ARG PHP_VERSION

RUN apk -U upgrade \
    && apk add \
        unzip \
        php7-cgi=${PHP_VERSION} \
        php7-ctype=${PHP_VERSION} \
        php7-curl=${PHP_VERSION} \
        php7-dom=${PHP_VERSION} \
        php7-exif=${PHP_VERSION} \
        php7-fileinfo=${PHP_VERSION} \
        php7-ftp=${PHP_VERSION} \
        php7-gd=${PHP_VERSION} \
        php7-gettext=${PHP_VERSION} \
        php7-iconv=${PHP_VERSION} \
        php7-imap=${PHP_VERSION} \
        php7-json=${PHP_VERSION} \
        php7-mbstring=${PHP_VERSION} \
        php7-mysqli=${PHP_VERSION} \
        php7-sodium=${PHP_VERSION} \
        php7-openssl=${PHP_VERSION} \
        php7-simplexml=${PHP_VERSION} \
        php7-soap=${PHP_VERSION} \
        php7-sockets=${PHP_VERSION} \
        php7-xml=${PHP_VERSION} \
        php7-xmlrpc=${PHP_VERSION} \
        php7-xmlreader=${PHP_VERSION} \
        php7-zip=${PHP_VERSION} \
    && rm -rf /var/cache/apk/* /www/* /tmp/*

ENV WORDPRESS_LOCALE="en_GB" \
    WORDPRESS_CLEAN_INSTALL=0

COPY ./overlay /

VOLUME [ "/wp" ]
