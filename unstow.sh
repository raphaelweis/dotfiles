#!/bin/bash

if [ ! -d "./setup" ]; then
    mkdir ./setup
    git clone https://github.com/raphaelweis/alacritty.git ./setup/alacritty
    git clone https://github.com/raphaelweis/dmenu.git ./setup/dmenu
    git clone https://github.com/raphaelweis/dunst.git ./setup/dunst
    git clone https://github.com/raphaelweis/dwm.git ./setup/dwm
    git clone https://github.com/raphaelweis/dwmblocks.git ./setup/dwmblocks
    git clone https://github.com/raphaelweis/nvchad.git ./setup/nvchad
    git clone https://github.com/raphaelweis/st.git ./setup/git
    git clone https://github.com/raphaelweis/sxhkd.git ./setup/sxhkd
    git clone https://github.com/raphaelweis/tmux.git ./setup/tmux
    git clone https://github.com/raphaelweis/wallpapers.git ./setup/wallpapers
    git clone https://github.com/raphaelweis/xorg.conf.d.git ./setup/xorg.conf.d
    git clone https://github.com/raphaelweis/xremap.git ./setup/xremap
    git clone https://github.com/raphaelweis/zsh.git ./setup/zsh
fi

# distro agnostic config files
stow -D -d ./setup alacritty -t ~/.config
stow -D -d ./setup dunst -t ~/.config
stow -D -d ./setup nvchad -t ~/.config
stow -D -d ./setup sxhkd -t ~/.config
stow -D -d ./setup tmux -t ~/.config
stow -D -d ./setup xremap -t ~/.config
stow -D -d ./setup zsh -t ~/.config

stow -D -d ./setup wallpapers -t ~/.local

sudo stow -D -d ./setup xorg.conf.d -t /etc/X11

# distro specific config files
stow -D -d ./config .local -t $XDG_DATA_HOME
stow -D -d ./config .config -t $XDG_CONFIG_HOME
stow -D -d ./config .home -t $HOME
