#!/bin/bash

host_ip=$(ip route | awk 'NR==1 {print $3}')

mv /var/www/dolibarr-18.0.3/htdocs/conf/conf.php.example /var/www/dolibarr-18.0.3/htdocs/conf/conf.php
CONF_FILE="/var/www/dolibarr-18.0.3/htdocs/conf/conf.php"

DB_NAME="gestion_parc_informatique"
DB_USER="root"
DB_PASSWORD="foo"
DB_PORT="3307"

sed -i "s/\(\$dolibarr_main_db_host=\).*/\1 '$host_ip';/" $CONF_FILE
sed -i "s/\(\$dolibarr_main_db_name=\).*/\1 '$DB_NAME';/" $CONF_FILE
sed -i "s/\(\$dolibarr_main_db_user=\).*/\1 '$DB_USER';/" $CONF_FILE
sed -i "s/\(\$dolibarr_main_db_pass=\).*/\1 '$DB_PASSWORD';/" $CONF_FILE
sed -i "s/\(\$dolibarr_main_db_port=\).*/\1 '$DB_PORT';/" $CONF_FILE
sed -i "s|\(\$dolibarr_main_url_root=\).*|\1'http://localhost';|" $CONF_FILE
sed -i "s|\(\$dolibarr_main_document_root=\).*|\1'/var/www/dolibarr-18.0.3/htdocs';|" $CONF_FILE
sed -i "s|\(\$dolibarr_main_url_root_alt=\).*|\1'/custom';|" $CONF_FILE
sed -i "s|\(\$dolibarr_main_document_root_alt=\).*|\1'/var/www/dolibarr-18.0.3/htdocs/custom';|" $CONF_FILE
sed -i "s|\(\$dolibarr_main_data_root=\).*|\1'/var/www/dolibarr-18.0.3/documents';|" $CONF_FILE
sed -i "s|\(\$dolibarr_main_db_prefix=\).*|\1'llx_';|" $CONF_FILE
sed -i "s|\(\$dolibarr_main_db_type=\).*|\1'mysqli';|" $CONF_FILE
sed -i "s|\(\$dolibarr_main_db_character_set=\).*|\1'utf8';|" $CONF_FILE
sed -i "s|\(\$dolibarr_main_db_collation=\).*|\1'utf8_unicode_ci';|" $CONF_FILE
sed -i "s|\(\$dolibarr_main_authentication=\).*|\1'dolibarr';|" $CONF_FILE
sed -i "s|\(\$dolibarr_main_prod=\).*|\1'0';|" $CONF_FILE
sed -i "s|\(\$dolibarr_main_force_https=\).*|\1'0';|" $CONF_FILE
sed -i "s|\(\$dolibarr_main_restrict_os_commands=\).*|\1'mysqldump, mysql, pg_dump, pgrestore, clam';|" $CONF_FILE
sed -i "s|\(\$dolibarr_nocsrfcheck=\).*|\1'0';|" $CONF_FILE
sed -i "s|\(\$dolibarr_main_instance_unique_id=\).*|\1'c32a07162a547f29459657f0afaa14a0';|" $CONF_FILE
sed -i "s|\(\$dolibarr_mailing_limit_sendbyweb=\).*|\1'0';|" $CONF_FILE
sed -i "s|\(\$dolibarr_mailing_limit_sendbycli=\).*|\1'0';|" $CONF_FILE
sed -i "s|\(\$dolibarr_main_distrib=\).*|\1'standard';|" $CONF_FILE

echo "Dolibarr a été configuré avec succès."
