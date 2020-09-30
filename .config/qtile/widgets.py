"""
Various widgets based on colour theme
"""
from libqtile import widget
from constants import TERM
from themes import Light, Dark
import os


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


def make_laptop_widgets(colours: dict,
                        style,
                        powerline: bool) -> list:
    """
    Make a list of widgets that do no have battery or brightnesss.
    I use the same config between a laptop and desktop and I am
    tired of (un)commenting out the same widgets everytime I
    update my config.

    returns list of widgets
    """
    begin_image, secondary_primary, primary_secondary, set_images_for_widgets(style)
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
    widgets.insert(-3, laptop_exclusive)
    return widgets


def initialize_widgets(colours: dict, style, powerline=True) -> list:
    """return list of widgets based on a colour scheme"""
    if powerline:
        if is_laptop():
            return make_laptop_widgets(colours, style, powerline)
        else:
            return powerline_widgets(colours, style, powerline)

    return no_powerline(colours, style, powerline)



def set_images_for_widgets(style) -> tuple:
    # use colours for One
    if style == Dark.OneDark or style == Light.OneLight:
        begin_image = "~/.config/qtile/resources/GreenEnd.png"
        secondary_primary = "~/.config/qtile/resources/BlueGreen.png"
        primary_secondary = "~/.config/qtile/resources/GreenBlue.png"

        return(begin_image, secondary_primary, primary_secondary)

    elif style == Dark.Dracula:
        begin_image = "~/.config/qtile/resources/OrangeEnd.png"
        secondary_primary = "~/.config/qtile/resources/PurpleOrange.png"
        primary_secondary = "~/.config/qtile/resources/OrangePurple.png"

        return(begin_image, secondary_primary, primary_secondary)


def powerline_widgets(colours: dict, style, powerline: bool) -> list:
    """
    style is an enumeration of Light or Dark

    returns list of widgets
    """
    begin_image, secondary_primary, primary_secondary = set_images_for_widgets(
        style)

    widget_foreground = colours["tertiary"]

    if style == Dark.Dracula or style == Dark.OneDark and powerline:
        widget_foreground = colours["background"]
    elif style == Light.OneLight and powerline:
        widget_foreground = colours["foreground"]

    # the background colours of the widgets
    if powerline:
        firstcolour = colours["secondary"]
        secondcolour = colours["primary"]
    else:
        firstcolour = colours["background"]
        secondcolour = firstcolour

    myWidgets = [
        widget.GroupBox(
            this_current_screen_border=colours["secondary"],
            active=colours["foreground"],
            inactive=colours["inactive"]),
        widget.WindowName(foreground=colours["foreground"]),
        widget.Image(
            filename=begin_image,
            margin=0,
        ),
        widget.CPU(
            foreground=widget_foreground,
            background=firstcolour,
            format='CPU {load_percent}%',
            mouse_callbacks={
                "Button1": lambda qtile: qtile.cmd_spawn(f"{TERM} -e htop")}
        ),
        widget.Image(
            filename=primary_secondary,
            margin=0,
        ),
        widget.Memory(
            foreground=widget_foreground,
            background=secondcolour,
            format='{MemUsed}M',
            mouse_callbacks={
                "Button1": lambda qtile: qtile.cmd_spawn(f"{TERM} -e htop")}
        ),
        widget.Image(
            filename=secondary_primary,
            margin=0,
        ),
        widget.AGroupBox(
            foreground=widget_foreground,
            background=firstcolour,
            borderwidth=0,
        ),
        widget.Image(
            filename=primary_secondary,
            margin=0,
        ),
        widget.CurrentLayout(
            foreground=widget_foreground,
            background=secondcolour,
        ),
        widget.Image(
            filename=secondary_primary,
            margin=0,
        ),
        widget.Volume(
            foreground=widget_foreground,
            background=firstcolour,
            fmt="{}",
        ),
        widget.Image(
            filename=primary_secondary,
            margin=0,
        ),
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


def no_powerline(colours: dict, style, powerline: bool) -> list:
    """
    remove the powerline images
    return a list of widgets
    """
    widgets = powerline_widgets(colours, style, powerline)
    for widg in widgets:
        if type(widg) is widget.image.Image:
            widgets.remove(widg)
    return widgets
