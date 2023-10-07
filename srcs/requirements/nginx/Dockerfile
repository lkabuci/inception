FROM debian:stable

RUN apt update
RUN apt install vim -y
RUN apt install nginx -y
RUN apt install openssl -y
RUN apt install iproute2 -y

ENTRYPOINT ["nginx", "-g", "daemon off;"]
