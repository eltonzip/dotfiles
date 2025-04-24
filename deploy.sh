#!/bin/env bash

su --command='apt install opendoas && cp doas.conf /etc/' root

doas apt install -y build-essential tmux vim ripgrep gdb universal-ctags htop

cp bashrc $HOME/.bashrc
cp tmux.conf $HOME/.tmux.conf
cp -r Scripts $HOME/
cp vimrc $HOME/.vimrc
cp -r nvim $HOME/.config/
cp gitconfig $HOME/.gitconfig
