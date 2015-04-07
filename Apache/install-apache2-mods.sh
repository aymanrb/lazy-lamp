#!/bin/bash
#
# Installs few apache2 modules we usually need (Mod-ReWrite / ModPageSpeed) 
#
# @aymanrb - 2015 / 04 / 07
#

sudo -v

echo "Installing Apache2 ReWrite Module"
sudo a2enmod rewrite


echo "Download Apache2 Google Mod-PageSpeed"
cd /usr/local/src
wget https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb
apt-get -f install
dpkg -i mod-pagespeed-*.deb


echo "Restarting Apache2 Service"
service apache2 restart


