-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config = {
    automatically_reload_config = true,
    window_close_confirmation = "NeverPrompt",
    window_decorations = "INTEGRATED_BUTTONS|RESIZE", -- disable the title bar but enable the resizable border
    window_background_opacity = 0.94,
    macos_window_background_blur = 40,
    font_size = 16,
    line_height = 1.2,
    font = wezterm.font("JetBrains Mono"),
    color_scheme = "Catppuccin Mocha",
    default_cursor_style = "BlinkingBar",
    front_end = "OpenGL",
    window_padding = {
        top = "1.5cell",
    },
    hide_tab_bar_if_only_one_tab = true,
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
