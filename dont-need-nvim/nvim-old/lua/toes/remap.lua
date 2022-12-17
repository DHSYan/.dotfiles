local nnoremap = require("toes.keymap").nnoremap
local vnoremap = require("toes.keymap").vnoremap

nnoremap("<leader>pv", "<cmd>E<CR>")
-- nnoremap("<leader>c", "<cmd>CommentToggle<CR>")
nnoremap("<leader>nh", "<cmd>noh<CR>")
nnoremap("q", "<Nop>")

-- vnoremap("<leader>c", "<cmd>'<,'>CommentToggle<CR>")
--
-- window management
nnoremap("<leader>h", "<C-w>h")
nnoremap("<leader>j", "<C-w>j")
nnoremap("<leader>k", "<C-w>k")
nnoremap("<leader>l", "<C-w>l")

nnoremap("<C-K>", ":resize +2<CR>" )
nnoremap("<C-J>", ":resize -2<CR>" )
nnoremap("<C-L>", ":vertical resize +2<CR>" )
nnoremap("<C-H>", ":vertical resize -2<CR>" )

nnoremap("<leader>f", "<cmd>Telescope find_files<CR>")


