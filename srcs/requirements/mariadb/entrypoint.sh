#!/bin/bash

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]
then {
	mysql_install_db
	/etc/init.d/mysql start
	mysql_secure_installation << EOF

Y
${MYSQL_ADMIN_PWD}
${MYSQL_ADMIN_PWD}
Y
n
Y
Y
EOF
	mysql -e "CREATE DATABASE IF NOT EXISTS `${MYSQL_DATABASE}`;"
	mysql -e "CREATE USER IF NOT EXISTS `${MYSQL_USER_USR}`@'localhost' IDENTIFIED BY '${MYSQL_USER_PWD}';"
	mysql -e "GRANT ALL PRIVILEGES ON `${MYSQL_DATABASE}`.* TO `${MYSQL_USER_USR}`@'%' IDENTIFIED BY '${MYSQL_PWD}';"
	mysql -e "FLUSH PRIVILEGES;"

	/etc/init.d/mysql stop
} else
{
	echo "Database already create"
} fi
exec "$@"

