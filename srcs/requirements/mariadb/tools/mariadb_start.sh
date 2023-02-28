#!/bin/bash

service mysql start

echo "CREATE DATABASE IF NOT EXISTS ${DB_DATABASE};
CREATE USER IF NOT EXISTS '${DB_USERNAME}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON wordpress.* TO '${DB_USERNAME}'@'%';
FLUSH PRIVILEGES;
ALTER USER '${DB_ADMIN_USERNAME}'@'localhost' IDENTIFIED BY '${DB_ADMIN_PASSWORD}';" > /init.sql

mysql -uroot -p${DB_ADMIN_PASSWORD} -e "source /init.sql;"
mysqladmin -uroot -p${DB_ADMIN_PASSWORD} shutdown

exec "$@"