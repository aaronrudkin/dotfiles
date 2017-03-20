#!/bin/bash

# Setup symlinks
ln -sF ~/.dotfiles/.zshrc ~/.zshrc
ln -sF ~/.dotfiles/.hushlogin ~/.hushlogin
ln -sF ~/.dotfiles/.nanorc ~/.nanorc

# Decrypt encrypted stuff
cd ~/.dotfiles
./decrypt.sh

# Setup more symlinks
ln -sF ~/.dotfiles/config ~/.ssh/config
ln -sF ~/.dotfiles/.gitconfig ~/.gitconfig

# Deploy the bin file.
mkdir ~/bin
ln -sF ~/.dotfiles/writecheck ~/bin/writecheck
