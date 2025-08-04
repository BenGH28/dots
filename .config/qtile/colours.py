class Palette:
    def __init__(
        self,
        foreground: str,
        background: str,
        inactive: str,
        primary: str,
        secondary: str,
        tertiary: str,
        red: str,
        green: str,
        blue: str,
        orange: str,
        teal: str,
        purple: str,
    ):
        self.foreground = foreground
        self.background = background
        self.inactive = inactive
        self.primary = primary
        self.secondary = secondary
        self.tertiary = tertiary
        self.red = red
        self.green = green
        self.blue = blue
        self.orange = orange
        self.teal = teal
        self.purple = purple


GRUVBOX_DARK = Palette(
    background="#282828",
    foreground="#EBDBB2",
    inactive="#928374",
    primary="#458588",  # Blue
    secondary="#B16286",  # Purple
    tertiary="#689D6A",  # Aqua
    red="#FB4934",
    green="#B8BB26",
    orange="#FE8019",
    blue="#83A598",
    teal="#8EC07C",
    purple="#D3869B",
)


ONE_DARK = Palette(
    background="#282A36",
    foreground="#ffffff",
    inactive="#9f9a9a",
    primary="#61afe0",  # Blue
    secondary="#98d379",  # Green
    tertiary="#50a14f",  # Darker Green
    red="#e06c75",
    green="#98c379",
    orange="#d19a66",
    blue="#61afef",
    teal="#56b6c2",
    purple="#c678dd",
)

DRACULA = Palette(
    background="#282a36",
    foreground="#f8f8f2",
    inactive="#6272a4",
    primary="#bd93f9",  # Purple
    secondary="#50fa7b",  # Green
    tertiary="#ffb86c",  # Orange
    red="#ff5555",
    green="#50fa7b",
    orange="#ffb86c",
    blue="#8be9fd",
    teal="#4db6ac",
    purple="#bd93f9",
)

SOLARIZED_DARK = Palette(
    background="#002b36",
    foreground="#839496",
    inactive="#586e75",
    primary="#268bd2",  # Blue
    secondary="#859900",  # Green
    tertiary="#2aa198",  # Cyan
    red="#dc322f",
    green="#859900",
    orange="#cb4b16",
    blue="#268bd2",
    teal="#2aa198",
    purple="#6c71c4",
)

NORD = Palette(
    background="#2E3440",
    foreground="#D8DEE9",
    inactive="#4C566A",
    primary="#88C0D0",  # Frost Green
    secondary="#A3BE8C",  # Green
    tertiary="#EBCB8B",  # Yellow
    red="#BF616A",
    green="#A3BE8C",
    orange="#D08770",
    blue="#81A1C1",
    teal="#8FBCBB",
    purple="#B48EAD",
)

CATPPUCCIN_MOCHA = Palette(
    background="#1E1E2E",
    foreground="#CDD6F4",
    inactive="#585B70",
    primary="#89B4FA",  # Blue
    secondary="#A6E3A1",  # Green
    tertiary="#FAB387",  # Peach
    red="#F38BA8",
    green="#A6E3A1",
    orange="#FAB387",
    blue="#89B4FA",
    teal="#94E2D5",
    purple="#CBA6F7",
)

TOKYO_NIGHT = Palette(
    background="#1a1b26",
    foreground="#a9b1d6",
    inactive="#414868",
    primary="#7aa2f7",      # Blue
    secondary="#bb9af7",     # Purple
    tertiary="#e0af68",     # Orange
    red="#f7768e",
    green="#9ece6a",
    orange="#ff9e64",
    blue="#7aa2f7",
    teal="#7dcfff",
    purple="#bb9af7",
)

MATERIAL_OCEAN = Palette(
    background="#0F111A",
    foreground="#8F93A2",
    inactive="#3B3F51",
    primary="#82AAFF",      # Blue
    secondary="#C3E88D",     # Green
    tertiary="#FFCB6B",     # Yellow
    red="#F07178",
    green="#C3E88D",
    orange="#F78C6C",
    blue="#82AAFF",
    teal="#89DDFF",
    purple="#C792EA",
)

AYU_DARK = Palette(
    background="#0A0E14",
    foreground="#B3B1AD",
    inactive="#3E4451",
    primary="#59C2FF",      # Blue
    secondary="#E6B450",     # Yellow
    tertiary="#FFD173",     # Light Yellow
    red="#F07178",
    green="#C2D94C",
    orange="#FF8F40",
    blue="#59C2FF",
    teal="#95E6CB",
    purple="#D2A6FF",
)

PALENIGHT = Palette(
    background="#292D3E",
    foreground="#A6ACCD",
    inactive="#676E95",
    primary="#82AAFF",      # Blue
    secondary="#C3E88D",     # Green
    tertiary="#F78C6C",     # Orange
    red="#F07178",
    green="#C3E88D",
    orange="#F78C6C",
    blue="#82AAFF",
    teal="#89DDFF",
    purple="#C792EA",
)