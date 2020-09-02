"""
Ben Hunt's Qtile Config
"""
import os
import subprocess
from typing import List  # noqa: F401
from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.lazy import lazy
from libqtile import layout, bar, widget, hook


MOD = "mod4"
ALT = "mod1"
TERM = "alacritty"


@hook.subscribe.startup_once
def start_once():
    """ Startup Applications """
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call([home])


# KEY BINDINGS
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
]

# groups = [Group(i) for i in "123456789"]

groups = [
        Group(name="1", label="1:  "),
        Group(name="2", label="2: "),
        Group(name="3", label="3: "),
        Group(name="4", label="4: "),
        Group(name="5", label="5: "),
        ]

for i in groups:
    keys.extend(
        [
            # MOD4 + letter of group = switch to group
            Key([MOD], i.name,
                lazy.group[i.name].toscreen()),
            # MOD4 + shift + num of group = switch and move window to group
            Key([MOD, "shift"], i.name,
                lazy.window.togroup(i.name, switch_group=True)),
        ]
    )

colours = {
    "foreground": "282A36",
    "background": "ffffff",
    "inactive": "d8d8d2",
    "blue": "61afe0",
    "green": "98d379",
}
layout_theme = {
    "border_width": 4,
    "margin": 10,
    "border_focus": colours["blue"],
    "border_normal": colours["background"]
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(),
]

widget_defaults = dict(font="JetBrainsMono Nerd Font", fontsize=18, padding=5,)
extension_defaults = widget_defaults.copy()


def initMyWidgets():
    myWidgets = [
        widget.GroupBox(
            this_current_screen_border=colours["blue"],
            active=colours["foreground"],
            inactive=colours["inactive"]),
        widget.WindowName(foreground=colours["foreground"]),
        widget.Image(
            filename="~/.config/qtile/BlueEnd.png",
            margin=0,
            ),
        widget.CPU(
            foreground=colours["foreground"],
            background=colours["blue"],
            mouse_callbacks={"Button1": lambda qtile: qtile.cmd_spawn(f"{TERM} -e htop")}
            ),
        widget.Image(
            filename="~/.config/qtile/BlueGreen.png",
            margin=0,
            ),
        widget.Memory(
            foreground=colours["foreground"],
            background=colours["green"],
            mouse_callbacks={"Button1": lambda qtile: qtile.cmd_spawn(f"{TERM} -e htop")}
            ),
        widget.Image(
            filename="~/.config/qtile/GreenBlue.png",
            margin=0,
            ),
        widget.AGroupBox(
            foreground=colours["foreground"],
            background=colours["blue"],
            borderwidth=0,
            ),
        widget.Image(
            filename="~/.config/qtile/BlueGreen.png",
            margin=0,
            ),
        widget.CurrentLayout(
            foreground=colours["foreground"],
            background=colours["green"],
            ),
        widget.Image(
            filename="~/.config/qtile/GreenBlue.png",
            margin=0,
            ),
        widget.Pacman(
            foreground=colours["foreground"],
            background=colours["blue"],
            execute="sudo pacman -Sy",
            mouse_callbacks={"Button1": lambda qtile: qtile.cmd_spawn(f"{TERM} -e sudo pacman -Syu")},
            fmt=" {}"
            ),
        widget.Image(
            filename="~/.config/qtile/BlueGreen.png",
            margin=0,
            ),
        widget.Volume(
            foreground=colours["foreground"],
            background=colours["green"],
            fmt="{}",
            ),
        widget.Image(
            filename="~/.config/qtile/GreenBlue.png",
            margin=0,
            ),
        widget.Backlight(
            foreground=colours["foreground"],
            background=colours["blue"],
            backlight_name="intel_backlight",
            brightness_file="/sys/class/backlight/intel_backlight/brightness",
            fmt=" {}",
            ),
        widget.Image(
            filename="~/.config/qtile/BlueGreen.png",
            margin=0,
            ),
        widget.Battery(
            foreground=colours["foreground"],
            background=colours["green"],
            charge_char="",
            discharge_char="",
            full_char="",
            format="{char} {percent:2.0%}",
        ),
        widget.Image(
            filename="~/.config/qtile/GreenBlue.png",
            margin=0,
            ),
        widget.Clock(
            foreground=colours["foreground"],
            background=colours["blue"],
            format="%D %H:%M"
            ),
        widget.Systray(
            background=colours["blue"],
            ),
    ]
    return myWidgets


widgets1 = initMyWidgets()
widgets2 = initMyWidgets()
opaque = 0.8
bar_size = 30
# My Screens: I have 2 monitors so add as many screens as monitors
screens = [
    Screen(top=bar.Bar(
        widgets1,
        size=bar_size,
        opacity=opaque,
        background=colours["background"],
        foreground=colours["foreground"],)),
    Screen(top=bar.Bar(
        widgets2,
        size=bar_size,
        opacity=opaque,
        background=colours["background"],
        foreground=colours["foreground"],)),
]

# Drag floating layouts
mouse = [
    Drag(
        [MOD],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [MOD],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size()
    ),
    Click([MOD], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of X client.
        {"wmclass": "confirm"},
        {"wmclass": "dialog"},
        {"wmclass": "download"},
        {"wmclass": "error"},
        {"wmclass": "file_progress"},
        {"wmclass": "notification"},
        {"wmclass": "splash"},
        {"wmclass": "toolbar"},
        {"wmclass": "confirmreset"},  # gitk
        {"wmclass": "makebranch"},  # gitk
        {"wmclass": "maketag"},  # gitk
        {"wname": "branchdialog"},  # gitk
        {"wname": "pinentry"},  # GPG key password entry
        {"wmclass": "ssh-askpass"},  # ssh-askpass
    ], **layout_theme
)
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
