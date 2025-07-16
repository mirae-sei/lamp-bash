#!/bin/bash

cd $HOME/lamp-bash

if [[ -d web-server ]]
then
	echo "Directory web-server already exist"
else
	mkdir web-server

fi

cp $HOME/src* -r $HOME/lamp-bash/web-server 


cd web-server

cat <<EOF > Dockerfile

FROM php:8.2-apache

RUN docker-php-ext-install pdo pdo_mysql mysqli

COPY src/ /var/www/html/

EOF
