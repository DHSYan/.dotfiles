local nnoremap = require("toes.keymap").nnoremap
local vnoremap = require("toes.keymap").vnoremap

nnoremap("<leader>pv", "<cmd>E<CR>")
vnoremap("<leader>cm", "<cmd>'<,'>s/^/;<CR>")
vnoremap("<leader>ucm", "<cmd>'<,'>s/;/<CR>")
