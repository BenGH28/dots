run() {
    kitty -o initial_window_width=80c -o initial_window_height=40c --class=float-term sh -c "$@"
}
