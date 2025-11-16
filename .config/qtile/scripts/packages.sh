run() {
    kitty -o initial_window_width=80c -o initial_window_height=40c --class=float-term sh -c "$@"
}
fzf_preview_window="--preview-window=up,50%"
install_arch() {
    run "pacman -Slq | fzf -m '$fzf_preview_window' --preview 'pacman -Si {+}' --bind 'enter:execute(pacman -S {+})'"
}

install_aur() {
    run "paru -Slq | fzf -m '$fzf_preview_window' --preview 'paru -Si {+}' --bind 'enter:execute(paru -S {+})'"
}
remove() {
    run "pacman -Q | fzf -m '$fzf_preview_window' --preview 'pacman -Qi {1}' --bind 'enter:execute(pacman -R {+})'"
}
update() {
    run "sudo pacman -Syu"
}

declare -A commands
commands=(
    ["󰆓  Install - Arch"]=install_arch
    ["󰆓  Install - AUR"]=install_aur
    ["  Remove"]=remove
    ["󰚰  Update"]=update
)

sorted_keys=$(for key in "${!commands[@]}"; do
    echo -e "$key\t${commands[$key]}"
done | sort -k2,2 | cut -f1)
len=${#commands[@]}
selected_command=$(printf "%s\n" "${sorted_keys[@]}" | rofi -theme-str 'window {width: 400px;}' -case-smart -dmenu -p "Menu" -l "$len")
if [ -n "$selected_command" ]; then
    ${commands[$selected_command]}
fi
