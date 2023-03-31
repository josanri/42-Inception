# Using a Debian 10 Buster base image
FROM debian:buster

# Using 3306 to interconect with other pods
EXPOSE 3306

# Install MariaDB Server
RUN apt-get update && apt install mariadb-server -y

# Mariadb database configuration
ADD ./conf/maria.conf .
RUN service mysql start; cat ./maria.conf | mariadb

# Run mysql service
CMD ["mysqld"]

openssl req -x509 -nodes -newkey rsa:2048 -keyout josesanc.42.fr.key -out josesanc.42.fr.crt -days 365