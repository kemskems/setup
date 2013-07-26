#!/bin/bash

INSTALL=(
    "Git"
    "Vim"
    "Byobu"
    "Sublime Text 2"
    "GCC"
    "OpenJDK 7"
    "PHP 5"
    "MariaDB"
    "NodeJS"
    "pacapt"
    "VLC media player"
    "Spotify"
)
SIZE=${#INSTALL[*]}

install() {
    # Update repo information
    sudo apt-get update

    while [ "$#" -gt 0 ]; do
        case "$1" in
            # Git
            0)  sudo apt-get -y install git
                ;;
            # Vim
            1)  sudo apt-get -y install vim
                ;;
            # Byobu
            2)  sudo apt-get -y install byobu
                ;;
            # Sublime Text 2
            3)  sudo add-apt-repository ppa:webupd8team/sublime-text-2
                sudo apt-get update
                sudo apt-get install -y sublime-text
                ;;
            # GCC
            4)  sudo apt-get -y install gcc
                ;;
            # OpenJDK 7
            5)  sudo apt-get -y install openjdk-7-jdk
                ;;
            # PHP 5
            6)  sudo apt-get -y install php5
                ;;
            # MariaDB
            7)  sudo apt-get -y install software-properties-common
                sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
                sudo add-apt-repository 'deb http://mariadb.biz.net.id//repo/10.0/ubuntu raring main'
                sudo apt-get update
                sudo apt-get install -y mariadb-server
                ;;
            # NodeJS
            8)  sudo apt-get -y install python-software-properties python g++ make
                sudo add-apt-repository ppa:chris-lea/node.js
                sudo apt-get update
                sudo apt-get -y install nodejs
                ;;
            # Pacapt
            9)  sudo wget -O /usr/local/bin/pacman https://github.com/icy/pacapt/raw/master/pacman
                sudo chmod 755 /usr/local/bin/pacman
                ;;
            # VLC media player
            10) sudo apt-get -y install vlc
                ;;
            # Spotify
            11) sudo add-apt-repository 'deb http://repository.spotify.com stable non-free'
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
