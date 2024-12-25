#!/bin/env bash

if [ $(lsb_release -is) == 'Arch' ]; then
	pacman -S kitty tmux ranger mpv python-pillow vim fzf ripgrep \
		i3 xorg xorg-xinit xorg-server dunst xfce4-power-manager firefox  pavucontrol \
		pipewire pipewire-alsa pipewire-pulse \
		zathura \
		otf-commit-mono-nerd ttf-hack-nerd noto-fonts noto-fonts-cjk \
		libreoffice gimp obs htop
elif [ $(lsb_release -is) == 'Debian' ]; then
	apt install kitty tmux ranger mpv python3-pillow vim fzf ripgrep \
		i3 xorg dunst xfce4-power-manager firefox pavucontrol \
		pipewire pipewire-alas pipewire-pulse \
		zathura fonts-noto fonts-noto-cjk \
		libreoffice gimp obs htop
fi
# Nerd Fonts need to be installed manually for Debian systems

cp bashrc $HOME/.bashrc
cp Scripts $HOME/Scripts -r

cp vimrc $HOME/.vimrc
cp xinitrc $HOME/.xinitrc
cp i3 $HOME/.config/ -r
cp i3status $HOME/.config/ -r
cp kitty $HOME/.config/ -r
cp zathura $HOME/.config/ -r
cp ranger $HOME/.config/ -r
cp Pictures/* $HOME/Pictures/
