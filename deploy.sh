#!/bin/env bash

su --command='apt install opendoas && cp doas.conf /etc/' root

doas apt install -y build-essential alacritty tmux ranger mpv vim ripgrep gdb \
	xwayland sway swaylock i3status xdg-desktop-portal-wlr wl-clipboard \
	mako-notifier firefox-esr pavucontrol \
	zathura zathura-pdf-poppler zathura-djvu \
	grim slurp rofi \
	universal-ctags htop iwd dhcpcd \
	pipewire-audio pipewire-pulse \
	fonts-noto fonts-noto-cjk fonts-liberation \
	gimp obs-studio libreoffice

mkdir $HOME/.config
mkdir $HOME/Pictures
xdg-user-dirs-update --set PICTURES $HOME/Pictures

cp bashrc $HOME/.bashrc
cp tmux.conf $HOME/.tmux.conf
cp -r Scripts $HOME/
cp vimrc $HOME/.vimrc
cp -r nvim $HOME/.config/
cp gitconfig $HOME/.gitconfig
cp -r tmux $HOME/.config/
cp -r sway $HOME/.config/
cp -r i3status $HOME/.config/
cp -r alacritty $HOME/.config/
cp -r ranger $HOME/.config/
cp -r zathura $HOME/.config/

systemctl --user enable wireplumber
doas systemctl enable dhcpcd iwd
crontab -e
