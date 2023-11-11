# wordpress
FROM debian:bullseye

RUN apt-get update && apt-get install -y --no-install-recommends \
    php-fpm=2:7.4+76 \
    iproute2=5.10.0-4 \
    vim=2:8.2.2434-3+deb11u1 \
    less=551-2 \
    ca-certificates=20210119 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/bin/
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar wp
RUN chmod +x wp

WORKDIR /var/www/html
RUN wp --allow-root --skip-plugins --skip-themes --skip-packages --insecure core download

# ENTRYPOINT [ "bash" ]
