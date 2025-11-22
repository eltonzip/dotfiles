#!/bin/env bash

if [[ -n $(command -v pacman) ]]; then
	sudo pacman -S --needed tmux gdb ctags                           \
		pipewire-pulse foot mpv bluez                                \
		firefox libreoffice-fresh terminus-font                      \
		noto-fonts-cjk noto-fonts-emoji noto-fonts-extra             \
		gdm gnome-shell gvfs gvfs-mtp loupe papers simple-scan       \
		gnome-tweaks gnome-control-center                            \
		gnome-shell-extension-appindicator gnome-shell-extensions    \
		snapshot xdg-desktop-portal-gnome xdg-user-dirs-gtk


	sudo systemctl enable gdm

	sudo systemctl enable bluetooth
	sudo systemctl enable --user wireplumber

	sudo ln -s $(which vim) /usr/local/bin/vi

	ln -s $(pwd)/cli/bash_ez    $HOME/.bash_ez
	ln -s $(pwd)/cli/vimrc      $HOME/.vimrc
	ln -s $(pwd)/cli/tmux.conf  $HOME/.tmux.conf
	ln -s $(pwd)/cli/gitconfig  $HOME/.gitconfig
	ln -s $(pwd)/cli/gdbinit    $HOME/.gdbinit
	ln -s $(pwd)/cli/ranger     $HOME/.config/ranger

	ln -s $(pwd)/gui/foot       $HOME/.config/foot
	ln -s $(pwd)/gui/mpv        $HOME/.config/mpv

	sed -i '$a\
\
#eltonzip:\
[[ -L $HOME/.bash_ez ]] && . $HOME/.bash_ez' $HOME/.bashrc
else
echo 'No pacman on this machine'
exit 1
fi
