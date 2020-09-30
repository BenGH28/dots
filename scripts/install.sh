#!/usr/bin/env sh

#installing my favourite packages and utilities
sudo pacman -Syu nvim alacritty i3 i3-gaps picom rofi ttf-hack ttf-font-awesome i3exit lxappearance nitrogen nodejs yay qtile

#only found in the aur
yay -S nerd-fonts-jetbrains-mono

##################################################
#install those utilities that aren't on ARCH repos
##################################################

# install rustup to gain access to cargo 
echo "Installing rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# installing commandline to for changing your alacritty theme
echo "Installing alacritty-theme from cargo"
~/.cargo/bin/cargo install alacritty-theme

#Oh-my-zsh
echo "Installing ZSH"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#vim-plugged for vim
case $1 in
	vim)echo "Installing vim-plug for vim"
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	;;
	nvim) echo "Installing vim-plug for neovim"
		sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    ;;
	*) echo "vim-plug not installed"
	;;
esac
