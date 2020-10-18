"""
Various widgets based on colour theme
"""
import os
from typing import Dict, Tuple

from libqtile import widget

from constants import TERM
from themes import Dark, Light


def is_laptop() -> bool:
    """
    Determines if the machine running the code is a laptop
    by checking if it has a battery

    returns True for batter, False otherwise
    """

    result = os.popen('acpi').read()
    splits = result.split(" ")
    if splits[0] == 'Battery':
        return True
    else:
        return False


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
        else:
            return powerline_widgets(colours, style, powerline)
    # This will return non laptop widgets (no battery/brightness)
    return no_powerline(colours, style, powerline)


def set_images_for_widgets(style) -> Tuple[str, str, str]:
    # use colours for One
    if style == Dark.OneDark or style == Light.OneLight:
        begin_image = "~/.config/qtile/resources/GreenEnd.png"
        secondary_primary = "~/.config/qtile/resources/BlueGreen.png"
        primary_secondary = "~/.config/qtile/resources/GreenBlue.png"

        return(begin_image, secondary_primary, primary_secondary)

    else:
        # style == Dark.Dracula:
        begin_image = "~/.config/qtile/resources/OrangeEnd.png"
        secondary_primary = "~/.config/qtile/resources/PurpleOrange.png"
        primary_secondary = "~/.config/qtile/resources/OrangePurple.png"

        return(begin_image, secondary_primary, primary_secondary)


def set_widget_foreground(colours: Dict[str, str],
                          style,
                          powerline: bool) -> str:
    if style == Dark.Dracula or style == Dark.OneDark and powerline:
        widget_foreground = colours["background"]
    elif style == Light.OneLight and powerline:
        widget_foreground = colours["foreground"]
    else:
        widget_foreground = colours["tertiary"]

    return widget_foreground


def set_widget_background(colours: Dict[str, str],
                          powerline: bool) -> Tuple[str, str]:
    # the background colours of the widgets
    if powerline:
        firstcolour = colours["secondary"]
        secondcolour = colours["primary"]
    else:
        firstcolour = colours["background"]
        secondcolour = firstcolour

    return (firstcolour, secondcolour)


def make_image_widget(filename: str) -> widget.Image:
    return widget.Image(filename=filename, margin=0, padding=0)


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

    myWidgets = [
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
                "Button1": lambda qtile: qtile.cmd_spawn(f"{TERM} -e htop")}
        ),
        make_image_widget(primary_secondary),
        widget.Memory(
            foreground=widget_foreground,
            background=secondcolour,
            format='{MemUsed}M',
            mouse_callbacks={
                "Button1": lambda qtile: qtile.cmd_spawn(f"{TERM} -e htop")}
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

    return myWidgets


def no_powerline(colours: Dict[str, str],
                 style,
                 powerline: bool) -> list:
    """
    remove the powerline images
    return a list of widgets
    """
    widgets = powerline_widgets(colours, style, powerline)
    for widg in widgets:
        if type(widg) is widget.image.Image:
            widgets.remove(widg)
    return widgets
