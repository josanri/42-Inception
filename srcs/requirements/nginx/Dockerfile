FROM debian:buster

# COPY /usr/share/nginx/html

RUN apt-get update && \
    apt-get install -y nginx
RUN sed -i 's/TLSv1 TLSv1.1 TLSv1.2/TLSv1.2 TLSv1.3/g' /etc/nginx/nginx.conf

CMD [ "nginx", "-g", "daemon off;" ]

# -p 443:80
EXPOSE 80