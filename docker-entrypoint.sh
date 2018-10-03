#!/bin/bash

create_certs () {
    
    # start nginx with certbot config
    nginx -c /etc/nginx/nginx.certbot.conf

    echo "Creating certificates..."

    # ensure certificate
    certbot certonly -a webroot --webroot-path=/var/www/html -d "$CERTBOT_DOMAIN" \
        --agree-tos \
        --email "$CERTBOT_EMAIL" \
        --hsts \
        --non-interactive

    # move certificates
    cp /etc/letsencrypt/live/$CERTBOT_DOMAIN/fullchain.pem /home/ssl/fullchain.pem
    cp /etc/letsencrypt/live/$CERTBOT_DOMAIN/privkey.pem /home/ssl/privkey.pem

    # stop
    service nginx stop

}

create_diffie () {
    openssl dhparam -out /home/ssl/dhparams.pem 2048
}


if [ ! -f "/home/ssl/fullchain.pem" ]; then
    create_certs
fi
if [ ! -f "/home/ssl/privkey.pem" ]; then
    create_certs
fi
if [ ! -f "/home/ssl/dhparams.pem" ]; then
    create_diffie
fi


# add cronjob

# start nginx
nginx -c /etc/nginx/nginx.conf
