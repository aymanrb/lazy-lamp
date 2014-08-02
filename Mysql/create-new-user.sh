#!/bin/bash
#
# Script to create a new database user
# @aymanrb - 2014 / 08 / 02

read -p "Enter the new database user name (e.g. dbuser): " DbUserName

if [[ ! $DbUserName ]]; then
	echo "Error: A username must be specified. Aren't you creating a new user after all :S !";
	exit
fi

echo -n "Enter a password to use for the MySQL username[$DbUserName] (e.g. UsrPsswd):"
read -s Psswd

echo ""

echo -n "Confirm '$DbUserName' password (Retype the password):"
read -s ConfPsswd

echo ""

if [ $Psswd != $ConfPsswd ]; then
	echo "Error: Password for user $DbUserName didn't match"
	exit
fi

echo "-----ROOT Access Required--------"
echo -n "Enter the password for the root MySQL username (e.g. AdminPsswd): "
read -s MySqlRootPass

echo ""

echo "CREATE USER '$DbUserName'@'localhost' IDENTIFIED BY '$Psswd'; GRANT ALL PRIVILEGES ON * . * TO '$DbUserName'@'localhost'; FLUSH PRIVILEGES;" | mysql --user=root --password=$MySqlRootPass mysql

echo "Done creating new user $DbUserName"
