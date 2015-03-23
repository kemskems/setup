#!/bin/bash

# Install Xcode command line tools
xcode-select --install

# Install Homebrew if not installed
if [[ -z `which brew` ]]; then
    echo "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && brew update && brew doctor
fi

echo "Installing macvim..."
brew install macvim --override-system-vim

# Some useful taps
brew tap homebrew/science
brew tap beeftornado/rmtree

# Some useful tools in Homebrew
binaries=(
    bash
    bash-completion
    brew-rmtree
    cmake
    coreutils
    ctags
    git
    htop-osx
    node
    python
    r
    wget
)

echo "Installing binaries..."
brew install ${binaries[@]}

# Install Homebrew Cask
echo "Installing Homebrew Cask..."
brew install caskroom/cask/brew-cask && brew cask update && brew cask doctor

brew tap caskroom/versions

# Install applications with Homebrew Cask
apps=(
    appcleaner
    caffeine
    dropbox
    evernote
    firefox
    iterm2
    libreoffice
    mactex
    mendeley-desktop
    rstudio
    skype
    spectacle
    steam
    sublime-text
    telegram
    texstudio
    the-unarchiver
    vlc
)

echo "Installing apps..."
brew cask install ${apps[@]}
