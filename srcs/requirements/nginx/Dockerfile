# nginx
FROM debian:bullseye

RUN apt-get update && apt-get install -y --no-install-recommends \
    nginx=1.18.0-6.1+deb11u3 \
    openssl=1.1.1w-0+deb11u1 \
    iproute2=5.10.0-4 \
    vim=2:8.2.2434-3+deb11u1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default /etc/nginx/sites-available/default

COPY ./tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 443

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
