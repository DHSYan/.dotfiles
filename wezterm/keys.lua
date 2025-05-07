local wezterm = require 'wezterm'
local keys = {}

keys = {
    {
        key = 'd', 
        mods = 'CMD',
        action = wezterm.action.SpawnCommandInNewTab {
            args = { 'nvim' },
        },
    }
}


return keys
