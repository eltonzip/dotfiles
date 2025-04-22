#!/bin/env bash

sudo apt install -y build-essential alacritty tmux mpv vim ripgrep gdb universal-ctags htop

mkdir $HOME/.config

cp bashrc $HOME/.bashrc
cp tmux.conf $HOME/.tmux.conf
cp -r Scripts $HOME/
cp vimrc $HOME/.vimrc
cp -r nvim/ $HOME/.config/
cp gitconfig $HOME/.gitconfig
cp -r alacritty $HOME/.config/
