#!/bin/bash

set -x

chmod +x /usr/local/bin/wp

mkdir -p /var/www/html/ && cd /var/www/html || exit 1

wp core download --allow-root --force
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/1' /etc/php/7.4/fpm/pool.d/www.conf
service php7.4-fpm start

wp config create --allow-root --dbname="$WP_DB" --dbuser="$WP_USER" --dbpass="$WP_PASS" --dbhost="$WP_HOST"
wp db create --allow-root
wp core install --allow-root --url="$URL" --title="$TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASS" --admin_email="$ADMIN_MAIL"
wp user create --allow-root "$WP_REGULAR_USER" "$WP_REGULAR_MAIL" --role=author
wp plugin install multiple-domain --activate --path="/var/www/html/" --allow-root

service php7.4-fpm stop

exec "$@"
