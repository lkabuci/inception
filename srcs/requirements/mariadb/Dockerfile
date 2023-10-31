FROM debian:bullseye

RUN apt update
RUN apt install -y mariadb-server iproute2 vim

# service mariadb restart

ENTRYPOINT ["tail", "-f", "/dev/null"]

