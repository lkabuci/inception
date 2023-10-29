FROM debian:stable

RUN apt update
RUN apt install -y mariadb-server mariadb-client iproute2 vim

ENTRYPOINT ["mariadbd"]

