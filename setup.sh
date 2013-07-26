#!/bin/bash

INSTALL=(
    "Vim"
    "Byobu"
    "Sublime Text 2"
    "GCC"
    "OpenJDK 7"
    "PHP 5"
    "MariaDB"
    "NodeJS"
    "Pacapt"
    "VLC media player"
    "Spotify"
)
SIZE=${#INSTALL[*]}

install() {
    while [ "$#" -gt 0 ]; do
        case "$1" in
            # Vim
            0)  sudo apt-get -y install vim
                ;;
            # Byobu
            1)  sudo apt-get -y install byobu
                ;;
            # Sublime Text 2
            2)  sudo add-apt-repository ppa:webupd8team/sublime-text-2
                sudo apt-get update
                sudo apt-get install -y sublime-text
                ;;
            # GCC
            3)  sudo apt-get -y install gcc
                ;;
            # OpenJDK 7
            4)  sudo apt-get -y install openjdk-7-jdk
                ;;
            # PHP 5
            5)  sudo apt-get -y install php5
                ;;
            # MariaDB
            6)  sudo apt-get -y install software-properties-common
                sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
                sudo add-apt-repository 'deb http://mariadb.biz.net.id//repo/10.0/ubuntu raring main'
                sudo apt-get update
                sudo apt-get install mariadb-server
                ;;
            # NodeJS
            7)  sudo apt-get -y install python-software-properties python g++ make
                sudo add-apt-repository ppa:chris-lea/node.js
                sudo apt-get update
                sudo apt-get -y install nodejs npm
                ;;
            # Pacapt
            8)  sudo wget -O /usr/local/bin/pacman https://github.com/icy/pacapt/raw/master/pacman
                sudo chmod 755 /usr/local/bin/pacman
                ;;
            # VLC media player
            9)  sudo apt-get -y install vlc
                ;;
            # Spotify
            10) sudo add-apt-repository 'deb http://repository.spotify.com stable non-free'
                sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
                sudo apt-get update
                sudo apt-get -y install spotify-client
                ;;
            # Default
            *)  echo "Unrecognized selection number '$1'. Skipping."
                ;;
        esac
        shift
    done
}

echo "Select which ones to install:"
for (( i = 0; i < $SIZE; i++ )); do
    echo "$i) ${INSTALL[$i]}"
done
echo -n "Your selection (list the numbers separated by a space) (default=all): "
read SELECTIONS
if [ -z "$SELECTIONS" ]; then
    install $(seq -s ' ' $SIZE)
else
    install $SELECTIONS
fi

# # This script assumes you're running Ubuntu 13.04
# # You may adjust some commands here to fit your environment

# # Ensure the repository is up-to-date
# sudo apt-get update

# # Install packages from official repository
# sudo apt-get -y install vim
# sudo apt-get -y install php5
# sudo apt-get -y install openjdk-7-jdk
# sudo apt-get -y install gcc
# sudo apt-get -y install vlc
# sudo apt-get -y install byobu

# # Add third-party repositories (PPA)
# # Sublime Text 2
# sudo add-apt-repository ppa:webupd8team/sublime-text-2
# # MySQL using MariaDB
# sudo apt-get -y install software-properties-common
# sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
# sudo add-apt-repository 'deb http://mariadb.biz.net.id//repo/10.0/ubuntu raring main'
# # NodeJS
# sudo apt-get -y install python-software-properties python g++ make
# sudo add-apt-repository ppa:chris-lea/node.js
# # Spotify
# sudo add-apt-repository 'deb http://repository.spotify.com stable non-free'
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

# # Update and install
# sudo apt-get update
# sudo apt-get -y install sublime-text
# sudo apt-get -y install mariadb-server
# sudo apt-get -y install nodejs npm
# sudo apt-get -y install spotify-client

# # Install phpmyadmin only after MySQL has been installed
# sudo apt-get -y install phpmyadmin

# # Install pacapt (https://github.com/icy/pacapt)
# sudo wget -O /usr/local/bin/pacman https://github.com/icy/pacapt/raw/master/pacman
# sudo chmod 755 /usr/local/bin/pacman
