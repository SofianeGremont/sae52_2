#!/bin/bash

backup_dir="/home/sauv-dolibarr"

backup_file="dolibarr_backup_$(date +\%Y\%m\%d_\%H\%M\%S).sql"

db_host="root"

mysqldump -u root -p'foo' -h 127.0.0.1 --port=3307 gestion_parc_informatique > $backup_dir/$backup_file

gzip $backup_dir/$backup_file
