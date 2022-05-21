#!/usr/bin/env bash

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

brew install wget
brew install tree

# Install Node
curl https://get.volta.sh | bash
volta install node@16.15.0
volta install yarn

# Install React Native deps
brew install watchman
sudo gem install cocoapods

# Install Java
brew tap homebrew/cask-versions
brew install --cask zulu11

# Install Rust
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Add $HOME/.cargo/bin into shell config

# Remove outdated versions from the cellar
brew cleanup
