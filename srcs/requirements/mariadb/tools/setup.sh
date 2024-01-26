#!/bin/bash

set -x

sed -i 's/# port = 3306/port = 3306/' /etc/mysql/mariadb.cnf
sed -i 's/127.0.0.1/0.0.0.0/'         /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

mysqladmin -u root password $DB_ROOT_PASS
mariadb -e "CREATE DATABASE IF NOT EXISTS $WP_DB;"
mariadb -e "CREATE USER IF NOT EXISTS '$WP_USER'@'%' IDENTIFIED BY '$WP_PASS';"
mariadb -e "GRANT ALL PRIVILEGES ON $WP_DB.* TO '$WP_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

exec "$@"
