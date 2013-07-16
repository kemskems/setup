#!/bin/bash

# This script assumes you're running Ubuntu 13.04
# You may adjust some commands here to fit your environment

# Ensure the repository is up-to-date
sudo apt-get update

# Install packages from official repository
sudo apt-get install vim php phpmyadmin openjdk-7-jdk gcc vlc byobu

# Add third-party repositories (PPA)
# Sublime Text 2
sudo add-apt-repository ppa:webupd8team/sublime-text-2
# MySQL using MariaDB
sudo apt-get install software-properties-common
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
sudo add-apt-repository 'deb http://mariadb.biz.net.id//repo/10.0/ubuntu raring main'
# NodeJS
sudo apt-get install python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
# Spotify
sudo add-apt-repository 'deb http://repository.spotify.com stable non-free'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

# Update and install
sudo apt-get update
sudo apt-get install sublime-text mariadb-server nodejs npm spotify-client

# Install pacapt (https://github.com/icy/pacapt)
sudo wget -O /usr/local/bin/pacman https://github.com/icy/pacapt/raw/master/pacman
sudo chmod 755 /usr/local/bin/pacman

# Use dotfiles config from https://github.com/kemskems/dotfiles
cd $HOME
mkdir -p Projects/
cd Projects/
git clone https://github.com/kemskems/dotfiles.git
cd dotfiles/
./install.sh
