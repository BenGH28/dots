def SetLightTheme():
    """
    Set a light theme based on One-Light
    Return a tuple of dictionary and string describing the dictionary
    """
    light = {
        "foreground": "282A36",
        "background": "ffffff",
        "inactive": "d8d8d2",
        "primary": "61afe0",
        "secondary": "98d379",
        }
    return (light, "light")


def SetDarkTheme():
    """
    Set a dark theme based on Dracula
    Return a tuple of dictionary and string describing the dictionary
    """
    dark = {
        "foreground": "f8f8f2",
        "background": "282a36",
        "inactive": "6272a4",
        "primary": "bd93f9",
        "secondary": "ffb86c",
        }
    return (dark, "dark")
