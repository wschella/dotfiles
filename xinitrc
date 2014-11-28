#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
xrdb ~/.Xresources
xset +fp ~/.fonts
xset +fb /usr/share/fonts/local
xset fp rehash
hsetroot -tile /home/wout/.config/fossilized.jpg

unclutter -grab -noevents -root &
urxvtd &
xterm
sxhkd &
exec bspwm
