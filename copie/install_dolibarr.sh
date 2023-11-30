#!/bin/bash

cd /var/www/

wget https://sourceforge.net/projects/dolibarr/files/Dolibarr%20ERP-CRM/18.0.3/dolibarr-18.0.3.tgz

tar xvf dolibarr-18.0.3.tgz

chown www-data:www-data -R dolibarr-18.0.3
chmod 755 dolibarr-18.0.3

cp /home/sae52_2/default /etc/nginx/sites-available/default

service apache2 stop
service php8.2-fpm restart
service nginx restart
