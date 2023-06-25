FROM debian:buster

# Instalar dependencias y herramientas necesarias
RUN apt-get update && apt-get install -y mariadb-server

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DB_NAME

# Copiar el archivo de configuración personalizado
COPY tools/init-maria.sh /mariadb/init-maria.sh
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mysql start && ./mariadb/init-maria.sh

# Run mysql service
CMD ["mysqld"]

# Using 3306 to interconect with other pods
EXPOSE 3306