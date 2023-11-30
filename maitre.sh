./purge.sh
if [ $? != 0 ]; then
        echo "echec du script purge"
        exit 2
fi

./run_mysql.sh
if [ $? != 0 ]; then
	echo "echec du script run_mysql"
	exit 2
fi

sleep 30

./filldb.sh
if [ $? != 0 ]; then
        echo "echec du script filledb"
        exit 2
fi

#./fillCSV.sh
if [ $? != 0 ]; then
        echo "echec du script filleCSV"
        exit 2
fi

systemctl stop apache2

./run_dolibarr.sh
if [ $? != 0 ]; then
        echo "echec du script filleCSV"
        exit 2
fi

echo "information de connexion à Dolibarr :"
echo "Adresse dolibarr : 127.0.0.1:80"
echo "Utilisateur : admin"
echo "Mot de passe : adminadmin"
