FROM debian:buster

# Using port 9000 to communicate php to other pods
EXPOSE 9000

RUN apt update && apt install -y php-fpm
RUN apt-get update && apt-get install wget -y

RUN wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm -f latest.tar.gz

# RUN cd /var/www/html/wordpress && cp wp-config-sample.php wp-config.php 

# Change permissions - 
# RUN cd /var/www/html && chown -R www-data:www-data * && chmod -R 755 *

# SED
# define( 'DB_NAME', 'wordpressdb' );
# define( 'DB_USER', 'wordpressuser' );
# define( 'DB_PASSWORD', 'strongpassword' );
# define( 'DB_HOST', 'localhost' );
# ADD - define('FS_METHOD', 'direct');

# PID 1
CMD php-fpm -F -R
# -F, --nodaemonize force to stay in foreground, and ignore daemonize option from config file
# -R, --allow-to-run-as-root