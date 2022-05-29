# Installation Steps

## Install Apps
Install apps manually from AppStore

Install Homebrew
```
./brew-install.sh
```

Install cmd tools and apps
```
./brew-cmd-app-install.sh OR brew bundle ./Brewfile
```

Install native apps
```
./brew-native-app-install.sh
```

## Setup Mac OS X
Show hidden files in Finder (probably needs the restart)
```
defaults write com.apple.finder AppleShowAllFiles YES
```
Install other apps manually

## Setup dotfiles
Setup `.zshrc`, `.zprofile`
```
cp .vimrc .gitconfig ../
```

## Setup SSH
[GitHub: Generating SSH keys](https://help.github.com/articles/generating-ssh-keys/)

Generate a new SSH keys
```
ssh-keygen -t rsa -b 4096 -C ""
ssh-keygen -t ed25519 -C ""
```

Start the ssh-agent in the background
```
eval "$(ssh-agent -s)"
```

Add your SSH key to the ssh-agent
```
ssh-add ~/.ssh/id_rsa
```

Copy the contents of the id_rsa.pub file to your clipboard
```
pbcopy < ~/.ssh/id_rsa.pub
```

Install browser extensions (Brave, Google Chrome)

Install Visual Code extensions


Another config examples could be find here:
* https://github.com/jirkapenzes/dotfiles
* https://github.com/rarous/dotfiles
* https://github.com/danielribeiro/dotfiles
