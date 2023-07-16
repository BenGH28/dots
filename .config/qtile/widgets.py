"""
Various widgets based on colour theme
"""
from os.path import exists
from subprocess import PIPE, run
from typing import Dict, Tuple

from libqtile import qtile, widget

from constants import TERM, IS_DARK
from spotify import Spotify
from themes import Dark, Light

BACKGROUND = "#191a21" if IS_DARK else "#f0f0f4"


def is_laptop() -> bool:
    """Check for the existance of a battery file
    return True if file exist False otherwise
    """
    batt_file = "/sys/class/power_supply/BAT0/model_name"
    return exists(batt_file)


def make_spotify_widget():
    foreground = "#e06c75"
    return Spotify(
        foreground=foreground, background=BACKGROUND, format="{icon} {artist} - {track}"
    )


def make_cpu_widget():
    foreground = "#e06c75"
    return widget.CPU(
        foreground=foreground,
        background=BACKGROUND,
        format=" {load_percent}%",
        mouse_callbacks={
            "Button1": lambda: qtile.cmd_spawn(f"{TERM} -e htop")},
    )


def make_ram_widget():
    foreground = "#98c379"
    return widget.Memory(
        foreground=foreground,
        background=BACKGROUND,
        format=" {MemUsed:.0f}M",
        mouse_callbacks={
            "Button1": lambda: qtile.cmd_spawn(f"{TERM} -e htop")},
    )


def make_agroupbox_widget():
    foreground = "#d19a66"
    return widget.AGroupBox(foreground=foreground, background=BACKGROUND, borderwidth=0)


def make_volume_widget():
    foreground = "#61afef"
    return widget.Volume(
        foreground=foreground,
        background=BACKGROUND,
        fmt="{}",
        # right click launches pavucontrol
        mouse_callbacks={"Button3": lambda: qtile.cmd_spawn("pavucontrol")},
    )


def make_battery_widget():
    foreground = "#56b6c2"
    return widget.Battery(
        foreground=foreground,
        background=BACKGROUND,
        charge_char="",
        discharge_char="",
        full_char="",
        format="{char}  {percent:2.0%}",
        notify_below=30,
    )


def make_brightness_widget():
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

    foreground = "#e06c75"
    return widget.Backlight(
        foreground=foreground,
        background=BACKGROUND,
        backlight_name=backlight_name,
        brightness_file=bright_file,
        fmt=" {}",
    )


def make_clock_widget():
    foreground = "#c768dd"
    return widget.Clock(
        foreground=foreground, background=BACKGROUND, format="%Y/%m/%d %H:%M"
    )


def make_image_widget():
    """make correct imaged widgets
    returns either an widget.Image or widget.Spacer depending on powerline
    """
    return widget.Spacer(background=BACKGROUND, length=10)


def make_systray_widget():
    return widget.Systray(background=BACKGROUND)


def make_groupbox_widget(colours: Dict[str, str]):
    border_colour = colours["primary"]
    active_colour = colours["foreground"]
    inactive_colour = colours["inactive"]
    return widget.GroupBox(
        this_current_screen_border=border_colour,
        background=BACKGROUND,
        highlight_method="line",
        rounded=False,
        active=active_colour,
        inactive=inactive_colour,
    )


def make_layout_icon_widget():
    return widget.CurrentLayoutIcon(foreground="000000", background=BACKGROUND)


def make_glyph(left: bool):
    if left:
        return widget.TextBox(fmt="◤", foreground=BACKGROUND, padding=0, fontsize=60)
    return widget.TextBox(fmt="◢", foreground=BACKGROUND, padding=0, fontsize=60)


def make_kernel_widget():
    foreground = "#c768dd"
    cmd = ["uname", "-r"]
    kernel_as_bytes = run(cmd, stdout=PIPE).stdout
    kernel_str = kernel_as_bytes.decode("utf-8").split('-')[0]

    return widget.TextBox(
        background=BACKGROUND, foreground=foreground, fmt=f" {kernel_str}"
    )


def base_widgets(colours: Dict[str, str]):
    """returns list of widgets"""
    my_widgets = [
        make_groupbox_widget(colours),
        make_glyph(True),
        widget.WindowName(foreground=colours["foreground"]),
        make_glyph(False),
        make_image_widget(),
        make_cpu_widget(),
        make_image_widget(),
        make_ram_widget(),
        make_image_widget(),
        make_kernel_widget(),
        # make_spotify_widget(colours["secondary"], firstcolour, powerline),
        make_image_widget(),
        make_agroupbox_widget(),
        make_image_widget(),
        make_layout_icon_widget(),
        make_image_widget(),
        make_volume_widget(),
        make_image_widget(),
        make_clock_widget(),
    ]

    return my_widgets


def make_laptop_widgets(colours: Dict[str, str]) -> list:
    """Make a list of widgets that do no have battery or brightnesss.
    I use the same config between a laptop and desktop and I am
    tired of (un)commenting out the same widgets everytime I
    update my config.

    returns list of widgets
    """

    laptop_exclusive = [
        make_image_widget(),
        make_brightness_widget(),
        make_image_widget(),
        make_battery_widget(),
    ]

    widgets = base_widgets(colours)
    for item in laptop_exclusive:
        widgets.insert(-3, item)
    return widgets


def initialize_widgets(colours: dict):
    """return list of widgets based on a colour scheme"""
    if is_laptop():
        return make_laptop_widgets(colours)
    return base_widgets(colours)


def set_images_for_widgets(style) -> Tuple[str, str, str]:
    """set properly coloured widgets based on the style"""
    # use colours for One
    if style in (Dark.OneDark, Light.OneLight):
        black_green = "~/.config/qtile/resources/GreenEnd.png"
        blue_green = "~/.config/qtile/resources/BlueGreen.png"
        green_blue = "~/.config/qtile/resources/GreenBlue.png"

        return (black_green, blue_green, green_blue)

    # style = Dark.Dracula:
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


def set_widget_background(colours: Dict[str, str]) -> Tuple[str, str]:
    """set a proper background"""
    # the background colours of the widgets
    firstcolour = colours["background"]
    secondcolour = firstcolour

    return (firstcolour, secondcolour)
