from typing import List

from libqtile.config import Key
from libqtile.lazy import lazy

from constants import ALT, CTRL, MOD, TERM


def get_keys() -> List[Key]:
    """Returns a list of Key bindings"""
    my_keys = [
        # Switch between windows in current stack pane
        Key([MOD], "j", lazy.layout.down()),
        Key([MOD], "k", lazy.layout.up()),
        # Move windows up or down in current stack
        Key([MOD, "shift"], "j", lazy.layout.shuffle_down()),
        Key([MOD, "shift"], "k", lazy.layout.shuffle_up()),
        # change window size
        Key([MOD], "h", lazy.layout.grow()),
        Key([MOD], "l", lazy.layout.shrink()),
        # Toggle floating
        Key([MOD], "n", lazy.window.toggle_floating()),
        Key([MOD, "shift"], "m", lazy.window.toggle_fullscreen()),
        # Switch window focus to other pane(s) of stack
        Key([MOD], "space", lazy.layout.next()),
        # Toggle between different layouts as defined below
        Key([MOD], "Tab", lazy.next_layout()),
        # Close Windows
        Key([MOD], "q", lazy.window.kill()),
        # Restart and Shutdown Qtile
        Key([MOD, "shift"], "r", lazy.restart()),
        Key([MOD, "shift"], "q", lazy.shutdown()),
        # Screen focus
        Key([ALT], "h", lazy.to_screen(0)),
        Key([ALT], "l", lazy.to_screen(1)),
        # screen brightness
        Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 10")),
        Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 10")),
        # Audio Control
        Key(
            [],
            "XF86AudioRaiseVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +10%"),
        ),
        Key(
            [],
            "XF86AudioLowerVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10%"),
        ),
        Key(
            [], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")
        ),
        Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
        Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
        Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
        # Key bindings for applications
        Key([MOD], "Return", lazy.spawn(f"{TERM}")),
        Key([MOD], "w", lazy.spawn("firefox")),
        Key(
            [CTRL],
            "space",
            lazy.spawn('rofi -show combi -modes combi -combi-modes "window,drun"'),
        ),
        # Key([CTRL], "space", lazy.spawn("dmenu_run -h 30")),
        Key([MOD], "m", lazy.spawn("spotify")),
        Key([MOD], "f", lazy.spawn("pcmanfm")),
        Key([MOD], "z", lazy.spawn(f"{TERM} -e nvim /home/ben/.zshrc")),
        Key(
            [MOD], "F3", lazy.spawn(f"{TERM} -e nvim /home/ben/.config/qtile/config.py")
        ),
        Key([MOD, "shift"], "l", lazy.spawn("slock")),
        Key([MOD], "p", lazy.spawn("/home/ben/scripts/power.sh")),
        Key([MOD, "shift"], "b", lazy.spawn("/home/ben/scripts/bluetooth.sh")),
        Key([MOD, "shift"], "v", lazy.spawn("/opt/cisco/anyconnect/bin/vpnui")),
    ]
    return my_keys
