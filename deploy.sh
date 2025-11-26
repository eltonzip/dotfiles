#!/bin/env bash

sudo apt install -y vim tmux gdb build-essential universal-ctags

ln -s $(pwd)/bash_ez    $HOME/.bash_ez
ln -s $(pwd)/vimrc      $HOME/.vimrc
ln -s $(pwd)/tmux.conf  $HOME/.tmux.conf
ln -s $(pwd)/gitconfig  $HOME/.gitconfig
ln -s $(pwd)/gdbinit    $HOME/.gdbinit

sed -i '$a\
\
#eltonzip:\
[[ -L $HOME/.bash_ez ]] && . $HOME/.bash_ez' $HOME/.bashrc
