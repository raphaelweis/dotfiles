#!/bin/bash

#sudo stow -d config -t /etc/ xorg.conf.d

stow -d config -t $HOME home
stow -d config -t $HOME/.config/shell shell
stow -d config -t $HOME/.config/git git
