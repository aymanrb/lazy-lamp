#!/bin/bash
#
# Script to automate the installation of few essential PHP5 modules
#
# @aymanrb - 2014 / 07 / 01
#
sudo -v

sudo apt-get update

echo "Installing Curl for PHP ..."
sudo apt-get install php5-curl

echo "Installing IMAP function for PHP ..."
sudo apt-get install php5-imap

echo "Done Installing PHP5 Modules"

