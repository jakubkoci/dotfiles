#!/usr/bin/env bash

# Install native apps
# Usage: `brew bundle Caskfile`

brew cask install brave-browser
brew cask install iterm2
brew cask install google-chrome
brew cask install google-backup-and-sync
# brew cask install keepassx
brew cask install flux
brew cask install appcleaner
brew cask install moom
brew cask install the-unarchiver
brew cask install visual-studio-code
brew cask install docker
brew cask install figma
# brew cask install licecap
brew cask install postman
brew cask install slack
brew cask install rocket-chat
brew cask install spotify
brew cask install vlc

# Map § key to escape https://github.com/tekezo/Karabiner-Elements/issues/931
# brew cask install karabiner-elements

# brew cask install skype

# cleanup
brew cleanup
