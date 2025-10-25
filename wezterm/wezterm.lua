local wezterm = require 'wezterm'
local config = {}


config.font = wezterm.font 'JetBrainsMono Nerd Font'
-- config.font = wezterm.font 'ZedMono Nerd Font'
config.font_size = 12.0

config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true

config.color_scheme = 'Teerb'

config.enable_wayland = true

config.keys = require 'keys'

return config


