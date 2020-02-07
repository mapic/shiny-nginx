FROM nginx:latest

LABEL maintainer="knutole@mapic.io"
LABEL repository="https://github.com/mapic/shiny-nginx"

# add certbot
RUN echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list
RUN apt-get update -y
RUN apt-get install -y python-certbot-nginx -t stretch-backports

# upgrade all
RUN apt-get upgrade -y

# create html folder for certbot
RUN mkdir -p /var/www/html
RUN mkdir -p /home/ssl

# set workdir
WORKDIR /home/

# add script
ADD ./docker-entrypoint.sh /home/

# expose ports
EXPOSE 443 80

# default command
CMD ["bash", "/home/docker-entrypoint.sh"]