FROM debian:bullseye

# Set environment variables
ENV MARIADB_ROOT_PASSWORD=rootpassword
ENV MARIADB_DATABASE=masterdb
ENV MARIADB_USER=masteruser
ENV MARIADB_PASSWORD=masterpass

RUN apt-get update && apt-get install -y --no-install-recommends \
    mariadb-server=1:10.5.21-0+deb11u1 \
    iproute2=5.10.0-4 \
    vim=2:8.2.2434-3+deb11u1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the setup script into the image
COPY tools/setup.sh /usr/local/bin/

# Set permissions for the setup script and ensure it runs on container start
RUN chmod +x /usr/local/bin/setup.sh
ENTRYPOINT ["/usr/local/bin/setup.sh"]
