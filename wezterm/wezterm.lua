local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.enable_wayland = false
config.enable_tab_bar = false

local dark_gruvbox = wezterm.color.get_builtin_schemes()["Gruvbox Material (Gogh)"]
dark_gruvbox.background = "#1b1b1b"

config.color_schemes = {
	["Dark Gruvbox"] = dark_gruvbox,
}
config.color_scheme = "Dark Gruvbox"

config.font = wezterm.font("Iosevka")
config.font_size = 13

config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.max_fps = 120

return config
