#!/usr/bin/env sh

   #installing my favourite packages and utilities
install_pkgs(){
    echo "installing pacman packages"
	sudo pacman -Syu --noconfirm --needed - < $HOME/scripts/pacman-pkgs.txt
}

##################################################
#install those utilities that aren't on ARCH repos
##################################################

#get the aur-packages
install_aur_pkg(){
    echo "installing aur packages"
    yay - < $HOME/scripts/aur-pkgs.txt
}

#get my version of dmenu
install_dmenu(){
	echo "Cloning dmenu-plusplus from github"
	git clone https://github.com/BenGH28/dmenu-plusplus.git ~/.config/dmenu/
	cd ~/.config/dmenu
	sudo make clean install
	cd
}

# install rustup to gain access to cargo
install_rust(){
	echo "Installing rust" && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

# installing commandline to for changing your alacritty theme
install_alacritty_theme(){
	echo "Installing alacritty-theme from cargo" &&  ~/.cargo/bin/cargo install alacritty-theme
}

install_starship_prompt(){
    echo "installing starship..." && curl -fsSL https://starship.rs/install.sh | bash
}

install_pkgs
install_aur_pkg
install_dmenu
install_rust
install_alacritty_theme
install_starship_prompt

# link the appropriate scripts in the appropriate places
echo "linking your scripts to your PATH (~/.local/bin)"
dir=$HOME/.local/bin
check_if_in_path(){
	result=$(echo $PATH | grep $dir)
	case $result in
		"") echo "$dir is not in your \$PATH please add it to \$PATH"
			exit
			;;
		$PATH) echo "$dir is in \$PATH"
			;;
		*) echo "uh-oh";;
	esac
}

linking_to_path(){
	echo "placing themile in your PATH"
	if [ -d $dir ]; then
		ln -s ~/scripts/themile ~/.local/bin/
	else
		echo "$dir does not exist! Making it now!"
		mkdir -p $HOME/.local/bin/
		ln -s ~/scripts/themile ~/.local/bin/
	fi
	echo "linking complete!"
}

check_if_in_path

linking_to_path

echo "backing up your .profile and linking $HOME/.config/zsh/profile to .profile" && \
    ln -bfs $HOME/.config/zsh/profile $HOME/.profile

