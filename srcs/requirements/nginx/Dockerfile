FROM debian:bullseye-slim as certifier

WORKDIR /etc/ssl/nginx
RUN set -x &&\
    apt-get update &&\
    apt-get install -y --no-install-recommends --no-install-suggests openssl=1.1.1w-0+deb11u1 &&\
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout inception.key \
        -out inception.crt \
        -subj "/CN=inception" &&\
    apt-get remove --purge --auto-remove -y openssl &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

FROM debian:bullseye-slim

RUN set -x &&\
    apt-get update &&\
    apt-get install -y --no-install-recommends --no-install-suggests nginx=1.18.0-6.1+deb11u3 &&\
    apt-get remove --purge --auto-remove -y &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* &&\
    mkdir -p /etc/ssl/nginx &&\
    ln -sf /dev/stdout /var/log/nginx/access.log &&\
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY conf/nginx.conf /etc/nginx/conf.d
COPY --from=certifier /etc/ssl/nginx/inception.crt /etc/ssl/nginx
COPY --from=certifier /etc/ssl/nginx/inception.key /etc/ssl/nginx

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
