# vsftpd
FROM debian:bullseye-slim as certifier
LABEL authors="kaboussi"

RUN set -x &&\
    apt-get update &&\
    apt-get install -y --no-install-recommends --no-install-suggests\
    openssl=1.1.1w-0+deb11u1 &&\
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout vsftpd.key \
        -out vsftpd.crt \
        -subj "/CN=inception" &&\
    apt-get remove --purge --auto-remove -y openssl &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*


FROM debian:bullseye-slim

# ensure that if any command in the pipeline fails
# the entire RUN command will fail
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN set -x &&\
    apt-get update && apt-get install -y --no-install-recommends --no-install-suggests \
        vsftpd=3.0.3-12+b1 &&\
    apt-get remove --purge --auto-remove -y &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*


COPY --from=certifier /vsftpd.key /etc/ssl/private/vsftpd.key
COPY --from=certifier /vsftpd.crt /etc/ssl/private/vsftpd.crt
COPY conf/vsftpd.conf /etc
COPY tools/logger.sh /usr/bin/logger.sh

ENTRYPOINT ["/bin/bash", "/usr/bin/logger.sh"]

CMD [ "/usr/sbin/vsftpd" ]

