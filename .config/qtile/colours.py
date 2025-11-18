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

CATPPUCCIN_LATTE = Palette(
    background="#eff1f5",
    foreground="#4c4f69",
    inactive="#acb0be",
    primary="#1e66f5",  # Blue
    secondary="#40a02b",  # Green
    tertiary="#fe640b",  # Peach
    red="#d20f39",
    green="#40a02b",
    orange="#fe640b",
    blue="#1e66f5",
    teal="#04a5e5",
    purple="#ea76cb",
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

TOKYONIGHT = Palette(
    background="#1a1b26",
    foreground="#a9b1d6",
    inactive="#414868",
    primary="#7aa2f7",  # Blue
    secondary="#bb9af7",  # Purple
    tertiary="#e0af68",  # Orange
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
    primary="#82AAFF",  # Blue
    secondary="#C3E88D",  # Green
    tertiary="#FFCB6B",  # Yellow
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
    primary="#59C2FF",  # Blue
    secondary="#E6B450",  # Yellow
    tertiary="#FFD173",  # Light Yellow
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
    primary="#82AAFF",  # Blue
    secondary="#C3E88D",  # Green
    tertiary="#F78C6C",  # Orange
    red="#F07178",
    green="#C3E88D",
    orange="#F78C6C",
    blue="#82AAFF",
    teal="#89DDFF",
    purple="#C792EA",
)


# ---------------------------------------------------------------------------- #
#                                 Light Themes                                 #
# ---------------------------------------------------------------------------- #

GRUVBOX_LIGHT = Palette(
    background="#FBF1C7",
    foreground="#3C3836",
    inactive="#928374",
    primary="#458588",
    secondary="#B16286",
    tertiary="#689D6A",
    red="#CC241D",
    green="#98971A",
    orange="#D65D0E",
    blue="#458588",
    teal="#689D6A",
    purple="#B16286",
)

ONE_LIGHT = Palette(
    background="#fafafa",
    foreground="#383a42",
    inactive="#a0a0a0",
    primary="#4271ae",  # Blue
    secondary="#718c00",  # Green
    tertiary="#f5871f",  # Orange
    red="#c82829",
    green="#718c00",
    orange="#f5871f",
    blue="#4271ae",
    teal="#008080",
    purple="#8959a8",
)



TOKYO_DAY = Palette(
    background="#d5d6db",
    foreground="#373844",
    inactive="#9b9ca3",
    primary="#3d67c7",
    secondary="#8264c7",
    tertiary="#c78d43",
    red="#c7546a",
    green="#6aa343",
    orange="#d97c3f",
    blue="#3d67c7",
    teal="#43a3c7",
    purple="#8264c7",
)

MATERIAL_LIGHT = Palette(
    background="#FAFAFA",
    foreground="#546E7A",
    inactive="#94A7B0",
    primary="#82AAFF",
    secondary="#C3E88D",
    tertiary="#FFCB6B",
    red="#F07178",
    green="#C3E88D",
    orange="#F78C6C",
    blue="#82AAFF",
    teal="#89DDFF",
    purple="#C792EA",
)

AYU_LIGHT = Palette(
    background="#FCFCFC",
    foreground="#5C6166",
    inactive="#787B80",
    primary="#399EE6",
    secondary="#F2AE49",
    tertiary="#55B4D4",
    red="#F07171",
    green="#86B300",
    orange="#FA8D3E",
    blue="#399EE6",
    teal="#4CBF99",
    purple="#A37ACC",
)

