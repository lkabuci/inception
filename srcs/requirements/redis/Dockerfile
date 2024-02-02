# Redis
FROM debian:bullseye-slim
LABEL authors="kaboussi"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests \
    redis-server=5:6.0.16-1+deb11u2 \
    && sed -i "s|bind 127.0.0.1 ::1|bind 0.0.0.0|" /etc/redis/redis.conf \
    && echo "vm.overcommit_memory = 1" | tee -a /etc/sysctl.conf \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 6379

CMD ["redis-server", "--protected-mode no"]
