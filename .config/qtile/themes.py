def SetLightTheme():
    """
    Set a light theme based on One-Light
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
    """
    dark = {
        "foreground": "f8f8f2",
        "background": "282a36",
        "inactive": "6272a4",
        "primary": "bd93f9",
        "secondary": "ffb86c",
        }
    return (dark, "dark")


if __name__ == "__main__":
    colours, style = SetDarkTheme()
    print(f"{colours}, {style}")
