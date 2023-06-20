# Using Debian 10 image
FROM debian:buster

# Install nginx
RUN apt-get update && apt-get install -y nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/josesanc.42.fr.crt /run/secrets/josesanc.42.fr.crt
COPY ./conf/josesanc.42.fr.key /run/secrets/josesanc.42.fr.key

# Expose the port 443 for the host machine
EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]

# openssl req -x509 -nodes -newkey rsa:2048 -keyout josesanc.42.fr.key -out josesanc.42.fr.crt -days 365