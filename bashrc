## Variables
export MOZ_ENABLE_WAYLAND=1 # for Tor Browser to run natively in wayland
export EDITOR=vim

## Prompt
PS1='\[\033[01;32m\]\w\[\033[00m\]\n$ '

## Aliases
alias reload="source ~/.bashrc"

alias ..="cd .."
alias ...="cd ../.."

alias cdin="pwd > ~/.cdbuff"
function cdto {
	cd $(cat $HOME/.cdbuff)
}

function back {
	mv "${1}" "${1}~"
}

# coreutils
alias pgnu="ping gnu.org"
alias du="du -h"
alias free="free -h"
alias cal="ncal -Mb"
alias cache-clean="sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'"
alias ls="ls --color=auto"
alias grep="grep -n --color=auto --exclude={tags,Makefile,build.sh,.gitignore} --exclude-dir={.cache,.git,vscode}"
alias zgrep="zgrep -n --color=auto"
alias fgrep="fgrep -n --color=auto"
alias egrep="egrep -n --color=auto"

# dev
alias pvenv="source $HOME/.venv/bin/activate"
alias devpy="source $HOME/.venv/bin/activate && cd $HOME/Programming/python"
alias ctags="ctags -R --kinds-C=+DLpxzl --kinds-C++=+ADLNUZpxzl --kinds-Python=+lz --fields=+iaS --extras=+q"

# pacman
alias Jupd="sudo pacman -Syu --noconfirm"
alias Upd-off="sudo pacman -Syu --noconfirm && Poweroff"

# Sway
alias Sway="$HOME/Scripts/sway.sh"

# iwd
alias wifi-scan="iwctl station wlan0 scan"
alias wifi-connect="iwctl station wlan0 connect"
alias wifi-disconnect="iwctl station wlan0 disconnect"

# other
alias Sleep="systemctl suspend && swaylock -e"
alias Poweroff="rm $HOME/.bash_history && poweroff"
alias Reboot="rm $HOME/.bash_history && reboot"
MAILCHECK=-1
