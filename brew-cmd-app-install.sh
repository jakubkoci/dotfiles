#!/usr/bin/env bash

# Install Shell tools

# Install zsh
# Most versions of macOS ship zsh by default. We don't need to install, but just set it as default shell.
# brew install zsh
chsh -s /bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install fish
# brew install fish
# append /etc/shells with /usr/local/bin/fish and run 'chsh -s /usr/local/bin/fish'

# Install oh-my-fish
# curl -L https://get.oh-my.fish | fish

#######################################################################################################################

# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

brew install wget
brew install tree

# Install NodeJS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

# Install Fish nvm plugin
# omf install nvm

# Install Node, latest LTS
nvm install v12.14.0

# Install Yarn
# If you use nvm or similar, you should exclude installing Node.js so that nvm’s version of Node.js is used.
brew install yarn

# Install React Native deps
brew install watchman

# Install Java
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk8

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Add following line into `config.fish`
# set -x PATH $PATH $HOME/.cargo/bin

# Install Cocoapods
brew install cocoapods

# Remove outdated versions from the cellar
brew cleanup
