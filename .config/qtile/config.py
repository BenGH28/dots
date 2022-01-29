"""
Ben Hunt's Qtile Config
"""
import asyncio
import os
import subprocess
from typing import List  # noqa: F401

import keybinding
import themes
import widgets
from constants import BAR_SIZE, IS_DARK, MOD, OPAQUE, POWERLINE
from libqtile import bar, hook, layout
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy


@hook.subscribe.startup_once
async def start_once() -> None:
    """
    Startup Applications

    Need this to be async otherwise the script
    can hang Qtile on initial startup
    """
    autostart = os.path.expanduser("~/.config/qtile/autostart.sh")
    proc = await asyncio.create_subprocess_shell(autostart,
                                                 stderr=asyncio.subprocess.PIPE,
                                                 stdout=asyncio.subprocess.PIPE)
    _, stderr = proc.communicate()
    if stderr:
        # let me know if something goes wrong with the autostart
        subprocess.call(
            ["notify-send", "-u", "critical",  f"{stderr.decode()}"])


@hook.subscribe.client_new
async def move_spotify(client) -> None:
    """ move spotify to workspace 3 """

    # NOTE: spotify is slow on setting properties so you need to sleep async to load the window properties
    # see issue 2406 in qtile's github
    await asyncio.tasks.sleep(0.1)
    if client.name == "Spotify":
        client.togroup("3")


@hook.subscribe.client_managed
def go_to_group(window):
    """move to the screen to the group when the window is opened"""
    win_name = window.window.get_wm_class()[1]
    windows = {"Spotify": "3", "firefox": "2", "discord": "5"}
    if win_name in windows:
        # NOTE: toggle=False is important else you will switch screens if you are already on that group
        # this doesn't seem to work for spofify...of course :(
        window.group.cmd_toscreen(toggle=False)


def init_groups() -> List[Group]:
    groups = [
        Group(name="1", label=""),
        Group(
            name="2",
            label="",
            matches=[
                Match(wm_class=["firefox"]),
                Match(wm_class=["qutebrowser"])
            ],
        ),
        Group(name="3",
              label="",
              matches=[Match(wm_class=["spotify", "Spotify"])]),
        Group(name="4", label=""),
        Group(name="5", label="", matches=[Match(wm_class=["discord"])]),
        Group(name="6", label=""),
    ]
    return groups


def extend_keys_for_group(keys: List[Key]) -> None:
    for i in groups:
        keys.extend([
            # MOD4 + letter of group = switch to group
            Key([MOD], i.name, lazy.group[i.name].toscreen()),
            # MOD4 + shift + num of group = switch and move window to group
            Key([MOD, "shift"], i.name,
                lazy.window.togroup(i.name, switch_group=True)),
        ])


def init_colours_and_style() -> tuple:
    if IS_DARK is True:
        return themes.SetOneDarkTheme()
    else:
        return themes.SetOneLightTheme()


def init_widget_defaults() -> dict:
    widget_defaults = dict(
        font="JetBrainsMono Nerd Font",
        fontsize=18,
        padding=5,
    )
    return widget_defaults


def init_layout_theme(colours) -> dict:
    layout_theme = {
        "border_width": 2,
        "margin": 5,
        "border_focus": colours["primary"],
        "border_normal": colours["background"],
    }
    return layout_theme


def init_layouts(layout_theme: dict) -> List:
    layouts = [
        layout.MonadTall(**layout_theme),
        layout.MonadWide(**layout_theme),
        layout.Max(),
    ]
    return layouts


def init_screens(colours, style) -> List[Screen]:
    widgets1 = widgets.initialize_widgets(colours, style, POWERLINE)
    widgets2 = widgets.initialize_widgets(colours, style, POWERLINE)
    if widgets.is_laptop():
        screens = [
            Screen(top=bar.Bar(
                widgets1,
                size=BAR_SIZE,
                opacity=OPAQUE,
                background=colours["background"],
                foreground=colours["foreground"],
            ))
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
                foreground=colours["foreground"],
            )),
        ]
    return screens


def init_mouse():
    mouse = [
        Drag(
            [MOD],
            "Button1",
            lazy.window.set_position_floating(),
            start=lazy.window.get_position(),
        ),
        Drag([MOD],
             "Button3",
             lazy.window.set_size_floating(),
             start=lazy.window.get_size()),
        Click([MOD], "Button2", lazy.window.bring_to_front()),
    ]
    return mouse


if __name__ in ["config", "__main__"]:
    colours, style = init_colours_and_style()
    groups = init_groups()
    keys = keybinding.get_keys()
    extend_keys_for_group(keys)
    widget_defaults = init_widget_defaults()
    extension_defaults = widget_defaults.copy()
    layout_theme = init_layout_theme(colours)
    layouts = init_layouts(layout_theme)
    screens = init_screens(colours, style)
    mouse = init_mouse()
    dgroups_key_binder = None
    dgroups_app_rules = []  # type: List
    main = None
    follow_mouse_focus = True
    bring_front_click = False
    cursor_warp = False
    floating_layout = layout.Floating(
        float_rules=[*layout.Floating.default_float_rules], **layout_theme)
    auto_fullscreen = True
    focus_on_window_activation = "smart"

    # for java stuff apparently
    wmname = "LG3D"
