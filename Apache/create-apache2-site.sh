#!/bin/bash
#
# Script to automate creating new apache2 site on a linux server with LAMP configurations
#
# @aymanrb - 2014 / 07 / 01
#

sudo -v

read -p "Enter the domain name you would like to use to access the new site (e.g. example.local): " DomainName

if [[ ! $DomainName ]]; then
	echo "Error: Apache needs a domainname to configure your website";
	exit
fi

read -p "Enter path to the document root of the new site (e.g. $HOME/www/$DomainName):" SiteDirectory

if [[ ! $SiteDirectory ]]; then
	SiteDirectory="$HOME/www/$DomainName"
fi

read -p "Enter ServerAdmin email (Optional): " ServerAdminMail

if [[ ! $ServerAdminMail ]]; then
	ServerAdminMail="info@$DomainName"
fi

if [ -d /etc/apache2/sites-available/$DomainName ]; then
	echo "Error: This site is already configured using $DomainName";
	exit
fi

echo "Creating Apache Site Configuration File"
echo "<VirtualHost *:80>
        ServerName $DomainName
        ServerAlias www.$DomainName
        DocumentRoot $SiteDirectory
        LogLevel warn
        ErrorLog  /var/log/apache2/$DomainName/error.log
        CustomLog /var/log/apache2/$DomainName/access.log combined
        ServerAdmin $ServerAdminMail
	<DIRECTORY $SiteDirectory>
		Options FollowSymLinks
		AllowOverride All
		Require all granted
	</DIRECTORY>
</VirtualHost>" | sudo tee /etc/apache2/sites-available/$DomainName.conf > /dev/null

echo "Creating Log File Directory"
sudo mkdir /var/log/apache2/$DomainName

if [ ! -d $SiteDirectory ]; then
	mkdir $SiteDirectory;
	echo "<h1>Welcome to $DomainName</h1>" > $SiteDirectory/index.php
fi

echo "Creating Hosts Localhost value"
sudo echo "127.0.0.1	$DomainName" | sudo tee	-a /etc/hosts > /dev/null

echo "Enabling Site & Reloading Apache (edit /etc/apache2/sites-available/$DomainName.conf for more options)"
sudo a2ensite $DomainName.conf
sudo /etc/init.d/apache2 reload

echo "Done, please browse to http://$DomainName to access your new site :)"
