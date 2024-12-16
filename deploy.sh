#!/bin/env bash

if [ $(lsb_release -is) == 'Arch' ]; then
	pacman -S kitty ranger mpv python-pillow neovim fzf ripgrep \
		i3 xorg xorg-xinit xorg-server dunst xfce4-power-manager firefox  pavucontrol \
		pipewire pipewire-alsa pipewire-pulse \
		zathura emacs \
		otf-commit-mono-nerd noto-fonts noto-fonts-cjk \
		libreoffice gimp obs htop
elif [ $(lsb_release -is) == 'Debian' ]; then
	apt install kitty ranger mpv python3-pillow neovim fzf ripgrep \
		i3 xorg dunst xfce4-power-manager firefox pavucontrol \
		pipewire pipewire-alas pipewire-pulse \
		zathura fonts-noto fonts-noto-cjk \
		libreoffice gimp obs htop
fi
# CommitMono Nerd Font needs to be installed manually for Debian systems

cp bashrc $HOME/.bashrc
cp Scripts $HOME/Scripts -r

cp nvim $HOME/.config/ -r
cp xinitrc $HOME/.xinitrc
cp i3 $HOME/.config/ -r
cp i3status $HOME/.config/ -r
mkdir .config/kitty && cp kitty.conf $HOME/.config/kitty/ -r
cp zathura $HOME/.config/ -r
cp ranger $HOME/.config/ -r
cp Pictures/* $HOME/Pictures/
