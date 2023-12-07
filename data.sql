use gestion_parc_informatique

LOAD DATA INFILE '/srv/csv/llx_adherent.csv'
INTO TABLE llx_adherent
FIELDS TERMINATED BY ','
(ref, civility, lastname, firstname, gender, login, pass, fk_adherent_type, morphy, societe, address, zip, town, country, phone, phone_perso, phone_mobile, email, birth, statut, photo, note_public, note_private, datec, datefin);

LOAD DATA INFILE '/srv/csv/llx_product.csv'
INTO TABLE llx_product
FIELDS TERMINATED BY ','
(ref, label, fk_product_type, tosell, tobuy, description, url, customcode, accountancy_code_sell, accountancy_code_sell_intra, accountancy_code_sell_export, accountancy_code_buy, accountancy_code_buy_intra, accountancy_code_buy_export, note_public, note, weight, length, width, height, surface, volume, duration, price, price_min, price_ttc, price_min_ttc, price_base_type, tva_tx, datec, cost_price);

LOAD DATA INFILE '/srv/csv/llx_user.csv'
INTO TABLE llx_user
FIELDS TERMINATED BY ','
(login, lastname, firstname, employee, job, gender, accountancy_code, pass_crypted, address, zip, town, office_phone, user_mobile, office_fax, email, note_public, note_private, salary, datec, statut);
