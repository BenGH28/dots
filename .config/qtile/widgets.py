"""
Various widgets based on colour theme
"""
from os.path import exists
from subprocess import PIPE, run
from typing import Dict, Tuple

from libqtile import qtile, widget

from constants import TERM
from themes import Dark, Light

BACKGROUND = "#191a21"


def is_laptop() -> bool:
    """
    Check for the existance of a battery file

    return True if file exist False otherwise
    """

    batt_file = "/sys/class/power_supply/BAT0/model_name"
    if exists(batt_file):
        return True
    return False


def make_cpu_widget(widget_foreground, firstcolour, powerline: bool):
    if powerline:
        foreground = widget_foreground
        background = firstcolour
    else:
        foreground = "#e06c75"
        background = BACKGROUND
    return widget.CPU(
        foreground=foreground,
        background=background,
        format=" {load_percent}%",
        mouse_callbacks={
            "Button1": lambda: qtile.cmd_spawn(f"{TERM} -e htop")},
    )


def make_ram_widget(widget_foreground, secondcolour, powerline: bool):
    if powerline:
        foreground = widget_foreground
        background = secondcolour
    else:
        foreground = "#98c379"
        background = BACKGROUND

    return widget.Memory(
        foreground=foreground,
        background=background,
        format=" {MemUsed:.0f}M",
        mouse_callbacks={
            "Button1": lambda: qtile.cmd_spawn(f"{TERM} -e htop")},
    )


def make_agroupbox_widget(widget_foreground, firstcolour, powerline: bool):
    if powerline:
        foreground = widget_foreground
        background = firstcolour
    else:
        foreground = "#d19a66"
        background = BACKGROUND
    return widget.AGroupBox(foreground=foreground,
                            background=background,
                            borderwidth=0)


def make_volume_widget(widget_foreground, firstcolour, powerline: bool):
    if powerline:
        foreground = widget_foreground
        background = firstcolour
    else:
        foreground = "#61afef"
        background = BACKGROUND
    return widget.Volume(
        foreground=foreground,
        background=background,
        fmt="{}",
        # right click launches pavucontrol
        mouse_callbacks={"Button3": lambda: qtile.cmd_spawn("pavucontrol")},
    )


def make_battery_widget(widget_foreground, firstcolour, powerline: bool):
    if powerline:
        foreground = widget_foreground
        background = firstcolour
    else:
        foreground = "#56b6c2"
        background = BACKGROUND

    return widget.Battery(
        foreground=foreground,
        background=background,
        charge_char="",
        discharge_char="",
        full_char="",
        format="{char}  {percent:2.0%}",
        notify_below=30,
    )


def make_brightness_widget(widget_foreground, secondcolour, powerline: bool):
    intel_bright_file = "/sys/class/backlight/intel_backlight/brightness"
    amd_bright_file = "/sys/class/backlight/amdgpu_bl0/brightness"
    backlight_name = ""
    bright_file = ""
    if exists(intel_bright_file):
        bright_file = intel_bright_file
        backlight_name = "intel_backlight"
    else:
        bright_file = amd_bright_file
        backlight_name = "amdgpu_bl0"

    if powerline:
        foreground = widget_foreground
        backgrond = secondcolour
    else:
        foreground = "#e06c75"
        backgrond = BACKGROUND
    return widget.Backlight(
        foreground=foreground,
        background=backgrond,
        backlight_name=backlight_name,
        brightness_file=bright_file,
        fmt=" {}",
    )


def make_clock_widget(widget_foreground, secondcolour, powerline: bool):
    if powerline:
        foreground = widget_foreground
        background = secondcolour
    else:
        foreground = "#c768dd"
        background = BACKGROUND
    return widget.Clock(
        foreground=foreground, background=background, format="%d/%m/%y %H:%M"
    )


def make_image_widget(filename: str, powerline: bool):
    """make correct imaged widgets
    returns either an widget.Image or widget.Spacer depending on powerline
    """
    if powerline:
        return widget.Image(filename=filename, margin=0, padding=0)
    return widget.Spacer(background=BACKGROUND, length=10)


