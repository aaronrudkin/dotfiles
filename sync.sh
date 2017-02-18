#!/bin/bash

current_date=`date +'%Y%m%d'`
cp ~/.nanorc ~/.dotfiles/
cp ~/.zshrc ~/.dotfiles/
cp ~/.hushlogin ~/.dotfiles/
cp ~/z.sh ~/.dotfiles/
cp ~/bin/writecheck ~/.dotfiles/
git add *
git commit -m "Sync cycle $current_date"
git push origin master
