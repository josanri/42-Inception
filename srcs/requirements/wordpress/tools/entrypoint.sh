#!/bin/bash

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
# [--skip-email] Don’t send an email notification to the new admin user.

wp user create $WP_USER_LOGIN $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --allow-root 2> /dev/null

wp theme install astra --activate --allow-root

php-fpm7.3 -F