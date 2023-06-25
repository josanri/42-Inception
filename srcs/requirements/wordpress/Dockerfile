FROM debian:buster

RUN apt update && apt install mariadb-client -y
RUN apt update && apt install php7.3 -y
RUN apt update && apt install php7.3-fpm -y
RUN apt update && apt install php7.3-mysql -y
RUN apt update && apt install php7.3-json php7.3-curl php7.3-cli php7.3-gd php7.3-zip -y


RUN apt update && apt install curl
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \ 
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html/wordpress
RUN wp core download --path=/var/www/html/wordpress --version=6.2.2 --allow-root
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR /var/www/html/wordpress

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DB_NAME

COPY tools/init.sh init.sh

RUN ./init.sh

RUN chown -R www-data:www-data .
RUN chmod -R 755 .
RUN mkdir /run/php && chown www-data:www-data /run/php

ENV WP_TITLE=$WP_TITLE
ENV WP_ADMIN=$WP_ADMIN
ENV WP_ADMIN_PASSWORD=$WP_ADMIN_PASSWORD
ENV WP_ADMIN_EMAIL=$WP_ADMIN_EMAIL
ENV WP_USER_LOGIN=$WP_USER_LOGIN
ENV WP_USER_EMAIL=$WP_USER_EMAIL
ENV WP_USER_PASSWORD=$WP_USER_PASSWORD
ENV DOMAIN_NAME=$DOMAIN_NAME

COPY tools/entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

# Using port 9000 to communicate php to other pods
EXPOSE 9000
