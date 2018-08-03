#!/usr/bin/env bash

set -e

if ! command -v pip3 > /dev/null; then
  echo Installing pip3
  pacman -S pip3
fi

if ! command -v nvim > /dev/null; then
  echo Installing neovim
  pacman -S neovim
  pip3 install neovim
fi

echo Installing Plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo Linking files
ln -s ~/.dotfiles/nvim ~/.config/nvim

echo Installing vim plugins
nvim +PlugInstall +qa
