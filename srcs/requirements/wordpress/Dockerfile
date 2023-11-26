# wordpress
FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        php-fpm=2:7.4+76 \
        php-mysql=2:7.4+76 \
        wget=1.21-1+deb11u1 \
        ca-certificates=20210119 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/bin/
COPY ./tools/setup.sh .
RUN wget --progress=bar:force:noscroll -O wp \
    https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp setup.sh \
    && mkdir -p /var/www/html/ \
    && wp core download --path=/var/www/html --allow-root \
    && ./setup.sh

ENTRYPOINT ["bash"]
