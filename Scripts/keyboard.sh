#!/bin/sh

# setxkbmap -option ctrl:swapcaps
xset r rate 240 45
setxkbmap -model pc104 -layout us,ru -variant ,, -option grp:toggle
