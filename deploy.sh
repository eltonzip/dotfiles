#!/bin/env bash

if [ $(lsb_release -is) == 'Arch' ]; then
	sudo pacman -S alacritty tmux ranger mpv vim ripgrep \
		i3 xorg xorg-xinit xorg-server dunst xfce4-power-manager firefox  pavucontrol \
		flameshot dmenu feh \
		ctags \
		pipewire pipewire-alsa pipewire-pulse \
		zathura \
		ttf-hack-nerd noto-fonts noto-fonts-cjk \
		libreoffice gimp obs-studio htop
elif [ $(lsb_release -is) == 'Debian' ]; then
	doas apt install -y alacritty tmux ranger mpv vim ripgrep \
		i3 xorg dunst xfce4-power-manager firefox-esr pavucontrol \
		flameshot dmenu feh \
		universal-ctags htop \
		pipewire-audio \
		zathura fonts-noto fonts-noto-cjk \
		flatpak

	doas flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi
# Nerd Fonts need to be installed manually on Debian systems

cp bashrc $HOME/.bashrc
cp Scripts $HOME/ -r

cp vimrc $HOME/.vimrc
cp xinitrc $HOME/.xinitrc
cp nvim $HOME/.config/ -r
cp tmux $HOME/.config/ -r
cp i3 $HOME/.config/ -r
cp i3status $HOME/.config/ -r
cp alacritty $HOME/.config/ -r
cp zathura $HOME/.config/ -r
cp ranger $HOME/.config/ -r
cp Pictures/* $HOME/Pictures/
