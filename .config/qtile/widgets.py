"""
Various widgets based on colour theme
"""
import os
from typing import Dict, Tuple

from libqtile import qtile, widget

from constants import TERM
from themes import Dark, Light


def is_laptop() -> bool:
    """
    Checks if the the name of the computer.
    Jotunheim is a desktop                => return false
    while anything else is laptop for now => return true
    """

    result = os.popen('hostname').read()
    if result.strip() == 'Jotunheim':
        return False
    return True


def make_powerline_laptop_widgets(colours: Dict[str, str],
                                  style,
                                  powerline: bool) -> list:
    """
    Make a list of widgets that do no have battery or brightnesss.
    I use the same config between a laptop and desktop and I am
    tired of (un)commenting out the same widgets everytime I
    update my config.

    returns list of widgets
    """
    begin_image, secondary_primary, primary_secondary = set_images_for_widgets(
        style)

    widget_foreground = set_widget_foreground(colours, style, powerline)

    firstcolour, secondcolour = set_widget_background(colours, powerline)

    laptop_exclusive = [
        widget.Image(
            filename=primary_secondary,
            margin=0,
        ),
        widget.Backlight(
            foreground=widget_foreground,
            background=secondcolour,
            backlight_name="intel_backlight",
            brightness_file="/sys/class/backlight/intel_backlight/brightness",
            fmt=" {}",
        ),
        widget.Image(
            filename=secondary_primary,
            margin=0,
        ),
        widget.Battery(
            foreground=widget_foreground,
            background=firstcolour,
            charge_char="",
            discharge_char="",
            full_char="",
            format="{char} {percent:2.0%}",
        ),
    ]

    widgets = powerline_widgets(colours, style, powerline)
    for item in laptop_exclusive:
        widgets.insert(-3, item)
    return widgets


def initialize_widgets(colours: dict, style, powerline=True) -> list:
    """return list of widgets based on a colour scheme"""
    if powerline:
        if is_laptop():
            return make_powerline_laptop_widgets(colours, style, powerline)
        # This will return non laptop widgets (no battery/brightness)
        return powerline_widgets(colours, style, powerline)
    return no_powerline(colours, style, powerline)


def set_images_for_widgets(style) -> Tuple[str, str, str]:
    """set properly coloured widgets based on the style"""
    # use colours for One
    if style in (Dark.OneDark, Light.OneLight):
        begin_image = "~/.config/qtile/resources/GreenEnd.png"
        secondary_primary = "~/.config/qtile/resources/BlueGreen.png"
        primary_secondary = "~/.config/qtile/resources/GreenBlue.png"

        return(begin_image, secondary_primary, primary_secondary)

    # style == Dark.Dracula:
    begin_image = "~/.config/qtile/resources/OrangeEnd.png"
    secondary_primary = "~/.config/qtile/resources/PurpleOrange.png"
    primary_secondary = "~/.config/qtile/resources/OrangePurple.png"

    return(begin_image, secondary_primary, primary_secondary)


def set_widget_foreground(colours: Dict[str, str],
                          style,
                          powerline: bool) -> str:
    """set a proper foreground"""
    if style in (Dark.Dracula, Dark.OneDark) and powerline:
        widget_foreground = colours["background"]
    elif style == Light.OneLight and powerline:
        widget_foreground = colours["foreground"]
    else:
        widget_foreground = colours["tertiary"]

    return widget_foreground


def set_widget_background(colours: Dict[str, str],
                          powerline: bool) -> Tuple[str, str]:
    """set a proper background"""
    # the background colours of the widgets
    if powerline:
        firstcolour = colours["secondary"]
        secondcolour = colours["primary"]
    else:
        firstcolour = colours["background"]
        secondcolour = firstcolour

    return (firstcolour, secondcolour)


def make_image_widget(filename: str) -> widget.Image:
    """make correct imaged widgets"""
    return widget.Image(filename=filename, margin=0, padding=0)


def make_left_char() -> str:
    """currently unused but perhaps used as a replacement for images"""
    left_arrow = ''
    return left_arrow


def make_right_char() -> str:
    """currently unused but perhaps used as a replacement for images"""
    right_arrow = ''
    return right_arrow


def powerline_widgets(colours: Dict[str, str],
                      style,
                      powerline: bool) -> list:
    """
    style is an enumeration of Light or Dark

    returns list of widgets
    """
    begin_image, secondary_primary, primary_secondary = set_images_for_widgets(
        style)

    widget_foreground = set_widget_foreground(colours, style, powerline)

    firstcolour, secondcolour = set_widget_background(colours, powerline)

    my_widgets = [
        widget.GroupBox(
            this_current_screen_border=colours["secondary"],
            active=colours["foreground"],
            inactive=colours["inactive"]),
        widget.WindowName(foreground=colours["foreground"]),
        make_image_widget(begin_image),
        widget.CPU(
            foreground=widget_foreground,
            background=firstcolour,
            format='CPU {load_percent}%',
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn(f"{TERM} -e htop")}
        ),
        make_image_widget(primary_secondary),
        widget.Memory(
            foreground=widget_foreground,
            background=secondcolour,
            format='{MemUsed}M',
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn(f"{TERM} -e htop")}
        ),
        make_image_widget(secondary_primary),
        widget.AGroupBox(
            foreground=widget_foreground,
            background=firstcolour,
            borderwidth=0,
        ),
        make_image_widget(primary_secondary),
        widget.CurrentLayoutIcon(
            foreground=widget_foreground,
            background=secondcolour,
        ),
        make_image_widget(secondary_primary),
        widget.Volume(
            foreground=widget_foreground,
            background=firstcolour,
            fmt="{}",
        ),
        make_image_widget(primary_secondary),
        widget.Clock(
            foreground=widget_foreground,
            background=secondcolour,
            format="%d/%m/%y %H:%M"
        ),
        widget.Systray(
            background=secondcolour,
        ),
    ]

    return my_widgets


def no_powerline(colours: Dict[str, str],
                 style,
                 powerline: bool) -> list:
    """
    remove the powerline images
    return a list of widgets
    """
    widgets = powerline_widgets(colours, style, powerline)
    for widg in widgets:
        if isinstance(widg, widget.image.Image):
            widgets.remove(widg)
    return widgets
