#!/bin/env bash

if [[ -z $(command -v pacman) ]]; then
	echo 'no pacman on this machine'
	exit 1
fi

if [[  -n $1 && $1 == 'gui' ]]; then
	sudo pacman -S --needed firefox libreoffice-fresh pavucontrol      \
		noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra    \
		sway pcmanfm grim slurp mako swaylock wmenu blueman imv        \
		xdg-desktop-portal-gtk xdg-desktop-portal-wlr wl-clipboard     \
		foot mpv terminus-font zathura zathura-djvu zathura-pdf-mupdf  \
		xorg-xwayland pipewire-pulse

	sudo usermod -aG seat "${USER}"
	sudo systemctl enable seatd
	systemctl --user enable pipewire-pulse

	mkdir -p $HOME/{.config,Pictures/Screenshots}

	ln -s $(pwd)/gui/sway     $HOME/.config/sway
	ln -s $(pwd)/gui/foot     $HOME/.config/foot
	ln -s $(pwd)/gui/mpv      $HOME/.config/mpv
	ln -s $(pwd)/gui/mako     $HOME/.config/mako
	ln -s $(pwd)/gui/zathura  $HOME/.config/zathura
else
	sudo pacman -S --needed tmux gdb ctags

	sudo ln -s $(which vim) /usr/bin/vi

	ln -s $(pwd)/cli/bash_ez    $HOME/.bash_ez
	ln -s $(pwd)/cli/vimrc      $HOME/.vimrc
	ln -s $(pwd)/cli/tmux.conf  $HOME/.tmux.conf
	ln -s $(pwd)/cli/gitconfig  $HOME/.gitconfig
	ln -s $(pwd)/cli/gdbinit    $HOME/.gdbinit
fi

grep 'bash_ez' $HOME/.bashrc &>/dev/null
if [[ $? != 0 ]]; then
	sed -i '$a\
\
#eltonzip:\
[[ -L $HOME/.bash_ez ]] && . $HOME/.bash_ez' $HOME/.bashrc
fi
