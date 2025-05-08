#!/bin/env bash

sudo pacman -S --noconfirm tmux ctags htop alacritty

cp bash_ez $HOME/.bash_ez
cp tmux.conf $HOME/.tmux.conf
cp -r Scripts $HOME/
cp vimrc $HOME/.vimrc
cp -r nvim $HOME/.config/
cp gitconfig $HOME/.gitconfig
cp -r alacritty $HOME/.config/

sed -i '$a\
\
if [ -f $HOME/.bash_ez ]; then\
	. $HOME/.bash_ez\
fi' $HOME/.bashrc
