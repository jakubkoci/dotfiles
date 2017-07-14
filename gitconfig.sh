#!/usr/bin/env bash
git config --global user.name jakubkoci
git config --global user.email jakub.koci@gmail.com

git config --global core.editor vim
git config --global color.ui true
git config --global github.user jakubkoci
git config --global push.default matching

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

git config --global core.excludesfile ~/.gitignore_global
touch ~/.gitignore_global
echo ".DS_Store" >> ~/.gitignore_global
echo ".idea" >> ~/.gitignore_global
