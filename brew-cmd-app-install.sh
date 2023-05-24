#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

brew install wget tree

# Install Node
curl https://get.volta.sh | bash
volta install node@16.15.0
volta install yarn

# Install Node alternative
# @see https://github.com/tj/n
# brew install n
# n install 18

# Install React Native deps
brew install watchman
sudo gem install cocoapods

# Install Java
brew tap homebrew/cask-versions
brew install --cask zulu11

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install audio/video conversion tool
brew install ffmpeg

# Remove outdated versions from the cellar
brew cleanup
