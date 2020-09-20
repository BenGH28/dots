"""
Various widgets based on colour theme
"""
from libqtile import widget


def widgets_no_images(colours) -> list:
    """
    Return list of widgets which based on colour scheme passed in
    """
    widgets = [
        widget.GroupBox(
            this_current_screen_border=colours["primary"],
            active=colours["foreground"],
            inactive=colours["inactive"]),
        widget.WindowName(foreground=colours["inactive"]),
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
        # widget.CheckUpdates(
        #     foreground=colours["primary"],
        #     custom_command="sudo pacman -Sy | wc -l",
        #     mouse_callbacks={"Button1": lambda qtile: qtile.cmd_spawn(f"{TERM} -e sudo pacman -Syu")},
        #     display_format=" {}",
        #     colour_no_updates=colours["primary"],
        #     ),
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


def light_widgets(colours) -> list:
    """
    returns list of widgets based on light scheme
    """

    begin_image = "~/.config/qtile/resources/BlueEnd.png"
    primary_secondary = "~/.config/qtile/resources/BlueGreen.png"
    secondary_primary = "~/.config/qtile/resources/GreenBlue.png"

    myWidgets = [
        widget.GroupBox(
            this_current_screen_border=colours["primary"],
            active=colours["foreground"],
            inactive=colours["inactive"]),
        widget.WindowName(foreground=colours["foreground"]),
        widget.Image(
            filename=begin_image,
            margin=0,
            ),
        widget.CPU(
            foreground=colours["foreground"],
            background=colours["primary"],
            mouse_callbacks={"Button1": lambda qtile: qtile.cmd_spawn(f"{TERM} -e htop")}
            ),
        widget.Image(
            filename=primary_secondary,
            margin=0,
            ),
        widget.Memory(
            foreground=colours["foreground"],
            background=colours["secondary"],
            mouse_callbacks={"Button1": lambda qtile: qtile.cmd_spawn(f"{TERM} -e htop")}
            ),
        widget.Image(
            filename=secondary_primary,
            margin=0,
            ),
        widget.AGroupBox(
            foreground=colours["foreground"],
            background=colours["primary"],
            borderwidth=0,
            ),
        widget.Image(
            filename=primary_secondary,
            margin=0,
            ),
        widget.CurrentLayout(
            foreground=colours["foreground"],
            background=colours["secondary"],
            ),
        widget.Image(
            filename=secondary_primary,
            margin=0,
            ),
        # widget.CheckUpdates(
        #     foreground=colours["foreground"],
        #     background=colours["primary"],
        #     custom_command="sudo pacman -Sy | wc -l",
        #     mouse_callbacks={"Button1": lambda qtile: qtile.cmd_spawn(f"{TERM} -e sudo pacman -Syu")},
        #     display_format=" {}",
        #     colour_no_updates=colours["foreground"],
        #     ),
        widget.Image(
            filename=primary_secondary,
            margin=0,
            ),
        widget.Volume(
            foreground=colours["foreground"],
            background=colours["secondary"],
            fmt="{}",
            ),
        widget.Image(
            filename=secondary_primary,
            margin=0,
            ),
        widget.Backlight(
            foreground=colours["foreground"],
            background=colours["primary"],
            backlight_name="intel_backlight",
            brightness_file="/sys/class/backlight/intel_backlight/brightness",
            fmt=" {}",
            ),
        widget.Image(
            filename=primary_secondary,
            margin=0,
            ),
        widget.Battery(
            foreground=colours["foreground"],
            background=colours["secondary"],
            charge_char="",
            discharge_char="",
            full_char="",
            format="{char} {percent:2.0%}",
        ),
        widget.Image(
            filename=secondary_primary,
            margin=0,
            ),
        widget.Clock(
            foreground=colours["foreground"],
            background=colours["primary"],
            format="%D %H:%M"
            ),
        widget.Systray(
            background=colours["primary"],
            ),
    ]
    return myWidgets
