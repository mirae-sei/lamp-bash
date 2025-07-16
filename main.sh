#!/bin/bash

dir=lamp-bash

if [[ -d $HOME/$dir ]]

then
        echo  "exist"
else
        echo "The directory $dir does not exist. Creating the directory..."
        mkdir $HOME/$dir
        echo "Directory $dir is successfully  created"
	cd $dir
fi



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
        echo "The file $ENV is successfully created"




~/step-1.sh
~/step-2.sh
~/step-3.sh
~/step-4.sh

docker-compose up -d
