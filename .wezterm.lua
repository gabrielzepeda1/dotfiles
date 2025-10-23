-- Pull in the wezterm API
--
--
--
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config = {
	automatically_reload_config = true,
	enable_tab_bar = false, 
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE", -- disable the title bar but enable the resizable border
	window_background_opacity = 0.9,
	macos_window_background_blur = 60,
	font_size = 14,
	font = wezterm.font("JetBrains Mono", {weight="Bold"}),
	color_scheme = "nord",
	default_cursor_style = "BlinkingBar",
	window_padding={ 
		left = 5, right = 5, top = 5, bottom = 5

	},
	keys = {
		{key="Enter", mods="SHIFT", action=wezterm.action{SendString="\x1b\r"}}
	}
} 

return config
