\#!/bin/bash

cd $HOME/lamp-bash



DOCKER_COMPOSE="docker-compose.yml"



ENV=".env"

cd $HOME/lamp-bash

if [ -e "$ENV" ];
then
        echo "exist"
else
        cat > $ENV <<EOF
MYSQL_ROOT_PASSWORD=root_pass
MYSQL_DATABASE=dlampdb
MYSQL_USER=db_admin
MYSQL_PASSWORD=0939bd

EOF

fi

if [ -e "$DOCKER_COMPOSE" ];
then
	echo "The file $DOCKER_COMPOSE already exist"
else
	cat > $DOCKER_COMPOSE <<EOF
version : "3.9"
services :
    web-server:
        networks:
            - lamp-net
        ports:
            - 80:80
        container_name: php-apache
        build: ./web-server
        environment:
            DB_USER: ${MYSQL_USER}
            DB_PASS: ${MYSQL_PASSWORD}
            DB_NAME: ${MYSQL_DATABASE}
        env_file:
            - .env
    mysql-server:
        networks:
            - lamp-net
        ports:
            - 3306:3306
        container_name: mysql-server
        image: "mysql:8.4"
        environment:
            MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
            MYSQL_DATABASE: ${MYSQL_DATABASE}
            MYSQL_USER: ${MYSQL_USER}
            MYSQL_PASSWORD: ${MYSQL_PASSWORD}
        volumes:
            - ./init.sql:/docker-entrypoint-initdb.d/init.sql

networks:
    lamp-net: {}

EOF

	echo "Docker compose file successfully created"

fi
