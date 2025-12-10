local wezterm = require 'wezterm'
local config = wezterm.config_builder()


-- config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font = wezterm.font 'ZedMono Nerd Font'
config.font_size = 14.0

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- config.color_scheme = 'Teerb'
config.color_scheme = 'Gruvbox Dark (Gogh)'

config.enable_wayland = true

config.keys = require 'keys'
-- config.enable_csi_u_key_encoding = true

local sessions = wezterm.plugin.require("https://github.com/abidibo/wezterm-sessions")
sessions.apply_to_config(config)

return config


