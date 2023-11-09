FROM debian:bullseye

RUN apt-get update && apt-get install -y --no-install-recommends \
    php-fpm=2:7.4+76 \
    iproute2=5.10.0-4 \
    vim=2:8.2.2434-3+deb11u1 \
    wget=1.21-1+deb11u1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

RUN wget -O wordpress.tar.gz https://wordpress.org/wordpress-6.4.1.tar.gz -q \
    && tar -xzf wordpress.tar.gz --strip-components=1 \
    && rm wordpress.tar.gz
