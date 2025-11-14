#!/bin/env bash

if [[ -n $(command -v pacman) ]]; then
	sudo pacman -S --needed tmux gdb ctags                           \
		sway pipewire-pulse foot mako polkit mpv bluez blueman       \
		swaylock wmenu otf-font-awesome wl-clipboard                 \
		xdg-desktop-portal-gtk xdg-desktop-portal-wlr xorg-xwayland  \
		firefox pavucontrol flameshot libreoffice-fresh              \
		noto-fonts-cjk noto-fonts-emoji noto-fonts-extra             \
		zathura zathura-pdf-mupdf zathura-djvu

	sudo systemctl enable bluetooth
	sudo systemctl enable --user wireplumber
	sudo systemctl enable --user mako

	ln -s $(pwd)/cli/bash_ez    $HOME/.bash_ez
	ln -s $(pwd)/cli/vimrc      $HOME/.vimrc
	ln -s $(pwd)/cli/tmux.conf  $HOME/.tmux.conf
	ln -s $(pwd)/cli/gitconfig  $HOME/.gitconfig
	ln -s $(pwd)/cli/gdbinit    $HOME/.gdbinit
	ln -s $(pwd)/cli/ranger     $HOME/.config/ranger

	ln -s $(pwd)/gui/sway       $HOME/.config/sway
	ln -s $(pwd)/gui/foot       $HOME/.config/foot
	ln -s $(pwd)/gui/flameshot  $HOME/.config/flameshot
	ln -s $(pwd)/gui/zathura    $HOME/.config/zathura
	ln -s $(pwd)/gui/mako       $HOME/.config/mako

	sed -i '$a\
\
#eltonzip:\
[[ -L $HOME/.bash_ez ]] && . $HOME/.bash_ez' $HOME/.bashrc
else
	echo 'No pacman on this machine'
	exit 1
fi
