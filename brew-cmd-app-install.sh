#!/usr/bin/env bash

# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

brew install wget
brew install tree

# Install NodeJS
brew install nvm
mkdir ~/.nvm
# Put this into .bash_profile
# echo "export NVM_DIR=~/.nvm" >> ~/.bash_profile
# echo "source $(brew --prefix nvm)/nvm.sh" >> ~/.bash_profile

# Install node
# nvm install v4.5.0

# Install fish
brew install fish
# append /etc/shells with /usr/local/bin/fish and run 'chsh -s /usr/local/bin/fish'

# Install oh-my-fish
# curl -L https://get.oh-my.fish | fish
# omf install nvm

brew install watchman
brew install leiningen
brew cask install java
brew install maven

# Remove outdated versions from the cellar
brew cleanup
