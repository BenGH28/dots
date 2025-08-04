"""Various widgets based on colour theme"""

from os.path import exists
from subprocess import PIPE, run

from libqtile import qtile, widget

from constants import TERM
from spotify import Spotify
from colours import Palette

RED = "#e06c75"
GREEN = "#98c379"
ORANGE = "#d19a66"
BLUE = "#61afef"
TEAL = "#56b6c2"
PURPLE = "#c768dd"
BACKGROUND = "#191a21"


def is_laptop() -> bool:
    """Check for the existance of a battery file
    return True if file exist False otherwise
    """
    batt_file = "/sys/class/power_supply/BAT0/model_name"
    return exists(batt_file)


def spotify():
    return Spotify(
        foreground=RED, background=BACKGROUND, format="{icon} {artist} - {track}"
    )


def cpu():
    return widget.CPU(
        foreground=RED,
        background=BACKGROUND,
        format="  {load_percent:.0f}%",
        mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(f"{TERM} -e htop")},
    )


def launch_bar():
    return widget.LaunchBar(
        default_icon="/usr/share/icons/manjaro/maia/128x128.png",
        background=BACKGROUND,
        progs=[
            (
                "Start",
                'rofi -show combi -modes combi -combi-modes "window,drun"',
                "Find software",
            )
        ],
    )


def ram():
    return widget.Memory(
        foreground=GREEN,
        background=BACKGROUND,
        measure_mem="M",
        format=" {MemUsed:.0f}{mm}",
        mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(f"{TERM} -e htop")},
    )


def agroupbox():
    return widget.AGroupBox(foreground=ORANGE, background=BACKGROUND, borderwidth=0)


def volume():
    return widget.Volume(
        foreground=ORANGE,
        background=BACKGROUND,
        fmt=" {}",
        # right click launches pavucontrol
        mouse_callbacks={"Button3": lambda: qtile.cmd_spawn("pavucontrol")},
    )


def battery():
    return widget.Battery(
        foreground=TEAL,
        background=BACKGROUND,
        charge_char="",
        discharge_char="",
        full_char="",
        format="{char} {percent:2.0%}",
        notify_below=30,
    )


def brightness():
    intel_bright_file = "/sys/class/backlight/intel_backlight/brightness"
    amd_bright_file = "/sys/class/backlight/amdgpu_bl0/brightness"
    if exists(intel_bright_file):
        bright_file = intel_bright_file
        backlight_name = "intel_backlight"
    else:
        bright_file = amd_bright_file
        backlight_name = "amdgpu_bl0"

    return widget.Backlight(
        foreground=RED,
        background=BACKGROUND,
        backlight_name=backlight_name,
        brightness_file=bright_file,
        fmt=" {}",
    )


def clock():
    return widget.Clock(
        foreground=PURPLE, background=BACKGROUND, format="%a %d %b %H:%M"
    )


def image():
    """make correct imaged widgets
    returns either an widget.Image or widget.Spacer depending on powerline
    """
    return widget.Spacer(background=BACKGROUND, length=10)


def systray():
    return widget.Systray(background=BACKGROUND)


def groupbox(colours: Palette):
    border_colour = colours.primary
    active_colour = colours.foreground
    inactive_colour = colours.inactive
    return widget.GroupBox(
        this_current_screen_border=border_colour,
        background=BACKGROUND,
        highlight_method="line",
        rounded=False,
        active=active_colour,
        inactive=inactive_colour,
    )


def layout_icon():
    return widget.CurrentLayoutIcon(foreground="000000", background=BACKGROUND)


def kernel():
    cmd = ["uname", "-r"]
    kernel_as_bytes = run(cmd, stdout=PIPE).stdout
    kernel_str = kernel_as_bytes.decode("utf-8").split("-")[0]

    return widget.TextBox(
        background=BACKGROUND, foreground=PURPLE, fmt=f" {kernel_str}"
    )


def tasklist():
    return widget.TaskList(
        background=BACKGROUND, txt_floating="🗗 ", highlight_method="block"
    )


def base_widgets(colours: Palette) -> list:
    """returns list of widgets"""
    return [
        launch_bar(),
        groupbox(colours),
        tasklist(),
        cpu(),
        ram(),
        volume(),
        image(),
        clock(),
    ]


def laptops(colours: Palette) -> list:
    """Make a list of widgets that do no have battery or brightnesss.
    I use the same config between a laptop and desktop and I am
    tired of (un)commenting out the same widgets everytime I
    update my config.

    returns list of widgets
    """

    laptop_exclusive = [
        image(),
        brightness(),
        image(),
        battery(),
    ]

    widgets = base_widgets(colours)
    for item in laptop_exclusive:
        widgets.insert(-3, item)
    return widgets


def initialize_widgets(colours: Palette) -> list:
    """return list of widgets based on a colour scheme"""
    if is_laptop():
        return laptops(colours)
    return base_widgets(colours)
