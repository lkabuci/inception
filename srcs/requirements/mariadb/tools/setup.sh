#!/bin/bash

service mariadb start

# wait untill mariadb stated
until timeout 1 bash -c "</dev/tcp/localhost/3306" > /dev/null 2>&1; do
    echo "Waiting for mariadb database to start ..."
    sleep 1
done

mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mariadb -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

mariadbd
