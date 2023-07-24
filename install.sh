#!/bin/bash

# create the necessary home directories
#TODO

# install packages from both the official and user repositories
yay -S \
    alacritty \
    xorg \
    bat \
    bluetuith \
    bluez \
    bluez-utils \
    chromium \
    composer \
    cowsay \
    dropbox \
    dunst \
    feh \
    firefox \
    fzf \
    github-cli \
    google-chrome \
    jdk-openjdk \
    julia \
    lsd \
    luarocks \
    man-db \
    man-pages \
    mpv \
    nautilus \
    neofetch \
    neovim \
    ntfs-3g \
    obsidian \
    pamixer \
    pavucontrol \
    picom-git \
    pipewire \
    pipewire-alsa \
    pipewire-audio \
    pipewire-pulse \
    python \
    python-gpgme \
    python-pip \
    ripgrep \
    ruby \
    rust \
    spotify-launcher \
    starship \
    stow \
    sxhkd-git \
    tmux \
    ttf-jetbrains-mono-nerd \
    unzip \
    wget \
    wireplumber \
    xclip \
    xcolor \
    xorg \
    xorg-xinit \
    xremap-x11-bin \
    zoxide \
    zsh \

# nvm installation
if [ ! -d "$HOME/.config/nvm" ] && [ ! -d "$HOME/.nvm" ]; then
    PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash'
    # Source the nvm script to make it available in the current shell
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install node
    nvm use node
fi

# nvchad installation
if [ ! -d "$HOME/.config/nvim" ]; then
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && rm -r $HOME/.config/nvim/lua/custom
fi

# start systemd services
sudo systemctl enable --now bluetooth.service
systemctl --user enable --now pipewire.service
