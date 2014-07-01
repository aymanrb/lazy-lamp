#!/bin/bash
#
# Script to automate the installation of webmin (http://www.webmin.com) for lazy devs
#
# @aymanrb - 2014 / 07 / 01
#

# Set up a repo and install
echo "Beginning Installation of Webmin"

echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list
echo "deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib" >> /etc/apt/sources.list
wget -q http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc > /dev/null 2>&1
rm -f jcameron-key.asc
apt-get -q update > /dev/null 2>&1
apt-get -q -y install webmin > /dev/null 2>&1
ufw allow 10000 > /dev/null 2>&1

echo "Webmin installation complete"
echo "Webmin is using the same username and password you are currently logged in with to linux"
echo "You can access it by visiting http://localhost:10000"
