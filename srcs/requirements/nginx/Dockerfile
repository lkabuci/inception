FROM debian:stable

RUN apt update
RUN apt install -y nginx openssl iproute2 vim

ENTRYPOINT ["nginx", "-g", "daemon off;"]
