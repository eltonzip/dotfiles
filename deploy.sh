#!/bin/env bash

sudo pacman -S --noconfirm --needed tmux ctags gdb

mkdir -p $HOME/.vim/colors
ln -s $(pwd)/bash_ez $HOME/.bash_ez
ln -s $(pwd)/eltonzip.vim $HOME/.vim/colors/eltonzip.vim
ln -s $(pwd)/gdbinit $HOME/.gdbinit
ln -s $(pwd)/gitconfig $HOME/.gitconfig
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/vimrc $HOME/.vimrc

sed -i '$a\
\
if [ -f $HOME/.bash_ez ]; then\
	. $HOME/.bash_ez\
fi' $HOME/.bashrc
