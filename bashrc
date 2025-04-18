case $- in
    *i*) ;;
      *) return;;
esac

if ! shopt -oq posix; then
if [ -f /usr/share/bash-completion/bash_completion ]; then
. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi
fi

## Variables
export MOZ_ENABLE_WAYLAND=1 # for Tor Browser to run natively in wayland
export EDITOR=vim

## Prompt
PS1='$ '

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
alias free="free -h"
alias cal="ncal -Mb"
alias cache-clean="sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'"
alias ls="ls --color=auto"
alias grep="grep --color=auto --exclude={tags,Makefile,build.sh,.gitignore} --exclude-dir={.cache,.git,.vscode}"
alias zgrep="zgrep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias vi="vim"
alias nvim="$HOME/Opt/nvim-linux-x86_64/bin/nvim"

# dev
alias pvenv="source $HOME/.venv/bin/activate"
alias devpy="source $HOME/.venv/bin/activate && cd $HOME/Programming/python"
alias ctags="ctags -R --kinds-C=+DLpxzl --kinds-C++=+ADLNUZpxzl --kinds-Python=+lz --fields=+iaS --extras=+q"

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
alias sudo="doas"

# Apt
alias Upd="doas apt update && apt list --upgradable"
alias Upg="doas apt upgrade"
alias Upp="Upd && Upg -y"
alias Upf="Upd && Upg -y && Poweroff"

## Other stuff
complete -cf doas
MAILCHECK=-1
