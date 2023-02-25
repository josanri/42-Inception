FROM debian:buster
EXPOSE 900

RUN apt-get install apache2  -y
RUN apt update && \
    echo "Y" | apt install php libapache2-mod-php php-mysql
CMD php -v