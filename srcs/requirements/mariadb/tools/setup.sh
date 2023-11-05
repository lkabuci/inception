#!/bin/bash

# Start the MariaDB service
service mariadb start

# Wait for MariaDB service to start
sleep 10

# Run the SQL setup
mariadb -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"
mariadb -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

bash

