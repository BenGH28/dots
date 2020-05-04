#!/usr/bin/env sh

#installing my favourite packages and utilities
sudo pacman -Syu gvim alacritty i3 i3-gaps picom rofi ttf-font-awesome i3exit lxappearance nitrogen

#install those utilities that aren't on ARCH repos
#Oh-my-zsh
 sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#vim-plugged for vim
 curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
