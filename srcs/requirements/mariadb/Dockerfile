FROM debian:buster
RUN apt-get update
RUN echo "Y" | apt-get install sudo
RUN echo "Y" | sudo apt-get install systemd
RUN sudo apt update
RUN echo "Y" | sudo apt install mariadb-server
CMD sudo systemctl status mariadb
EXPOSE 3306