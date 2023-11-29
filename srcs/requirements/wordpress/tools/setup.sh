#!/bin/bash

set -e

wget --progress=bar:force:noscroll -O /usr/local/bin/wp \
	https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x /usr/local/bin/wp

mkdir -p /var/www/html/ && cd /var/www/html || exit 1

wp core download --allow-root --force

mv wp-config-sample.php wp-config.php

sed -i "s/database_name_here/$WORDPRESS_DB_NAME/1" wp-config.php
sed -i "s/username_here/$WORDPRESS_DB_USER/1"      wp-config.php
sed -i "s/password_here/$WORDPRESS_DB_PASS/1"      wp-config.php
sed -i "s/localhost/$WORDPRESS_DB_HOST/1"          wp-config.php

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/1' /etc/php/7.4/fpm/pool.d/www.conf

service php7.4-fpm start
service php7.4-fpm stop

exec "$@"

# wp core install --allow-root \
# 	--url=$DOMAIN_NAME/ \
# 	--title=$WP_TITLE \
# 	--admin_user=$WP_ADMIN_USR \
# 	--admin_password=$WP_ADMIN_PWD \
# 	--admin_email=$WP_ADMIN_EMAIL \
# 	--skip-email
