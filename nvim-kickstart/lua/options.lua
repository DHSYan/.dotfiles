vim.opt.guicursor = ""

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- vim.opt.clipboard = "unnamed"

vim.opt.hlsearch = true

vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.cmdheight = 1


vim.opt.nu = true

vim.o.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.mouse= nil

-- vim.opt.wrap = true
vim.opt.wrap = false


-- vim.opt.termguicolors = true


-- vim.opt.undodir = os.getenv("HOME") .. "/nvim-undo"
vim.opt.undodir = "."
vim.opt.undofile = true

-- Some rust bs
vim.g.rust_recommended_style = false


-- vim.opt.formatoptions="cro"
--

vim.opt.scrolloff = 8 -- so you would never have less then 8 line below you

vim.opt.colorcolumn = "80"

-- vim.g.autochdir = true
-- vim.opt.autochdir = true



-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

