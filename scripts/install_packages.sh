#!/usr/bin/env sh

# error out if anything goes wrong
set -e

message() {
    echo "***********************"
    echo "$@"
    echo "***********************"
}

##################################################
#install those utilities that aren't on ARCH repos
##################################################

install_paru() {
    message "installing paru..."
    git clone https://aur.archlinux.org/paru.git
    cd paru || return
    makepkg -si
}

install_system_pkgs() {
    message "installing packages"
    sudo paru -Syu --noconfirm --needed - <"$HOME/scripts/packages.txt"
}

# install rustup to gain access to cargo
install_rust() {
    message "Installing rust" && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
}

install_psutil() {
    message "installing psutil for Qtile..." && pip install psutil
}

install_tpm() {
    message "installing Tmux Plugin Manager..." &&
        git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
}

install_nvim() {
    message "installing my nvim config..." &&
        curl https://raw.githubusercontent.com/BenGH28/nvim/main/bootstrap.sh | sh
}

setup_xbacklight() {
    message "adding '$USER' to the video group..." &&
        sudo usermod -a -G video "$USER" &&
        message "setup acpibacklight..." &&
        sudo cp backlight.rules /etc/udev/rules.d/90-backlight.rules
}

change_shell() {
    # see if zsh is installed and if so then change to zsh
    if command -v zsh 2>/dev/null; then
        message "zsh is installed"
    else
        message "zsh is not installed"
        return
    fi

    message "changing shell to zsh..." && chsh -s /bin/zsh || return

}

install_snaps() {
    sudo systemctl enable snapd &&
        sudo systemctl start start snapd &&
        sudo snap install spotify discord accountable2you
}

main() {
    install_rust
    install_paru
    install_system_pkgs
    install_snaps
    install_tpm
    install_psutil
    install_nvim
    setup_xbacklight
    change_shell
}

main
