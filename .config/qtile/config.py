"""
Ben Hunt's Qtile Config
"""
import os
import subprocess
import themes
import widgets
import keys
from typing import List  # noqa: F401
from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.lazy import lazy
from libqtile import layout, bar, hook
from constants import MOD

is_dark = False


@hook.subscribe.startup_once
def start_once():
    """ Startup Applications """
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call([home])


# KEY BINDINGS
keys = keys.GetKeys()

# Groups
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


if is_dark is True:
    colours, style = themes.SetDarkTheme()
else:
    colours, style = themes.SetLightTheme()

widget_defaults = dict(font="JetBrainsMono Nerd Font", fontsize=18, padding=5,)
extension_defaults = widget_defaults.copy()

widgets1 = widgets.initialize_widgets(colours, style)
widgets2 = widgets.initialize_widgets(colours, style)

layout_theme = {
    "border_width": 4,
    "margin": 10,
    "border_focus": colours["primary"],
    "border_normal": colours["background"]
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Max(),
]


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
