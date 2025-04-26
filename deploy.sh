#!/bin/env bash

su --command="echo 'eltonzip ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers"

sudo apt install -y build-essential tmux vim ripgrep gdb universal-ctags htop alacritty

cp bashrc $HOME/.bashrc
cp tmux.conf $HOME/.tmux.conf
cp -r Scripts $HOME/
cp vimrc $HOME/.vimrc
cp -r nvim $HOME/.config/
cp gitconfig $HOME/.gitconfig
cp -r alacritty $HOME/.config/
