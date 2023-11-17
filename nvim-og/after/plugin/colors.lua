-- for Rose-Pine
function RosePine(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" } )
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" } )

end
-- RosePine()


function cat(color)
  color = color or "catppuccin"
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" } )
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" } )
  require("catppuccin").setup({
    -- flavour = "mocha",
    transparent_background = true,
  })
  vim.cmd.colorscheme(color)
end
	

-- cat()


-- function vscode(color)
--   local c = require('vscode.colors').get_colors()
--   color = color or "vscode"
--   require("vscode").setup({
--     vim.o.background = 'dark',
--     transparent = true,
--
--   })
--   vim.cmd.colorscheme(color)
-- end

-- vscode()



function kana(color)
    color = color or 'kanagawa'

    require('kanagawa').setup({
        compile = false,             -- enable compiling the colorscheme
        undercurl = true,            -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,         -- do not set background color
        dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
        terminalColors = true,       -- define vim.g.terminal_color_{0,17}
        colors = {                   -- add/modify theme and palette colors
            palette = {},
            theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
            return {}
        end,
        theme = "wave",              -- Load "wave" theme when 'background' option is not set
        background = {               -- map the value of 'background' option to a theme
            dark = "wave",           -- try "dragon" !
            light = "lotus"
        },
    })
    vim.cmd.colorscheme(color)
end
kana()
    



vim.api.nvim_command('highlight clear SignColumn')
vim.api.nvim_command('highlight CursorLine guibg=grey')
