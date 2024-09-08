local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.enable_wayland = false
config.enable_tab_bar = false

config.color_scheme = 'Gruvbox Material (Gogh)'

config.font = wezterm.font("JetBrainsMono")

config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000

return config
