# Using Debian 10 image
FROM debian:buster

# Install nginx
RUN apt-get update && apt-get install -y nginx

# COPY ./conf./nginx.conf /etc/nginx/nginx.conf
# RUN sed -i 's/TLSv1 TLSv1.1 TLSv1.2/TLSv1.2 TLSv1.3/g' /etc/nginx/nginx.conf
ADD ./conf/nginx.conf /etc/nginx/nginx.conf

# Expose the port 443 for the host machine
EXPOSE 443

# Execute nginx as PID 1
CMD [ "nginx", "-g", "daemon off;" ]