#!/bin/bash

mkdir -p ~/.config/nvim

cp init.vim ~/.config/nvim/init.vim

# install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install pip
paru -S python-pip

sudo pip install neovim

sudo pip install pynvim 
