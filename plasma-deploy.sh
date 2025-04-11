#!/bin/env bash

DISTRO=$(head -n 1 /etc/os-release | grep -o 'Debian\|Arch')

if [ $DISTRO == 'Arch' ]; then
	sudo pacman -S alacritty tmux ctags \
		pipewire pipewire-alsa pipewire-pulse \
		ttf-liberation noto-fonts noto-fonts-cjk \
		libreoffice gimp obs-studio htop
elif [ $DISTRO == 'Debian' ]; then
	sudo apt install -y alacritty tmux universal-ctags \
		fonts-noto fonts-noto-cjk fonts-liberation \
		flatpak

	sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

cp bashrc $HOME/.bashrc
cp Scripts $HOME/ -r

cp vimrc $HOME/.vimrc
cp tmux $HOME/.config/ -r
cp alacritty $HOME/.config/ -r
