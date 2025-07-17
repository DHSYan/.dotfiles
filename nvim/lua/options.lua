vim.opt.guicursor = ""

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.clipboard = "unnamed"

vim.opt.hlsearch = true

vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.cmdheight = 1

vim.opt.nu = true
vim.opt.relativenumber = true

-- vim.opt.updatetime = 30 -- Better to have high updatetime?

vim.opt.swapfile = true
vim.opt.backup = false
vim.opt.writebackup = true

vim.opt.mouse= nil

-- vim.opt.wrap = true
vim.opt.wrap = false

vim.opt.signcolumn = "yes"

vim.opt.termguicolors = true


-- vim.opt.undodir = os.getenv("HOME") .. "/nvim-undo"
vim.opt.undodir = "." -- save the undofile in the same folder the editing file
                      -- is in
vim.opt.undofile = true

-- vim.opt.formatoptions="cro"

vim.opt.scrolloff = 8 -- so you would never have less then 8 line below you

vim.opt.colorcolumn = "100" -- puts a color thingy at column 80

vim.opt.cursorline = true


vim.opt.conceallevel = 2; -- for obsidian, see ":h conceallevel"
-- vim.opt.concealcursor = "vi"
--
--
vim.api.nvim_create_autocmd("FileType", {
    pattern = "asm",
    callback = function()
        vim.opt.tabstop = 8
        vim.opt.softtabstop = 8
        vim.opt.shiftwidth = 8
        vim.opt.expandtab = false
        vim.opt.smartindent = false
    end,
})


vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
        vim.opt.shiftwidth = 2
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "javascript",
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
        vim.opt.shiftwidth = 2
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "typescript",
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
        vim.opt.shiftwidth = 2
    end,
})
