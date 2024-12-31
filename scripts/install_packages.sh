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
    if ! command -v paru 2>/dev/null; then
        install_rust
        install_paru
    fi
    message "installing packages"

    filename="$HOME/scripts/packages.txt"
    sudo pacman -S --noconfirm --needed $(comm -12 <(pacman -Slq | sort) <(sort $filename))
}

# install rustup to gain access to cargo
install_rust() {
    message "Installing rust" && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
}

install_nvim() {
    message "installing my nvim config..." &&
        curl https://raw.githubusercontent.com/BenGH28/nvim/main/bootstrap.sh | sh
}

setup_xbacklight() {
    message "adding '$USER' to the video group..." &&
        sudo usermod -a -G video "$USER" &&
        message "setup acpibacklight..." &&
        sudo cp /home/ben/scripts/backlight.rules /etc/udev/rules.d/90-backlight.rules
}

change_shell() {
    # see if zsh is installed and if so then change to zsh
    command -v zsh 2>/dev/null && message "changing shell to zsh..." && chsh -s /bin/zsh || message "zsh is not installed"
}

install_snaps() {
    sudo systemctl enable snapd &&
        sudo systemctl start start snapd &&
        sudo snap install spotify discord accountable2you || echo "can't enable snapd"
}

all() {
    install_system_pkgs
    install_snaps
    install_tpm
    install_nvim
    setup_xbacklight
    change_shell
}

main() {
    case "$1" in
    all) all ;;
    nvim) install_nvim ;;
    tpm) install_tpm ;;
    pkgs) install_system_pkgs ;;
    *) all ;;
    esac
}

main $@
