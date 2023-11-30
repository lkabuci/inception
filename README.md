# Inception

- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
- A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
- A Docker container that contains MariaDB only without nginx.
- A volume that contains your WordPress database.
- A second volume that contains your WordPress website files.
- Adocker-networkthat establishes the connection between your containers.

```bash
docker volume create wp_volume
docker volume create db_volume
docker network create --subnet=172.18.0.0/24 --gateway=172.18.0.1 inception
```

* Mariadb
```bash
clear &&\
docker stop database \
; docker container rm database \
; docker build -t mariadb:dev . \
&& docker run -t --rm \
   --network inception \
   --ip=172.18.0.2 \
   --volume db_volume:/var/lib/mysql \
   --name database \
   mariadb:dev
```

