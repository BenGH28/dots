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
    yay -S - <~/scripts/aur-pkgs.txt
}

# install rustup to gain access to cargo
install_rust() {
    echo "Installing rust" && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

install_starship_prompt() {
    echo "installing starship..." && curl -fsSL https://starship.rs/install.sh | bash
}

install_tpm() {
    echo "installing Tmux Plugin Manager..." && git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
}

install_nvim() {
    echo "installing my nvim config..." && curl https://raw.githubusercontent.com/BenGH28/nvim/main/bootstrap.sh | sh
}

change_shell() {
    echo "changing shell to zsh..." && chsh -s /bin/zsh
}

install_pkgs
install_aur_pkg
install_rust
install_starship_prompt
install_tpm
install_nvim
change_shell
