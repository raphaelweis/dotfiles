# ArchLinux dotfiles
My ArchLinux dotfiles (I use Arch, btw)

# Programs table

## Notable configuration steps

### Setting the gtk theme

If the theme is available in the AUR, install it from there, and then apply it with [nwg-look](https://github.com/nwg-piotr/nwg-look).
Otherwise, follow these steps:

The gtk theme has to be set separately for gtk3 and gtk4 applications.

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

### Installing nvm

Nvm is the easiest way to manage a nodejs installation, and it also allows us to use npm for global packages
without encountering permission errors.
Assuming that the source command is already in the shell configuration file, the one liner to install is:
```
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash'
```
We simply set PROFILE to `/dev/null` to prevent nvm from adding additional lines in a random config file.
Source your shell configuration, you can now install the latest node and npm with:
```
nvm install node && nvm use node
```

### Sddm

On arch, we can install either `sddm` or `sddm-git`.
We can then simply enable sddm with systemctl:
```
systemctl enable sddm.service
```

Everything should now function correctly on next reboot.
For theming, there are a couple dependencies that are needed. For Arch we can install:
```
qt5-graphicaleffects qt5-svg qt5-quickcontrols2
```

We can then copy the theme folder into `/usr/share/sddm/themes`. Do not forget to edit 
`/etc/sddm.conf` and add/edit this line:
```
[Theme]
Current=SDDM_THEME
```
for example with catpuccin we can use `Current=catpuccin-mocha` (or any other flavor)
