# mariadb
FROM debian:bullseye-slim

RUN set -x &&\
    apt-get update && apt-get install -y --no-install-recommends --no-install-suggests \
         mariadb-server=1:10.5.21-0+deb11u1 &&\
    apt-get remove --purge --auto-remove -y &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY tools/setup.sh /usr/local/bin/

ENTRYPOINT ["bash", "/usr/local/bin/setup.sh"]

CMD ["mariadbd"]
