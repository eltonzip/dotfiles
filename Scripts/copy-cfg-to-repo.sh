#!/bin/env bash

cp $HOME/.bashrc $HOME/dotfiles/bashrc
cp $HOME/.vimrc $HOME/dotfiles/vimrc
cp $HOME/.gitconfig $HOME/dotfiles/gitconfig
cp $HOME/.config/tmux/* $HOME/dotfiles/tmux
cp $HOME/.config/alacritty/* $HOME/dotfiles/alacritty
cp $HOME/Scripts/* $HOME/dotfiles/Scripts

if [ $DESKTOP_SESSION != 'plasmawayland' ]; then
	cp $HOME/.config/nvim/* $HOME/dotfiles/nvim
	cp $HOME/.config/sway/* $HOME/dotfiles/sway
	cp $HOME/.config/i3status/* $HOME/dotfiles/i3status
	cp $HOME/.config/zathura/* $HOME/dotfiles/zathura
	cp $HOME/.config/ranger/* $HOME/dotfiles/ranger
fi
