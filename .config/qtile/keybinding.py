from typing import List
from libqtile.config import Key
from libqtile import extension
from libqtile.lazy import lazy
from constants import MOD, ALT, TERM


def GetKeys() -> List[Key]:
    """Returns a list of Key bindings"""
    keys = [
        # Switch between windows in current stack pane
        Key([MOD], "j",
            lazy.layout.down()),
        Key([MOD], "k",
            lazy.layout.up()),

        # Move windows up or down in current stack
        Key([MOD, "control"], "j",
            lazy.layout.shuffle_down()),
        Key([MOD, "control"], "k",
            lazy.layout.shuffle_up()),

        # change window size
        Key([MOD], "h",
            lazy.layout.grow()),
        Key([MOD], "l",
            lazy.layout.shrink()),

        # Toggle floating
        Key([MOD], "n", lazy.window.toggle_floating()),

        # Switch window focus to other pane(s) of stack
        Key([MOD], "space",
            lazy.layout.next()),

        # Toggle between different layouts as defined below
        Key([MOD], "Tab",
            lazy.next_layout()),

        # Close Windows
        Key([MOD], "q",
            lazy.window.kill()),

        # Restart and Shutdown Qtile
        Key([MOD, "shift"], "r",
            lazy.restart()),
        Key([MOD, "shift"], "q",
            lazy.shutdown()),

        # Screen focus
        Key([ALT], "h",
            lazy.to_screen(0)),
        Key([ALT], "l",
            lazy.to_screen(1)),

        # screen brightness
        Key([], "XF86MonBrightnessUp",
            lazy.spawn("xbacklight -inc 10")),
        Key([], "XF86MonBrightnessDown",
            lazy.spawn("xbacklight -dec 10")),

        # Audio Control
        Key([], "XF86AudioRaiseVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +10%")),
        Key([], "XF86AudioLowerVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10%")),
        Key([], "XF86AudioMute",
            lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
        Key([], "XF86AudioPlay",
            lazy.spawn("playerctl play-pause")),
        Key([], "XF86AudioNext",
            lazy.spawn("playerctl next")),
        Key([], "XF86AudioPrev",
            lazy.spawn("playerctl previous")),

        # Key bindings for applications
        Key([MOD], "Return",
            lazy.spawn(TERM)),
        Key([MOD], "w",
            lazy.spawn("firefox")),
        Key([MOD], "d",
            lazy.spawn("rofi -show run")),
        Key([ALT], "Tab",
            lazy.spawn("rofi -show window")),
        Key([MOD], "m",
            lazy.spawn("com.spotify.Client")),
        Key([MOD], "f",
            lazy.spawn("thunar")),
        Key([MOD, "shift"], "f",
            lazy.spawn(f"{TERM} -e ranger")),
        Key([MOD], "z",
            lazy.spawn(f"{TERM} -e nvim /home/ben/.zshrc")),
        Key([MOD], "F3",
            lazy.spawn(f"{TERM} -e nvim /home/ben/.config/qtile/config.py")),
        Key([MOD], "F1",
            lazy.spawn("sgtk-menu -f -a")),
        Key([MOD], 'r', lazy.run_extension(extension.DmenuRun(
            dmenu_prompt=">",
            dmenu_font="Andika-8",
            background="#15181a",
            foreground="#00ff00",
            selected_background="#079822",
            selected_foreground="#fff",
            dmenu_height=24,  # Only supported by some dmenu forks
        ))),
    ]
    return keys
