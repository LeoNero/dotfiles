#!/bin/sh

set -e

if ! command -v fish > /dev/null; then
  echo Installing fish
  pacman -S fish

  echo Installing omf
  curl -L https://get.oh-my.fish | fish
fi

echo Linking files
ln -s ~/.dotfiles/fish/fish ~/.config/fish
ln -s ~/.dotfiles/fish/omf ~/.config/omf
