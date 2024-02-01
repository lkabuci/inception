#! /bin/bash

set -x

sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 8080|1' /etc/php/7.4/fpm/pool.d/www.conf

service php7.4-fpm start
service php7.4-fpm stop

exec "$@"
