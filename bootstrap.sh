#!/usr/bin/env bash

# Install apps manually from AppStore

# Install Homebrew
# ./brew-install.sh

# ./brew-cmd-app-install.sh OR brew bundle ./Brewfile
# ./brew-native-app-install.sh OR brew bundle ./Caskfile

# Mac OS X

## Show hidden files in Finder (probably needs the restart)
# defaults write com.apple.finder AppleShowAllFiles YES

# Install other apps manually

# Setup dotfiles
# .vimrc, .bashrc, .bash_profile (?),

# Git configuration
# source ./gitconfig.sh

# GitHub: Generating SSH keys
# https://help.github.com/articles/generating-ssh-keys/

# Checking for existing SSH keys
ls -al ~/.ssh

# Generating a new SSH key
ssh-keygen -t rsa -b 4096 -C "jakub.koci@gmail.com"

# Start the ssh-agent in the background
# in bash
eval "$(ssh-agent -s)"

# Add your SSH key to the ssh-agent
ssh-add ~/.ssh/id_rsa

# Copies the contents of the id_rsa.pub file to your clipboard
pbcopy < ~/.ssh/id_rsa.pub

# Install browser extensions (Brave, Google Chrome)

# Install Visual Code extensions
