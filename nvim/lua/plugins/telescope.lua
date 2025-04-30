function keymap()
    -- Got the default from Github
    local builtin = require('telescope.builtin')
    local nmap = require('util.nmap')

    nmap('<leader>ff',
        function ()
            builtin.find_files({ hidden = true })
        end,
        "[f]ind [f]iles")
    nmap('<leader>T', vim.cmd.Telescope, "[T]elescope")
    nmap('<leader>J', ":Telescope jumplist<CR>", "[J]umplist")
    nmap('<leader>ws', builtin.live_grep, "[W]ord [S]earch")
    nmap('<leader>fb', builtin.buffers, "[f]ind [b]uffers")
    nmap('<leader>km', builtin.keymaps, "[K]ey[m]ap")
end

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        'BurntSushi/ripgrep'
    },
    config = function()
        keymap()
    end
}
