#!/bin/bash

PLUGINS=(
    "Pathogen"
    "Syntastic"
    "UltiSnips"
    "Command-T"
    "Lightline"
    "YouCompleteMe"
)
NUM_PLUGINS=${#PLUGINS[*]}

COLORS=(
    "Molokai"
    "Badwolf"
)
NUM_COLORS=${#COLORS[*]}


install_plugin() {
    while [ "$#" -gt 0 ]; do
        case "$1" in
            # Pathogen
            0)  mkdir -p ~/.vim/autoload
                cd ~/.vim/autoload
                git clone https://github.com/tpope/vim-pathogen.git
                ln -s `realpath vim-pathogen/autoload/pathogen.vim`
                ;;
            # Syntastic
            1)  mkdir -p ~/.vim/bundle
                cd ~/.vim/bundle
                git clone https://github.com/scrooloose/syntastic.git
                ;;
            # UltiSnips
            2)  mkdir -p ~/.vim/bundle
                cd ~/.vim/bundle
                git clone https://github.com/SirVer/ultisnips.git
                ;;
            # Command-T
            3)  mkdir -p ~/.vim/bundle
                cd ~/.vim/bundle
                if [ `vim --version | grep -c "+ruby"` -eq 1 ]; then
                    if [ -n "`which ruby`" ]; then
                        git clone https://github.com/wincent/Command-T.git
                        cd ~/.vim/bundle/Command-T/ruby/command-t
                        ruby extconf.rb
                        make
                        cd ~/.vim/bundle
                    else
                        echo "Ruby not found. Skipping Command-T installation..."
                    fi
                else
                    echo "Vim was not compiled with Ruby support. Skipping Command-T installation..."
                fi
                ;;
            # Lightline
            4)  mkdir -p ~/.vim/bundle
                cd ~/.vim/bundle
                git clone https://github.com/itchyny/lightline.vim.git
                ;;
            # YouCompleteMe
            5)  mkdir -p ~/.vim/bundle
                cd ~/.vim/bundle
                if [ `vim --version | grep -c "+python"` -eq 1 ]; then
                    if [ -n "`which cmake`" ]; then
                        git clone https://github.com/Valloric/YouCompleteMe.git
                        cd YouCompleteMe
                        git submodule update --init --recursive
                        mkdir ~/ycm_build
                        cd ~/ycm_build
                        cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
                        make ycm_support_libs
                        cd ~/.vim/bundle
                        rm -rf ~/ycm_build
                    else
                        echo "Cmake not found. Skipping YouCompleteMe installation..."
                    fi
                else
                    echo "Vim was not compiled with Python 2 support. Skipping YouCompleteMe installation..."
                fi
                ;;
            # Default
            *)  echo "Unrecognized selection number '$1'. Skipping."
                ;;
        esac
        shift
    done
}

install_colorscheme() {
    while [ "$#" -gt 0 ]; do
        case "$1" in
            # Molokai
            0)  mkdir -p ~/.vim/colors
                cd ~/.vim/colors
                git clone https://github.com/tomasr/molokai.git
                ln -s `realpath molokai/colors/molokai.vim`
                ;;
            # Badwolf
            1)  mkdir -p ~/.vim/colors
                cd ~/.vim/colors
                git clone https://github.com/sjl/badwolf.git
                ln -s `realpath badwolf/colors/badwolf.vim`
                ;;
            # Default
            *)  echo "Unrecognized selection number '$1'. Skipping."
                ;;
        esac
        shift
    done
}


# Prompt to install plugins
echo "Select which plugins to install:"
for (( i = 0; i < $NUM_PLUGINS; i++ )); do
    if [ $i -gt 0 ]; then
        echo -n " "
    fi
    echo -n "$i) ${PLUGINS[$i]}"
done
echo
echo -n "Your selection (list the numbers separated by a space) (default=all): "
read SELECTIONS
if [ -z "$SELECTIONS" ]; then
    install_plugin $(seq -s ' ' $NUM_PLUGINS)
else
    install_plugin $SELECTIONS
fi

echo

# Prompt to install colorschemes
echo "Select which colorschemes to install:"
for (( i = 0; i < $NUM_COLORS; i++ )); do
    if [ $i -gt 0 ]; then
        echo -n " "
    fi
    echo -n "$i) ${COLORS[$i]}"
done
echo
echo -n "Your selection (list the numbers separated by a space) (default=all): "
read SELECTIONS
if [ -z "$SELECTIONS" ]; then
    install_colorscheme $(seq -s ' ' $NUM_COLORS)
else
    install_colorscheme $SELECTIONS
fi
