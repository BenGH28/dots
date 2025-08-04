"""Ben Hunt's Qtile Config"""

import asyncio
import os
import subprocess
from typing import Any

from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

import keybinding
import widgets
from colours import Palette
from constants import BAR_SIZE, MOD, OPAQUE, TERM


@hook.subscribe.startup_once
def start_once() -> None:
    """Startup Applications"""
    autostart = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call([autostart])


async def move_spotify(window) -> None:
    """move spotify to workspace 3"""

    # NOTE: spotify is slow on setting properties so you need to sleep async
    # to load the window properties
    # see issue 2406 in qtile's github

    await asyncio.tasks.sleep(0.1)
    if window.name == "Spotify":
        window.togroup("3")


@hook.subscribe.client_managed
def go_to_group(window):
    """move to the screen to the group when the window is opened"""
    # window is XWindow
    win_name = window.window.get_wm_class()[1]
    windows = {
        "Spotify": "3",
        "firefox": "2",
        "discord": "5",
        TERM: "1",
    }
    if win_name in windows:
        # NOTE: toggle=False is important else you will switch screens if you
        # are already on that group this doesn't seem to work for spotify
        window.group.toscreen(toggle=False)


def init_groups() -> list[Group]:
    return [
        Group(name="1", label="1:TERM", matches=[Match(wm_class=TERM)]),
        Group(
            name="2",
            label="2:WEB",
            matches=[Match(wm_class="firefox"), Match(wm_class="qutebrowser")],
        ),
        Group(
            name="3",
            label="3:MUSIC",
            matches=[Match(wm_class="spotify"), Match(wm_class="Spotify")],
        ),
        Group(name="4", label="4:DOCS"),
        Group(
            name="5",
            label="5:COMMS",
            matches=[Match(wm_class="discord")],
        ),
        Group(name="6", label="6:MISC"),
    ]


def extend_keys_for_group(keys: list[Key]) -> None:
    for i in groups:
        keys.extend(
            [
                # MOD4 + letter of group = switch to group
                Key([MOD], i.name, lazy.group[i.name].toscreen()),
                # MOD4 + shift + num of group = switch and move window to group
                Key(
                    [MOD, "shift"],
                    i.name,
                    lazy.window.togroup(i.name, switch_group=True),
                ),
            ]
        )


def init_widget_defaults() -> dict[str, Any]:
    return {
        "font": "Noto Sans",
        "fontsize": 16,
        "padding": 5,
    }


def init_layout_theme(colours: Palette) -> dict[str, Any]:
    return {
        "border_width": 2,
        "margin": 5,
        "border_focus": colours.primary,
        "border_normal": colours.background,
    }


def init_layouts(layout_theme: dict[str, str]) -> list:
    return [
        layout.MonadTall(**layout_theme),
        layout.MonadWide(**layout_theme),
        layout.Max(),
    ]


def bottom_bar(background: str, foreground: str) -> bar.Bar:
    return bar.Bar(
        widgets=[
            widget.Spacer(length=int(1920 / 3)),
            widgets.spotify(),
            widget.Spacer(length=int(1920 / 3)),
        ],
        size=BAR_SIZE,
        opacity=OPAQUE,
        background=background,
        foreground=foreground,
    )


def init_screens(colours: Palette) -> list[Screen]:
    # will not display for multiple screens/bars
    systray = widgets.systray()

    widgets1 = widgets.initialize_widgets(colours)
    widgets2 = widgets.initialize_widgets(colours)

    # attach the systray to only one bar
    widgets2.append(systray)

    my_background = colours.background
    my_foreground = colours.foreground

    if widgets.is_laptop():
        return [
            Screen(
                top=bar.Bar(
                    widgets2,
                    size=BAR_SIZE,
                    opacity=OPAQUE,
                    background=my_background,
                    foreground=my_foreground,
                ),
                # bottom=bottom_bar(my_background, my_foreground),
            )
        ]

    return [
        Screen(
            top=bar.Bar(
                widgets1,
                size=BAR_SIZE,
                opacity=OPAQUE,
                background=my_background,
                foreground=my_foreground,
            ),
            bottom=bottom_bar(my_background, my_foreground),
        ),
        Screen(
            top=bar.Bar(
                widgets2,
                size=BAR_SIZE,
                opacity=OPAQUE,
                background=my_background,
                foreground=my_foreground,
            )
        ),
    ]


def init_mouse():
    return [
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
            start=lazy.window.get_size(),
        ),
        Click([MOD], "Button2", lazy.window.bring_to_front()),
    ]


if __name__ in ["config", "__main__"]:
    groups = init_groups()
    keys = keybinding.get_keys()
    extend_keys_for_group(keys)

    widget_defaults = init_widget_defaults()
    extension_defaults = widget_defaults.copy()

    colours = Palette("#ffffff", "#282A36", "#9f9a9a", "#61afe0", "#98d379", "#50a14f")
    layout_theme = init_layout_theme(colours)
    layouts = init_layouts(layout_theme)
    screens = init_screens(colours)
    mouse = init_mouse()
    dgroups_key_binder = None
    dgroups_app_rules: list = []
    main = None
    follow_mouse_focus = True
    bring_front_click = False
    cursor_warp = False
    floating_layout = layout.Floating(
        float_rules=[*layout.Floating.default_float_rules], **layout_theme
    )
    auto_fullscreen = True
    focus_on_window_activation = "smart"

    # for java stuff apparently
    wmname = "LG3D"
