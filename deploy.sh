#!/bin/env bash

sudo pacman -S --noconfirm tmux ctags gdb terminus-font

mkdir -p $HOME/.vim/colors
cp bash_ez $HOME/.bash_ez
cp tmux.conf $HOME/.tmux.conf
cp -r Scripts $HOME/
cp vimrc $HOME/.vimrc
cp eltonzip.vim $HOME/.vim/colors/
cp gitconfig $HOME/.gitconfig
cp gdbinit $HOME/.gdbinit

sed -i '$a\
\
if [ -f $HOME/.bash_ez ]; then\
	. $HOME/.bash_ez\
fi' $HOME/.bashrc