def make_systray_widget(secondcolour: str, powerline: bool):
    if powerline:
        background = secondcolour
    else:
        background = BACKGROUND
    return widget.Systray(background=background)


def make_groupbox_widget(colours: dict, powerline: bool):
    border_colour = colours["primary"]
    active_colour = colours["foreground"]
    inactive_colour = colours["inactive"]
    if powerline:
        background = None
    else:
        background = BACKGROUND
    return widget.GroupBox(
        this_current_screen_border=border_colour,
        background=background,
        highlight_method="line",
        rounded=False,
        active=active_colour,
        inactive=inactive_colour,
    )


def make_layout_icon_widget(secondcolour, powerline: bool):
    if powerline:
        background = secondcolour
    else:
        background = BACKGROUND
    return widget.CurrentLayoutIcon(foreground="000000", background=background)


def make_glyph(secondcolour, powerline: bool, left: bool):
    if powerline:
        background = secondcolour
        return widget.Spacer(background=background, length=10)
    else:
        background = BACKGROUND
        if left:
            return widget.TextBox(
                fmt="◤", foreground=background, padding=0, fontsize=60
            )
        return widget.TextBox(fmt="◢", foreground=background, padding=0, fontsize=60)


def make_kernel_widget(widget_foreground, secondcolour, powerline):
    if powerline:
        background = secondcolour
        foreground = widget_foreground
    else:
        background = BACKGROUND
        foreground = "#c768dd"

    cmd = ['uname', '-r']
    kernel_as_bytes = run(cmd, stdout=PIPE).stdout
    kernel_str = kernel_as_bytes.decode('utf-8')[:4]

    return widget.TextBox(background=background,
                          foreground=foreground,
                          fmt=f" {kernel_str}")


def base_widgets(colours: Dict[str, str], style, powerline: bool) -> list:
    """
    style is an enumeration of Light or Dark

    returns list of widgets
    """
    black_green, blue_green, primary_secondary = set_images_for_widgets(style)

    widget_foreground = set_widget_foreground(colours, style, powerline)

    firstcolour, secondcolour = set_widget_background(colours, powerline)

    my_widgets = [
        make_groupbox_widget(colours, powerline),
        make_glyph(widget_foreground, powerline, True),
        widget.WindowName(foreground=colours["foreground"]),
        make_glyph(widget_foreground, powerline, False),
        make_image_widget(black_green, powerline),
        make_cpu_widget(widget_foreground, firstcolour, powerline),
        make_image_widget(primary_secondary, powerline),
        make_ram_widget(widget_foreground, secondcolour, powerline),
        make_image_widget(primary_secondary, powerline),
        make_kernel_widget(colours["primary"], secondcolour, powerline),
        make_image_widget(blue_green, powerline),
        make_agroupbox_widget(widget_foreground, firstcolour, powerline),
        make_image_widget(primary_secondary, powerline),
        make_layout_icon_widget(secondcolour, powerline),
        make_image_widget(blue_green, powerline),
        make_volume_widget(widget_foreground, firstcolour, powerline),
        make_image_widget(primary_secondary, powerline),
        make_clock_widget(widget_foreground, secondcolour, powerline),
    ]

    return my_widgets


def make_laptop_widgets(colours: Dict[str, str], style, powerline: bool) -> list:
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


def set_widget_foreground(colours: Dict[str, str], style, powerline: bool) -> str:
    """set a proper foreground"""
    if style in (Dark.Dracula, Dark.OneDark) and powerline:
        widget_foreground = colours["background"]
    elif style == Light.OneLight and powerline:
        widget_foreground = colours["foreground"]
    else:
        widget_foreground = colours["tertiary"]

    return widget_foreground


def set_widget_background(colours: Dict[str, str], powerline: bool) -> Tuple[str, str]:
    """set a proper background"""
    # the background colours of the widgets
    if powerline:
        firstcolour = colours["secondary"]
        secondcolour = colours["primary"]
    else:
        firstcolour = colours["background"]
        secondcolour = firstcolour

    return (firstcolour, secondcolour)
