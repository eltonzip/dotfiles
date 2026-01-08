#!/bin/env bash

if [[ -z $(command -v pacman) ]]; then
	echo 'no pacman on this machine'
	exit 1
fi

if [[  -n $1 && $1 == 'gui' ]]; then
	sudo pacman -S --needed firefox libreoffice-fresh pavucontrol           \
		noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra         \
		sway pcmanfm grim slurp mako swaylock wmenu blueman imv             \
		xdg-desktop-portal-gtk xdg-desktop-portal-wlr wl-clipboard          \
		foot mpv terminus-font zathura zathura-djvu zathura-pdf-mupdf       \
		xorg-xwayland pipewire-pulse polkit network-manager-applet

	systemctl --user enable pipewire-pulse
	sudo systemctl enable bluetooth

	xdg-mime default imv.desktop image/png \
		image/jpeg image/webp image/svg+xml image/tiff
	xdg-mime default mpv.desktop image/gif

	mkdir -p $HOME/{.config,Pictures/Screenshots}

	ln -s $(pwd)/gui/sway            $HOME/.config/sway
	ln -s $(pwd)/gui/waybar          $HOME/.config/waybar
	ln -s $(pwd)/gui/foot            $HOME/.config/foot
	ln -s $(pwd)/gui/mpv             $HOME/.config/mpv
	ln -s $(pwd)/gui/mako            $HOME/.config/mako
	ln -s $(pwd)/gui/zathura         $HOME/.config/zathura
else
	sudo pacman -S --needed gdb ctags

	ln -s $(pwd)/cli/bashez    $HOME/.bashez
	ln -s $(pwd)/cli/vimrc      $HOME/.vimrc
	ln -s $(pwd)/cli/gitconfig  $HOME/.gitconfig
	ln -s $(pwd)/cli/gdbinit    $HOME/.gdbinit
fi

grep 'bashez' $HOME/.bashrc &>/dev/null
if [[ $? != 0 ]]; then
	sed -i '$a\
\
#losercitymayor:\
[[ -L $HOME/.bashez ]] && . $HOME/.bashez' $HOME/.bashrc
fi
