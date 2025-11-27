#!/bin/env bash

if [[ -z $(command -v pacman) ]]; then
	echo 'no pacman on this machine'
	exit 1
fi

if [[  -n $1 && $1 == 'gui' ]]; then
	sudo pacman -S firefox libreoffice-fresh pavucontrol             \
		noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra  \
		foot mpv

	ln -s $(pwd)/gui/foot    $HOME/.config/foot
	ln -s $(pwd)/gui/mpv     $HOME/.config/mpv
else
	sudo pacman -S needed tmux gdb ctags

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
