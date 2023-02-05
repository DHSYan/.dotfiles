vim.keymap.set("n", " ", "<nop>")
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)


vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")


vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<leader>nh", vim.cmd.noh)

vim.keymap.set('n', '<leader>t', ":!")
vim.keymap.set('n', '<leader>T', vim.cmd.Telescope)



vim.keymap.set('n', '<leader>g', ":Git")
vim.keymap.set('n', '<leader>G', vim.cmd.Git)

vim.keymap.set('n', '<leader>md', ":!md-to-pdf *.md && open *.pdf<CR>")

vim.keymap.set('n', '<leader>i', vim.cmd.PasteImg)
