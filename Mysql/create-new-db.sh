#!/bin/bash
#
# Script to create a new database
# @aymanrb - 2014 / 08 / 02
#

read -p "Enter the new database name (e.g. test): " DbName

echo "-----ROOT Access Required--------"
echo -n "Enter the password for the root MySQL username (e.g. AdminPsswd): "
read -s MySqlRootPass

echo ""

echo "CREATE DATABASE $DbName;" | mysql --user=root --password=$MySqlRootPass mysql

echo "Done: $DbUserName was successfylly created"
