#!/bin/bash

INSTALL=(
    "Git"
    "Vim"
    "Byobu"
    "Sublime Text 2"
    "gcc"
    "Oracle Java 7"
    "PHP 5"
    "MariaDB"
    "NodeJS"
    "pacapt"
    "VLC media player"
    "GNOME session fallback"
    "Compiz Config Settings Manager"
    "Synapse"
    "MS Fonts"
    "Google Chrome"
    "g++"
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
            # gcc
            4)  sudo apt-get -y install gcc
                ;;
            # Oracle Java 7
            5)  sudo add-apt-repository ppa:webupd8team/java
                sudo apt-get update
                sudo apt-get -y install oracle-java7-installer
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
            9)  sudo wget -O /usr/local/bin/pacapt https://github.com/icy/pacapt/raw/master/pacapt
                sudo chmod 755 /usr/local/bin/pacapt
                ;;
            # VLC media player
            10) sudo apt-get -y install vlc
                ;;
            # Gnome session fallback
            11) sudo apt-get -y install gnome-session-fallback
                ;;
            # Compiz
            12) sudo apt-get -y install compizconfig-settings-manager
                sudo apt-get -y install compiz-plugins-extra
                ;;
            # Synapse
            13) sudo apt-get -y install synapse
                ;;
            # MS Fonts
            14) sudo apt-get -y install ttf-mscorefonts-installer
                ;;
            # Google Chrome
            15) wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
                sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
                sudo apt-get update
                sudo apt-get -y install google-chrome-stable
                ;;
            # g++
            16) sudo apt-get -y install g++
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
