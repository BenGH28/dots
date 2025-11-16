#!/usr/bin/env bash

CONFIG_DIR=$HOME/.config
NVIM_DIR=$HOME/.config/nvim
KITTY_DIR=$CONFIG_DIR/kitty
QTILE_DIR=$CONFIG_DIR/qtile
STYLE_DIR="$QTILE_DIR/style"

ROFI_DIR=$CONFIG_DIR/rofi

CONSTS="$QTILE_DIR/constants.py"

CURRENT_THEME=$(grep -e "^PALETTE = .*" "$CONSTS" | awk '{print $3}' | tr '[:upper:]' '[:lower:]' | tr '[=_=]' ' ')

go_qtile() {
    local theme="$1"
    qtile_theme="$(echo "$theme" | tr '[:lower:]' '[:upper:]' | tr '[= =]' '_')"
    sed -i "s/^PALETTE = .*/PALETTE = $qtile_theme/" "$CONSTS"
    qtile cmd-obj -o cmd -f restart
}

go_kitty() {
    local theme="$1"
    kitty_theme="${theme// /_}"
    ln -sf "$STYLE_DIR/$kitty_theme/kitty.conf" "$KITTY_DIR/theme.conf"
    for sock in /tmp/kitty-*; do
        [ -S "$sock" ] || continue
        kitty @ --to "unix:$sock" set-colors -a "$KITTY_DIR/theme.conf"
    done
}

go_rofi() {
    local theme="$1"
    rofi_theme="${theme// /_}"
    ln -sf "$QTILE_DIR/style/$rofi_theme/rofi.rasi" "$ROFI_DIR/theme.rasi"
}

go_nvim() {
    local theme_file=$NVIM_DIR/lua/plugins/theme.lua

    local theme="$1"
    theme="${theme// /_}"
    cat "$STYLE_DIR/$theme/nvim.lua" >"$theme_file"

    # make any instances of nvim update colorscheme
    # for sock in /run/user/1000/nvim.*; do
    #     [ -S "$sock" ] || continue
    #     nvim --server "$sock" --remote-send ": CR>"
    # done
}

main() {
    themes=$(find "$STYLE_DIR" -type d ! -path "$STYLE_DIR" | awk -v base="$STYLE_DIR/" '{sub(base, ""); print $1}' | tr '[:upper:]' '[:lower:]' | tr '[=_=]' ' ' | sort -u)
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
