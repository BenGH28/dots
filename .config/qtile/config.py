"""
Ben Hunt's Qtile Config
"""
import os
import subprocess
from typing import List  # noqa: F401

from libqtile import bar, hook, layout
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

import keybinding
import themes
import widgets
from constants import BAR_SIZE, MOD, OPAQUE

# import logging
# logging.basicConfig(filename='/home/ben/.config/qtile/config.log',
#                     encoding='utf-8', level=logging.DEBUG)

# True for dark theme in bar, False for light
IS_DARK = True
# True for POWERLINE-esque bar
POWERLINE = True


@hook.subscribe.startup_once
def start_once() -> None:
    """Startup Applications"""
    autostart = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call([autostart])


@hook.subscribe.client_managed
def move_to_group(window) -> None:
    """When that app opens we immediately switch to that group"""
    my_windows = ['Spotify', 'firefox', 'discord', 'qutebrowser']
    if window.window.get_wm_class()[1] in my_windows:
        window.group.cmd_toscreen()


# KEY BINDINGS
keys = keybinding.get_keys()

# Groups
groups = [
    Group(name="1", label=""),
    Group(name="2", label="", matches=[
          Match(wm_class=['firefox']), Match(wm_class=['qutebrowser'])]),
    Group(name="3", label="", matches=[Match(wm_class=['spotify'])]),
    Group(name="4", label=""),
    Group(name="5", label="", matches=[Match(wm_class=['discord'])]),
    Group(name="6", label=""),
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

if IS_DARK is True:
    colours, style = themes.SetOneDarkTheme()
else:
    colours, style = themes.SetOneLightTheme()

widget_defaults = dict(font="Iosevka Extended",
                       fontsize=18, padding=5,)
extension_defaults = widget_defaults.copy()

widgets1 = widgets.initialize_widgets(colours, style, POWERLINE)
widgets2 = widgets.initialize_widgets(colours, style, POWERLINE)

layout_theme = {
    "border_width": 3,
    "margin": 10,
    "border_focus": colours["primary"],
    "border_normal": colours["background"]
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Max(),
]


if widgets.is_laptop():
    screens = [
        Screen(top=bar.Bar(
            widgets1,
            size=BAR_SIZE,
            opacity=OPAQUE,
            background=colours["background"],
            foreground=colours["foreground"]))
    ]
else:
    screens = [
        Screen(top=bar.Bar(
            widgets1,
            size=BAR_SIZE,
            opacity=OPAQUE,
            background=colours["background"],
            foreground=colours["foreground"],
        )),
        Screen(top=bar.Bar(
            widgets2,
            size=BAR_SIZE,
            opacity=OPAQUE,
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
        *layout.Floating.default_float_rules,
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

# for java stuff apparently
wmname = "LG3D"
