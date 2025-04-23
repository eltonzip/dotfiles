#!/bin/env bash

su --command='apt install opendoas && cp doas.conf /etc/' root

doas apt install -y build-essential alacritty tmux vim ripgrep gdb universal-ctags htop

mkdir $HOME/.config

cp bashrc $HOME/.bashrc
cp tmux.conf $HOME/.tmux.conf
cp -r Scripts $HOME/
cp vimrc $HOME/.vimrc
cp -r nvim $HOME/.config/
cp gitconfig $HOME/.gitconfig
cp -r alacritty $HOME/.config/

sed -i '47,54d;57,59d;105,114d;/Upf/d' $HOME/.bashrc
