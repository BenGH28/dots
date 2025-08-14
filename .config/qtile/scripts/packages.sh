run() {
    kitty --class=float-term sh -c "$@"
}
install() {
    run 'paru -Slq | fzf -m --preview "paru -Si {+}" --bind "enter:execute(paru -S {+})"'
}
remove() {
    run 'paru -Q | fzf -m --preview "paru -Qi {1}" --bind "enter:execute(paru -R {+})"'
}
update() {
    run 'paru -Syu'
}

declare -A commands
commands=(
    ["💾 Install"]=install
    ["🗑 Remove"]=remove
    ["💫 Update"]=update
)

sorted_keys=$(for key in "${!commands[@]}"; do
    echo -e "$key\t${commands[$key]}"
done | sort -k2,2 | cut -f1)
len=${#commands[@]}
selected_command=$(printf "%s\n" "${sorted_keys[@]}" | rofi -theme-str 'window {width: 400px;}' -case-smart -dmenu -p "Menu" -l "$len")
if [ -n "$selected_command" ]; then
    ${commands[$selected_command]}
fi
