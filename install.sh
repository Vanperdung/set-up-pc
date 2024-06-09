#!/bin/bash

NEOVIM_FILE=nvim.appimage
NODEJS_FILE=node-v20.10.0-linux-x64.tar.xz

# sudo apt install neovim
# sudo apt install nodejs

if [ ! -e ${NEOVIM_FILE} ]; then
    wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    chmod u+x nvim.appimage
    ./nvim.appimage --appimage-extract
    sudo cp squashfs-root/usr/bin/nvim /usr/bin
fi

if [ ! -e ${NODEJS_FILE} ]; then
    wget https://nodejs.org/dist/v20.10.0/node-v20.10.0-linux-x64.tar.xz
    sudo tar -C /usr/local --strip-components 1 -xJf node-v20.10.0-linux-x64.tar.xz
fi

sudo apt install npm
mkdir ~/.config/nvim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp init.vim ~/.config/nvim/init.vim
nvim ~/.config/nvim/init.vim