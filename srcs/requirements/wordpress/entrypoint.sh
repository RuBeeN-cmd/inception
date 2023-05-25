#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/html
cd /var/www/html
wp core --allow-root download

mv wp-config-sample.php wp-config.php

sed -i "23d" wp-config.php
sed -i "23i define( \'DB_NAME\', \'${MYSQL_DATABASE}\' );" wp-config.php
sed -i "26d" wp-config.php
sed -i "26i define( \'DB_USER\', \'${MYSQL_USER_USR}\' );" wp-config.php
sed -i "29d" wp-config.php
sed -i "29i define( \'DB_PASSWORD\', \'${MYSQL_USER_PWD}\' );" wp-config.php
sed -i "32d" wp-config.php
sed -i "32i define( \'DB_HOST\', \'${DOMAIN_NAME}\' );" wp-config.php

wp core --allow-root install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USR} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL} --skip-email 

mkdir -p /run/php
/usr/sbin/php-fpm7.3 -F
