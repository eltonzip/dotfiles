#!/bin/env bash

su --command='apt install opendoas && cp doas.conf /etc/' root

doas apt install -y build-essential alacritty tmux ranger mpv vim ripgrep \
	xwayland sway swaylock i3status xdg-desktop-portal-wlr wl-clipboard \
	dunst firefox-esr pavucontrol \
	grim slurp rofi \
	universal-ctags htop \
	pipewire-audio pipewire-pulse \
	fonts-noto fonts-noto-cjk fonts-liberation \

mkdir $HOME/.config

mkdir $HOME/Pictures
xdg-user-dirs-update --set PICTURES $HOME/Pictures

cp bashrc $HOME/.bashrc
cp Scripts $HOME/ -r
cp vimrc $HOME/.vimrc
cp gitconfig $HOME/.gitconfig
cp tmux $HOME/.config/ -r
cp sway $HOME/.config/ -r
cp i3status $HOME/.config/ -r
cp alacritty $HOME/.config/ -r
cp ranger $HOME/.config/ -r
