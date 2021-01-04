#!/usr/bin/env sh

#installing my favourite packages and utilities
install_pkgs(){
	sudo pacman -Syu - < $HOME/scripts/pacman-pkgs.txt
}

##################################################
#install those utilities that aren't on ARCH repos
##################################################

#get the aur-packages
install_aur_pkg(){
	yay -S - < $HOME/scripts/aur-pkgs.txt
}

#get my version of dmenu
install_dmenu(){
	echo "Cloning dmenu-plusplus from github" && \
	git clone https://github.com/BenGH28/dmenu-plusplus.git ~/.config/dmenu/ && \
	cd ~/.config/dmenu && \
	sudo make clean install && \
	cd
}

# install rustup to gain access to cargo 
install_rust(){
	echo "Installing rust" && \
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

# installing commandline to for changing your alacritty theme
install_alacritty_theme(){
	echo "Installing alacritty-theme from cargo" && \
	~/.cargo/bin/cargo install alacritty-theme
}

#vim-plugged for vim
install_vim_plug(){
	echo "Use vim-plug for vim or nvim? (enter vim or nvim)"
	read editor
	case $editor in
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
}

#Oh-my-zsh
install_OhMyZSH(){
	echo "Installing Oh-My-ZSH"
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
	git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions && \
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

install_pkgs
install_aur_pkg
install_dmenu
install_rust
install_alacritty_theme
install_vim_plug
install_OhMyZSH

