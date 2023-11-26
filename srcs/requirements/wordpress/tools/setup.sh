#!/bin/bash


cd /var/www/html
mv wp-config-sample.php wp-config.php

sed -i "s/database_name_here/$WORDPRESS_DB_NAME/1" wp-config.php
sed -i "s/username_here/$WORDPRESS_DB_USER/1"      wp-config.php
sed -i "s/password_here/$WORDPRESS_DB_PASS/1"      wp-config.php
sed -i "s/localhost/$WORDPRESS_DB_HOST/1"          wp-config.php
