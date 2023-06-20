FROM debian:buster

RUN apt update && apt install php7.3 php7.3-fpm php7.3-curl php7.3-cli php7.3-mysql php7.3-gd wget -y

RUN mkdir -p /var/www/html/wordpress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz -C /var/www/html/.

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR /var/www/html/wordpress

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DB_NAME
ARG AUTH_KEY
ARG SECURE_AUTH_KEY
ARG LOGGED_IN_KEY
ARG NONCE_KEY
ARG AUTH_SALT
ARG SECURE_AUTH_SALT
ARG LOGGED_IN_SALT
ARG NONCE_SALT

RUN mv wp-config-sample.php wp-config.php
RUN sed -i "s/username_here/$MYSQL_USER/" wp-config.php
RUN sed -i "s/database_name_here/$MYSQL_DB_NAME/" wp-config.php
RUN sed -i "s/password_here/$MYSQL_PASSWORD/" wp-config.php
RUN sed -i "s/localhost/mariadb/" wp-config.php

RUN chown -R www-data:www-data .
RUN chmod -R 755 .
RUN mkdir /run/php && chown www-data:www-data /run/php

CMD php-fpm7.3 -F

# Using port 9000 to communicate php to other pods
EXPOSE 9000
