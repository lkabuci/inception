# wordpress
FROM debian:bullseye

ENV WORDPRESS_DB_HOST db
ENV WORDPRESS_DB_NAME wordpress_db
ENV WORDPRESS_DB_USER wordpress_user
ENV WORDPRESS_DB_PASS super+secret+passwp

RUN apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
        php-fpm=2:7.4+76 \
        php-mysql=2:7.4+76 \
        wget=1.21-1+deb11u1 \
        ca-certificates=20210119 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./tools/setup.sh /

ENTRYPOINT ["bash", "setup.sh"]

CMD ["php-fpm7.4", "-F"]

