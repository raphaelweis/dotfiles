#!/bin/bash

sudo apt remove gnome-shell-extension-ubuntu-dock

gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 9
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.shell.extensions.desktop-icons show-home false

dconf write /org/gnome/desktop/interface/color-scheme \'prefer-dark\'

for i in {1..9}; do
	gsettings set org.gnome.shell.keybindings switch-to-application-${i} '[]'
	gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-${i}" "['<Super>${i}']"
	gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-${i}" "['<Super><Shift>${i}']"
done
