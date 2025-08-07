"""Ben Hunt's Qtile Config"""

import asyncio
import os
import subprocess
from typing import Any

from libqtile import bar, hook, layout
from libqtile.config import Click, Drag, Group, Match, Screen
from libqtile.lazy import lazy

import keybinding
import widgets

from constants import BAR_SIZE, MOD, OPAQUE, TERM, FONT, FONT_SIZE, PALETTE


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
        "Signal": "5",
        "zen": "2",
        TERM: "1",
    }
    if win_name in windows:
        # NOTE: toggle=False is important else you will switch screens if you
        # are already on that group this doesn't seem to work for spotify
        window.group.toscreen(toggle=False)


def get_groups() -> list[Group]:
    return [
        Group(name="1", label="1:TERM", matches=[Match(wm_class=TERM)]),
        Group(
            name="2",
            label="2:WEB",
            matches=[
                Match(wm_class="firefox"),
                Match(wm_class="zen"),
                Match(wm_class="qutebrowser"),
            ],
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
            matches=[Match(wm_class="discord"), Match(wm_class="signal")],
        ),
        Group(name="6", label="6:MISC"),
    ]


def get_widget_defaults() -> dict[str, Any]:
    return {
        "font": FONT,
        "fontsize": FONT_SIZE,
        "padding": 5,
    }


def init_layout_theme() -> dict[str, Any]:
    return {
        "border_width": 2,
        "margin": 5,
        "border_focus": PALETTE.primary,
        "border_normal": PALETTE.background,
    }


def get_layouts() -> list:
    theme = init_layout_theme()
    return [
        layout.MonadTall(**theme),
        layout.MonadWide(**theme),
        layout.Max(),
    ]


def get_screens() -> list[Screen]:
    # will not display for multiple screens/bars
    systray = widgets.systray(PALETTE)

    widgets1 = widgets.initialize_widgets(PALETTE)
    widgets2 = widgets.initialize_widgets(PALETTE)

    # attach the systray to only one bar
    widgets2.append(systray)

    back = PALETTE.background
    fore = PALETTE.foreground

    if widgets.is_laptop():
        return [
            Screen(
                top=bar.Bar(
                    widgets2,
                    size=BAR_SIZE,
                    opacity=OPAQUE,
                    background=back,
                    foreground=fore,
                ),
            )
        ]

    return [
        Screen(
            top=bar.Bar(
                widgets1,
                size=BAR_SIZE,
                opacity=OPAQUE,
                background=back,
                foreground=fore,
            ),
        ),
        Screen(
            top=bar.Bar(
                widgets2,
                size=BAR_SIZE,
                opacity=OPAQUE,
                background=back,
                foreground=fore,
            )
        ),
    ]


def get_mouse():
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
    groups = get_groups()
    keys = keybinding.get_keys(groups)
    widget_defaults = get_widget_defaults()
    extension_defaults = widget_defaults.copy()
    layouts = get_layouts()
    screens = get_screens()
    mouse = get_mouse()
    dgroups_key_binder = None
    dgroups_app_rules: list = []
    main = None
    follow_mouse_focus = True
    bring_front_click = False
    cursor_warp = False
    floating_layout = layout.Floating(
        float_rules=[*layout.Floating.default_float_rules], **init_layout_theme()
    )
    auto_fullscreen = True
    focus_on_window_activation = "smart"

    # for java stuff apparently
    wmname = "LG3D"
