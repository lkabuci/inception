FROM debian:stable

RUN apt update
RUN apt install -y nginx openssl iproute2 vim

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/default /etc/nginx/sites-enabled/default

COPY conf/certs/ /etc/nginx/certs/

ENTRYPOINT ["nginx", "-g", "daemon off;"]
