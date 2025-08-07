"""Various widgets based on colour theme"""

from os.path import exists
from subprocess import PIPE, run

from libqtile import qtile, widget

from constants import TERM
from spotify import Spotify
from colours import Palette

__all__ = ["is_laptop", "initialize_widgets", "systray"]


def is_laptop() -> bool:
    """Check for the existance of a battery file
    return True if file exist False otherwise
    """
    batt_file = "/sys/class/power_supply/BAT0/model_name"
    return exists(batt_file)


def spotify(palette: Palette):
    return Spotify(
        foreground=palette.red,
        background=palette.background,
        format="{icon} {artist} - {track}",
    )


def cpu(palette: Palette):
    return widget.CPU(
        foreground=palette.red,
        background=palette.background,
        format="💻  {load_percent:.0f}%",
        mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(f"{TERM} -e htop")},
    )


def mpris(palette: Palette):
    return widget.Mpris2(background=palette.background)


def launch_bar(palette: Palette):
    return widget.LaunchBar(
        default_icon="/usr/share/icons/manjaro/maia/128x128.png",
        background=palette.background,
        progs=[
            (
                "Start",
                "rofi -show combi -modes combi -combi-modes 'window,drun' -markup -transient-window -sorting-method 'fzf' -sort",
                "Find software",
            )
        ],
    )


def ram(palette: Palette):
    return widget.Memory(
        foreground=palette.green,
        background=palette.background,
        measure_mem="M",
        format="🧠 {MemUsed:.0f}{mm}",
        mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(f"{TERM} -e htop")},
    )


def agroupbox(palette: Palette):
    return widget.AGroupBox(
        foreground=palette.orange,
        background=palette.background,
        borderwidth=0,
    )


def volume(palette: Palette):
    return widget.Volume(
        foreground=palette.orange,
        background=palette.background,
        fmt=" 🔉{}",
        # right click launches pavucontrol
        mouse_callbacks={"Button3": lambda: qtile.cmd_spawn("pavucontrol")},
    )


def battery(palette: Palette):
    return widget.Battery(
        foreground=palette.teal,
        background=palette.background,
        charge_char="🌩️",
        discharge_char="🔋",
        full_char="🔌",
        format="{char} {percent:2.0%}",
        notify_below=30,
    )


def brightness(palette: Palette):
    intel_bright_file = "/sys/class/backlight/intel_backlight/brightness"
    amd_bright_file = "/sys/class/backlight/amdgpu_bl0/brightness"
    if exists(intel_bright_file):
        bright_file = intel_bright_file
        backlight_name = "intel_backlight"
    else:
        bright_file = amd_bright_file
        backlight_name = "amdgpu_bl0"

    return widget.Backlight(
        foreground=palette.red,
        background=palette.background,
        backlight_name=backlight_name,
        brightness_file=bright_file,
        fmt="🔆 {}",
    )


def clock(palette: Palette):
    return widget.Clock(
        foreground=palette.purple,
        background=palette.background,
        format="%a %d %b %H:%M",
    )


def spacer(palette: Palette):
    return widget.Spacer(background=palette.background, length=10)


def systray(palette: Palette):
    return widget.Systray(background=palette.background)


def groupbox(palette: Palette):
    border_colour = palette.primary
    active_colour = palette.foreground
    inactive_colour = palette.inactive
    return widget.GroupBox(
        this_current_screen_border=border_colour,
        background=palette.background,
        highlight_method="line",
        rounded=True,
        active=active_colour,
        inactive=inactive_colour,
        hide_unused=True,
    )


def layout_icon(palette: Palette):
    return widget.CurrentLayoutIcon(foreground="000000", background=palette.background)


def kernel(palette: Palette):
    cmd = ["uname", "-r"]
    kernel_as_bytes = run(cmd, stdout=PIPE).stdout
    kernel_str = kernel_as_bytes.decode("utf-8").split("-")[0]
    return widget.TextBox(
        background=palette.background, foreground=palette.purple, fmt=f" {kernel_str}"
    )


def tasklist(palette: Palette):
    return widget.TaskList(
        background=palette.background,
        txt_floating="🗗 ",
        highlight_method="block",
        max_title_width=200,
    )


def base_widgets(palette: Palette) -> list:
    """returns list of widgets"""
    return [
        launch_bar(palette),
        groupbox(palette),
        tasklist(palette),
        mpris(palette),
        cpu(palette),
        ram(palette),
        volume(palette),
        spacer(palette),
        clock(palette),
    ]


def laptops(palette: Palette) -> list:
    """Make a list of widgets that do no have battery or brightnesss.
    I use the same config between a laptop and desktop and I am
    tired of (un)commenting out the same widgets everytime I
    update my config.

    returns list of widgets
    """

    laptop_exclusive = [
        brightness(palette),
        battery(palette),
    ]

    widgets = base_widgets(palette)
    for item in laptop_exclusive:
        widgets.insert(-2, item)
    return widgets


def initialize_widgets(palette: Palette) -> list:
    """return list of widgets based on a colour scheme"""
    if is_laptop():
        return laptops(palette)
    return base_widgets(palette)
