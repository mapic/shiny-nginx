#!/bin/bash

# $

# create certificates
certbot certonly -a webroot --webroot-path=/var/www/html -d "$CERTBOT_DOMAIN" \
    --agree-tos \
    --email "$CERTBOT_EMAIL" \
    --hsts \
    --non-interactive 