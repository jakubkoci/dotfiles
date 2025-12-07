# Installation Steps

## Install Apps
Install apps manually from AppStore

Install apps manually
- Brave Browser
- 1Password
- Proton VPN

Install oh-my-zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install Homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install cmd tools and apps

```sh
./brew-cmd-app-install.sh
```

Install native apps
```sh
./brew-native-app-install.sh
```

Install AI tools

```sh
brew install codex
brew install --cask claude-code
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

```sh
ssh-keygen -t rsa -b 4096 -C ""
ssh-keygen -t ed25519 -C ""
```

Start the ssh-agent in the background

```sh
eval "$(ssh-agent -s)"
```

Add your SSH key to the ssh-agent. It should be added automatically but if it's not you can run:

```sh
ssh-add ~/.ssh/id_rsa
```

Copy the contents of the id_rsa.pub file to your clipboard

```sh
pbcopy < ~/.ssh/id_rsa.pub
pbcopy < ~/.ssh/id_ed25519.pub
```

Install browser extensions (Brave, Google Chrome)

Install Visual Code extensions


Another config examples could be find here:
* https://github.com/jirkapenzes/dotfiles
* https://github.com/rarous/dotfiles
* https://github.com/danielribeiro/dotfiles
