#!/bin/bash

backup_dir="sauv-dolibarr"

backup_file="dolibarr_backup_$(date +\%Y\%m\%d_\%H\%M\%S).sql"

db_host="root"

mysqldump -u root -p'foo' -h 127.0.0.1 --port=3307 gestion_parc_informatique > $backup_dir/$backup_file

gzip $backup_dir/$backup_file

# Configuration machine distante
adresse_ip="192.168.1.84"
utilisateur="user"
mdp="user"
chemin_sauv="/home/user/sauv-dolibarr"

sshpass -p $mdp rsync -avz $backup_dir/$backup_file.gz $utilisateur@$adresse_ip:$chemin_sauv

rm $backup_dir/$backup_file.gz
