FROM debian:bullseye as certifier

WORKDIR /etc/ssl/nginx
RUN set -x &&\
    apt-get update &&\
    apt-get install -y --no-install-recommends --no-install-suggests \
        apt-utils=2.2.4 \
        openssl=1.1.1w-0+deb11u1 &&\
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout inception.key \
        -out inception.crt \
        -subj "/CN=inception" &&\
    apt-get remove --purge --auto-remove -y openssl apt-utils &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

FROM debian:bullseye

RUN set -x &&\
    apt-get update &&\
    apt-get install -y --no-install-recommends --no-install-suggests \
        apt-utils=2.2.4 \
        nginx=1.18.0-6.1+deb11u3 &&\
    apt-get remove --purge --auto-remove -y apt-utils &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* &&\
    ln -sf /dev/stdout /var/log/nginx/access.log &&\
    ln -sf /dev/stderr /var/log/nginx/error.log &&\
    mkdir -p /etc/ssl/nginx

COPY conf/nginx.conf /etc/nginx/conf.d
COPY --from=certifier /etc/ssl/nginx/inception.crt /etc/ssl/nginx
COPY --from=certifier /etc/ssl/nginx/inception.key /etc/ssl/nginx

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
