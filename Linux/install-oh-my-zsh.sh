#!/bin/bash
#
# Script to install oh-my-zsh shell
#
# @aymanrb - 2015 / 04 / 07
#

sudo -v

echo "Installing prerequisites ..."
sudo apt-get install zsh git-core curl

echo "Installing ohmyzsh"
sudo curl -L http://install.ohmyz.sh | sh

sudo chsh -s /usr/bin/zsh $(whoami)

echo "Done ! Oh-my-zsh will be your default shell on your next reboot"
