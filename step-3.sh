#!/bin/bash



INIT="init.sql"

if [ -e "$INIT" ]
then
	echo " The file $INIT already exist"
else
	cat > $INIT <<EOF
USE dlampdb;

CREATE TABLE employees (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    salary INT(10) NOT NULL
);

EOF
	echo "The file $INIT is successfully created"
fi
