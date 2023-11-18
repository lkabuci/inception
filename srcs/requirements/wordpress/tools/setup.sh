#!/bin/bash

SourceDir="/var/www/html"

mkdir -p "$SourceDir" && cd "$SourceDir" || exit

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar wp
mv wp /usr/local/bin/
wp core download --allow-root

mv wp-config-sample.php wp-config.php

sed -i "s/database_name_here/$DATABASE/g" wp-config.php
sed -i "s/username_here/$USERNAME/g"      wp-config.php
sed -i "s/password_here/$PASSWORD/g"      wp-config.php
sed -i "s/localhost/$HOSTNAME/g"          wp-config.php
