-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config = {
    automatically_reload_config = true,
    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE", -- disable the title bar but enable the resizable border
    window_background_opacity = 0.95,
    macos_window_background_blur = 90,
    font_size = 16,
    font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
    color_scheme = "GruvboxDarkHard",
    default_cursor_style = "BlinkingBar",
    window_padding = {
        left = 5, right = 5, top = 5, bottom = 5
    },
    keys = {
        {
            key = "Enter",
            mods = "SHIFT",
            action = wezterm.action { SendString = "\x1b\r" }
        },
        {
            key = "n",
            mods = "CMD",
            action = wezterm.action.SpawnCommandInNewWindow {
                cwd = wezterm.home_dir
            }
        },
        { mods = "OPT", key = "LeftArrow",  action = wezterm.action.SendKey({ mods = "ALT", key = "b" }) },
        { mods = "OPT", key = "RightArrow", action = wezterm.action.SendKey({ mods = "ALT", key = "f" }) },
        { mods = "CMD", key = "LeftArrow",  action = wezterm.action.SendKey({ mods = "CTRL", key = "a" }) },
        { mods = "CMD", key = "RightArrow", action = wezterm.action.SendKey({ mods = "CTRL", key = "e" }) },
        { mods = "CMD", key = "Backspace",  action = wezterm.action.SendKey({ mods = "CTRL", key = "u" }) },
    }
}

return config
