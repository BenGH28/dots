#!/usr/bin/env bash

CONFIG_DIR=$HOME/.config
NVIM_DIR=$HOME/.config/nvim
KITTY_DIR=$CONFIG_DIR/kitty
QTILE_DIR=$CONFIG_DIR/qtile

ROFI_DIR=$CONFIG_DIR/rofi

CONSTS="$QTILE_DIR/constants.py"
COLOURS="$QTILE_DIR/colours.py"

CURRENT_THEME=$(grep -e "^PALETTE = .*" "$CONSTS" | awk '{print $3}' | tr '[:upper:]' '[:lower:]' | tr '[=_=]' ' ')

go_qtile() {
    theme="$1"
    qtile_theme="$(echo "$theme" | tr '[:lower:]' '[:upper:]' | tr '[= =]' '_')"
    sed -i "s/^PALETTE = .*/PALETTE = $qtile_theme/" "$CONSTS"
    qtile cmd-obj -o cmd -f restart
}

go_kitty() {
    theme="$1"
    kitty_theme="${theme// /}"
    ln -sf "$KITTY_DIR/themes/$kitty_theme.conf" "$KITTY_DIR/theme.conf"
    for sock in /tmp/kitty-*; do
        [ -S "$sock" ] || continue
        kitty @ --to "unix:$sock" set-colors -a "$KITTY_DIR/theme.conf"
    done
}

go_rofi() {
    theme="$1"
    rofi_theme="${theme// /-}"
    ln -sf "$ROFI_DIR/themes/$rofi_theme.rasi" "$ROFI_DIR/theme.rasi"
}

go_nvim() {
    theme="$1"
    nvim_theme="${theme// /-}"
    case "$theme" in
    *gruvbox*) nvim_theme="gruvbox" ;;
    "material ocean") nvim_theme="material-oceanic" ;;
    palenight) nvim_theme=palenightfall ;;
    "one dark") nvim_theme=onedark ;;
    "tokyo night") nvim_theme=tokyonight ;;
    *) ;;
    esac

    echo "vim.cmd.colorscheme('$nvim_theme')" >"$NVIM_DIR/lua/theme.lua"

    # make any instances of nvim update colorscheme
    for sock in /run/user/1000/nvim.*; do
        [ -S "$sock" ] || continue
        nvim --server "$sock" --remote-send ":source $NVIM_DIR/lua/theme.lua<CR>"
    done
}

main() {
    themes=$(grep -e '^[A-Z].* ' "$COLOURS" | awk '{print $1}' | tr '[:upper:]' '[:lower:]' | tr '[=_=]' ' ' | sort -u)
    len=$(echo "$themes" | wc -l)
    selected_theme=$(echo "$themes" | rofi -dmenu -p "Theme ($CURRENT_THEME)" -l "$len")
    if [ -z "$selected_theme" ]; then
        exit 0
    fi
    go_qtile "$selected_theme"
    go_rofi "$selected_theme"
    go_kitty "$selected_theme"
    go_nvim "$selected_theme"
    notify-send "Theme changed to '$selected_theme...'"
}

main
