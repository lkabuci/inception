FROM debian:bullseye

# Set environment variables
ENV MARIADB_ROOT_PASSWORD=rootpassword
ENV MARIADB_DATABASE=masterdb
ENV MARIADB_USER=masteruser
ENV MARIADB_PASSWORD=masterpass

# Update the package listing, install MariaDB server, and clean up the cache
RUN apt update && \
    apt install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Copy the setup script into the image
COPY tools/setup.sh /usr/local/bin/

# Set permissions for the setup script and ensure it runs on container start
RUN chmod +x /usr/local/bin/setup.sh
ENTRYPOINT ["/usr/local/bin/setup.sh"]

