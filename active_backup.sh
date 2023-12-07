echo "Pour que tout fonctionne correctement, il est nécessaire de :
- Remplir préalablement la configuration de la machine distante (utilisateur, adresse IP, mot de passe) dans le fichier backup_dolibarr.sh.
- Installer le paquet openssh-server sur la machine distante.
- Installer le paquet crontab sur la machine actuel."

echo "Voulez-vous activer la sauvegarde automatique 'oui' ou 'non':"
read reponse

reponse=$(echo "$reponse" | tr '[:upper:]' '[:lower:]')

if [ "$reponse" = "oui" ]; then
	echo "0 20 * * 0 /bin/sh backup_dolibarr.sh" | crontab -
	echo "Sauvegarde automatique tous les dimanches à 20h : activée"
elif [ "$reponse" = "non" ]; then
	crontab -r
	echo "Sauvegarde automatique tous les dimanches à 20h : désactivée"
else
    echo "Réponse invalide. Veuillez répondre par 'oui' ou 'non'."
fi
