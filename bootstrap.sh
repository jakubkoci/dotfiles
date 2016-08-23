#!/usr/bin/env bash

# Install manually from AppStore
#   XCode
#   Wunderlist
#   Evernote

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew bundle ./Brewfile
brew bundle ./Caskfile

# Install manually
#   IntelliJ
#   Docker
#   Sketch

# Install NodeJS (latest LTS version)
nvm install v4.5.0

# Mac OS X

## show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles YES

# Setup dotfiles
# .bashrc, .bash_profile, .vimrc
mkdir -p /Users/jakub/projects/dotfiles
git clone https://jakubkoci@bitbucket.org/jakubkoci/dotfiles.git /Users/jakub/projects/dotfiles

# Git configuration
source ./gitconfig.sh

# GitHub: Generating SSH keys
# https://help.github.com/articles/generating-ssh-keys/
# ...

# Install Google Chrome extensions
#   Translator
#   Evernote
#   Pocket
