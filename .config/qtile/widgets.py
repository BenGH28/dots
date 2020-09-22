"""
Various widgets based on colour theme
"""
from libqtile import widget
from constants import TERM


def initialize_widgets(colours, style, powerline=True) -> list:
    """return widgets based on a colour scheme"""
    if powerline is True:
        return powerline_widgets(colours, style)
    else:
        # return no_powerline(colours, style)
        return widgets_no_images(colours)


def widgets_no_images(colours) -> list:
    """
    Return list of widgets with no powerline effects
    """
    widgets = [
        widget.GroupBox(
            this_current_screen_border=colours["primary"],
            active=colours["foreground"],
            inactive=colours["inactive"]),
        widget.WindowName(foreground=colours["foreground"]),
        widget.CPU(
            foreground=colours["primary"],
            mouse_callbacks={"Button1": lambda qtile: qtile.cmd_spawn(f"{TERM} -e htop")},
            fmt="|{}|",
            ),
        widget.Memory(
            foreground=colours["secondary"],
            mouse_callbacks={"Button1": lambda qtile: qtile.cmd_spawn(f"{TERM} -e htop")},
            fmt="|{}|",
            ),
        widget.AGroupBox(
            foreground=colours["primary"],
            borderwidth=0,
            fmt="|{}|",
            ),
        widget.CurrentLayout(
            foreground=colours["secondary"],
            fmt="|{}|",
            ),
        widget.Volume(
            foreground=colours["primary"],
            fmt="|{}|",
            ),
        widget.Backlight(
            foreground=colours["secondary"],
            backlight_name="intel_backlight",
            brightness_file="/sys/class/backlight/intel_backlight/brightness",
            fmt="| {}|",
            ),
        widget.Battery(
            foreground=colours["primary"],
            charge_char="",
            discharge_char="",
            full_char="",
            format="|{char} {percent:2.0%}|",
        ),
        widget.Clock(
            foreground=colours["secondary"],
            format="|%d/%m/%y %H:%M|"
            ),
        widget.Systray(),
        ]
    return widgets


def powerline_widgets(colours, style) -> list:
    """
    returns list of widgets based on light scheme
    """

    if style == "light":
        begin_image = "~/.config/qtile/resources/GreenEnd.png"
        secondary_primary = "~/.config/qtile/resources/BlueGreen.png"
        primary_secondary = "~/.config/qtile/resources/GreenBlue.png"
        widget_foreground = colours["foreground"]
    else:
        begin_image = "~/.config/qtile/resources/OrangeEnd.png"
        secondary_primary = "~/.config/qtile/resources/PurpleOrange.png"
        primary_secondary = "~/.config/qtile/resources/OrangePurple.png"
        widget_foreground = colours["background"]

    # the background colours of the widgets
    firstcolour = colours["secondary"]
    secondcolour = colours["primary"]

    myWidgets = [
        widget.GroupBox(
            this_current_screen_border=firstcolour,
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
            mouse_callbacks={"Button1": lambda qtile: qtile.cmd_spawn(f"{TERM} -e htop")}
            ),
        widget.Image(
            filename=primary_secondary,
            margin=0,
            ),
        widget.Memory(
            foreground=widget_foreground,
            background=secondcolour,
            mouse_callbacks={"Button1": lambda qtile: qtile.cmd_spawn(f"{TERM} -e htop")}
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


def no_powerline(colours, style):
    """
    remove the powerline images
    return a list of widgets
    """
    widgets = powerline_widgets(colours, style)
    for widg in widgets:
        if type(widg) is widget.image.Image:
            widgets.remove(widg)
    return widgets
