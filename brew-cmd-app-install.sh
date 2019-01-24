#!/usr/bin/env bash

# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

brew install wget
brew install tree

# Install fish
brew install fish
# append /etc/shells with /usr/local/bin/fish and run 'chsh -s /usr/local/bin/fish'

# Install NodeJS
brew install nvm
mkdir ~/.nvm

# Install oh-my-fish
curl -L https://get.oh-my.fish | fish
omf install nvm

# Install Node
nvm install v8.12.0

# Install Yarn
# If you use nvm or similar, you should exclude installing Node.js so that nvm’s version of Node.js is used.
brew install yarn --without-node

# Install React Native deps
brew install watchman
npm install -g react-native-cli

# Install Java
brew cask install java # latest version
# or specific version
brew tap caskroom/versions
brew search java # shows all available versions
brew cask install java8
# Maven
brew install maven

# Install Rust
curl https://sh.rustup.rs -sSf | sh
# Add following line into `config.fish`
# set -x PATH $PATH $HOME/.cargo/bin

# Install Cocoapods
brew install cocoapods

# Remove outdated versions from the cellar
brew cleanup
