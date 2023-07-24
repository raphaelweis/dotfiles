#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# to correctly kill x session
export XSESSION_PID="$$"

xrandr -o 0 -s 1920x1080 -r 60

feh $HOME/.config/wallpapers/panda.jpg --bg-fill --no-fehbg &
sxhkd &
dunst &
#dropbox &
#xremap $XDG_CONFIG_HOME/xremap/config.yml &
dwmblocks &
exec startdwm
