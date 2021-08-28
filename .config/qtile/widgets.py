"""
Various widgets based on colour theme
"""
import os
from os.path import exists
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

    batt_file = "/sys/class/power_supply/BAT0/model_name"
    if exists(batt_file):
        return True
    return False


def make_cpu_widget(widget_foreground, firstcolour, powerline: bool):
    if powerline:
        foreground = widget_foreground
    else:
        foreground = "#e06c75"
    return widget.CPU(foreground=foreground,
                      background=firstcolour,
                      format=' {load_percent}%',
                      mouse_callbacks={
                          "Button1":
                          lambda: qtile.cmd_spawn(f"{TERM} -e gotop")
                      })


def make_ram_widget(widget_foreground, secondcolour, powerline: bool):
    if powerline:
        foreground = widget_foreground
    else:
        foreground = "#98c379"

    return widget.Memory(foreground=foreground,
                         background=secondcolour,
                         format=' {MemUsed:.0f}M',
                         mouse_callbacks={
                             "Button1":
                             lambda: qtile.cmd_spawn(f"{TERM} -e gotop")
                         })


def make_agroupbox_widget(widget_foreground, firstcolour, powerline: bool):
    if powerline:
        foreground = widget_foreground
    else:
        foreground = "#d19a66"
    return widget.AGroupBox(foreground=foreground,
                            background=firstcolour,
                            borderwidth=0)


def make_volume_widget(widget_foreground, firstcolour, powerline: bool):
    if powerline:
        foreground = widget_foreground
    else:
        foreground = "#61afef"
    return widget.Volume(
        foreground=foreground,
        background=firstcolour,
        fmt="{}",
    )


def make_battery_widget(widget_foreground, firstcolour, powerline: bool):
    if powerline:
        foreground = widget_foreground
    else:
        foreground = "#56b6c2"

    return widget.Battery(
        foreground=foreground,
        background=firstcolour,
        charge_char="",
        discharge_char="",
        full_char="",
        format="{char} {percent:2.0%}",
    )


def make_brightness_widget(widget_foreground, secondcolour, powerline: bool):
    if powerline:
        foreground = widget_foreground
    else:
        foreground = "#e06c75"
    return widget.Backlight(
        foreground=foreground,
        background=secondcolour,
        backlight_name="intel_backlight",
        brightness_file="/sys/class/backlight/intel_backlight/brightness",
        fmt=" {}",
    )


def make_clock_widget(widget_foreground, secondcolour, powerline: bool):
    if powerline:
        foreground = widget_foreground
    else:
        foreground = "#c768dd"
    return widget.Clock(foreground=foreground,
                        background=secondcolour,
                        format="%d/%m/%y %H:%M")


def make_image_widget(filename: str, powerline: bool):
    """make correct imaged widgets
        returns either an widget.Image or widget.Spacer depending on powerline
    """
    # breakpoint
    if powerline:
        return widget.Image(filename=filename, margin=0, padding=0)
    return widget.Spacer(background='#282A36', length=10)


def base_widgets(colours: Dict[str, str], style, powerline: bool) -> list:
    """
    style is an enumeration of Light or Dark

    returns list of widgets
    """
    black_green, blue_green, primary_secondary = set_images_for_widgets(style)

    widget_foreground = set_widget_foreground(colours, style, powerline)

    firstcolour, secondcolour = set_widget_background(colours, powerline)

    # list of widgets that may be a mix of widget and None
    my_widgets = [
        widget.GroupBox(this_current_screen_border=colours["secondary"],
                        active=colours["foreground"],
                        inactive=colours["inactive"]),
        widget.WindowName(foreground=colours["foreground"]),
        make_image_widget(black_green, powerline),
        make_cpu_widget(widget_foreground, firstcolour, powerline),
        make_image_widget(primary_secondary, powerline),
        make_ram_widget(widget_foreground, secondcolour, powerline),
        make_image_widget(blue_green, powerline),
        make_agroupbox_widget(widget_foreground, firstcolour, powerline),
        make_image_widget(primary_secondary, powerline),
        widget.CurrentLayoutIcon(foreground="000000", background=secondcolour),
        make_image_widget(blue_green, powerline),
        make_volume_widget(widget_foreground, firstcolour, powerline),
        make_image_widget(primary_secondary, powerline),
        make_clock_widget(widget_foreground, secondcolour, powerline),
        widget.Systray(background=secondcolour),
    ]

    return my_widgets


def make_laptop_widgets(colours: Dict[str, str], style,
                        powerline: bool) -> list:
    """
    Make a list of widgets that do no have battery or brightnesss.
    I use the same config between a laptop and desktop and I am
    tired of (un)commenting out the same widgets everytime I
    update my config.

    returns list of widgets
    """
    _, blue_green, green_blue = set_images_for_widgets(style)

    widget_foreground = set_widget_foreground(colours, style, powerline)

    firstcolour, secondcolour = set_widget_background(colours, powerline)

    laptop_exclusive = [
        make_image_widget(green_blue, powerline),
        make_brightness_widget(widget_foreground, secondcolour, powerline),
        make_image_widget(blue_green, powerline),
        make_battery_widget(widget_foreground, firstcolour, powerline),
    ]

    widgets = base_widgets(colours, style, powerline)
    for item in laptop_exclusive:
        widgets.insert(-3, item)
    return widgets


def initialize_widgets(colours: dict, style, powerline=True):
    """return list of widgets based on a colour scheme"""
    if is_laptop():
        return make_laptop_widgets(colours, style, powerline)
    return base_widgets(colours, style, powerline)


def set_images_for_widgets(style) -> Tuple[str, str, str]:
    """set properly coloured widgets based on the style"""
    # use colours for One
    if style in (Dark.OneDark, Light.OneLight):
        black_green = "~/.config/qtile/resources/GreenEnd.png"
        blue_green = "~/.config/qtile/resources/BlueGreen.png"
        green_blue = "~/.config/qtile/resources/GreenBlue.png"

        return (black_green, blue_green, green_blue)

    # style == Dark.Dracula:
    black_orange = "~/.config/qtile/resources/OrangeEnd.png"
    purple_orange = "~/.config/qtile/resources/PurpleOrange.png"
    orange_purple = "~/.config/qtile/resources/OrangePurple.png"

    return (black_orange, purple_orange, orange_purple)


def set_widget_foreground(colours: Dict[str, str], style,
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
