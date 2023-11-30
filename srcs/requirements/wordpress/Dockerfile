# wordpress
FROM debian:bullseye-slim

RUN set -x &&\
    apt-get update && apt-get install -y --no-install-recommends --no-install-suggests \
      ca-certificates=20210119 \
      wget=1.21-1+deb11u1 \
      php-fpm=2:7.4+76 \
      php-mysql=2:7.4+76 &&\
    wget --progress=bar:force:noscroll -O /usr/local/bin/wp \
    	https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
    apt-get remove --purge --auto-remove -y &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY tools/setup.sh /

ENTRYPOINT [ "bash", "setup.sh" ]

CMD ["php-fpm7.4", "-F"]
