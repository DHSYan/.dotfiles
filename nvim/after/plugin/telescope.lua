pcall(require('telescope').load_extension, 'fzf')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>g', builtin.git_files, {}) -- only search that files that are in git
-- vim.keymap.set('n', '<leader>ps', function()
-- 	builtin.grep_string ({ search = vim.fn.input("Grep > ") }) ;
-- end)


