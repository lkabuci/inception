# nginx
FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        openssl=1.1.1w-0+deb11u1 \
        nginx=1.18.0-6.1+deb11u3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /etc/ssl/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout nginx.key \
    -out nginx.crt \
    -subj "/CN=inception"

COPY conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
