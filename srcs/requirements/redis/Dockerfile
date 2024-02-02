# Redis
FROM debian:bullseye-slim
LABEL authors="kaboussi"

RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests \
    redis-server=5:6.0.16-1+deb11u2 \
    && sed -i "s|bind 127.0.0.1 ::1|bind 0.0.0.0|" /etc/redis/redis.conf \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 6379

CMD ["redis-server", "--protected-mode no"]