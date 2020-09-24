"""
Various colour themes for the Qtile Bar
"""
from enum import Enum


class Light(Enum):
    OneLight = 1


class Dark(Enum):
    Dracula = 1
    OneDark = 2


def SetOneLightTheme() -> tuple:
    """
    Set a light theme based on One-Light
    Return a tuple of dictionary and enum describing the dictionary
    """
    OneLight = {
        "foreground": "282A36",
        "background": "ffffff",
        "inactive": "d8d8d2",
        "primary": "61afe0",
        "secondary": "98d379",
        "tertiary": "50a14f",
        }
    return (OneLight, Light.OneLight)


def SetOneDarkTheme() -> tuple:
    """
    Set a Dark theme based on One-Dark
    Return a tuple of dictionary and enum describing the dictionary
    """
    OneDark = {
        "foreground": "ffffff",
        "background": "282A36",
        "inactive": "9f9a9a",
        "primary": "61afe0",
        "secondary": "98d379",
        "tertiary": "50a14f",
        }
    return (OneDark, Dark.OneDark)


def SetDraculaTheme() -> tuple:
    """
    Set a dark theme based on Dracula
    Return a tuple of dictionary and enum describing the dictionary
    """
    dracula = {
        "foreground": "f8f8f2",
        "background": "282a36",
        "inactive": "6272a4",
        "primary": "bd93f9",
        "secondary": "ffb86c",
        "tertiary": "50fa7b",
        }
    return (dracula, Dark.Dracula)
