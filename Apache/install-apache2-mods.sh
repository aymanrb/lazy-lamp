#!/bin/bash
#
# Installs few apache2 modules we usually need (Mod-ReWrite) 
#
# @aymanrb - 2015 / 04 / 07
#

sudo -v

echo "Installing Apache2 ReWrite Module"
sudo a2enmod rewrite

echo "Restarting Apache2 Service"
service apache2 restart


