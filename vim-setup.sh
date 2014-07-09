#!/bin/bash

# Create directories
mkdir -p ~/.vim/{autoload,bundle,colors}

# Install Pathogen
cd ~/.vim/autoload
git clone https://github.com/tpope/vim-pathogen.git
ln -s `realpath vim-pathogen/autoload/pathogen.vim`


#################
# PLUGINS
#################

cd ~/.vim/bundle

# Syntastic
git clone https://github.com/scrooloose/syntastic.git

# UltiSnips
git clone https://github.com/SirVer/ultisnips.git

# Command-T
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

# Lightline
git clone https://github.com/itchyny/lightline.vim.git

# YouCompleteMe
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


#################
# COLORSCHEMES
#################

cd ~/.vim/colors

# Molokai
git clone https://github.com/tomasr/molokai.git
ln -s `realpath molokai/colors/molokai.vim`

# Badwolf
git clone https://github.com/sjl/badwolf.git
ln -s `realpath badwolf/colors/badwolf.vim`
