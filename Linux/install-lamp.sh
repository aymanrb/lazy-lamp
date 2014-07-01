#!/bin/bash
#
# Script to automate the installation of Apache, PHP5, MySQl and PhpMyAdmin
#
# @aymanrb - 2014 / 07 / 01
#
sudo -v

read -p "Enter the password for the root MySQL username (e.g. root): " MySqlPass

echo "Installing apache2 ..."
sudo apt-get update
sudo apt-get -y install apache2

echo "Installing PHP5 ..."
sudo apt-get -y install php5 libapache2-mod-php5

echo "Retarting Apache2 Server ..."
sudo /etc/init.d/apache2 restart

echo "Installing MySQL Server"
echo mysql-server-5.1 mysql-server/root_password password $MySqlPass | debconf-set-selections
echo mysql-server-5.1 mysql-server/root_password_again password $MySqlPass | debconf-set-selections
sudo apt-get install -y mysql-server

echo "Installing PhpMyAdmin ..."
sudo apt-get install phpmyadmin

echo "#Phpmyadmin
Include /etc/phpmyadmin/apache.conf" | sudo tee -a /etc/apache2/apache2.conf > /dev/null

echo "Retarting Apache2 Server ..."
sudo /etc/init.d/apache2 restart

echo "You can now access your local apache server @ http://localhost & PhpMyadmin @ http://localhost/phpmyadmin"
