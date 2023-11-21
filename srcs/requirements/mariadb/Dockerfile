# mariadb
FROM debian:bullseye

# Set environment variables
ENV MYSQL_DATABASE=wordpress_db
ENV MYSQL_USER=wordpress_user
ENV MYSQL_PASSWORD=wordpress_pass
ENV MYSQL_ROOT_PASSWORD=super+secret+pass

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        mariadb-server=1:10.5.21-0+deb11u1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the setup script into the image
COPY tools/setup.sh /usr/local/bin/

# Set permissions for the setup script and ensure it runs on container start
RUN chmod +x /usr/local/bin/setup.sh
ENTRYPOINT ["/usr/local/bin/setup.sh"]
