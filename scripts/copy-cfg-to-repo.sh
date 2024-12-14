#!/bin/env bash

cp $HOME/.bashrc $HOME/dotfiles/bashrc
cp $HOME/.xinitrc $HOME/dotfiles/xinitrc
cp $HOME/.config/nvim/* $HOME/dotfiles/nvim -r
cp $HOME/.config/i3/* $HOME/dotfiles/i3 -r
cp $HOME/.config/i3status/* $HOME/dotfiles/i3status -r
cp $HOME/.config/kitty/* $HOME/dotfiles/kitty.conf -r
cp $HOME/.config/zathura/* $HOME/dotfiles/zathura -r
cp $HOME/.config/ranger/* $HOME/dotfiles/ranger -r
cp $HOME/scripts $HOME/dotfiles/ -r
cp $HOME/Pictures/wallpaper* $HOME/dotfiles/Pictures/
