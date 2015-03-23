#!/bin/bash

# Install Xcode command line tools
xcode-select --install

# Install Homebrew if not installed
if [[ -z `which brew` ]]; then
    echo "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && brew update && brew doctor
fi

# Some useful tools in Homebrew
brew install bash
brew install bash-completion
brew install coreutils
brew install git
brew install cmake
brew install htop-osx
brew install wget
brew install macvim

# Install Homebrew Cask
echo "Installing Homebrew Cask..."
brew install caskroom/cask/brew-cask && brew cask update && brew cask doctor

# Install applications with Homebrew Cask
brew cask install iterm2
brew cask install firefox
brew cask install dropbox
brew cask install evernote
brew cask install mendeley-desktop
