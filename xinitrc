#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
# . /etc/X11/Xsession

# setxkbmap -option ctrl:swapcaps
xrandr --output eDP-1 --off
xrandr --rate 120
xset r rate 240 45
setxkbmap -model pc104 -layout us,ru -variant ,, -option grp:toggle &

exec dbus-run-session i3
