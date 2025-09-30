#!/bin/env bash

distro=$(grep -o 'Debian\|Arch' /etc/os-release | uniq)
if [[ $distro == 'Arch' ]]; then
	sudo pacman -S --noconfirm --needed tmux ctags gdb
elif [[ $distro == 'Debian' ]]; then
	sudo apt install -y tmux universal-ctags gdb vim
else
	echo 'this script is not suitable for your distro'
fi

ln -s $(pwd)/bash_ez $HOME/.bash_ez
ln -s $(pwd)/gdbinit $HOME/.gdbinit
ln -s $(pwd)/gitconfig $HOME/.gitconfig
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/vimrc $HOME/.vimrc

grep 'bash_ez' $HOME/.bashrc &>/dev/null
if [[ $? != 0 ]]; then
	sed -i '$a\
\
if [ -e $HOME/.bash_ez ]; then\
	. $HOME/.bash_ez\
fi' $HOME/.bashrc
fi
