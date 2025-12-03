#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install multiple apps with one command
brew install wget tree n ffmpeg lazygit lazydocker neovim

# Install one be one
brew install wget
brew install tree

# Install Node
# @see https://github.com/tj/n
brew install n
n install lts

# Install audio/video conversion tool
brew install ffmpeg

# Install other dev tools
brew install lazygit
brew install lazydocker
brew install neovim

# Install React Native deps
brew install watchman
sudo gem install cocoapods

# Install Java
brew tap homebrew/cask-versions
brew install --cask zulu11

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Remove outdated versions from the cellar
brew cleanup
