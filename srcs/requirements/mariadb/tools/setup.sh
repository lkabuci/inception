#!/bin/bash

service mariadb start

# wait untill mariadb stated using netcat tool
for ((i=1; i<=5; i++)); do
    if nc -z localhost 3306 >/dev/null; then
        echo "MariaDB database is up."
        break
    fi
    echo "Waiting for MariaDB database to start ..."
    sleep 5
done


mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mariadb -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

exec "$@"
