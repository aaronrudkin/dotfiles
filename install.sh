#!/bin/bash

ln -sF ~/.dotfiles/.zshrc ~/.zshrc
ln -sF ~/.dotfiles/.hushlogin ~/.hushlogin
ln -sF ~/.dotfiles/.nanorc ~/.nanorc

cd ~/.dotfiles
./decrypt.sh
ln -sF ~/.dotfiles/config ~/.ssh/config
ln -sF ~/.dotfiles/.gitconfig ~/.gitconfig
mkdir ~/bin
ln -sF ~/.dotfiles/writecheck ~/bin/writecheck
