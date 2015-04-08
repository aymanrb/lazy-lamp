#!/bin/bash
#
# Script to automate the installation of few essential PHP5 modules
#
# @aymanrb - 2014 / 07 / 20
#
sudo -v

sudo apt-get update

echo "Installing Curl for PHP ..."
sudo apt-get install php5-curl

echo "Installing IMAP function for PHP ..."
sudo apt-get install php5-imap

echo "Installing Mcrypt"
sudo apt-get install mcrypt php5-mcrypt
sudo php5enmod mcrypt

echo "Restarting Apache2 Server ..."
sudo /etc/init.d/apache2 restart

echo "Done !"
