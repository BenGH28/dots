

## Install

```sh
alias dots="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
git clone --bare https://github.com/BenGH28/dots ~/.dotfiles
dots checkout

#install packages related to the dotfiles
cd scripts/
#note this is for arch-based distros
./install_packages.sh
```
For more information about managing dotfiles with git checkout this Atlassian [tutorial](https://www.atlassian.com/git/tutorials/dotfiles)

Download all the software related to this repos:
```sh
```

## Qtile Scrots

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
