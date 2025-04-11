#!/bin/env bash

DISTRO=$(head -n 1 /etc/os-release | grep -o 'Debian\|Arch')

if [ $DISTRO == 'Arch' ]; then
	sudo pacman -S alacritty tmux ranger mpv vim ripgrep \
		xorg-xwayland sway swaylock i3status \
		mako xfce4-power-manager firefox  pavucontrol \
		grim slurp wmenu \
		ctags \
		pipewire pipewire-alsa pipewire-pulse \
		zathura \
		ttf-liberation noto-fonts noto-fonts-cjk \
		libreoffice gimp obs-studio htop
elif [ $DISTRO == 'Debian' ]; then
	doas apt install -y alacritty tmux ranger mpv vim ripgrep \
		xwayland sway swaylock i3status xdg-desktop-portal-wlr \
		mako xfce4-power-manager firefox-esr pavucontrol \
		grim slurp wmenu \
		universal-ctags htop \
		pipewire-audio \
		zathura fonts-noto fonts-noto-cjk fonts-liberation \
		flatpak

	doas flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

cp bashrc $HOME/.bashrc
cp Scripts $HOME/ -r

cp vimrc $HOME/.vimrc
cp gitconfig $HOME/.gitconfig
cp tmux $HOME/.config/ -r
cp sway $HOME/.config/ -r
cp i3status $HOME/.config/ -r
cp alacritty $HOME/.config/ -r
cp zathura $HOME/.config/ -r
cp ranger $HOME/.config/ -r
