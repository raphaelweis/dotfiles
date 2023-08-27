# ArchLinux dotfiles
My ArchLinux dotfiles (I use Arch, btw)

# Programs table

## Notable configuration steps

### Keyd

To set up keyd:
- Install it from the AUR
```
keyd
```
> Note: The following steps require root privileges

- Enable the systemctl service with:
```
systemctl enable keyd
```
- reload the config (if you need to) placed in `/etc/keyd/default.conf` with:
```
keyd reload
```

### Setting the GTK theme

If the theme is available in the AUR, install it from there, and then apply it with [nwg-look](https://github.com/nwg-piotr/nwg-look).
Otherwise, follow these steps:

The GTK theme has to be installed separately for gtk3 and gtk4 applications.

- For gtk3:
    copy your theme into the `~/.themes` directory. You may create the directory if it does exist.
    The files need to be copied, and not symlinked. The entire theme folder need to be copied.
    
    You can then use [nwg-look](https://github.com/nwg-piotr/nwg-look) to apply the theme.
    This should work on both wayland and X based environments.

- For gtk4:
    go into your theme folder, and copy the assets folder and any css files into `~/.config/gtk-4.0`
    These files can be symlinked without issue.

### Setting the mouse cursor and icons theme

If you can find the themes in the arch packages or the AUR, simply install them and use [nwg-look](https://github.com/nwg-piotr/nwg-look)
to apply them.

### Nvm

Nvm is the easiest way to manage a nodejs installation, and it also allows us to use npm for global packages
without encountering permission errors.
Assuming that the source command is already in the shell configuration file, the one liner to install is:
```
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash'
```
You simply set PROFILE to `/dev/null` to prevent nvm from adding additional lines in a random config file.
After sourcing your shell configuration, you can now install the latest node and npm with:
```
nvm install node && nvm use node
```

### Sddm

On arch, you can install either `sddm` or `sddm-git`.
To start using sddm, enable it with systemd:
```
systemctl enable sddm.service
```
Everything should now function correctly on next reboot.

For theming, there are a couple dependencies that are needed. For Arch you can install:
```
qt5-graphicaleffects qt5-svg qt5-quickcontrols2
```

You can then copy the theme folder into `/usr/share/sddm/themes`. Do not forget to create
`/etc/sddm.conf.d/theme.conf` (you can name the file whatever you want) and add these 2 lines:
```
[Theme]
Current=<YOUR_SDDM_THEME>
```
for example with catpuccin you can use `Current=catpuccin-mocha` (or any other flavor)

Depending on the theme, you might want to show a profile picture for the selected user.
For that, sddm will look for a png image named `.face.icon` located in `~`.
Additionaly, you need to grant sddm the correct access rights to this picture, which can
be done using these 2 commands, per the [Arch wiki](https://wiki.archlinux.org/title/SDDM#User_icon_(avatar))
```
setfacl -m u:sddm:x ~/
setfacl -m u:sddm:r ~/.face.icon
```
Do note that symlinking does not work for sddm configuration, the best approach is
probably to copy everything over instead.

When configuring or creating a theme, you may test your changes directly using:
```
sddm-greeter --test-mode --theme /usr/share/sddm/themes/<YOUR_SDDM_THEME>
```
This command will pop in a full screen sddm window using the theme you specified.
To exit, close the window with your window manager like you would for a normal window.
