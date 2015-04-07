#!/bin/bash
#
# All scripts accessible from one single script execution. The whole Lazy Lamp thing
#
# @aymanrb - 2014 / 07 / 21
#
sudo -v

ScriptBaseDir=`dirname "$BASH_SOURCE"`

echo "

** Welcome to the Lazy-LAMP for Lazy Developers ! **

LAMP Scripts to Choose From:

[L]inux:
	1- Install Environment (Apache2 | PHP5 | MySQL)
	2- Install Webmin Panel
	3- Install Essntial Tools (VIM | GIT)
	4- Change Machine's DNS Server

[A]pache:
	1- Create a new website
	2- Install / Enable Essential Modules
	3- Clear Google Pagespeed Module Cache

[M]ySQL:
	1- Create a Full Backup
	2- Create a New MySQL Database
	3- Create a New MySQL User

[P]hp:
	1- Install Handy Modules (CURL | IMAP)
"

read -p "Choose an action to do from the index above (e.g. A1): " UserChoice


if [[ $UserChoice ]]; then
	echo "Running $UserChoice script(s)..."
fi

case "$UserChoice" in

L1) echo ".$ScriptBaseDir/Linux/install-lamp.sh"
	sudo bash $ScriptBaseDir/Linux/install-lamp.sh
    ;;
L2) echo ".$ScriptBaseDir/Linux/install-webmin.sh"
	sudo bash $ScriptBaseDir/Linux/install-webmin.sh
    ;;
L3) echo ".$ScriptBaseDir/Linux/install-essntials.sh"
	sudo bash $ScriptBaseDir/Linux/install-essntials.sh
    ;;
L4) echo ".$ScriptBaseDir/Linux/change-dns.sh"
	sudo bash $ScriptBaseDir/Linux/change-dns.sh
    ;;
A1) echo ".$ScriptBaseDir/Apache/create-apache2-site.sh"
	sudo bash $ScriptBaseDir/Apache/create-apache2-site.sh
    ;;
A2) echo ".$ScriptBaseDir/Apache/install-apache2-mods.sh"
        sudo bash $ScriptBaseDir/Apache/install-apache2-mods.sh
    ;;
A3) echo ".$ScriptBaseDir/Apache/clear-pagespeed-cache.sh"
	sudo bash $ScriptBaseDir/Apache/clear-pagespeed-cache.sh
    ;;
M1) echo ".$ScriptBaseDir/Mysql/full-backup.sh"
	sudo bash $ScriptBaseDir/Mysql/full-backup.sh
    ;;
M2) echo ".$ScriptBaseDir/Mysql/create-new-db.sh"
	sudo bash $ScriptBaseDir/Mysql/create-new-db.sh
    ;;
M3) echo ".$ScriptBaseDir/Mysql/create-new-user.sh"
	sudo bash $ScriptBaseDir/Mysql/create-new-user.sh
    ;;
P1) echo ".$ScriptBaseDir/Php/create-apache2-site.sh"
	sudo bash $ScriptBaseDir/Php/install_modules.sh
    ;;
*) echo "Unknown or missing Lazy-LAMP script '$UserChoice'" 
   ;;
esac
