# mariadb
FROM debian:bullseye-slim

# TODO: move only mariadb to bottom
RUN apt-get update && apt-get install -y \
    vim \
    iputils-ping \
    mariadb-server=1:10.5.21-0+deb11u1 \
    mariadb-client=1:10.5.21-0+deb11u1

# TODO: delete these environment variables
ENV MYSQL_DATABASE=wordpress_db
ENV MYSQL_USER=wordpress_user
ENV MYSQL_PASSWORD=wordpress_pass
ENV MYSQL_ROOT_PASSWORD=super+secret+pass

RUN set -x &&\
    apt-get update \
    # && apt-get install -y --no-install-recommends --no-install-suggests \
    #     mariadb-server=1:10.5.21-0+deb11u1 \
    #     netcat=1.10-46 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY tools/setup.sh /usr/local/bin/

ENTRYPOINT ["bash", "/usr/local/bin/setup.sh"]

CMD ["mariadbd"]
