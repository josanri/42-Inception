#!/bin/bash

set -e

rm -f wp-config.php
rm -f wp-config-sample.php

wp config create --skip-check --dbname=$MYSQL_DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root 

# mv wp-config-sample.php wp-config.php
# sed -i "s/username_here/$MYSQL_USER/" wp-config.php
# sed -i "s/database_name_here/$MYSQL_DB_NAME/" wp-config.php
# sed -i "s/password_here/$MYSQL_PASSWORD/" wp-config.php
# sed -i "s/localhost/mariadb/" wp-config.php
