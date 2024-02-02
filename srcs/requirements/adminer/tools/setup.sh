#!/bin/bash

set -x

wget --progress=bar:force:noscroll -O adminer.php \
    https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php

# Check if download was successful
if [ -e adminer.php ]; then
    echo "Adminer file downloaded successfully"
else
    echo "Adminer file download failed"
    exit 1
fi

sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 8080|1' /etc/php/7.4/fpm/pool.d/www.conf

service php7.4-fpm start

service php7.4-fpm stop

exec "$@"
