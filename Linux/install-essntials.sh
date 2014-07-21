#!/bin/bash
#
# Script to automate the installation of few essential tools for Linux (Vim / GIT / )
#
# @aymanrb - 2014 / 07 / 21
#

sudo -v

echo "Installing VIM ..."
sudo apt-get install vim

echo "Installing GIT ..."
sudo apt-get install git

read -p "Enter the email address of the Global GIT User: " MainUserMail
read -p "Enter the User name of the Global GIT User: " MainUserName

sudo git config --global user.email $MainUserMail
sudo git config --global user.name  $MainUserName

echo "Done !"
