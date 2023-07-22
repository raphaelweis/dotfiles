#!/bin/bash

if [ ! -d "./setup" ]; then
    mkdir ./setup
    git clone https://github.com/raphaelweis/alacritty.git
    git clone https://github.com/raphaelweis/dmenu.git
    git clone https://github.com/raphaelweis/dunst.git
    git clone https://github.com/raphaelweis/dwm.git
    git clone https://github.com/raphaelweis/dwmblocks.git
    git clone https://github.com/raphaelweis/nvchad.git
    git clone https://github.com/raphaelweis/st.git
    git clone https://github.com/raphaelweis/sxhkd.git
    git clone https://github.com/raphaelweis/tmux.git
    git clone https://github.com/raphaelweis/wallpapers.git
    git clone https://github.com/raphaelweis/xorg.conf.d.git
    git clone https://github.com/raphaelweis/xremap.git
    git clone https://github.com/raphaelweis/xremap.git
    git clone https://github.com/raphaelweis/zsh.git
fi

stow -d ./setup alacritty -t ~/.config
stow -d ./setup dunst -t ~/.config
stow -d ./setup nvchad -t ~/.config
stow -d ./setup sxhkd -t ~/.config
stow -d ./setup tmux -t ~/.config
stow -d ./setup xremap -t ~/.config
stow -d ./setup zsh -t ~/.config

stow -d ./setup wallpapers -t ~/.local

sudo stow -d ./setup xorg.conf.d -t /etc/X11

# stow -d config -t $HOME home
# stow -d config -t $HOME/.config/shell shell
# stow -d config -t $HOME/.config/git git
