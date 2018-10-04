#!/bin/bash
docker build -t mapic/shiny-nginx .
docker push mapic/shiny-nginx:latest