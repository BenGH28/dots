

## Install

Get [yadm](https://github.com/TheLocehiliosan/yadm) a git wrapper that handles your dotfiles nicely

```sh
yadm clone https://github.com/BenGH28/dots

#install packages related to the dotfiles
cd scripts/
#note this is for arch-based distros
./install_packages.sh
```

## Preview

![Qtile Layout](https://github.com/BenGH28/dots/blob/master/.screenshots/qconf_conf1.png)
![Qtile OneDark](https://github.com/BenGH28/dots/blob/master/.screenshots/qtile_OneDarkTheme.png)

## Themile: theming qtile and bit more ...

Themile is a small script that will change the theme of 3 things:

- qtile
- gtk3
- alacritty (be sure to `cargo install alacritty-theme` for this to work)

Themile will change the theme of qtile by default but you can set options in the commandline to toggle
gtk, alacritty or both.

```sh
#only qtile is themed
themile light

#toggle qtile, alacritty and gtk to light theme
themile -a light

#toggle alacritty and qtile to dark theme
themile -t dark

#toggle gtk3 and qtile to light theme
themile -g light
```
