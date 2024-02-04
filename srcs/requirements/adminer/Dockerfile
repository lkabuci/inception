FROM debian:bullseye-slim

WORKDIR /var/www/adminer

RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
        wget=1.21-1+deb11u1 \
        ca-certificates=20210119 \
        php=2:7.4+76 \
        php-fpm=2:7.4+76 \
        php-mysql=2:7.4+76 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY tools/setup.sh /usr/bin/setup.sh

ENTRYPOINT [ "bash", "/usr/bin/setup.sh" ]
CMD [ "php-fpm7.4", "-F" ]
