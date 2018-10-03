FROM nginx:latest

LABEL maintainer="knutole@mapic.io"
LABEL repository="https://github.com/mapic/shiny-nginx.docker"

# add certbot
RUN echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list
RUN apt-get update -y
RUN apt-get install -y python-certbot-nginx -t stretch-backports

# expose ports
EXPOSE 443 80

