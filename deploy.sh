#!/bin/env bash

sudo apt install -y build-essential alacritty tmux mpv vim ripgrep gdb universal-ctags htop

mkdir $HOME/.config

cp bashrc $HOME/.bashrc
cp -r Scripts $HOME/
cp vimrc $HOME/.vimrc
cp -r nvim/ $HOME/.config/
cp gitconfig $HOME/.gitconfig
cp -r tmux $HOME/.config/
cp -r alacritty $HOME/.config/
