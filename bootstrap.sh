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

# brew bundle ./Brewfile
# brew bundle ./Caskfile

# Install manually
#   IntelliJ
#   Docker
#   Sketch

# Install NodeJS (latest LTS version)
# nvm install v4.5.0

# Mac OS X

## show hidden files in Finder
# defaults write com.apple.finder AppleShowAllFiles YES

# Setup dotfiles
# .bashrc, .bash_profile, .vimrc

# Git configuration
# source ./gitconfig.sh

# GitHub: Generating SSH keys
# https://help.github.com/articles/generating-ssh-keys/

# Checking for existing SSH keys
ls -al ~/.ssh

# Generating a new SSH key
ssh-keygen -t rsa -b 4096 -C "jakub.koci@gmail.com"

# Start the ssh-agent in the background
eval "$(ssh-agent -s)"

# Add your SSH key to the ssh-agent
ssh-add ~/.ssh/id_rsa

# Copies the contents of the id_rsa.pub file to your clipboard
pbcopy < ~/.ssh/id_rsa.pub

# Install Google Chrome extensions
#   Translator
#   Evernote
#   Pocket
