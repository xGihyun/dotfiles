local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.enable_wayland = false
config.enable_tab_bar = false

config.color_scheme = 'Gruvbox Material (Gogh)'

config.font = wezterm.font("JetBrainsMono")

return config
