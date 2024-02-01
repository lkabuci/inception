# Adminer
FROM debian:bullseye-slim AS builder
LABEL authors="kaboussi"

WORKDIR /var/www/html

RUN set -x &&\
    apt-get update && apt-get install -y --no-install-recommends --no-install-suggests \
      wget=1.21-1+deb11u1 \
      ca-certificates=20210119 &&\
    wget --progress=bar:force:noscroll -O adminer.php \
      https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php &&\
    apt-get remove --purge --auto-remove wget ca-certificates -y &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY tools/setup.sh /usr/bin/setup.sh

FROM debian:bullseye-slim

WORKDIR /var/www/html

RUN set -x &&\
    apt-get update && apt-get install -y --no-install-recommends --no-install-suggests \
      php=2:7.4+76 \
      php-fpm=2:7.4+76 \
      php-mysql=2:7.4+76 &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=builder /var/www/html/adminer.php ./adminer.php
COPY tools/setup.sh /usr/bin/setup.sh

ENTRYPOINT [ "bash", "/usr/bin/setup.sh" ]
CMD [ "php-fpm7.4", "-F" ]
