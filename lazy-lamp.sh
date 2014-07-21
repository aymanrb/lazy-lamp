#!/bin/bash
#
# All scripts accessible from one single script execution. The whole Lazy Lamp thing
#
# @aymanrb - 2014 / 07 / 21
#
sudo -v

echo "

** Welcome to the Lazy-LAMP for Lazy Developers ! **

LAMP Scripts to Choose From:

[L]inux:
	1- Install Environment (Apache2 | PHP5 | MySQL)
	2- Install Webmin Panel
	3- Install Essntial Tools (VIM | GIT)

[A]pache:
	1- Create a new website
	2- Install / Enable Essential Modules [N/A]

[M]ySQL:
	1- Create a Full Backup
	2- Create a New Database [N/A]

[P]hp:
	1- Install Handy Modules (CURL | IMAP)
"

read -p "Choose an action to do from the index above (e.g. A1): " UserChoice


if [[ $UserChoice ]]; then
	echo "Running $UserChoice script(s)..."
fi

case "$UserChoice" in

L1) echo ".$PWD/Linux/install-lamp.sh"
	sudo bash $PWD/Linux/install-lamp.sh
    ;;
L2) echo ".$PWD/Linux/install-webmin.sh"
	sudo bash $PWD/Linux/install-lamp.sh
    ;;
L3) echo ".$PWD/Linux/install-essntials.sh"
	sudo bash $PWD/Linux/install-lamp.sh
    ;;
A1) echo ".$PWD/Apache/create-apache2-site.sh"
	sudo bash $PWD/Apache/create-apache2-site.sh
    ;;
M1) echo ".$PWD/Mysql/full-backup.sh"
	sudo bash $PWD/Mysql/full-backup.sh
    ;;
P1) echo ".$PWD/Php/create-apache2-site.sh"
	sudo bash $PWD/Php/install_modules.sh
    ;;
*) echo "Unknown or missing Lazy-LAMP script '$UserChoice'" 
   ;;
esac
