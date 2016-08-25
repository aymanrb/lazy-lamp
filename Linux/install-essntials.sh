#!/bin/bash
#
# Script to automate the installation of few essential tools for Linux (Vim / CURL / GIT / Composer)
#
# @aymanrb - 2014 / 07 / 21
#

sudo -v

echo "Installing VIM ..."
sudo apt-get install vim

echo "Installing CURL ..."
sudo apt-get install curl

echo "Installing GIT ..."
sudo apt-get install git

read -p "Enter the email address of the Global GIT User: " MainUserMail
read -p "Enter the User name of the Global GIT User: " MainUserName

sudo git config --global user.email $MainUserMail
sudo git config --global user.name  $MainUserName

echo "Installing Composer ..."
sudo apt-get install php5-cli
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

echo "Done !"
