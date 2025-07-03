-- Captppuccin
local catppuccin = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      flavour = "mocha"
    })

    vim.cmd.colorscheme 'catppuccin'
  end,
}

-- Kanagawa
local kanagawa = {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
        require('kanagawa').setup({
            theme = "lotus"
        })
        vim.cmd.colorscheme 'kanagawa'
    end
}

local tokyonight = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require("tokyonight").setup({
            style = 'night',
            transparent = false,

        })
        vim.cmd.colorscheme 'tokyonight'
        vim.cmd("hi ColorColumn guibg='grey'")
    end
}

local flexoki = {
    'kepano/flexoki-neovim',
    name = 'flexoki',
    config = function() 
        require("flexoki").setup({
        })
        vim.cmd.colorscheme 'flexoki-dark'
        vim.cmd("hi ColorColumn guibg='grey'")
    end

}

return tokyonight
