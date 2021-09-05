#!/usr/bin/env sh

#installing my favourite packages and utilities
install_pkgs() {
    echo "installing pacman packages"
    sudo pacman -Syu --noconfirm --needed - <~/scripts/pacman-pkgs.txt
}

##################################################
#install those utilities that aren't on ARCH repos
##################################################

#get the aur-packages
install_aur_pkg() {
    echo "installing aur packages"
    yay -S <~/scripts/aur-pkgs.txt
}

#get my version of dmenu
install_dmenu() {
    echo "Cloning dmenu-plusplus from github"
    git clone https://github.com/BenGH28/dmenu-plusplus.git ~/.config/dmenu/
    cd ~/.config/dmenu
    sudo make clean install
    cd
}

# install rustup to gain access to cargo
install_rust() {
    echo "Installing rust" && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

# installing commandline to for changing your alacritty theme
install_alacritty_theme() {
    echo "Installing alacritty-theme from cargo" && ~/.cargo/bin/cargo install alacritty-theme
}

install_starship_prompt() {
    echo "installing starship..." && curl -fsSL https://starship.rs/install.sh | bash
}

install_pkgs
install_aur_pkg
install_dmenu
install_rust
install_alacritty_theme
install_starship_prompt

echo "backing up your .zprofile and linking $HOME/.config/zsh/profile to .zprofile" &&
    ln -bfs $HOME/.config/zsh/profile $HOME/.zprofile
