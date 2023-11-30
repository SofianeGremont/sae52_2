#!/bin/bash

sudo docker build -t debian1 .
sudo docker run --rm -d -p 80:80 --name dolibarr debian1
sudo docker exec dolibarr service php8.2-fpm start
