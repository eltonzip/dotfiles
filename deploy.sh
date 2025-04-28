#!/bin/env bash

sudo dnf install tmux vim ripgrep gdb htop alacritty

mkdir $HOME/.bashrc.d
cp bashrc $HOME/.bashrc.d/eltonzip
cp tmux.conf $HOME/.tmux.conf
cp -r Scripts $HOME/
cp vimrc $HOME/.vimrc
cp -r nvim $HOME/.config/
cp gitconfig $HOME/.gitconfig
cp -r alacritty $HOME/.config/
