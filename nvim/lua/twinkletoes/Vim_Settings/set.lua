vim.opt.guicursor = ""

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.clipboard = "unnamed"

vim.opt.hlsearch = true

vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.cmdheight = 1


vim.opt.nu = true 
vim.opt.relativenumber = true


vim.opt.updatetime = 30

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.mouse= nil

vim.opt.wrap = true

vim.opt.signcolumn = "yes"

vim.opt.termguicolors = true


vim.opt.undodir = os.getenv("HOME") .. "/nvim-undo"
vim.opt.undofile = true

-- Some rust bs
vim.g.rust_recommended_style = false


-- vim.opt.formatoptions="cro"
--

vim.opt.scrolloff = 8 -- so you would never have less then 8 line below you

vim.opt.colorcolumn = "100"

-- vim.g.autochdir = true
-- vim.opt.autochdir = true
