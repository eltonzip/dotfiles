#!/bin/env bash

sudo apt install -y build-essential tmux vim universal-ctags ripgrep gdb htop alacritty clang clangd curl

cp bash_ez $HOME/.bash_ez
cp tmux.conf $HOME/.tmux.conf
cp -r Scripts $HOME/
cp vimrc $HOME/.vimrc
cp -r nvim $HOME/.config/
cp gitconfig $HOME/.gitconfig
cp -r alacritty $HOME/.config/
