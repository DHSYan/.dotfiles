-- for Rose-Pine
function RosePine(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" } )
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" } )

end
	
RosePine()

vim.api.nvim_command('highlight clear SignColumn')
vim.api.nvim_command('highlight CursorLine guibg=grey')
