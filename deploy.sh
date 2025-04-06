#!/bin/env bash

if [ $(lsb_release -is) == 'Arch' ]; then
	sudo pacman -S alacritty tmux ranger mpv vim neovim ripgrep \
		xorg-xwayland sway swaylock swaybg i3status \
		mako xfce4-power-manager firefox  pavucontrol \
		grim slurp wmenu imv \
		ctags \
		pipewire pipewire-alsa pipewire-pulse \
		zathura \
		ttf-hack-nerd noto-fonts noto-fonts-cjk \
		libreoffice gimp obs-studio htop
elif [ $(lsb_release -is) == 'Debian' ]; then
	doas apt install -y alacritty tmux ranger mpv vim neovim ripgrep \
		mako xfce4-power-manager firefox-esr pavucontrol \
		xwayland sway # I'll work on that later
		grim slurp wmenu imv \
		universal-ctags htop \
		pipewire-audio \
		zathura fonts-noto fonts-noto-cjk \
		flatpak

	doas flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi
# Nerd Fonts need to be installed manually on Debian systems

cp bashrc $HOME/.bashrc
cp Scripts $HOME/ -r

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp nvim/ $HOME/.config -r

cp vimrc $HOME/.vimrc
cp tmux $HOME/.config/ -r
cp sway $HOME/.config/ -r
cp i3status $HOME/.config/ -r
cp alacritty $HOME/.config/ -r
cp zathura $HOME/.config/ -r
cp ranger $HOME/.config/ -r
cp Pictures/* $HOME/Pictures/
