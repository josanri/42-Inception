FROM debian:buster

ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_DB_NAME=$MYSQL_DB_NAME

# Instalar dependencias y herramientas necesarias
RUN apt-get update && apt-get install -y mariadb-server

# Copiar el archivo de configuración personalizado
COPY conf/init-maria.sh /mariadb/init-maria.sh

# Iniciar el servicio de MariaDB y configurar la base de datos
RUN service mysql start && mysql -sfu root < mariadb/init-maria.sh

# Run mysql service
CMD ["mysqld"]

# Using 3306 to interconect with other pods
EXPOSE 3306