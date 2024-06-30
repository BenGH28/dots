#!/usr/bin/env sh

#installing my favourite packages and utilities
install_pkgs() {
    echo "installing pacman packages"
    sudo pacman -Syu --noconfirm --needed - <./pacman-pkgs.txt
}

##################################################
#install those utilities that aren't on ARCH repos
##################################################

#get the aur-packages
install_aur_pkg() {
    echo "installing paru..."
    git clone https://aur.archlinux.org/paru.git
    cd paru || return
    makepkg -si
    echo "installing aur packages"
    paru -S - <./aur-pkgs.txt
}

# install rustup to gain access to cargo
install_rust() {
    echo "Installing rust" && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

install_psutil() {
    echo "installing psutil for Qtile..." && pip install psutil
}

install_tpm() {
    echo "installing Tmux Plugin Manager..." \
        && git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
}

install_nvim() {
    echo "installing my nvim config..." \
        && curl https://raw.githubusercontent.com/BenGH28/nvim/main/bootstrap.sh | sh
}

setup_xbacklight() {
    echo "adding '$USER' to the video group..." \
        && sudo usermod -a -G video "$USER" \
        && echo "setup acpibacklight..." \
        && sudo cp backlight.rules /etc/udev/rules.d/90-backlight.rules
}

change_shell() {
    # see if zsh is installed and if so then change to zsh
    if command -v zsh 2>/dev/null; then
        echo "zsh is installed"
    else
        echo "zsh is not installed"
        return
    fi

    echo "changing shell to zsh..." && chsh -s /bin/zsh || return

}

install_snaps() {
    sudo systemctl enable snapd \
        && sudo systemctl start start snapd \
        && sudo snap install spotify discord accountable2you
}

main() {
    install_pkgs
    install_aur_pkg
    install_snaps
    install_rust
    install_tpm
    install_psutil
    install_nvim
    setup_xbacklight
    change_shell
}

main
