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
	
cat()


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




vim.api.nvim_command('highlight clear SignColumn')
vim.api.nvim_command('highlight CursorLine guibg=grey')
