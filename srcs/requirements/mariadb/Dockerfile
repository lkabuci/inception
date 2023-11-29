# mariadb
FROM debian:bullseye

# Set environment variables
ENV MYSQL_DATABASE=wordpress_db
ENV MYSQL_USER=wordpress_user
ENV MYSQL_PASSWORD=wordpress_pass
ENV MYSQL_ROOT_PASSWORD=super+secret+pass

RUN set -x &&\
    apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
        mariadb-server=1:10.5.21-0+deb11u1 \
        netcat=1.10-46 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/setup.sh /usr/local/bin/

ENTRYPOINT ["bash", "/usr/local/bin/setup.sh"]

CMD ["mariadbd"]
