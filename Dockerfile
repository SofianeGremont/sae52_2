FROM debian:12
RUN apt update
RUN apt upgrade -y
RUN apt -y install php php-cli php-common php-curl php-gd php-intl php-json php-mbstring php-mysql php-soap php-xml php-xmlrpc php-zip php-fpm php-imap nginx wget
COPY copie /home/sae52_2/
EXPOSE 80
WORKDIR /home/sae52_2
CMD ["nginx", "-g", "daemon off;"]
RUN ./install_dolibarr.sh
RUN ./config_dolibarr.sh
